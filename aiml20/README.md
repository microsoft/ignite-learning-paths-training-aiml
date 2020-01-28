# <a name="aiml20-using-pre-built-ai-to-solve-business-challenges"></a>AIML20：使用預先建立的 AI 解決商務挑戰

這是支援 Microsoft Ignite 2019 及 Microsoft Ignite the Tour 2019-2020 討論「使用預先建立的 AI 解決商務挑戰」的存放庫。 您可以在這裡找到討論中所提及資源的連結，以及重新建立討論中所提供示範所需的程式碼和指令碼。

* [AIML20：使用预先构建的 AI 解决业务难题](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-SimplifiedChinese/aiml20)
* [AIML20：Uso da IA pré-criada para resolver desafios de negócios](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-PortugueseBrazil/aiml20)
* [AIML20：事前構築済み AI を使用してビジネスの課題を解決する](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-Japanese/aiml20)

## <a name="session-abstract"></a>課程摘要

**使用預先建立的 AI 解決商務挑戰**

Tailwind Traders 是以資料為導向的公司，了解使用人工智慧來改善商務流程和取悅客戶的重要性。
在投資 AI 小組之前，其現有開發人員可以使用預先建立的 AI 技術來獲得快速致勝。 

在本課程中，我們將示範如何使用 Azure 認知服務來實作 Tailwind Traders 網站中的「依相片購物」功能，並說明電腦視覺背後的神經網路運作。 我們也將示範網站版面配置如何自動進行調整，以將匿名使用者的參與提到最高，這都多虧有增強式學習和個人化工具服務。

最後，我們將回顧在將 AI 投入生產環境之前，您應該思考的成本、資料法規和倫理考量。

## <a name="table-of-contents"></a>目錄
 

| 資源          | 連結                            |
|-------------------|----------------------------------|
| PowerPoint        | - [簡報](presentations.md) |
| 影片            | - [嘗試執行排練](https://youtu.be/jRO-5g-HYuU) <br/>- [Microsoft Ignite 奧蘭多錄影](https://myignite.techcommunity.microsoft.com/sessions/82987?source=sessions) |
| 示範             | - [示範 1 - 設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md) <br/>- [示範 2 - 電腦視覺](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Computer%20Vision.md) <br/>- [示範 3 - 自訂視覺](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Custom%20Vision.md)<br/>- [示範 4 - ONNX 部署](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20ONNX%20deployment.md) <br/>- [示範 5 - 個人化工具](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Personalizer.md) | 

[在這裡下載 AIML20 簡報的投影片](presentations.md) (使用第一個連結以取得最新版本)。這些投影片採用 PPT 格式，並包含詳細的演講者備忘稿和內嵌示範影片。

這些資源的簡短連結：[aka.ms/AIML20repo](https://aka.ms/AIML20repo)。 

同時也提供[適用於此討論簡報者的資源](README-Presenters.md)。



## <a name="technologies-used"></a>使用的技術

* [Azure 認知服務](https://docs.microsoft.com/en-us/azure/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure 命令列介面 (CLI))](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest?WT.mc_id=msignitethetour2019-github-aiml20)
* [ONNX](https://github.com/onnx/onnx)
* [Visual Studio Code](https://code.visualstudio.com/)

## <a name="other-resources-mentioned-in-talk"></a>討論中所提及的其他資源

* Brandon Rohrer 主講的 How Neural Networks Work (神經網路的運作方式)： http://brohrer.github.io/blog.html
* XKCD "Tasks" (XKCD「工作」)： https://xkcd.com/1425

### <a name="azure-cognitive-services-docs-and-apps"></a>Azure 認知服務文件和應用程式

* 認知服務電腦視覺：[https://aka.ms/try-computervision](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=ignitetour-talk-davidsmi)  
* 認知服務自訂視覺：[文件](https://docs.microsoft.com/en-us/azure/cognitive-services/custom-vision-service/?WT.mc_id=ignitethetour-github-davidsmi)和應用程式，網址為 [https://customvision.ai](https://www.customvision.ai/?WT.mc_id=ignitethetour-github-davidsmi)
* ONNX Runtime： https://github.com/microsoft/onnxruntime
* 認知服務個人化工具：[https://aka.ms/personalizer-intro](https://docs.microsoft.com/en-us/azure/cognitive-services/personalizer/?WT.mc_id=msignitethetour2019-github-aiml20)
* 使用個人化工具進行增強式學習： https://aka.ms/personalizerdemo
* 容器中的認知服務： https://aka.ms/cs-containers

### <a name="cognitive-services-information"></a>認知服務資訊

* 認知服務定價： https://aka.ms/cs-pricing 
* 認知服務合規性和隱私權： https://aka.ms/az-compliance
* Microsoft 採用倫理 AI 的方法：[https://microsoft.com/AI/our-approach-to-ai](https://www.microsoft.com/AI/our-approach-to-ai?rtc=1&WT.mc_id=msignitethetour2019-github-aiml20)
* Microsoft Learn 中的認知服務訓練課程： https://aka.ms/AIML20MSLearnCollection
* Microsoft 認證 Azure 資料科學家夥伴： https://aka.ms/DataScientistCert 
* Microsoft 認證 Azure AI 工程師夥伴： https://aka.ms/AIEngineerCert

## <a name="demonstrations"></a>示範

遵循下列連結，詳細了解如何重新建立討論中所提供的示範。 您將需要 Azure 訂用帳戶才能執行這些示範；如果您還沒有訂用帳戶，以下是[新訂閱者可享美金 $200 元免費 Azure 點數](https://aka.ms/azure-free-credits)的連結。

1. [設定](DEMO%20Setup.md)：建立帳戶，然後部署和設定資源以支援以下示範。 遵循這些指示，再嘗試以下任何示範。

1. [電腦視覺](DEMO%20Computer%20Vision.md)：使用認知服務電腦視覺，透過 Web 應用程式和透過 Azure CLI 來分析影像。

1. [自訂視覺](DEMO%20Custom%20Vision.md)：建立自訂視覺模型，僅偵測 Tailwind Traders 所銷售的產品。

1. [ONNX 部署](DEMO%20ONNX%20deployment.md)：將 ONNX 格式的自訂視覺模型部署到 Tailwind Traders 網站「依相片購物」功能

1. [個人化工具](DEMO%20Personalizer.md)：以動態方式重新設定 Tailwind Traders 網站 [建議] 區段的版面配置，將匿名訪客按一下「精選」產品的可能性提到最高。

## <a name="feedback-loop"></a>意見反應迴圈

您是否有註解、意見反應或建議？ 內容變更/建議/意見反應的最佳意見反應迴圈，是在此 GitHub 存放庫上建立新的問題。 若要取得如何建立問題的所有詳細資料，請參閱[參與文件](../CONTRIBUTING.md)
