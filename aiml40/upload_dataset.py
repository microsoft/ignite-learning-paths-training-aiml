# Script to upload dataset to Azure ML Datastore

import argparse
from azureml.core import Workspace,Dataset
import os                            

lib_root = os.path.dirname(os.path.abspath("__file__"))

parser = argparse.ArgumentParser()

parser.add_argument('-s',help='Subscription ID',required=True)
parser.add_argument('-w',help='Workspace name',required=True)
parser.add_argument('-g',help='Resource group',required=True)
parser.add_argument('-f',help='File to upload',required=True)

args = parser.parse_args()

ws = Workspace(args.s, args.g, args.w)

print("Workspace {} created".format(ws.name))

ds = ws.get_default_datastore()
ds.upload_files([os.path.join(lib_root,args.f)],relative_root=lib_root)

print("File {} uploaded".format(args.f))

datastore_paths = [(ds, args.f)]
dset = Dataset.Tabular.from_delimited_files(path=datastore_paths)

print("Dataset created")

dset1 = dset.register(workspace = ws, name = args.f)

print("Dataset registered")

#print("Creating dataset profile")

#res = dset.generate_profile()
#res.wait_for_completion(show_output=True)

#print('Dataset profile created')
