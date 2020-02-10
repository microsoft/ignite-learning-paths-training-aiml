## <a name="different-jupyter-notebook-usage-options"></a>其他 Jupyter Notebook 使用方式選項

Jupyter Notebook 是執行 Python 程式碼的常見方式，因此大部分示範都是以 Jupyter Notebook 程式碼呈現。 您可以使用其他選項來執行 Jupyter Notebook 中的程式碼：

 - 使用 Azure ML 工作區內的 Jupyter Notebook。 這是建議的方式，而且在[主要讀我檔案](README.md)中已說明。
 - 在本機安裝 Python 環境，如下面的 **Python 環境安裝**中所述
 - 使用 [Azure Notebooks](http://aka.ms/whyaznb)。 在此案例中，您應該將 `absa.ipynb` 檔案上傳至新的 Azure Notebooks 專案。 此外，由於 Azure Notebooks 中的免費計算有限制 (1 GB 磁碟空間)，因此您只能在虛擬機器上執行筆記本，如[這裡](https://docs.microsoft.com/azure/notebooks/use-data-science-virtual-machine/?wt.mc_id=msignitethetour2019-github-aiml40) \(部分機器翻譯\) 所述。

#### <a name="python-environment-installation"></a>Python 環境安裝

如果您決定不使用 Azure Notebooks，且希望使用本機 Python 環境，則需要安裝 Python Azure ML SDK，同時也務必安裝筆記本和 contrib：

```shell
conda create -n azureml -y Python=3.6
source activate azureml
pip install --upgrade azureml-sdk[notebooks,contrib] 
conda install ipywidgets
jupyter nbextension install --py --user azureml.widgets
jupyter nbextension enable azureml.widgets --user --py
```

完成安裝之後，您將需要重新啟動 Jupyter。 [這裡](https://docs.microsoft.com/azure/machine-learning/service/quickstart-create-workspace-with-python/?WT.mc_id=msignitethetour2019-github-aiml40) \(部分機器翻譯\) 有詳細指示
