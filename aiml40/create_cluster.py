# Script to upload dataset to Azure ML Datastore

import argparse
from azureml.core import Workspace,Dataset
from azureml.core.compute import ComputeTarget, AmlCompute
from azureml.core.compute_target import ComputeTargetException

import os                            

parser = argparse.ArgumentParser()

parser.add_argument('-s',help='Subscription ID',required=True)
parser.add_argument('-w',help='Workspace name',required=True)
parser.add_argument('-g',help='Resource group',required=True)

args = parser.parse_args()

ws = Workspace(args.s, args.g, args.w)

print("Workspace {} created".format(ws.name))

# Choose a name for your CPU cluster
cluster_name = "absa-cluster"

# Verify that cluster does not exist already
try:
    cluster = ComputeTarget(workspace=ws, name=cluster_name)
    print('Found existing cluster, use it.')
except ComputeTargetException:
    print('Creating cluster....')
    compute_config = AmlCompute.provisioning_configuration(vm_size='STANDARD_D3_V2',
                                                           vm_priority='lowpriority',
                                                           min_nodes=1,
                                                           max_nodes=1)
    cluster = ComputeTarget.create(ws, cluster_name, compute_config)

cluster.wait_for_completion(show_output=True)
print('Cluster created')
