# <a name="using-pre-built-ai-to-understand-images"></a>使用預先建置的 AI 來了解影像

> 💡 您必須先完成[設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md)，才能嘗試進行此示範。

在此示範中，我們將使用 Azure 電腦視覺來偵測影像所代表的物件類型。 

首先，我們將使用電腦視覺線上 Web 表單來上傳影像並觀察結果。

接下來，我們將使用電腦視覺 API，使用 curl 來以程式設計方式收集相同的資訊。

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>定義問題：依相片購物未正確運作

引起這項討論的問題，是 Tailwind Traders 網站中的依相片購物工具無法正確識別產品。 此時在 [ONNX 部署](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)中執行此區段以設定場景會十分有幫助。

## <a name="using-computer-vision-via-the-web-interface"></a>透過 Web 介面使用電腦視覺

讓我們試試對硬體產品的圖片使用電腦視覺。 如果我們可以依名稱來識別 Tailwind Traders 銷售的產品，我們就可以在「依相片購物」應用程式的目錄中搜尋該名稱。

1. 在 [https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=msignitethetour2019-github-aiml20) 瀏覽電腦視覺網頁

2. 向下捲動至＜分析影像＞一節。 看起來會像是：

![「電腦視覺：分析影像」](img/Computer%20Vision%20Analyze%20an%20Image.png)

3. 按一下 [瀏覽] 按鈕，然後在 "CV Training Images" 中的 "test images" 資料夾選擇 "man in hardhat.jpg"。

4. 一段時間後，您的影像分析就會出現在右側窗格中。 其看起來如下：

```
FEATURE NAME:   VALUE

Objects [ { "rectangle": { "x": 138, "y": 27, "w": 746, "h": 471 }, "object": "headwear", "confidence": 0.616 }, { "rectangle": { "x": 52, "y": 33, "w": 910, "h": 951 }, "object": "person", "confidence": 0.802 } ]

Tags    [ { "name": "man", "confidence": 0.999212 }, { "name": "headdress", "confidence": 0.99731946 }, { "name": "person", "confidence": 0.995057464 }, { "name": "clothing", "confidence": 0.991814733 }, { "name": "wearing", "confidence": 0.9827137 }, { "name": "hat", "confidence": 0.9691986 }, { "name": "helmet", "confidence": 0.9227209 }, { "name": "headgear", "confidence": 0.840476155 }, { "name": "personal protective equipment", "confidence": 0.8358513 }, { "name": "looking", "confidence": 0.832229853 }, { "name": "hard hat", "confidence": 0.8004248 }, { "name": "human face", "confidence": 0.785058737 }, { "name": "green", "confidence": 0.774940848 }, { "name": "fashion accessory", "confidence": 0.706475437 } ]

Description { "tags": [ "man", "headdress", "person", "clothing", "wearing", "hat", "helmet", "looking", "green", "jacket", "shirt", "standing", "head", "suit", "glasses", "yellow", "white", "large", "phone", "holding" ], "captions": [ { "text": "a man wearing a helmet", "confidence": 0.8976638 } ] }

Image format    "Jpeg"

Image dimensions    1000 x 1000

Clip art type   0

Line drawing type   0

Black and white false

Adult content   false

Adult score 0.0126242451

Racy    false

Racy score  0.0156497136

Categories  [ { "name": "people_", "score": 0.69140625 } ]

Faces   [ { "age": 37, "gender": "Male", "faceRectangle": { "top": 419, "left": 363, "width": 398, "height": 398 } } ]

Dominant color background   "White"

Dominant color foreground   "White"

Accent Color    #90A526
```

(請注意，上述分析未來可能會變更：電腦視覺模型會定期更新。)

請注意，第一個「物件」結果偵測到了「頭飾」和「人」這兩個物件，並提供了其在影像中的位置。 我們想要偵測的物件分類為「頭飾」，但針對應用程式，我們需要更具體的分類：「安全帽」。 不過，「安全帽」並非電腦視覺目前能偵測到的一種物件類型。 (之後我們將使用自訂視覺來解決此問題。)另請注意，每個物件分類都會提供信賴分數。

第二個「標籤」結果會提供與整個影像建立關聯的標籤清單。 具有最高信賴度 (最先列出) 的標籤是「男性」，這對我們來說並沒有什麼幫助。 第二個標籤「頭巾」也不盡然是我們要尋找的項目。

其他回應也很有趣，但不是我們示範中的焦點。 但請看一下其中包含的內容：

* 描述欄位中相片的標題 (「戴著頭盔的男性」)。

* 影像功能 (是否為黑白？線條繪製？)

* 在影像中偵測到的任何臉部詳細資料 (在此案例中識別為 37 歲男性)

* 影像內容的分數：是否為「成人」或「猥褻」？

* 影像的色彩分析：主要前景、輔色和背景色彩。

就目的而言，我們只對「標籤」欄位感興趣，因此將在下一節了解如何以程式設計方式來擷取該欄位。

## <a name="using-computer-vision-via-the-api"></a>透過 API 使用電腦視覺

您可以[使用電腦視覺的 REST API 以程式設計方式來控制電腦視覺](https://docs.microsoft.com/en-us/azure/cognitive-services/computer-vision/vision-api-how-to-topics/howtocallvisionapi?WT.mc_id=msignitethetour2019-github-aiml20)。
您可以使用任何可存取 Web 的語言或應用程式來執行此操作，但我們將使用 [curl](https://curl.haxx.se/)，這是用來與 URL 互動並收集其輸出的一般命令列應用程式。 Curl 應用程式會預先安裝在大部分的 Linux 發行版本和最新版本 Windows 10 (1706 和更新版本) 中。 

執行檔案 [`vision_demo.sh`](vision_demo.sh) 中的命令。 您可以使用本機 Azure CLI 或 Azure Cloud Shell，但您必須將 Bash 用作為 Shell。

此指令碼中的命令將會：

1. 登入您的 Azure 訂用帳戶 (如果使用 Cloud Shell，則不需要此步驟)
2. 建立 Azure 資源群組
3. 建立認知服務金鑰。 (注意：這是我們之後將用於自訂視覺的多用途金鑰。)
4. 尋找金鑰
5. 使用 CURL 來分析兩個影像

## <a name="manually-generating-keys-for-use-with-computer-vision"></a>手動產生金鑰以用於電腦視覺

在指令碼 [vision_demo. sh](vision_demo.sh) 中執行「建立金鑰」區段，以使用 Azure 命令列介面以程式設計方式建立認知服務金鑰。
(如果您想要的話，您可以[使用 Azure 入口網站以互動方式建立金鑰](https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account?tabs=multiservice%2Clinux&WT.mc_id=msignitethetour2019-github-aiml20)。)

## <a name="next-step"></a>後續步驟

[自訂視覺](DEMO%20Custom%20Vision.md)