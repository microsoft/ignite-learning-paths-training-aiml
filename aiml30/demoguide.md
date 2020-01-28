# <a name="demo-guide"></a>示範指南
> 💡 您必須先完成[部署](demosetup.md)，才能嘗試進行此示範。

# <a name="demo-1-data-prep-demo-with-app"></a>示範 1：使用應用程式示範資料準備
在第一個示範中，主要會示範時間序列模型投影片中所討論的資料準備。 逐步解說如何在 C# 示範應用程式中執行這項作業。 請務必強調這可以使用任何語言來完成。

若要使用 `F12` 和 `CTRL-` 快速鍵來巡覽程式碼，請在[這裡](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vs-keybindings)下載適用於 VS Code 的 Visual Studio 快速鍵延伸模組。 這非常有用，讓您不必四處捲動來嘗試尋找項目。 (請注意，此延伸模組不適用於 Mac 或 Linux)。

### <a name="data-prep-demo-video-herehttpsyoutubeu1ppyazunmot751"></a>如需資料準備示範影片，請參閱[這裡](https://youtu.be/u1ppYaZuNmo?t=751)

> 💡 您必須先完成[部署](demosetup.md)，才能嘗試進行此示範。

### <a name="1-open-the-igniteaimldataapp-app-i-personally-like-to-have-this-open-before-i-start-the-talk-so-i-can-just-flip-to-it"></a>1.開啟 `IgniteAimlDataApp` 應用程式。 我個人喜歡在開始討論之前先開啟此應用程式，以便能夠直接切換到應用程式。
* 開啟 `Program.cs` 檔案
* 按一下滑鼠右鍵並選取 [`Go To Definition`] 或按 `F12`，以移至 `GetProcessedDataForScore` 方法
    * 從資料來源匯入資料。 在此範例中，我們要載入解決方案中的本機 Excel 檔案。
* 按 `F12` 移至 `AddWeeksToPredict` 方法並討論邏輯。
    * 取得最新的日期，並自該日期起加上未來 4 週
    * 由於資料是每週，且我們想要知道在一週內是否出現假日，因此我們會計算一週內出現的所有日期，並填入稱為 `DatesInWeek` 的集合。
    * 接下來，對集合加上未來 4 週，以建立未來的時間。
* 按 `F12` 從 `AddWeeksToPredict` 邏輯內移至 `CreateTimeFeatures` 方法並討論邏輯。
    * 適當地使用目前的時間屬性來計算所需時間和假日特徵。
* 按 `CTRL-` 巡覽回到 `AddWeeksToPredict`
* 按 `F12` 移至 `CreateFourierFeatures`
    * 從我們每週資料特徵 52 的季節性來計算傅立葉項特徵。 
* 按 `CTRL-` 巡覽回到 `GetProcessedDataForScore`
* 按 `F12` 移至 `CreateLagFeatures` 方法並討論邏輯。
    * 將前 26 週的銷售值新增至目前資料列。
* 按 `CTRL-` 巡覽回到 `GetProcessedDataForScore`

* 資料示範備份選項
    * 使用隱藏投影片中內嵌的 MP4 影片。 在此無聲影片播放同時進行解說。
    * 從投影片 21 開始，示範靜態投影片步驟中的資料準備程式碼。

# <a name="demo-2-build-model-with-azure-machine-learning-designer"></a>示範 2：使用 Azure Machine Learning 設計工具建立模型
💡 您必須先完成[部署](demosetup.md)，才能嘗試進行此示範。

### <a name="full-model-building-live-demo-video-herehttpsyoutubeu1ppyazunmot1278"></a>如需完整模型建立即時示範影片，請參閱[這裡](https://youtu.be/u1ppYaZuNmo?t=1278)

### <a name="1-create-resource-and-upload-dataset"></a>1.建立資源並上傳資料集

