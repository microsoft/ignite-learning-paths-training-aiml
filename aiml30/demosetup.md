# <a name="demo-setup"></a>示範設定
請遵循下列步驟，以準備好您的環境進行即時示範。 完成此設定之後，接著遵循[示範指南](demoguide.md)。

## <a name="create-azure-machine-learninge-resources-with-the-deploy-to-azure-button-below"></a>使用下方的 [部署至 Azure] 按鈕來建立 Azure Machine Learninge 資源
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>

> 建立後，請針對本課程，將 Azure Machine Learning 資源升級為 Enterprise 版本。 您應該會看到 [升級] 按鈕來完成此動作。 這目前為預覽階段，但定價結構如[這裡](https://azure.microsoft.com/en-us/pricing/details/machine-learning/)所述

## <a name="create-additional-resources-needed"></a>建立所需的其他資源

* 選取 [啟動新的 Azure Machine Learning Studio] 

建立基底 Azure Machine Learning 服務之後，我們需要新增其他計算資源。
### <a name="create-compute-targets"></a>建立計算目標
1. 建立 Machine Learning Compute
    * 按一下 [計算] 瀏覽項目
    * 選取 [Training Clusters] \(定型叢集\)
    * 按一下 [新增]
    * 輸入資源的名稱
    * 選取機器大小 (例如：Standard_DS2_v2)
    * 輸入最小和最大節點數 (建議最小值為 0，最大值為 5)
    * 按一下 [建立] ![建立計算](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif)
2. 建立 Kubernetes 計算
    * 按一下 [計算] 瀏覽項目
    * 選取 [Inference Clusters] \(推斷叢集\)
    * 按一下 [新增]
    * 輸入資源的名稱
    * 選取區域
    * 將 [虛擬機器大小] 保留為預設值
    * 將叢集目的設定為 [開發/測試]
    * 按一下 [建立] ![建立 Kubernetes](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif)
3. 建立筆記本虛擬機器
    * 按一下 [計算] 瀏覽項目
    * 選取 [筆記本 VM]
    * 按一下 [新增]
    * 為筆記本指定唯一名稱
    * 選取 VM 大小
    * 按一下 [建立] ![建立 VM](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif)


## <a name="upload-dataset-to-workspace-blob-storage-and-save-to-local"></a>將資料集上傳到工作區 Blob 儲存體，然後儲存到本機
每週會建立所需的資料集並提供更新日期，以允許您的示範能夠預測未來週數。 以下步驟可讓您取得新的資料集，並將其新增至 Azure Machine Learning 儲存體帳戶和示範資料應用程式。

1. 從[這裡](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv)將資料集下載到本機
2. 開啟 Azure 儲存體總管 - [在這裡下載](https://azure.microsoft.com/en-us/features/storage-explorer/)。
3. 巡覽至 `azureml-blobstore-<guid>`
4. 建立稱為 `datasets` 的新資料夾
5. 上傳資料集
6. 取代 C# 示範應用程式中的本機 ForecastingData.csv 檔案，以便預測未來日期。 有預設的 csv，但這不會是更新的資料。

## <a name="get-the-c-demo-app"></a>取得 C# 示範應用程式
第一個示範使用 VS Code 和 C# IgniteAimlDataApp。 這是為了示範如何執行資料處理，並強調這可以使用任何語言來完成。

1. [在這裡下載 VS Code](https://code.visualstudio.com/download)
2. 確定已在本機安裝 [.NET Core SDK 2.1.0](https://dotnet.microsoft.com/download/dotnet-core/2.1)
3. 使用下列命令來複製應用程式
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
4. 巡覽至專案路徑
    * `cd ignite-learning-paths-training-aiml/aiml30/C#/IgniteAimlDataApp/IgniteAimlDataApp`
5. 在 VS Code 中開啟專案
    * `code .`
6. 將本機資料集取代為 `IgniteAimlDataApp/Datasets` 資料夾中從上述步驟下載的資料集。
7. 執行應用程式
    * 以滑鼠右鍵按一下 `Program.cs`，然後選取 `Open in Terminal`
    * 執行 `dotnet run` 命令
    * 在系統出現問題提示 `Would you like to run the default params` 時，鍵入 `y`
    * 這會嘗試叫用 API，但由於尚未建立，因此會失敗。

## <a name="run-through-the-live-demo"></a>執行即時示範
完成執行即時示範，以開啟完整的備份模型並顯示最終結果。

#### <a name="there-will-not-be-enough-time-to-run-the-model-during-the-live-demo-make-sure-to-build-the-model-_without_-running-it-in-the-live-session-once-you-have-added-all-the-modules-to-the-experiment-workspace-then-navigate-to-the-model-you-created-and-trained-prior-to-the-session"></a>在即時示範期間，沒有足夠的時間可執行模型。 請務必建立模型，而「不要」  在即時課程中執行。 將所有模組新增至實驗工作區之後，請巡覽至您在課程之前建立和定型的模型。

[下一步 - 即時示範步驟](demoguide.md)
