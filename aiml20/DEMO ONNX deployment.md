# <a name="demo-onnx-deployment"></a>演示：ONNX 部署

> 💡 在尝试执行此演示之前，必须已完成[设置](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md)。

本演示将提取[自定义视觉](DEMO%20Custom%20Vision.md)演示中导出的 ONNX 文件，并将其部署到 Tailwind Traders 网站。

该网站对“按图购物”应用使用 `products.onnx` 中的模型。 上传的图像将由模型处理，它会生成五个标签之一：“锤子”、“电钻”、“钳子”、“螺丝刀”或“安全帽”。 该网站在产品列表中搜索生成的标签，并返回搜索结果。

## <a name="load-the-simple-onnx-model"></a>加载简单的 ONNX 模型

（提示：可以提前执行此步骤。 如果以前已在同一部署中运行本演示，则需要执行此步骤。）

我们会将 Web 应用中的 products.onnx 文件替换为仅识别以下两个对象类别的版本：“锤子”和“电钻”。

1. 在 Azure 门户中访问 aiml20-demo 资源组

1. 单击“aiml20”应用服务资源

1. 在“开发工具”下的左侧菜单中单击“高级工具”，然后在右窗格中单击“开始”以启动 Kudu。

1. 在主菜单栏中，单击“调试控制台”>“PowerShell”

1. 浏览到：site / wwwroot / Standalone / Onnxmodels

1. 在资源管理器中，打开 AIML20 存储库中的 `ONNX / simple model` 文件夹

1. 将 products.onnx 拖放到 Kudu 窗口的左半部分。 （重要：请不要拖放到带有“拖放到此处以上传并解压缩”字样的框中。）此模型仅知道如何识别电钻和锤子。

1. 重启 Web 服务器。 返回到“aiml20”应用服务资源，然后单击顶部菜单栏中的“重启”。 等待两分钟让网站完全重启。

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>定义问题：“按图购物”不正常工作

（注意：本部分的操作已在 AIML20 演示文稿的开头部分完成。）

1. 请访问以前部署的 Tailwind Traders 网站。 

1. 向下滚动到网站的“按图购物”部分

1. 单击“按图购物”

1. 在 AIML20 存储库中，选择“test images”>“drill.jpg”

1. 它会正确识别出该图像是一个电钻。 太棒了！

1. 返回到主页，再次单击“按图购物”

1. 在 AIML20 存储库中，选择“test images”>“pliers.jpg”

1. 糟糕！ 它将此图像识别成了一把锤子。 我们稍后来解决它，首先，让我们了解它为何失败。

## <a name="update-the-onnx-model-in-the-tailwind-traders-website"></a>更新 Tailwind Traders 网站中的 ONNX 模型

首先查看 Netron 中导出的模型：

1. 浏览到 https://lutzroeder.github.io/netron/ ，单击“打开模型”

2. 打开“ONNX”>“自定义模型”>“products. ONNX”

3. 滚动浏览神经网络，可以看到：

 - 它很大
 - 顶部是用作输入的 224x224 图像（不光彩的秘密：计算机视觉模型的视觉效果很差）
 - 模型在底部输出了 5 个值，即类标签的置信度评分

接下来，删除已导出到 TWT 文件系统中的 ONNX 文件

1. 在 Azure 门户中访问 aiml20-demo 资源组

1. 单击“aiml20”Web 应用资源

1. 在“开发工具”下单击“高级工具”，然后在右窗格中单击“开始”以启动 Kudu。

1. 在主菜单栏中，单击“调试控制台”>“PowerShell”

1. 浏览到：site / wwwroot / Standalone / Onnxmodels

1. 在资源管理器中，打开 AIML20 存储库中的 `ONNX / custom model` 文件夹

1. 将 products.onnx 拖放到 Kudu 窗口的左半部分。 （重要：请不要拖放到带有“拖放到此处以上传并解压缩”字样的框中。）

1. 重启 Web 服务器。 返回到“onnx”Web 应用资源，然后单击“重启”。

重新运行“按图购物”，然后上传 `test images / pliers.jpg`。 现在一切正常！

## <a name="next-step"></a>后续步骤

[个性化体验创建服务](DEMO%20Personalizer.md)