* 建立 Azure Machine Learning Studio 資源，並巡覽至新的工作區。
    * 概觀檢閱，其中包含投影片中所討論的不同工具。
    * 此步驟的影片資源：
        * [這裡](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateAMLNavToWorkspace.mp4)是此步驟的無聲影片。
        * [這裡](https://youtu.be/u1ppYaZuNmo?t=1278)是示範如何建立資源的有聲影片。
* 將資料集上傳到 AML 中的資料集
    * 按一下 `Datasets`
    * 按一下 `Create from datastore` 或從本機 (視您的偏好而定)
        * 注意：您應該已將資料集上傳到示範設定步驟中的資料存放區。
    * 填寫必要欄位，然後選取 `workspaceblobstorage` 選項
    * 按一下 `Create`
    * 選擇性：逐步解說針對 AML 所上傳資料集中的資料準備功能

### <a name="2-launch-designer-and-explain-tool-features"></a>2.啟動設計工具並說明工具功能

* 在 Studio 中，選取左瀏覽列中的 [設計工具]
* 摘要說明左瀏覽列中的不同模組，包括測試資料集。

### <a name="3-start-building-the--model"></a>3.開始建立模型

* 將資料集拖放到實驗工作區上
    * 請注意，檔案上傳模組是將資料匯入工作區的選項
* 將 `Select Columns in Dataset` 拖曳到工作區上
    * 從右側的 [參數] 功能表，按一下 `Edit columns`。
    * 按一下 `By Name`
    * 按一下 `Add All`
    * 按一下 `Time` 資料行上的 `Minus` 圖示予以排除
* 將 `Split Data` 拖曳到工作區上
    * 編輯參數，將資料分割為 70/30。 
    * 此分割百分比不是規則，且可能會根據不同的模型需求而有所變更。
* 將 `Train Model` 拖曳到工作區上
    * 從右側的 [參數] 選取標籤資料行名稱 `Value`
* 將 `Boosted Decision Tree Regression` 拖曳到工作區上
* 將 `Score Model` 拖曳到工作區上
* 將 `Evaluate` 拖曳到工作區上
* 將 `Split Data` 模組連接到 `Train Model` 用於定型資料，以及 `Score Model` 來使用未曾見過的資料對預測結果進行評分。
* 將 `Train Model` 連接到定型演算法 `Boosted Decision Tree Regression` 模組。
* 使用 `Evaluate` 模組連接 `Score Model`。
* 這通常是您執行模型的位置，「但」  在示範中執行時所花費的時間太長。 討論如何按一下下方瀏覽列中的 `Run` 按鈕，然後選取 [計算]。 如此即可流暢地繼續討論如何在 AML 中建立計算資源。

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

### <a name="4-discuss-compute-target-creation"></a>4.討論計算目標建立

* 按一下 `Compute` 瀏覽項目
* 按一下 `Add`
* 討論不同的計算類型及其用途。 此示範所使用的計算包括用於定型的 `Machine Learning Compute`，以及用於部署 API 的 `Kubernetes Service`。

### <a name="5-explain-trained-model"></a>5.說明定型的模型
* 巡覽回到視覺化設計工具
* 以滑鼠右鍵按一下模型中的第二個模組，將資料視覺化 (最有可能是 `Select Columns in Dataset`)
* 快速捲動資料以顯示資料看起來的結果。
* 按一下資料行，並顯示工具如何在右方面板中建立視覺效果。
* 將 `Score Model` 模組視覺化，以顯示模型如何根據未曾見過的資料進行預測
* 將 `Evaluate Model` 模組視覺化，並討論用來評分的計量。
    * 在 [參數] 的右方面板中，按一下 `More Help`
    * 強調每個模組在參數中都有文件的連結，以說明模組所執行的作業。
    * 捲動並顯示文件中的模型計量說明。
    
### <a name="6-create-inference-pipeline-and-deploy-the-model"></a>6.建立推斷管線並部署模型
通常您可以在此建立 `Inference Pipeline` 並將其部署至 Web 服務，「但」  我們已事先完成這些步驟。 
* 討論這些步驟，「不要即時執行」  ：
    * 按一下 `Create inference pipeline`，然後選取 `Real-time inference pipeline`
    * 確定 `Web Service Output` 已連接到最後一個資料處理步驟模組 `Select Columns in Dataset`
    * 按一下 `Run`
    * 按一下 `Deploy`
* 討論建立 `Inference Pipeline` 的步驟之後，請從左瀏覽列巡覽至已部署的 Web 服務。
* 按一下事先建立的 Web 服務名稱。
* 按一下 `Test`，並顯示其在計分資料項目上的執行效能。
* 按一下 `Consume`，並顯示為整合 Web 服務所提供的範例程式碼。


# <a name="demo-3-testing-api-with-c-console-app-dotnet-core"></a>示範 3：使用 C# 主控台應用程式測試 API (dotnet core)

> 💡 您必須先完成[部署](demosetup.md)，才能嘗試進行此示範。

### <a name="api-demo-test-video-herehttpsyoutubeu1ppyazunmot2136"></a>如需 API 示範測試影片，請參閱[這裡](https://youtu.be/u1ppYaZuNmo?t=2136)

* 從 `Consume` 索引標籤複製 API 金鑰
* 開啟 `App.config` 並將其貼到值屬性中
* 從 `Consume` 索引標籤複製 `Request-Response Url`
* 開啟 `Program.cs` 並將值貼到 `client.BaseAddress = new Uri("");` 中
* 以滑鼠右鍵按一下 `Program.cs`，然後選取 `Open in Terminal`
* 鍵入命令 `dotnet run` 以執行主控台應用程式
* 若要使用 StoreID (ID1) 的預設值 2，以及 ItemID (ID2) 的預設值 1，並針對要預測的週數使用預設值， 請直接鍵入 `y`
* 這會執行並應該會傳回未來 4 週的預測值。
