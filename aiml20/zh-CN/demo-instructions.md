# <a name="demo-instructions-for-presenters"></a>供演示者使用的演示说明

此存储库中的演示脚本提供给所有人。

对于演示，你应该遵循相同的脚本，但可以参考下面提供的其他说明。

另外，我们还在 [PPT 幻灯片](presentations.md)中以视频形式提供演示记录（下面还提供了一些其他视频的链接）。 如果没有 Internet 或出现其他技术问题，则可使用嵌入的视频而不使用实时演示。 （在这种情况下，建议将音频静音，自行对着视频讲述。）[发言人说明](speaker-notes.md)根据嵌入视频中的事件计时。

## <a name="demo-setup"></a>演示设置

在演示之前，请浏览下面脚本中的所有说明。

[演示脚本](DEMO%20Setup.md)

## <a name="demo-computer-vision"></a>演示计算机视觉

[演示脚本](DEMO%20Computer%20Vision.md)

### <a name="slide-demo--shop-by-photo"></a>幻灯片：演示/按图购买

注意，此演示的实际说明在[这里](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)。

### <a name="slide-demo--cognitive-services-computer-vision"></a>幻灯片：演示/认知服务计算机视觉

[演示脚本](DEMO%20Computer%20Vision.md#using-computer-vision-via-the-web-interface)

## <a name="demo-custom-vision"></a>演示自定义视觉

[演示脚本](DEMO%20Custom%20Vision.md)

提前完成演示的第一部分。

### <a name="slide-demo--customized-object-recognition"></a>幻灯片：演示/自定义的对象识别

在“[添加图像并训练模型](DEMO%20Custom%20Vision.md#add-images-and-train-a-model)”中启动实时演示。

## <a name="demo-onnx-deployment"></a>演示 ONNX 部署

[演示脚本](DEMO%20ONNX%20deployment.md)

提前运行“[加载简单的 ONNX 模型](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model)”部分。

你已在演示开头完成了“[定义问题](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)”，因此请跳过它。

### <a name="slide-demo--onnx"></a>幻灯片：演示/ONNX

在“在 Tailwind Traders 网站中更新 ONNX 模型”部分启动实时演示。

若要在 Netron 中查看，可以查看直接从“自定义视觉”中导出的文件，也可以使用在 `ONNX/custom model/products.onnx` 的存储库中预先准备的文件

请注意，部署文件时，其名称**必须**为 `products.onnx`，以便从桌面按该名称获取预先准备的文件，这是最轻松的，不必重命名导出的文件。

### <a name="slide-demo--personalizer"></a>幻灯片：演示/个性化体验创建服务

[演示脚本](DEMO%20Personalizer.md)
