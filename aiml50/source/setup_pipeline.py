from azureml.core import VERSION
from azureml.core import Workspace, Experiment, Datastore, Environment
from azureml.core.runconfig import RunConfiguration
from azureml.data.datapath import DataPath, DataPathComputeBinding
from azureml.data.data_reference import DataReference
from azureml.core.compute import ComputeTarget, AmlCompute
from azureml.core.compute_target import ComputeTargetException
from azureml.pipeline.core import Pipeline, PipelineData, PipelineParameter
from azureml.pipeline.steps import PythonScriptStep, EstimatorStep
from azureml.train.estimator import Estimator
import sys, getopt, os

## Get arguments
def printhelp():
        print ('Arguments:')
        print ('  -d    Data Store name')
        print ('  -p    Data Store Path')
        print ('  -c    Compute Target name')
        print ('  -v    Universal Package version (for deployment and inferencing code)')
        print ('  -s    Azure Subscription id')
        print ('  -a    Storage Account name')
        print ('  -k    Storage Account key')
        print ('  -r    Resource Group name')
        print ('  -w    Machine Learning workspace name')

datastorename=''
datastorepath=''
computetarget=''
packageversion=''
workspace_name=''
subscription_id=''
resource_group=''
storage_account=''
storage_account_key=''

try:
    print('Arguments: ', sys.argv[1:])
    opts, args = getopt.getopt(sys.argv[1:],"d:p:c:v:s:a:k:r:w:")
except getopt.GetoptError:
    printhelp
for opt, arg in opts:
    if opt == '-h':
        printhelp
    elif opt == '-d':
        datastorename = arg
    elif opt == '-p':
        datastorepath = arg
    elif opt == '-c':
        computetarget = arg
    elif opt == '-v':
        packageversion = arg
    elif opt == '-s':
        subscription_id = arg
    elif opt == '-a':
        storage_account = arg
    elif opt == '-k':
        storage_account_key = arg
    elif opt == '-r':
        resource_group = arg
    elif opt == '-w':
        workspace_name = arg

print("Azure ML SDK Version: ", VERSION)

#### Connect to our workspace ####
##################################

# workspace
ws = Workspace.get( name=workspace_name, 
                    subscription_id=subscription_id, 
                    resource_group=resource_group)

# data
ds = Datastore.register_azure_blob_container(workspace=ws, 
                                            datastore_name=datastorename, 
                                            container_name='seer-container',
                                            account_name=storage_account, 
                                            account_key=storage_account_key,
                                            create_if_not_exists=True)
datastore = ws.datastores[datastorename]

# compute target
try:
    cpu_cluster = ComputeTarget(workspace=ws, name=computetarget)
    print('Found existing cluster, use it.')
except ComputeTargetException:
    compute_config = AmlCompute.provisioning_configuration(vm_size='STANDARD_NC12',
                                                           min_nodes=1, 
                                                           max_nodes=4)
    cpu_cluster = ComputeTarget.create(ws, computetarget, compute_config)

cpu_cluster.wait_for_completion(show_output=True)

compute = ws.compute_targets[computetarget]


#### Define Pipeline! ####
##########################

# The following will be created and then run:
# 1. Pipeline Parameters
# 2. Data Process Step
# 3. Training Step
# 4. Model Registration Step
# 5. Pipeline registration
# 6. Submit the pipeline for execution


## Pipeline Parameters ##
# We need to tell the Pipeline what it needs to learn to see!

datapath = DataPath(datastore=datastore, path_on_datastore=datastorepath)
data_path_pipeline_param = (PipelineParameter(name="data", 
                                            default_value=datapath), 
                                            DataPathComputeBinding(mode='mount'))

# Configuration for data prep and training steps #

dataprepEnvironment = Environment.from_pip_requirements('dataprepenv', 'requirements-dataprepandtraining.txt')
dataprepRunConfig = RunConfiguration()
dataprepRunConfig.environment = dataprepEnvironment

## Data Process Step ##
# parse.py file parses the images in our data source #

seer_tfrecords = PipelineData(
    "tfrecords_set",
    datastore=datastore,
    is_directory=True
)

prepStep = PythonScriptStep(
    'parse.py',
    source_directory='.',
    name='Data Preparation',
    compute_target=compute,
    arguments=["--source_path", data_path_pipeline_param, "--target_path", seer_tfrecords],
    runconfig=dataprepRunConfig,
    inputs=[data_path_pipeline_param],
    outputs=[seer_tfrecords]
)

## Training Step ##
# train.py does the training based on the processed data #

seer_training = PipelineData(
    "train",
    datastore=datastore,
    is_directory=True
)

train = Estimator(source_directory='.',
                    compute_target=compute,
                    entry_script='train.py',
                    pip_requirements_file='requirements-dataprepandtraining.txt')

trainStep = EstimatorStep(
    name='Model Training',
    estimator=train,
    estimator_entry_script_arguments=["--source_path", seer_tfrecords, 
                                    "--target_path", seer_training,
                                    "--epochs", 20,
                                    "--batch", 10,
                                    "--lr", 0.001],
    inputs=[seer_tfrecords],
    outputs=[seer_training],
    compute_target=compute
)


## Register Model Step ##
# Once training is complete, register.py registers the model with AML #

# Configuration for registration step #
registerEnvironment = Environment.from_pip_requirements('registerenv', 'requirements-registration.txt')
registerRunConfig = RunConfiguration()
registerRunConfig.environment = registerEnvironment

seer_model = PipelineData(
    "model",
    datastore=datastore,
    is_directory=True
)

registerStep = PythonScriptStep(
    'register.py',
    source_directory='.',
    name='Model Registration',
    arguments=["--source_path", seer_training, 
               "--target_path", seer_model,
               "--universal_package_version", packageversion],
    inputs=[seer_training],
    outputs=[seer_model],
    compute_target=compute,
    runconfig=registerRunConfig
)

## Create and publish the Pipeline ##
# We now define and publish the pipeline #

pipeline = Pipeline(workspace=ws, steps=[prepStep, trainStep, registerStep])

published_pipeline = pipeline.publish(
    name="Seer Pipeline", 
    description="Transfer learned image classifier. Uses folders as labels.")

## Submit the pipeline to be run ##
# Finally, we submit the pipeline for execution #

pipeline_run = Experiment(ws, 'seer',).submit(published_pipeline, tags={'universalPackageVersion': packageversion})
print('Run created with ID: ', pipeline_run.id)