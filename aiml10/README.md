# <a name="aiml10-making-sense-of-your-unstructured-data-with-ai"></a>AIML10：利用 AI 讓您的非結構化資料發揮意義

## <a name="session-abstract"></a>課程摘要

Tailwind Traders 擁有許多舊資料，希望開發人員能在應用程式中運用；這些資料可能來自各種結構化和非結構化的來源，並包含影像、表單、PDF 檔案和其他數種格式。 在本課程中，您將了解小組如何使用認知搜尋，在短時間內讓此資料發揮意義，並獲得驚人的成功。 我們將討論許多 AI 概念，例如內嵌-擴充-探索模式、技能、認知技能、自然語言處理、電腦視覺等。

## <a name="table-of-content"></a>目錄
 

| 資源          | 連結                            |
|-------------------|----------------------------------|
| PowerPoint        | - [簡報](presentations.md) |
| 影片            | - [嘗試執行排練](https://www.youtube.com/watch?v=dm0wDTSso0E) <br/>- [Microsoft Ignite 奧蘭多錄影](https://myignite.techcommunity.microsoft.com/sessions/82986?source=sessions) |
| 示範             | - [Demo 1 - Azure Cognitive Search](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo1.md) (示範 1 - Azure 認知搜尋) <br/>- [Demo 2 - Forms Recognizer Service](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo2.md) (示範 2 - 表單辨識器服務) <br/>- [Demo 3 - Creating a Custom Invoice Reader Skill](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo3.md) (示範 3 - 建立自訂的發票讀取器技能)<br/>- [Demo 4 - Tying it all Together](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo4.md) (示範 4 - 全部整合) <br/>- [Demo 5 - Knowledge Store](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo5.md) (示範 5 - 知識存放區) | 


# <a name="overview"></a>概觀
在此解決方案中，我們會開發一個程序，其中會採用一組非結構化的 PDF 發票，並使用 Azure 認知搜尋搭配自訂表單辨識器技能來產生結構化的表格式輸出。 

建立此解決方案時，會建立一些 Azure 資源 (如有需要，請[在這裡免費試用](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml10))。 下表列出每個資源和其用途，以及完整實作解決方案所需的任何特殊指示 (我使用討論期間所顯示的名稱，但必須針對您的特定解決方案重新命名)：

![Azure 資源](images/resources.png "Azure 資源")

## <a name="azure-resources"></a>Azure 資源

| 名稱                       | 類型                            | 目的                    |
| -------------------------- | ------------------------------- | ------------------------- |
| **ttcognitivesearch**     | 資源群組                  | 將服務分組在一起   |
| **ttinvoicestorage**      | 儲存體帳戶                 | 用於儲存發票     |
| **ttinvoicesearch**       | 搜尋服務                  | 精選服務           |
| **ttinvoiceintelligence** | 認知服務 (全方位) | 用於搜尋服務 |
| **ttinvoicereader**       | 表單辨識器服務         | 這項服務最後會併入全方位服務。 但目前處於有限存取權的預覽階段。 若要存取預覽，請填寫並提交 [Form Recognizer access request](https://aka.ms/FormRecognizerRequestAccess) (表單辨識器存取要求) 表單。  |
| **readerskillstorage**   | 儲存體帳戶              | 用於 Azure 函式的儲存體 |
| **readerskill**          | 函數應用程式                 | 認知技能應用程式 |
| **readerskill**          | App Insights                   | 將見解新增至函數應用程式 |
| **EastUS2LinuxDynamicPlan** | App Service 方案                   | 用於執行函數應用程式的使用情況方案 |

# <a name="presentation"></a>簡報

* [PowerPoint 下載](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/aiml10.pptx)
* [Microsoft Ignite 奧蘭多課程影片](https://myignite.techcommunity.microsoft.com/sessions/82986?source=sessions)


# <a name="demonstrations"></a>示範
這段討論是由下列 5 個示範所組成。 

- **示範 1**：[Azure 認知搜尋](demo1.md)
- **示範 2**：[表單辨識器服務](demo2.md) - 此示範需要存取表單辨識器預覽。 若要存取預覽，請填寫並提交 [Form Recognizer access request](https://aka.ms/FormRecognizerRequestAccess) (表單辨識器存取要求) 表單。
- **示範 3**：[建立自訂的發票讀取器技能](demo3.md)
- **示範 4**：[全部整合](demo4.md)
- **示範 5**：[知識存放區](demo5.md)


# <a name="teardown-instructions"></a>終止指示

### <a name="full-teardown"></a>完整終止

* 進入 Azure 入口網站，並刪除您所建立 **Azure 資源群組**來移除此專案的所有資源


# <a name="resources-and-continued-learning"></a>資源與繼續學習

**Microsoft Learn：**
* [Azure 搜尋服務簡介](https://docs.microsoft.com/en-us/learn/modules/intro-to-azure-search/?WT.mc_id=msignitethetour2019-github-aiml10)
* [Microsoft Azure Artificial Intelligence (AI) strategy and solutions](https://docs.microsoft.com/en-us/learn/modules/azure-artificial-intelligence/?WT.mc_id=msignitethetour2019-github-aiml10) (Microsoft Azure 人工智慧 (AI) 策略與解決方案)

**Azure 文件**
* [什麼是 Azure 搜尋服務中的「認知搜尋」？](https://docs.microsoft.com/en-us/azure/search/cognitive-search-concept-intro/?WT.mc_id=msignitethetour2019-github-aiml10)
* [什麼是 Azure 搜尋服務中的知識存放區？](https://docs.microsoft.com/en-us/azure/search/knowledge-store-concept-intro)


# <a name="feedback-loop"></a>意見反應迴圈

您是否有評論、意見反應或建議？ 目前，內容變更/建議/意見反應的最佳意見反應迴圈，是在此 GitHub 存放庫上建立新的問題。 若要取得如何建立問題的所有詳細資料，請參閱[參與文件](../CONTRIBUTING.md)

## <a name="become-a-trained-presenter"></a>成為經訓練的簡報者

若要成為經訓練的簡報者，請連絡 [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com)。 請在電子郵件中包含以下內容：

- 完整名稱
- 這份簡報的代碼：aiml10
- 您的簡報影片連結 (長度在 10 分鐘以內) (例如：未列出的 YouTube 影片)。 
  > 不一定要用此內容的影片，重點是展現您的簡報者技能

顧問會帶您了解流程的相關資訊。

## <a name="trained-presenters"></a>經訓練的簡報者

感謝這些很棒的人員 ([表情圖示按鍵](https://allcontributors.org/docs/en/emoji-key))：

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/sethjuarez">
        <img src="https://avatars2.githubusercontent.com/u/115409?s=460&v=4" width="100px;" alt="Seth Juarez"/><br />
        <sub><b>Seth Juarez</b></sub></a><br />
            <a href="Add link to powerpoint here" title="討論">📢</a>
            <a href="Add link to pull request here" title="文件">📖</a> 
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->