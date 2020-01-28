# <a name="demo-onnx-deployment"></a>示範：ONNX 部署

> 💡 您必須先完成[設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md)，才能嘗試進行此示範。

在此示範中，我們會採用[自訂視覺](DEMO%20Custom%20Vision.md)示範中匯出的 ONNX 檔案，並將其部署到 Tailwind Traders 網站。

網站針對「依相片購物」應用程式，使用 `products.onnx` 中的模型。 該模型會處理上傳的影像，並產生下列五個標籤的其中一個：[鐵鎚]、[電鑽]、[鉗子]、[螺絲起子] 或 [安全帽]。 網站會搜尋所產生標籤的產品清單，然後傳回搜尋結果。

## <a name="load-the-simple-onnx-model"></a>載入簡單的 ONNX 模型

(提示：您可以提前執行此步驟。 只有在您之前已在相同的部署上執行此示範時，才需要進行此步驟。)

我們會將 Web 應用程式中的 products.onnx 檔案，取代為只會辨識下列兩個物件類別的版本：[鐵鎚] 和 [電鑽]。

1. 在 Azure 入口網站中，瀏覽您的 aiml20-demo 資源群組

1. 按一下 App Service 資源 [aiml20]

1. 在左側功能表的 [開發工具] 下，按一下 [進階工具]，然後按一下右窗格中的 [執行] 以啟動 Kudu。

1. 在主功能表列中，按一下 [偵錯主控台] > [PowerShell]

1. 瀏覽至：site/wwwroot/Standalone/Onnxmodels

1. 使用檔案總管，開啟 AIML20 存放庫中的 `ONNX / simple model` 資料夾

1. 將 products.onnx 拖曳到 Kudu 視窗左半部 (重要：請勿拖曳到顯示 [drag here to upload and unzip] \(拖曳到這裡以上傳並解壓縮\) 的方塊中)。此模型只知道如何識別電鑽和鐵鎚。

1. 重新啟動網頁伺服器。 返回 App Service 資源 [aiml20]，然後按一下頂端功能表列中的 [重新啟動]。 等候兩分鐘，直到網站完全重新啟動。

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>定義問題：「依相片購物」未正確運作

(注意：本節在 AIML20 簡報一開始即已完成。)

1. 瀏覽稍早所部署的 Tailwind Traders 網站。 

1. 向下捲動至網站的 [依相片購物] 區段

1. 按一下 [依相片購物]

1. 在 AIML20 存放庫中，選取：test images > drill.jpg

1. 已正確將其識別為電鑽。 很好！

1. 返回首頁，然後再按一次 [依相片購物]

1. 在 AIML20 存放庫中，選取：test images > pliers.jpg

1. 糟糕！ 已將其識別為鐵鎚。 我們稍後會修正此問題，但首先，讓我們了解失敗的原因。

## <a name="update-the-onnx-model-in-the-tailwind-traders-website"></a>更新 Tailwind Traders 網站中的 ONNX 模型

首先，在 Netron 中檢視已匯出的模型：

1. 瀏覽至 https://lutzroeder.github.io/netron/ ，按一下 [Open Model] \(開啟模型\)

2. 開啟 ONNX/Custom Model/products.onnx

3. 捲動神經網路，並請注意：

 - 它佔據頂端的一大部分，
 - 且作為輸入的 224x224 影像 (遺憾的是，電腦視覺模型的視覺相當差)
 - 新增下限，這會輸出 5 個值，這些是類別標籤的信賴分數

接下來，將我們匯出的 ONNX 檔案放到 TWT 檔案系統中

1. 在 Azure 入口網站中，瀏覽 aiml20-demo 資源群組

1. 按一下 Web 應用程式資源 [aiml20]

1. 在 [開發工具] 下，按一下 [進階工具]，然後按一下右窗格中的 [執行] 以啟動 Kudu。

1. 在主功能表列中，按一下 [偵錯主控台] > [PowerShell]

1. 瀏覽至：site/wwwroot/Standalone/Onnxmodels

1. 使用檔案總管，開啟 AIML20 存放庫中的 `ONNX / custom model` 資料夾

1. 將 products.onnx 拖曳到 Kudu 視窗左半部。 (重要：請勿拖曳到顯示 [drag here to upload and unzip] \(拖曳到這裡以上傳並解壓縮\) 的方塊中)。

1. 重新啟動網頁伺服器。 返回 Web 應用程式資源 [onnx]，然後按一下 [重新啟動]。

重新執行「依相片購物」，並上傳 `test images / pliers.jpg`。 現在運作正常！

## <a name="next-step"></a>後續步驟

[個人化工具](DEMO%20Personalizer.md)


