# <a name="aiml30--start-building-machine-learning-models-faster-than-you-think--train-the-trainer"></a>AIML30 - 開始建立機器學習模型比您想得更快 - 訓練人員培訓

Tailwind Traders 使用自訂機器學習模型來修正其庫存問題，而無需變更軟體開發生命週期！ 怎麼做？ Azure Machine Learning 設計工具。
 
在本課程中，您將了解 Tailwind Traders 使用的資料科學程序，並取得 Azure Machine Learning 設計工具的簡介。 您將了解如何尋找、匯入和準備資料；選取機器學習演算法；定型和測試模型；以及將完整模型部署至 API。 取得您和開發小組所需的祕訣、最佳做法和資源，以繼續進行機器學習旅程、建立第一個模型等。


## <a name="demo-environment-deployment"></a>示範環境部署
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>


## <a name="create-additional-resources-needed"></a>建立所需的其他資源
建立基底 Azure Machine Learning 服務工作區之後，我們需要新增其他計算資源。
### <a name="create-compute-targets"></a>建立計算目標
1. 建立 Machine Learning Compute
    * 按一下 [計算] 瀏覽項目
    * 按一下 [新增]
    * 輸入資源的名稱
    * 從下拉式清單選取 [Machine Learning Compute]
    * 選取機器大小
    * 輸入最小節點數和最大節點數 (建議最小值為 0，最大值為 5)
    * 按一下 [建立] ![建立計算](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif)
2. 建立 Kubernetes 計算
    * 按一下 [計算] 瀏覽項目
    * 按一下 [新增]
    * 輸入資源的名稱
    * 從下拉式功能表選取 [Kubernetes Service]
    * 按一下 [建立] ![建立 Kubernetes](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif)


## <a name="build-model-with-azure-machine-learning-visual-designer"></a>使用 Azure Machine Learning 視覺化設計工具建立模型

### <a name="1-upload-the-dataset-to-the-datasets-in-aml"></a>1.將資料集上傳到 AML 中的資料集
* 從[這裡](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv)將資料集下載到本機
* 按一下 `Datasets`
* 按一下 `Create from local`
* 填寫表單並上傳資料集

### <a name="2-start-building-the--model"></a>2.開始建立模型

* 從左瀏覽列按一下 `Designer`
* 按一下加號以建立新的管線
* 展開 `My Datasets` 和 `Datasets`
* 將上傳的資料集拖放到實驗工作區上
* 將 `Select Columns in Dataset` 拖曳到工作區上
    * 從右側的 [參數] 功能表，按一下 `Edit columns`。
    * 按一下 `By Name`
    * 按一下 `Add All`
    * 按一下 `Time` 資料行上的 `Minus` 圖示予以排除
* 將 `Split Data` 拖曳到工作區上
    * 編輯參數，將資料分割為 70/30。 
    * 這不是規則，且可能會根據不同的模型需求而有所變更。
* 將 `Train Model` 拖曳到工作區上
    * 從右側的 [參數]，選取標籤資料行名稱 `Values`
* 將 `Boosted Decision Tree Regression` 拖曳到工作區上
* 將 `Score Model` 拖曳到工作區上
* 將 `Evaluate` 拖曳到工作區上
* 將 `Split Data` 模組連接到 `Train Model` 用於定型資料，以及 `Score Model` 來使用未曾見過的資料對預測結果進行評分。
* 將 `Train Model` 連接到定型演算法 `Boosted Decision Tree Regression` 模組。
* 使用 `Evaluate` 模組連接 `Score Model`。
* 按一下下方瀏覽列中的 `Run` 按鈕，然後選取 [計算]。 

* 將建立的資料行 `Scored Labels` 重新命名為 [`Forecast`]
    * 將 `Edit Metadata` 拖曳到工作區上
    * 使用 `Edit Metadata` 模組連接 `Score Model`。
    * 在 `Edit Metadata` 模組的 `Parameters` 中。 按一下 `Edit Columns`
    * 在文字方塊中鍵入 `Score Labels` (不需要變更任何預設值)
    * 按一下 `Save`
    * 接下來，將 `Parameters` 中的 `New Column Name`欄位更新為 `Forecast`
* 將標準化數值轉換回完整項目計數
    * 將 `Apply Math Operation` 拖曳到工作區上
    * 將 `Edit Metadata` 連接到 `Apply Math Operation`
    * 將 `Basic math function` 設定為 `Exp`
    * 按一下 `Edit Columns`，然後鍵入 `Value` 和 `Forecast`
    * 按一下 `Save`
    * 將 `Output mode` 設定為 `Inplace`
