# <a name="demo-custom-vision"></a>示範：自訂視覺

> 💡 您必須先完成[設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md)，才能嘗試進行此示範。

在此示範中，我們會使用 customvision.ai 的服務來建立自訂視覺模型。

## <a name="create-a-custom-model-project-with-custom-vision"></a>建立具有自訂視覺的自訂模型專案

提示：您可以提前執行本節來節省即時示範的時間。

1. 登入[自訂視覺](https://customvision.ai)並建立新的專案。
   [遵循這裡的指示進行](https://docs.microsoft.com/azure/cognitive-services/custom-vision-service/getting-started-build-a-classifier?WT.mc_id=msignitethetour2019-github-aiml20)。

1. 新專案應具有下列設定：

    - 名稱：工具
    - 描述：Tailwind Traders 銷售的產品
    - 資源：aiml20-cs-resource
    - 專案類型：分類
    - 分類類型：多元分類
    - 領域：零售 (精簡)
    - 匯出功能：基本平台

1. 在左側的 [標記] 工具中，使用 [+] 按鈕來新增下列標記：

    - 電鑽
    - 鐵鎚
    - 鉗子
    - 螺絲起子

1. 我們現在會從 [CV Training Images] 的對應資料夾，新增每個標記的影像。 以下說明如何針對「電鑽」執行此作業

    - 按一下頂端列中的 [新增影像]
    - 瀏覽至 CV Training Images/drills
    - 選取所有檔案：按一下一個檔案，然後按 Control-A
    - 按一下 [開啟]
    - 在接下來出現的 [影像上傳] 對話方塊中，選取 [我的標記] 中的 [電鑽]，然後按一下 [上傳 16 個檔案]
    - 針對下列標記重複此程序：鐵鎚、鉗子、螺絲起子 (稍後會處理 [安全帽])

## <a name="add-images-and-train-a-model"></a>新增影像並定型模型

在 Ignite Tour，先前的步驟全部都會在準備時提前完成。 只有其餘步驟會即時執行，以節省時間。

1. 如果您還沒有這麼做，請登入 customvision.ai 並開啟「工具」專案。

1. 已為此專案提供電鑽、鐵鎚、鉗子和螺絲起子的影像。 讓我們也新增一些安全帽的影像。

- 按一下頂端列中的 [新增影像]
- 瀏覽至 CV Training Images/drills
- 選取所有檔案：按一下一個檔案，然後按 Control-A
- 按一下 [開啟]
- 在接下來出現的 [影像上傳] 對話方塊中，選取 [我的標記] 中的 [安全帽]，然後按一下 [上傳 16 個檔案]

1. 按一下頂端功能表列中的 [效能]，然後按一下綠色的 [定型] 按鈕。 選擇 [Quick Training] \(快速定型\)，然後按一下 [定型]

1. 按一下左窗格中的最近反覆項目，以查看結果。 您應該有 90.9% 精確度 (模型正確預測多少定型影像)、88.2% 重新叫用 (當我們產生預測時是否正確)，以及 98.7% AP (整體量值)。 請注意，這取決於機率閾值 -- 如果您想要避免誤判，請將此值設低。
   針對我們的零售應用程式，您可以放心地將其設高。

1. 使用新圖片測試模型。 按一下 [快速測試] 和 [瀏覽本機檔案]，然後選擇 [test images/man in hardhat.jpg]。 發現識別為安全帽的機率有 99.9%。 使用 [test images/drill.jpg] 嘗試相同作業，也會正確識別。

現在，我們會以 ONNX 格式儲存模型，以便整合到 Tailwind Traders 應用程式中。

1. 按一下 [匯出]，然後選擇 [ONNX]。 請注意，還有其他平台特定的格式可供使用。

1. 選取版本 ONNX 1.2，然後按一下 [匯出]。 TWT 應用程式需要稱為 products.onnx 的檔案，因此我們將使用已儲存在存放庫中的檔案。

## <a name="next-step"></a>後續步驟

[ONNX 部署](DEMO%20ONNX%20deployment.md)