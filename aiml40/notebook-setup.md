## Different Jupyter Notebook usage Options

Jupyter Notebooks are a common way to execute Python code, and thus much of the demo is presented as Jupyter Notebooks code. You can use different options for executing code in Jupyter Notebook:

 - Use Jupyter Notebooks from within Azure ML Workspace. It is the recommended way, and it is described in the [main readme](README.md).
 - Install Python environment locally, as described below in **Python Environment Installation**
 - Use [Azure Notebooks](http://aka.ms/whyaznb). In this case you should upload the `absa.ipynb` file to a new Azure Notebooks project. Also, because of limitations of free compute in Azure Notebooks (1 Gb disk space), you will only be able to run the notebook on a virtual machine, as described [here](https://docs.microsoft.com/azure/notebooks/use-data-science-virtual-machine/?wt.mc_id=msignitethetour2019-github-aiml40).

#### Python Environment Installation

If you decide not to use Azure Notebooks, and prefer to use your local Python environment, you need to install the Python Azure ML SDK, and make sure to install notebook and contrib:

```shell
conda create -n azureml -y Python=3.6
source activate azureml
pip install --upgrade azureml-sdk[notebooks,contrib] 
conda install ipywidgets
jupyter nbextension install --py --user azureml.widgets
jupyter nbextension enable azureml.widgets --user --py
```

You will need to restart Jupyter after this. Detailed instructions are [here](https://docs.microsoft.com/azure/machine-learning/service/quickstart-create-workspace-with-python/?WT.mc_id=msignitethetour2019-github-aiml40)
