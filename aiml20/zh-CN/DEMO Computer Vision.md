# <a name="using-pre-built-ai-to-understand-images"></a>使用预构建的 AI 来理解图像

本演示将使用 Azure 计算机视觉来检测图像代表的对象类型。 

首先，我们将使用计算机视觉在线 Web 窗体上传图像并观察结果。

然后，我们将使用计算机视觉 API 通过 curl 以编程方式收集相同的信息。

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>定义问题：“按图购物”不正常工作

促成此次研讨的问题是 Tailwind Traders 网站上的“按图购物”工具无法正常识别产品。 此时，最好是在 [ONNX 部署](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)中运行此环节，以设置场景。

## <a name="using-computer-vision-via-the-web-interface"></a>通过 Web 界面使用计算机视觉

让我们针对某张五金产品图片尝试使用计算机视觉。 如果可以按名称识别出 Tailwind Traders 销售的某个产品，则我们可以在“按图购物”应用的目录中搜索该名称。

1. 访问计算机视觉网页 ([https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=msignitethetour2019-github-aiml20))

2. 向下滚动到“分析图像”部分。 如下所示：

![“计算机视觉:分析图像”](img/Computer%20Vision%20Analyze%20an%20Image.png)

3. 单击“浏览”按钮，然后从“计算机视觉训练图像”中的“test images”文件夹内选择“man in hardhat.jpg”。

4. 片刻之后，图像分析结果将显示在右窗格中。 如下所示：

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

（请注意，上述分析将来可能会发生变化：计算机视觉模型会定期更新。）

请注意，在第一个“对象”结果中，检测到了两个对象“头戴用具”和“人”，并指出了它们在图像中的位置。 我们要检测的对象分类为“头戴用具”，但我们的应用场景需要更具体的分类：“安全帽”。 不过，“安全帽”并非计算机视觉目前可以检测的对象类型之一。 （稍后我们将解决自定义视觉的这一问题。）另请注意，为每个对象分类提供了置信度评分。

第二个“标记”结果提供与整个图像关联的标签列表。 置信度最高的标记（最先列出）是“男人”，这没有太大的作用。 第二个标记“头戴用具”也不完全是我们所需的标记。

其他响应也很有趣，但本演示不会重点关注它们。 请看一下包含的内容：

* “说明”字段中照片的标题（“戴头盔的男人”）。

* 图像特征（是否为黑白色？是否为素描？）

* 在图像中检测到的任何人脸的细节（在本例中识别为 37 岁的男性）

* 图像内容评分：是否为“成人”或“猥亵”内容？

* 图像的颜色分析：主导前景色、强调色和背景色。

对于本演示，我们实际上只关注“标记”字段，在下一部分我们将了解如何以编程方式提取该字段。

## <a name="using-computer-vision-via-the-api"></a>通过 API 使用计算机视觉

可以[使用计算机视觉的 REST API 以编程方式对其进行控制](https://docs.microsoft.com/en-us/azure/cognitive-services/computer-vision/vision-api-how-to-topics/howtocallvisionapi?WT.mc_id=msignitethetour2019-github-aiml20)。
几乎可以在任何语言中或者在任何能够访问 Web 的应用程序中进行这种控制，但本演示使用的是 [curl](https://curl.haxx.se/)：一个常用的命令行应用程序，用来与 URL 交互并收集其输出。 大多数 Linux 分发版以及最新版本的 Windows 10（1706 和更高版本）已预装了 curl 应用程序。 

运行文件 [`vision_demo.sh`](vision_demo.sh) 中的命令。 可以使用本地 Azure CLI 或 Azure Cloud Shell，但必须将 bash 用作 shell。

此脚本中的命令将会：

1. 登录到 Azure 订阅（如果使用 Cloud Shell，则不需要执行此步骤）
2. 创建 Azure 资源组
3. 创建认知服务密钥。 （注意：这相当于一个公交车钥匙，我们以后还会在自定义视觉中用到它。）
4. 查找密钥
5. 使用 CURL 分析两张图像

## <a name="manually-generating-keys-for-use-with-computer-vision"></a>手动生成用于计算机视觉的密钥

在脚本 [vision_demo.sh](vision_demo.sh) 中运行“Create a Key”节，使用 Azure 命令行接口以编程方式创建认知服务密钥。
（如果需要，可以[使用 Azure 门户以交互方式创建密钥](https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account?tabs=multiservice%2Clinux&WT.mc_id=msignitethetour2019-github-aiml20)。）

## <a name="next-step"></a>后续步骤

[自定义视觉](DEMO%20Custom%20Vision.md)