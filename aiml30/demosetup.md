# Demo Setup

## Create Base Azure Resources with one click
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow">
 <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>

## Create Additional Resources Needed
Once you have created the base Azure Machine Learning Service Workspace we need to add additional compute resources.
### Create Compute Targets
1. Create Machine Learning Compute
    * Click on the nav "Compute"
    * Click "New"
    * Enter a name for the resource
    * Select "Machine Learning Compute" from the dropdown
    * Select the machine size
    * Enter the min and max nodes (recommend min of 0 and max of 5)
    * Click "Create"
    ![Create Compute](assets/CreateMlCompute.gif)
2. Create Kubernetes Compute
    * Click on the nav "Compute"
    * Click "New"
    * Enter a name for the resource
    * Select "Kubernetes Service" from the dropdown
    * Click "Create"
    ![Create Kubernetes](assets/CreateKubService.gif)
3. Create Notebook Virtual Machine
    * Click on the "Notebook VM" nav
    * Click "New"
    * Give the notebook a unique name
    * Select the VM size
    * Click "Create"
    ![Create VM](assets/CreateNotebookVM.gif)


## Upload Dataset to Workspace Blob Storage
The datasets needed are created weekly with updated dates to allow your demo to be predicting future weeks. Below are the steps to get the new dataset and add it to the Azure Machine Learning Storage account.

1. Download dataset to local from [here]()
2. Open Azure Storage Explorer - [download](https://azure.microsoft.com/en-us/features/storage-explorer/).
3. Navigate to `azureml-blobstore-<guid>`
4. Create a new folder called `datasets`
5. Upload datasets

## Run through the Live Demo
You will want to do a complete run through of the live demo so that you have a completed backup model to open and show the end result. 

[Live Demo Steps](demoguide.md)