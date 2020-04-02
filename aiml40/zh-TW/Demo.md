# <a name="aiml40---demo-instructions"></a>AIML40 - 示範指示

[AIML40 公開材料](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/)會詳細描述 AIML40 中的示範指示，包括所需的準備工作。 我們不會複製此處所述的步驟，但會醒目提示一些重要技巧，讓示範更出眾 (不超過 45 分鐘)。 請先閱讀公開材料以熟悉示範案例。

## <a name="demo-preparation"></a>示範準備

如 [AIML40 公開讀我檔案](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md)中所述，準備步驟如下：

1. 建立 Azure ML 工作區 (使用 Azure 範本或 CLI 命令)
2. 將適用於自動化 ML 示範的資料集上傳至工作區
3. 建立計算叢集以加速示範
4. 設定 Jupyter Notebook 環境並於其中開啟 `asba.ipynb` 檔案，準備開始執行。

因此，在示範之前，您應該在瀏覽器開啟下列 3 頁：
 - [文字分析頁面](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)
 - [Azure ML 工作區](http://ml.azure.com)
 - 具有 `asba.ipynb` 的 Jupyter Notebook

除這些步驟之外，您還需要執行下列動作，以確保快速示範：

> 💡 您必須先完成[環境設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/Demo.md#demo-preparation)，才能嘗試執行此示範。

1. **示範 1：** 在瀏覽器開啟[文字分析頁面](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)，並在下方的文字方塊中輸入下列文字，然後按 [分析]  ： 
> I loved the polka dot pants that I bought in the london store

[示範 1 的影片連結：Cognitive Services Text Analytics](https://youtu.be/QJxjm5BirOA) (認知服務文字分析)

2. **示範 2：**
   - 使用 [Azure ML 工作區](http://ml.azure.com)開啟頁面。 如有必要 -- 選取正確的工作區。
   - 確定資料集已上傳
   - 移至 Azure Machine Learning 工作區的 [自動化 ML]  索引標籤，然後執行自動化 ML 實驗，如 [AIML40 公開讀我檔案](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md)中所述。 因為執行需要相當長的時間，所以請先完成。
   - 請務必在即將開始簡報前重新整理頁面，如此在執行示範時即不必再次登入

[示範 2 的影片連結：Automated Machine Learning](https://youtu.be/qrstXN6TLZk) (自動化機器學習)

3. **示範 3：**
   - 在 Jupyter 環境中開啟 `asba.ipynb`
   - 請確定在程式碼中貼上正確的訂閱識別碼 (以及叢集名稱/資源群組名稱，如已變更預設值)
   - 執行筆記本中的所有儲存格，以確保所有步驟都正確執行。 某些步驟需要花較長的時間執行，因此請事先準備好。 (實驗執行時間約需 ~3.5 小時，所以讓計算叢集成為低優先順序以節省成本很重要)
   - 請確定在示範開始前完成使用筆記本，如此就不需要再次輸入認證。

[示範 3 的影片連結：Azure Machine Learning SDK and Hyperdrive](https://youtu.be/sccNTPO3PwU) (Azure Machine Learning SDK 和 Hyperdrive)


## <a name="demo-time"></a>示範開始！

在示範期間，建議您顯示下列各項：

1. **示範 1.1**：只要在瀏覽器開啟[文字分析頁面](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)，然後按一下 [分析]  即可。 頁面應預先載入。
2. **示範 1.2**： 
  - 在同一頁面中，按一下 [Example-English-Positive] \(範例-英文-正向\)  切換至預設片語 *I had a wonderful trip to Seattle last week and even visited the Space Needle two times*，然後按一下 [分析] 
  - 觀察良好的正面分數
  - 移除 **wonderful** 一詞
  - 按一下 [分析]  ，然後觀察明顯下降的分數
3. **示範 2：** Azure ML 工作區和自動化 ML
  - 開啟瀏覽器，且 [Azure ML 工作區](http://ml.azure.com) 頁面應預先載入
  - 巡覽至 [資料集] 
  - 開啟 [資料集]
  - 展開 [概觀]  索引標籤上的 [範例使用方式]  以顯示程式碼
  - 切換至 [探索]  以顯示資料
  - 切換至 [自動化 ML] 
  - 填入實驗名稱，選取 [計算]，然後選取資料集 (clothing_automl.xlsx)
  - 選擇 [分類]  工作和 [評分]  作為目標資料行
  - 展開 [進階設定]  並示範可用的選項，包括演算法選項
  - 按一下 [開始]  (但請務必準備好先前執行的實驗，因為這需要很多時間！)
  - 按一下 [自動化 ML]  索引標籤，帶出之前在準備階段期間即執行過的實驗
  - 說明顯示執行不同模型及最佳執行的圖表
  - 按一下最佳模型以探索 **ROC**、**精確度重新叫用** 和其他計量圖形的詳細資訊
  - 示範 [部署模型]  按鈕，顯示部署模型有多麼簡單
4. **示範 3：** 使用 Azure ML 服務和 Python SDK
  - 在此示範中，您應該遵循並說明 `absa.ipynb` 筆記本的儲存格
  - 為確保百分百安全，您可以只顯示但完全不執行程式碼，這絕對安全，但就不會予人真正在示範模式中執行程式碼的印象
  - 若要製作更生動的示範，請參閱 [absa-instuctions.ipynb](absa-instuctions.ipynb) 筆記本，其會說明示範期間「不」  該執行哪些儲存格，而哪些可以安全執行
  - 一般而言，我們希望能避免長時間執行的工作

## <a name="tear-down"></a>拆除

因為示範需要大量資源，所以請別忘了：
* 刪除計算叢集 (尤其為節省叢集準備時間，我們的示範關閉了自動調整功能)
* 如果搭配 Azure Machine Learning 計算執行，請確定停機期間的節點下限設為 0、示範期間設為 1 以節省成本
* 您也可以刪除 Azure ML 工作區和資源群組 -- 指示請參閱[公開讀我檔案](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md)

