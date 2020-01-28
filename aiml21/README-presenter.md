# <a name="aiml21-developers-guide-to-ai-a-data-story"></a>AIML21：AI 開發人員指南：資料案例 

## <a name="train-the-trainer-guide"></a>訓練人員指南

### <a name="session-abstract"></a>課程摘要

在這個講堂式課程中，我們將示範資料科學程序，以及如何加以套用。 從探索資料集到部署服務 - 全都適用於一個有趣的資料案例。 這也會帶您簡單地導覽 Azure AI 平台。

# <a name="how-to-use"></a>如何使用

### <a name="welcome-presenter"></a>歡迎，簡報者！

非常開心您能來到這裡，我們對您帶來的精彩內容萬分期待。 身為有經驗的簡報者，我們知道您清楚「如何」  進行簡報，因此本指南將著重於您需要簡報的「內容」  。 為您提供由簡報設計小組建立的完整簡報流程。

除了簡報的影片，這份文件也連結到您完成簡報所需的所有資產，包括 PowerPoint 投影片和示範指示與程式碼。

* 請完整閱讀整份文件。
* 觀看影片簡報
* 向簡報者提出問題

# <a name="assets-in-train-the-trainer-kit"></a>訓練人員套件中的資產

* 本指南
* [PowerPoint 簡報](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/presentations.md)
* [簡報的全長錄製](https://youtu.be/K8upKkvtEI0)
* [使用的資料集](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/data)
* [要執行的程式碼檔案](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/code)
* 個別的示範影片： 
    * 示範 1 - [探索](https://youtu.be/-z6nfyq-WrI)
    * 示範 2 - [實驗](https://youtu.be/c7p_4CRYT8k)
    * 示範 3 - [部署](https://youtu.be/7bkBO7NQd4Q)
    * 示範 4 - [展示](https://youtu.be/g7aBaC9s9qQ)
* 示範指示

# <a name="demo-instructions"></a>示範指示：

請下載此存放庫中的所有程式碼和資料檔案，以便開始使用。 有一個程式碼和資料的資料夾，其中包含執行所有示範需要的所有資訊

**您將需要：**
* Azure 訂用帳戶 - 視需要在[這裡取得免費試用](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Power BI Desktop (僅限 Windows)](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=msignitethetour2019-github-aiml21) - 如果您在 MacOS/Linux 上執行，則您仍然可從任何新式網頁瀏覽器示範功能

**安裝指示：**
* 使用下面的 [部署至 Azure]  按鈕，建立要在整個課程中使用的 Azure Machine Learning 工作區

[![部署至 Azure](https://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

* 登入 Azure 入口網站及 Azure Machine Learning 服務
* 選擇將工作區升級為 **Enterprise 版本 (預覽)** 。[如需目前定價的詳細資訊，請參閱這裡](https://azure.microsoft.com/en-us/pricing/details/machine-learning/) - 您將需要 Enterprise 版本才能完成此實驗示範 (示範2)
* 啟動**預覽 UI**
* 建立**筆記本 VM**
    * 從左窗格選取 [計算]
    * 在 [筆記本 VM] 下選取 [新增]
    * 提供 [筆記本 VM 名稱] (全部小寫)
    * 保留提供的預設 VM 大小
    * 建立後，選取 [Jupyter 連結]
    * 按兩下以進入使用者資料夾
    * 選取 [上傳] 按鈕，並上傳下列檔案：
        * [data/data_train.csv](data/data_train.csv)
        * [code/explore.ipynb](code/explore.ipynb)
        * [code/deploy.ipynb](code/deploy.ipynb)
        * [code/config.json](code/config.json)
    * 開啟 [config.xml](code/config.json)，並輸入您的訂用帳戶金鑰、資源群組和 Azure ML 工作區名稱，然後儲存檔案

>[在這裡深入了解筆記本 VM](https://azure.microsoft.com/en-us/blog/three-things-to-know-about-azure-machine-learning-notebook-vm/?WT.mc_id=msignitethetour2019-github-aiml21)

* 建立**計算執行個體**
    * 從左窗格選取 [計算]
    * 在 [Training Clusters] \(定型叢集\) 索引標籤下選取 [新增]
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

* 建立 **Power BI 工作區**
    * 開啟 [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)
    * 使用您的工作區認證登入
    * 按一下左窗格中的 [工作區]
    * 按一下 [建立工作區]
    * 輸入工作區名稱
    * 輸入工作區的描述
    * 按一下 [儲存]
* 發佈 **Power BI 報表**
    * 使用 Present.pbix 開啟 Power BI Desktop
    * 按一下 [發佈]
    * 選取您剛才建立的工作區名稱
    * 等候報表發佈
* 檢視 **Power BI 報表**
    * 返回 [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) 
    * 如有需要，請重新整理瀏覽器
    * 在網頁瀏覽器中，查看左窗格中的報表
    * 按一下報表，會隨即將其載入

## <a name="demo-1---explore"></a>示範 1 - 探索

> 💡 您必須先完成[設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-presenter.md#demo-instructions)，才能嘗試進行此示範。

### <a name="video-demo-with-voice-over-aiml21---demo-1---explorehttpsyoutube-z6nfyq-wri"></a>有聲影片示範：[AIML21 - 示範 1 - 探索](https://youtu.be/-z6nfyq-WrI)

* 登入您的 [Azure 入口網站](https://azure.microsoft.com/en-gb/?WT.mc_id=msignitethetour2019-github-aiml21)，並開啟您使用上述範本所建立的 **Azure Machine Learning**
* 按一下 [立即啟動預覽]  以啟動預覽體驗
* 從左窗格開啟 [計算] 
* 在您的筆記本 VM 上選取 [Jupyter]  連結
* 如有需要，請使用您的 Azure 認證登入 
* 開啟 [**Explore.ipynb**](code/explore.ipynb) *(建議所有這些索引標籤均已開啟並就緒)*
* 確定已清除筆記本中的所有輸出資料格 - [選取資料格] -> [所有輸出] -> [清除] 
* **觀看影片以了解每個示範的所有談話重點**
* 執行並簡短說明前 6 個資料格
* 請注意，還有其他資料格和視覺效果可供使用，出席者應該從 **[aka.ms/AIML21repo](http://aka.ms/aiml21repo)** 下載程式碼

## <a name="demo-2---experiment"></a>示範 2 - 實驗

> 💡 您必須先完成[設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-presenter.md#demo-instructions)，才能嘗試進行此示範。

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
* 選取 [檢視其他組態設定]  ，並將 [主要計量] 設定為 [normalized_root_mean_squared_error] 
* 將 [並行] 的 [最大並行反覆運算次數] 設定為 3
* 將 [結束準則] 的 [定型工作時間 (小時)] 設定為 1
* 選取 [儲存] 
* 選取 [完成] 

> 一旦正在執行，說明需要一些時間來執行實驗，且您將會檢閱先前執行的範例。 

> 請確定在開始進行階段之前，您有所述完全執行的自動化 ML 迴歸

* 從左側 [自動化 ML] 頁面選取先前執行的實驗，或從您剛才提交的上述實驗按 [上一步] 按鈕
* 先前執行的實驗會有很長的「執行識別碼」，請選取此連結
* **觀看影片以了解每個示範的所有談話重點**

## <a name="demo-3---deploy"></a>示範 3 - 部署

> 💡 您必須先完成[設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-presenter.md#demo-instructions)，才能嘗試進行此示範。

### <a name="video-demo-with-voice-over-aiml21---demo-3---deployhttpsyoutube7bkbo7nqd4q"></a>有聲影片示範：[AIML21 - 示範 3 - 部署](https://youtu.be/7bkBO7NQd4Q)

> 您將使用在上方檢閱的先前執行實驗來進行部署

* 在畫面上開始執行**自動化 ML 實驗**
* 選取 [Deploy Best Model] \(部署最佳模型\)  按鈕
* 建立部署名稱 example/ aiml21-v1
* 如有需要，請新增部署描述
* 將 [計算類型] 設定為 [ACI (Azure 容器執行個體)]
* 保持啟用驗證
* 選擇 [部署]  按鈕
* 對部署可能需要的時間加上註解，您可以從左側的 [端點] 索引標籤進行檢閱

>請確定在開始進行階段之前，您有完全執行的自動化 ML 迴歸實驗，並已部署到 ACI

* 選取左窗格中的 [端點] 
* 選取您已建立的 Azure 容器執行個體模型
* **觀看影片以了解每個示範的所有談話重點**
* 選取具有 Jupyter 的瀏覽器索引標籤
* 開啟 [Deploy.ipynb](code/deploy.ipynb)
* 確定已清除筆記本中的所有輸出資料格 - [選取資料格] -> [所有輸出] -> [清除] 
* 確認 config.json 檔案已完成，並具有正確資訊
* 編輯第 2 個資料格，以包含您已部署的 Web 服務名稱
* 執行筆記本中的所有資料格，並說明程式碼 - **觀看影片以了解每個示範的所有談話重點**

## <a name="demo-4---present"></a>示範 4 - 展示

> 💡 您必須先完成[設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-presenter.md#demo-instructions)，才能嘗試進行此示範。

### <a name="video-demo-with-voice-over-aiml21---demo-4---presenthttpsyoutubeg7abac9s9qq"></a>有聲影片示範：[AIML21 - 示範 4 - 展示](https://youtu.be/g7aBaC9s9qQ)

>開始進行階段之前，請使用 [Present.pbix](code/Present.pbix) 和 [https://powerbi.microsoft.com/](https://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) 開啟 Power BI Desktop，並從上述設定開啟工作區和報表

* 開啟 Present.pbix 
* **觀看影片以了解每個示範的所有談話重點**
* 顯示 [發佈] 按鈕
* 開啟 [https://powerbi.microsoft.com/](https://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)
* **觀看影片以了解每個示範的所有談話重點**

# <a name="teardown-instructions"></a>終止指示

### <a name="full-teardown"></a>完整終止

* 進入 Azure 入口網站，並刪除 Azure 資源群組來移除此專案的所有資源

### <a name="to-save-costs"></a>節省成本

* 確定在未使用的筆記本 VM 上選取 [關機]
* 未使用時，刪除端點中的 Azure 容器執行個體

# <a name="resources-and-continued-learning"></a>資源與繼續學習

**Microsoft Learn：**
* [在 Azure 中探索資料科學工具](https://docs.microsoft.com/en-us/learn/paths/explore-data-science-tools-in-azure/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Python 簡介](https://docs.microsoft.com/en-us/learn/modules/intro-to-python/?WT.mc_id=msignitethetour2019-github-aiml21)
* [使用 Azure Machine Learning 服務自動選取 ML 模型](https://docs.microsoft.com/en-us/learn/modules/automate-model-selection-with-azure-automl/?WT.mc_id=msignitethetour2019-github-aiml21)
* [透過 Power BI 建立及使用分析報表](https://docs.microsoft.com/en-us/learn/paths/create-use-analytics-reports-power-bi/?WT.mc_id=msignitethetour2019-github-aiml21)


# <a name="feedback-loop"></a>意見反應迴圈

所有演講者每個月都有機會參加**訓練人員問與答課程** (涵蓋所有時區的兩個課程)，而在舞台上傳遞內容之後，我們很歡迎您加入我們的**意見反應課程**，這是為了分享您的內容經驗，以及想要提供意見反應或想法的任何內容而組織。 

您是否有評論、意見反應或建議？ 目前，內容變更/建議/意見反應的最佳意見反應迴圈，是在此 GitHub 存放庫上建立新的問題。 若要取得如何建立問題的所有詳細資料，請參閱[參與文件](../CONTRIBUTING.md)

## <a name="become-a-trained-presenter"></a>成為經訓練的簡報者

若要成為經訓練的簡報者，請連絡 [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com)。 請在電子郵件中包含以下內容：

- 完整名稱
- 這份簡報的代碼：aiml21
- 您的簡報影片連結 (長度在 10 分鐘以內) (例如：未列出的 YouTube 影片)。 
  > 不一定要用此內容的影片，重點是展現您的簡報者技能

顧問會帶您了解流程的相關資訊。

## <a name="trained-presenters"></a>經訓練的簡報者

感謝這些很棒的人員 ([表情圖示按鍵](https://allcontributors.org/docs/en/emoji-key))：

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/amynic">
        <img src="https://avatars3.githubusercontent.com/u/13828867?s=400&u=f6aca8528d65d6c191114d3a7328b46137eda162&v=4" width="100px;" alt="Amy Boyd"/><br />
        <sub><b>Amy Boyd</b></sub></a><br />
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/commits?author=amynic" title="討論">📢</a>
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/commits?author=amynic" title="文件">📖</a> 
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->