* 將 `Select Columns in Dataset` 模組拖曳到工作區上
* 將 `Apply Math Operation` 連接到 `Select Columns in Dataset`
* 按一下 `Edit Columns`，然後鍵入下列資料行名稱：`ID1,ID2,Value,Forecast`
* 這些是當我們張貼以從完成和部署的模型取得結果時，資料示範應用程式預期會有的資料行。
* 執行定型

### <a name="4-create-inference-pipeline-and-deploy-the-model"></a>4.建立推斷管線並部署模型
* 按一下 `Create inference pipeline`，然後選取 `Real-time inference pipeline`
* 確定 `Web Service Output` 已連接到最後一個資料處理步驟模組 `Select Columns in Dataset`
* 按一下 `Run`
* 按一下 `Deploy`
* 從左瀏覽列巡覽至已部署的 Web 服務。
* 按一下事先建立的 Web 服務名稱。
* 按一下 `Test`，並查看其在計分資料項目上的執行效能。
* 按一下 `Consume`，並查看為整合 Web 服務提供的範例程式碼。

### <a name="5-test-api-with-c-console-app-dotnet-core"></a>5.使用 C# 主控台應用程式測試 API (dotnet core)

1. [在這裡下載 VS Code](https://code.visualstudio.com/download)
2. 使用下列命令來複製應用程式
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
3. 巡覽至專案路徑
    * `cd ignite-learning-paths\aiml\aiml30\C#\IgniteAimlDataApp`
4. 在 VS Code 中開啟專案
    * `code .`
5. 將本機資料集取代為 `IgniteAimlDataApp/Datasets` 資料夾中從上述步驟所下載的資料集。
6. 執行測試
    * 從 `Consume` 索引標籤複製 API 金鑰
    * 開啟 `App.config` 並將其貼到 [值] 屬性中
    * 從 `Consume` 索引標籤複製 `Request-Response Url`
    * 開啟 `Program.cs` 並將值貼到 `client.BaseAddress = new Uri("");` 中
    * 以滑鼠右鍵按一下 `Program.cs`，然後選取 `Open in Terminal`
    * 鍵入命令 `dotnet run` 以執行主控台應用程式
    * 若要使用 StoreID (ID1) 的預設值 2，以及 ItemID (ID2) 的預設值 1，並針對要預測的週數使用預設值， 請直接鍵入 `y`
    * 這會執行並應該會傳回未來 4 週的預測值。


### <a name="6-optional-additionally-test-api-with-python-in-notebook-vms-using-jupyter-notebooks"></a>6.選擇性：此外，在使用 Jupyter 筆記本的筆記本 VM 中，透過 Python 測試 API
1. 巡覽至 `Compute`，並建立新的筆記本 VM ![建立計算](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif)
2. 建立後，在 `Application URI` 資料行下，按一下 `Jupyter Lab` 選項 (在 VM 處於 `running` 狀態之前，不會顯示此選項)。
3. 按一下來自 JupyterLab 首頁的終端
4. 從 JupyterLab 的終端複製存放庫
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
5. 另外在終端 `pip install holidays` 中
6. 開啟已複製的資料夾 `ignite-learning-paths-training-aiml` 並巡覽至 `ignite-ailml30-get-prediction.ipynb` 檔案，然後按一下檔案予以開啟。
    * 完整路徑應如下所示：`ignite-learning-paths-training-aiml\aiml30\Python\ignite-ailml30-get-prediction.ipynb`
7. 更新 CSV 檔案、端點和金鑰的路徑。
8. 按 `SHIFT + Enter`，或在頂端功能表中每個資料格上按一下 [執行] 來執行每個資料格

## <a name="powerpoint-deck-and-video-demo"></a>PowerPoint 簡報和影片示範

- [PowerPoint 簡報](presentations.md)

- [示範影片](https://www.youtube.com/watch?v=u1ppYaZuNmo&feature=youtu.be)

## <a name="resources-and-continue-learning"></a>資源與繼續學習

以下是相關訓練和文件的清單。

- [What is the Designer for Azure Machine Learning?](https://docs.microsoft.com/en-us/azure/machine-learning/service/ui-concept-visual-interface?WT.mc_id=msignitethetour-slides-cxa) (什麼是 Azure Machine Learning 設計工具？)
- [使用 Microsoft Azure Machine Learning 發佈機器學習實驗](https://docs.microsoft.com/en-us/learn/paths/publish-experiment-with-ml-studio/)


## <a name="feedback-loop"></a>意見反應迴圈

您是否有註解、意見反應或建議？ 目前，內容變更/建議/意見反應的最佳意見反應迴圈，是在此 GitHub 存放庫上建立新的問題。 若要取得如何建立問題的所有詳細資料，請參閱[參與](../../contributing.md)文件
