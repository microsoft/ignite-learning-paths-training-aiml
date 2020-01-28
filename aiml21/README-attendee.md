# <a name="developers-guide-to-ai-a-data-story"></a>AI 開發人員指南：資料案例

在這個講堂式課程中，我們將示範資料科學程序，以及如何加以套用。 從探索資料集到部署服務 - 全都適用於一個有趣的資料案例。 這也會帶您簡單地導覽 Azure AI 平台。

# <a name="demo-environment-deployment"></a>示範環境部署

請下載此存放庫中的所有程式碼和資料檔案，以便開始使用。 有一個程式碼和資料的資料夾，其中包含執行所有示範需要的全部資訊

**您將需要：**
* Azure 訂用帳戶 - 視需要在[這裡取得免費試用](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Power BI Desktop (僅限 Windows)](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=msignitethetour2019-github-aiml21) - 如果您在 MacOS/Linux 上執行，則仍然可以從任何新式網頁瀏覽器示範功能

**設定指示：**
* 使用下面的 [部署至 Azure]  按鈕來建立 Azure Machine Learning 工作區

[![部署至 Azure](https://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

* 登入 Azure 入口網站及 Azure Machine Learning 服務
* 選擇將工作區升級為 **Enterprise 版本 (預覽)** 。[如需目前定價的詳細資訊，請參閱這裡](https://azure.microsoft.com/en-us/pricing/details/machine-learning/) - 您將需要 Enterprise 版本才能完成此實驗示範 (示範 2)
* 啟動**預覽 UI**
* 建立**筆記本 VM**
    * 從左窗格選取 [計算]
    * 在 [筆記本 VM] 下選取 [新增]
    * 提供 [筆記本 VM 名稱] (全部小寫)
    * 保留提供的預設 VM 大小
    * 建立後，選取 [Jupyter 連結]
    * 按兩下以進入使用者資料夾
    * 選取 [上傳] 按鈕，並上傳以下檔案：
        * [data/data_train.csv](data/data_train.csv)
        * [code/explore.ipynb](code/explore.ipynb)
        * [code/deploy.ipynb](code/deploy.ipynb)
        * [code/config.json](code/config.json)
    * 開啟 [config.xml](code/config.json)，並輸入您的訂用帳戶金鑰、資源群組和 Azure ML 工作區名稱，然後儲存檔案

>[在這裡深入了解筆記本 VM](https://azure.microsoft.com/en-us/blog/three-things-to-know-about-azure-machine-learning-notebook-vm/?WT.mc_id=msignitethetour2019-github-aiml21)

* 建立**計算執行個體**
    * 從左窗格選取 [計算]
    * 在 [Training Clusters] \(定型叢集\) 下選取 [新增]
    * 提供 [計算名稱] (全部小寫)
    * 選擇 VM 大小
        * 針對標準計算，選取 [Standard_DS2_v2] 之類的選項
        * 針對 GPU 計算，選取 [Standard_NC6]
    * 針對虛擬機器優先順序，選取 [低優先順序]
    * 將最小節點數設定為 0 (如此會縮小到最小以降低成本)
    * 將最大節點數設定為 3-6
    * 按一下 [建立]

>[在這裡深入了解 Azure Machine Learning Compute](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-set-up-training-targets#amlcompute/?WT.mc_id=msignitethetour2019-github-aiml21)

* 上傳**資料集**
    * 從左窗格選取 [資料集]
    * 選取 [建立資料集]，然後選取 [從本機檔案]
    * 選取 [瀏覽] 按鈕，然後尋找 data_train_experiment.csv 檔案
    * 選取 [下一步]
    * 檢閱資料並選取 [下一步]，然後選取 [下一步]
    * 最後檢閱資料集設定，並選取 [建立]

>[在這裡深入了解如何建立資料集](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-create-register-datasets/?WT.mc_id=msignitethetour2019-github-aiml21)

# <a name="delivery-of-assets"></a>傳遞資產

* [PowerPoint 簡報](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/presentations.md)
* [使用的資料集](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/data)
* [要執行的程式碼檔案](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/code)
* 個別示範影片： 
    * 示範 1 - [探索](https://youtu.be/-z6nfyq-WrI)
    * 示範 2 - [實驗](https://youtu.be/c7p_4CRYT8k)
    * 示範 3 - [部署](https://youtu.be/7bkBO7NQd4Q)
    * 示範 4 - [展示](https://youtu.be/g7aBaC9s9qQ)

# <a name="demo-1---explore"></a>示範 1 - 探索

> 💡 您必須先完成[設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-attendee.md#demo-environment-deployment)，才能嘗試進行此示範。

### <a name="video-demo-with-voice-over-aiml21---demo-1---explorehttpsyoutube-z6nfyq-wri"></a>有聲影片示範：[AIML21 - 示範 1 - 探索](https://youtu.be/-z6nfyq-WrI)

* 登入 [Azure 入口網站](https://azure.microsoft.com/en-gb/?WT.mc_id=msignitethetour2019-github-aiml21)，並開啟您使用上述範本所建立的 **Azure Machine Learning**
* 按一下 [立即啟動預覽]  以啟動預覽體驗
* 從左窗格開啟 [計算] 
* 在您的筆記本 VM 上選取 [Jupyter]  連結
* 如有需要，請使用您的 Azure 認證登入 
* 開啟 [**Explore.ipynb**](code/explore.ipynb)
* 使用 SHIFT + ENTER 執行所有程式碼資料格

# <a name="demo-2---experiment"></a>示範 2 - 實驗

> 💡 您必須先完成[設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-attendee.md#demo-environment-deployment)，才能嘗試進行此示範。

### <a name="video-demo-with-voice-over-aiml21---demo-2---experimenthttpsyoutubec7p_4cryt8k"></a>有聲影片示範：[AIML21 - 示範 2 - 實驗](https://youtu.be/c7p_4CRYT8k)

* 前往 [ml.azure.com](https://ml.azure.com/?WT.mc_id=msignitethetour2019-github-aiml21)：Azure Machine Learning Studio。 您可以直接透過 URL 進行存取，然後登入並選取您為此討論所建立的正確工作區。 或者，從 Azure 入口網站中的 Azure Machine Learning 服務，選取 [立即啟動預覽]  按鈕
* 選取左窗格中的 [自動化 ML] 
* **觀看影片以了解每個示範的所有談話重點**
* 按一下 [新增自動化 ML 回合] 
* 選取定型資料集 (data_train_experiment-XXXXXX)
* 提供實驗名稱 example/ aiml21-regression-duration
* 選取目標資料行的 [持續時間] 
* 選取您在上方為計算所設定的「定型叢集」
* 選取 [下一步] 
* 針對預測工作，選取 [迴歸] 
* 選取 [檢視其他組態設定]  ，並將 [主要計量] 設定為 **'normalized_root_mean_squared_error'**
* 將 [並行] 的 [最大並行反覆運算次數] 設定為 3
* 將 [結束準則] 的 [定型工作時間 (小時)] 設定為 1
* 選取 [儲存] 
* 選取 [完成] 

> 這需要一些時間來執行 - ~15 - 20 分鐘 

* 完成後，檢閱模型執行的輸出，並找出最佳模型

# <a name="demo-3---deploy"></a>示範 3 - 部署

> 💡 您必須先完成[設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-attendee.md#demo-environment-deployment)，才能嘗試進行此示範。

### <a name="video-demo-with-voice-over-aiml21---demo-3---deployhttpsyoutube7bkbo7nqd4q"></a>有聲影片示範：[AIML21 - 示範 3 - 部署](https://youtu.be/7bkBO7NQd4Q)

* 示範 2 結束後
* 在畫面上開始執行**自動化 ML 實驗**
* 選取 [Deploy Best Model] \(部署最佳模型\)  按鈕
* 建立部署名稱 example/ aiml21-v1
* 如有需要，請新增部署描述
* 將 [計算類型] 設定為 [ACI (Azure 容器執行個體)]
* 保持啟用驗證
* 選擇 [部署]  按鈕

>這需要一些時間來執行 - ~20-30 分鐘

* 完成後，選取左窗格中的 [端點] 
* 選取 Azure 容器執行個體模型並檢閱詳細資料
* 選取已開啟 Jupyter 的瀏覽器索引標籤
* 開啟 [**Deploy.ipynb**](code/deploy.ipynb)
* 確認 [config.json](code/config.json) 檔案已完成，並包含設定階段中的正確資訊
* 編輯第 2 個資料格，以包含已部署的 Web 服務名稱
* 執行筆記本中的所有資料格，並檢閱輸出

# <a name="demo-4---present"></a>示範 4 - 展示

> 💡 您必須先完成[設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-attendee.md#demo-environment-deployment)，才能嘗試進行此示範。

### <a name="video-demo-with-voice-over-aiml21---demo-4---presenthttpsyoutubeg7abac9s9qq"></a>有聲影片示範：[AIML21 - 示範 4 - 展示](https://youtu.be/g7aBaC9s9qQ)

* 開啟 [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)
* 使用您的工作區認證登入
* 按一下左窗格中的 [工作區]
* 按一下 [建立工作區]
* 輸入工作區名稱
* 輸入工作區的描述
* 按一下 [儲存]
* 使用 Present.pbix 開啟 Power BI Desktop
* 與資料和視覺效果互動
* 按一下 [發佈] 按鈕
* 選取您剛才建立的工作區名稱
* 等候報表發佈
* 返回 [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) 
* 如有需要，請重新整理瀏覽器
* 在網頁瀏覽器中，查看左窗格中的報表
* 按一下報表，這會隨即載入

# <a name="teardown-instructions"></a>終止指示

### <a name="full-teardown"></a>完整終止

* 進入 Azure 入口網站，並刪除 Azure 資源群組來移除此專案的所有資源

### <a name="to-save-costs"></a>節省成本

* 確定在未使用的筆記本 VM 上選取 [關機] 
* 未使用時，**刪除**端點中的 Azure 容器執行個體

# <a name="resources-and-continued-learning"></a>資源與繼續學習

**Microsoft Learn：**
* [在 Azure 中探索資料科學工具](https://docs.microsoft.com/en-us/learn/paths/explore-data-science-tools-in-azure/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Python 簡介](https://docs.microsoft.com/en-us/learn/modules/intro-to-python/?WT.mc_id=msignitethetour2019-github-aiml21)
* [使用 Azure Machine Learning 服務自動選取 ML 模型](https://docs.microsoft.com/en-us/learn/modules/automate-model-selection-with-azure-automl/?WT.mc_id=msignitethetour2019-github-aiml21)
* [透過 Power BI 建立及使用分析報表](https://docs.microsoft.com/en-us/learn/paths/create-use-analytics-reports-power-bi/?WT.mc_id=msignitethetour2019-github-aiml21)

# <a name="feedback-loop"></a>意見反應迴圈

您是否有註解、意見反應或建議？ 目前，內容變更/建議/意見反應的最佳意見反應迴圈，是在此 GitHub 存放庫上建立新的問題。 若要取得如何建立問題的所有詳細資料，請參閱[參與文件](../CONTRIBUTING.md)
