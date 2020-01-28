# <a name="aiml40---taking-models-to-the-next-level-with-azure-machine-learning-best-practices"></a>AIML40 - 使用 Azure Machine Learning 的最佳做法讓模型更上一層樓

## <a name="session-information"></a>工作階段資訊

人工智慧和機器學習可用於許多方式來提高商務程序的生產力，並藉由分析非結構化資料流程內的影像、文字和趨勢來收集有意義的見解。 雖然許多工作都可以用現有模型來解決，但在某些情況下，您也需要定型自己的模型，以運用於更具體的工作或提高準確度。 

在此課程中，我們會探索將文字分析智慧型服務整合至 [Tailwind Traders](http://tailwindtraders.com) 商務程序的完整過程，從可用為[認知服務](https://azure.microsoft.com/services/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml40)的預先建置模型開始，一直到訓練[以外觀為基礎之情感分析](https://www.intel.ai/introducing-aspect-based-sentiment-analysis-in-nlp-architect/)的協力廠商神經自訂模型，此模型使用 [Azure Machine Learning 服務](https://azure.microsoft.com/services/machine-learning-service/?wt.mc_id=msignitethetour2019-github-aiml40) 作為 [Intel NLP Architect](http://nlp_architect.nervanasys.com/) 的一部分提供。 我們將討論需要自訂模型的案例，並示範使用 [AutoML](https://docs.microsoft.com/azure/machine-learning/service/concept-automated-ml/?wt.mc_id=msignitethetour2019-github-aiml40) 從頭開始建立這類模型的快速方法，也會示範如何使用 [HyperDrive](https://docs.microsoft.com/azure/machine-learning/service/how-to-tune-hyperparameters/?wt.mc_id=msignitethetour2019-github-aiml40) 來微調模型超參數

## <a name="table-of-content"></a>目錄
 

| 資源          | 連結                            |
|-------------------|----------------------------------|
| PowerPoint        | - [簡報](presentations.md) |
| 影片            | - [嘗試執行練習](https://youtu.be/If9IQm3gWVQ) <br/>- [Microsoft Ignite 奧蘭多錄影](https://myignite.techcommunity.microsoft.com/sessions/83002?source=sessions) |
| 示範             | - [Demo 1 - Cognitive Services Text Analytics](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#demo-1-text-analytics-cognitive-service) (示範 1 - 認知服務文字分析) <br/>- [Demo 2 - Automated Machine Learning](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#demo-2-azure-automl) (示範 2 - 自動化機器學習) <br/>- [Demo 3 - Azure Machine Learning SDK and Hyperdrive](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#demo-3-using-azure-ml-workspace-with-python-sdk) (示範 3 - Azure Machine Learning SDK 和 Hyperdrive) |

## <a name="delivery-assets"></a>傳遞資產

* [PowerPoint 簡報](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/presentations.md)
* [其他簡報者資源](README-Instructor.md)
* 示範影片：
    * Demo 1 - [Cognitive Services Text Analytics](https://youtu.be/QJxjm5BirOA) (示範 1 - 認知服務文字分析)
    * Demo 2 - [Automated Machine Learning](https://youtu.be/qrstXN6TLZk) (示範 2 - 自動化機器學習)
    * Demo 3 - [Azure Machine Learning SDK and Hyperdrive](https://youtu.be/sccNTPO3PwU) (示範 3 - Azure Machine Learning SDK 和 Hyperdrive)


## <a name="overview-of-demonstrations"></a>示範的概觀

此簡報會進行下列示範：

1. 使用[認知服務文字分析](https://azure.microsoft.com/services/cognitive-services/text-analytics/?wt.mc_id=msignitethetour2019-github-aiml40)來找出服裝評論的情感
2. 使用 [Azure 自動化 ML](https://docs.microsoft.com/azure/machine-learning/service/concept-automated-ml/?wt.mc_id=msignitethetour2019-github-aiml40) 來建立文字分類器，幾乎不需要程式碼
3. 使用 [Azure Machine Learning 服務](https://azure.microsoft.com/services/machine-learning-service/?wt.mc_id=msignitethetour2019-github-aiml40)來定型以外觀為基礎的情感分析模型。

## <a name="starting-fast"></a>快速開始

如果想要立即開始，您可以透過 Azure 範本來部署所有必要的資源。 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml40%2Ftemplate%2Fazuredeploy.json" target="_blank">
 <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

下面，我們會提供更詳細的示範指示來供您手動執行這些步驟，以完全了解所示範的概念。

## <a name="initial-environment-setup"></a>初始環境設定

為了執行示範的步驟 2 和 3，我們必須：

1. 建立 Azure Machine Learning 工作區
2. 上傳用於 AutoML 定型的資料 - [clothing_automl.xlsx](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_automl.xlsx)

#### <a name="creating-azure-machine-learning-workspace"></a>建立 Azure Machine Learning 工作區

建立 Azure ML 工作區的方式如下：
* 從 [Azure 入口網站](http://portal.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40)手動建立 ([這裡提供完整的逐步解說](https://docs.microsoft.com/azure/machine-learning/service/how-to-manage-workspace/?wt.mc_id=msignitethetour2019-github-aiml40))
* 從提供的 Azure 範本部署
* 透過 [Azure CLI](https://docs.microsoft.com/ru-ru/cli/azure/?view=azure-cli-latest&wt.mc_id=msignitethetour2019-github-aiml40) 建立

> 注意：(在此範例中我們使用 `absa` 作為名稱，並使用「美國西部 2」  資料中心，但您可以隨意變更) 

```shell
az extension add -n azure-cli-ml
az group create -n absa -l westus2
az ml workspace create -w absa_space -g absa
```

您也需要知道訂用帳戶識別碼，其可藉由執行 `az account list` 來取得。

#### <a name="uploading-data-to-the-workspace"></a>將資料上傳至工作區

在示範中，我們會使用一些資料集：
* 用於自動化 ML 示範的資料集 - [clothing_automl.xlsx](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_automl.xlsx)
* 大型資料集 [clothing_absa_train.csv](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_absa_train.csv)，用於示範 3 定型以外觀為基礎的完整情感分析模型
* 較小型的偵錯資料集 [clothing_absa_train_small.csv](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_absa_train_small.csv)，用於以外觀為基礎的情感分析模型
* 個別的驗證集 [clothing-absa-validation.json](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing-absa-validation.json)，用於測試模型

若要遵循自動化 ML 示範，請將資料集上傳至工作區。 您可以透過 [Azure ML 入口網站](http://ml.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40)來手動執行此操作，也可以使用提供的檔案 `upload_dataset.py` (csv/xlsx 檔案應位於目前的目錄中，且應根據您的訂用帳戶來取代 `[subscription_id]`)：

```shell
python upload_dataset.py -s [subscription_id] -w absa_space -g absa -f clothing_automl.xlsx
```

自動化 ML 服裝資料集可透過示範程式碼上傳至 AML 服務資料存放區。

#### <a name="using-the-azure-ml-demo-code"></a>使用 Azure ML 示範程式碼

您可以從任何 Jupyter Notebook 環境執行示範程式碼。 您可以使用下列其中一個選項：
 - 在本機安裝 Python 環境，如下面的 **Python 環境安裝**中所述
 - 使用 Azure ML 工作區內的 Jupyter Notebook。 若要執行此操作：
     - 巡覽至 [Azure ML 入口網站](https://ml.azure.com/)
     - 從左側功能表選取 [筆記本] 
     - 上傳 `absa.ipynb` 檔案並加以選取
     - 系統會提示您**建立筆記本 VM**。 現在，您可以直接從入口網站使用筆記本。
 - 使用 [Azure Notebooks](https://docs.microsoft.com/azure/notebooks/azure-notebooks-overview/?wt.mc_id=absa-notebook-abornst)。 在此案例中，您應該將 `absa.ipynb` 檔案上傳至新的 Azure Notebooks 專案。 此外，由於 Azure Notebooks 中的免費計算有限制 (1 GB 磁碟空間)，因此您只能在虛擬機器上執行此筆記本，如[此處](https://docs.microsoft.com/azure/notebooks/use-data-science-virtual-machine/?wt.mc_id=msignitethetour2019-github-aiml40)所述。 

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

完成安裝之後，您將需要重新啟動 Jupyter。 [此處](https://docs.microsoft.com/azure/machine-learning/service/quickstart-create-workspace-with-python/?WT.mc_id=msignitethetour2019-github-aiml40)有詳細的指示

如果需要免費試用帳戶以開始使用，您可以在[此處](https://azure.microsoft.com/offers/ms-azr-0044p/?WT.mc_id=msignitethetour2019-github-aiml40)取得免費試用帳戶

#### <a name="pre-creating-compute-cluster"></a>預先建立計算叢集

您需要計算叢集以用於最後兩個示範。 針對示範用途，我們將建立僅由單一節點組成的叢集。 完成此操作的方式有三種：

1. 透過 [Azure ML 入口網站](http://ml.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40)前往 [計算]  區段，並使用 *Standard_DS3_v2* VM 來手動建立 Azure ML Compute 叢集，指定節點數目 = 1。 將叢集命名為 `absa-cluster`。
2. 執行提供的 `create_cluster.py` 指令碼，並提供上述參數：
```shell
python create_cluster.py -s [subscription_id] -w absa_space -g absa
```
3. 執行 `absa.ipynb` 筆記本的前幾個資料格，即會為您建立叢集。

## <a name="demos"></a>示範

### <a name="demo-1-text-analytics-cognitive-service"></a>示範 1：文字分析認知服務

> 💡 您必須先完成[環境設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#starting-fast)，才能嘗試進行此示範。

在此示範中，我們將示範文字分析如何在 Web 介面中執行片語的情感分析。

1. 開啟[文字分析頁面](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)
2. 向下捲動至 [以動作檢視]  區段，並輸入片語 *I loved the polka dot pants that I bought in the london store* (您也可以保留預設片語來示範該要點)。
3. 按下 [分析]  以取得下列結果：

![Azure 文字分析的螢幕擷取畫面](images/analytics.png)

請注意，文字分析不只提供情感，也會從文字擷取位置和關鍵字。

### <a name="demo-2-azure-automl"></a>示範 2：Azure AutoML

> 💡 您必須先完成[環境設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#starting-fast)，才能嘗試進行此示範。

在此示範中，我們將示範在不需撰寫程式碼的情況下如何使用自動化 ML 來建立 ML 模型。

1. 在 [http://ml.azure.com](http://ml.azure.com/?WT.mc_id=msignitethetour2019-github-aiml40) 中巡覽至 Azure ML 工作區 (已在上面建立)
2. 前往**資料集** - 您應該會在此看到先前上傳的資料集 (clothing_automl.xlsx)。 請注意，您也可以透過入口網站將資料集上傳至此處。
3. 選取資料集。
4. 從 [概觀]  索引標籤中展開 [範例使用方式]  ，並顯示可用來以程式設計方式存取資料的程式碼 (如有需要)。
5. 從 [探索]  索引標籤中查看資料。
6. 前往 [自動化 ML]  索引標籤，然後按一下 [新增實驗] 
7. 選取要使用的實驗名稱和計算。
8. 選取資料集。
9. 選擇預測工作的類型 -- [分類]  。
10. 選取目標資料行 -- [分級]  。
11. 按一下 [啟動]  。

由於實驗將會調查不同的演算法，因此執行時間會很長。 如果要用於示範用途，請事先執行此操作，並僅顯示結果。

### <a name="demo-3-using-azure-ml-workspace-with-python-sdk"></a>示範 3：搭配 Python SDK 使用 Azure ML 工作區

> 💡 您必須先完成[環境設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#starting-fast)，才能嘗試進行此示範。

我們將在此示範中執行自訂 Python 程式碼，該程式碼會使用 Python Azure ML SDK 來定型、最佳化及使用自訂以外觀為基礎的情感分析 (ABSA) 模型。

此部分示範的所有指示都位於 Jupyter Notebook 本身中。 使用上述其中一項方法來執行 Notebook (在 Azure Notebooks 中或在本機執行)，並遵循該處的指示。 

## <a name="tear-down"></a>終止方法

若要釋放在示範期間所使用的雲端資源，您必須刪除 Azure ML 工作區和資源群組：

```shell
az ml workspace delete --w absa_space -g absa
az group delete -n absa
```

## <a name="presenter-resources"></a>其他簡報者資源

如果您要簡報此內容，請查看[其他簡報者資源](README-Instructor.md)。

## <a name="resources-and-continue-learning"></a>資源與繼續學習

### <a name="getting-started-series"></a>快速入門系列

* [Azure 認知服務文字分析 API](https://aka.ms/TextCogSvc)
* [自動化機器學習](https://aka.ms/AutomatedMLDoc)
* [超參數微調](https://aka.ms/AzureMLHyperDrive)
* [Azure ML 服務和 Python SDK](https://aka.ms/AA3dzht) 

### <a name="other-materials"></a>其他材料

* [9 種用於生產機器學習的進階提示](http://aka.ms/9TipsProdML)
* [Intel 以外觀為基礎的情感分析頁面](https://www.intel.ai/introducing-aspect-based-sentiment-analysis-in-nlp-architect/)
* Azure ML 最佳做法存放庫：
    * [自然語言處理](https://github.com/microsoft/nlp/)
    * [電腦視覺](https://github.com/microsoft/ComputerVision)
    * [推薦](https://github.com/microsoft/Recommenders)


## <a name="feedback-loop"></a>意見反應迴圈

您是否有註解、意見反應或建議？ 目前，內容變更、建議、意見反應的最佳意見反應迴圈，是在此 GitHub 存放庫上建立新的問題。 若要取得如何建立問題的所有詳細資料，請參閱[參與](../../contributing.md)文件
