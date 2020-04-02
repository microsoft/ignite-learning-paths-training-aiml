# <a name="demo-instructions-for-presenters"></a>簡報者的示範指示

此存放庫中的每個人皆可使用示範腳本。

您的簡報應該遵循相同腳本，但有以下提供的其他注意事項。

示範的錄影也提供為 [PPT 投影片](presentations.md)格式的影片 (以下也有一些其他影片的連結)。 在缺少網際網路或有其他技術問題的情況下，您可以使用內嵌的影片，而非實況示範。 (在此情況下，我們建議您自行將音訊靜音，並對著影片演講。)[演講者附註](speaker-notes.md)是針對內嵌影片中的事件計時。

## <a name="demo-setup"></a>示範設定

在簡報之前，請執行以下腳本中的所有指示。

[示範腳本](DEMO%20Setup.md)

## <a name="demo-computer-vision"></a>示範電腦視覺

[示範腳本](DEMO%20Computer%20Vision.md)

### <a name="slide-demo--shop-by-photo"></a>投影片：示範/依相片購物

請注意，此示範的實際指示在[這裡](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)。

其他示範影片： https://www.dropbox.com/s/ylxjuifg9x0h4n3/ITT-aiml20-demo1.mp4?dl=0 

### <a name="slide-demo--cognitive-services-computer-vision"></a>投影片：示範/認知服務電腦視覺

[示範腳本](DEMO%20Computer%20Vision.md#using-computer-vision-via-the-web-interface)

## <a name="demo-custom-vision"></a>示範自訂視覺

[示範腳本](DEMO%20Custom%20Vision.md)

請事先進行示範的第一個部分。

### <a name="slide-demo--customized-object-recognition"></a>投影片：示範/自訂物件辨識

在[新增影像並將模型定型](DEMO%20Custom%20Vision.md#add-images-and-train-a-model)處開始即時示範。

## <a name="demo-onnx-deployment"></a>示範 ONNX 部署

[示範腳本](DEMO%20ONNX%20deployment.md)

事先執行＜[載入簡單的 ONNX 模型](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model)＞一節。

您已在簡報開始時進行了＜[定義問題](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)＞一節，因此請略過。

### <a name="slide-demo--onnx"></a>投影片：示範/ONNX

在「更新 Tailwind Traders 網站中的 ONNX 模型」開始實況示範。

若要在 Netron 中進行檢視，您可以檢視直接從自訂視覺匯出的檔案，也可以使用存放庫中預先準備的檔案，其位置在 `ONNX/custom model/products.onnx`

請注意，當您部署檔案時，它**必須**稱為 `products.onnx`，因此最好是從桌面取得該名稱的預先準備檔案，而不要重新命名已匯出的檔案。

### <a name="slide-demo--personalizer"></a>投影片：示範/個人化工具

[示範腳本](DEMO%20Personalizer.md)
