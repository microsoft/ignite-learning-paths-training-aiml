# <a name="demo-custom-vision"></a>演示：自定义视觉

> 💡 在尝试执行此演示之前，必须已完成[设置](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md)。

在本演示中，我们将使用 customvision.ai 的服务创建自定义视觉模型。

## <a name="create-a-custom-model-project-with-custom-vision"></a>使用自定义视觉创建自定义模型项目

提示：可以提前完成本部分，以节省现场演示的时间。

1. 登录到[自定义视觉](https://customvision.ai)并创建一个新项目。
   [按照此处的说明操作](https://docs.microsoft.com/azure/cognitive-services/custom-vision-service/getting-started-build-a-classifier?WT.mc_id=msignitethetour2019-github-aiml20)。

1. 新项目应采用以下设置：

    - 名称：工具
    - 说明：Tailwind Traders 销售的产品
    - 资源：aiml20-cs-resource
    - 项目类型：分类
    - 分类类型：多类
    - 域：零售（精简）
    - 导出功能：基本平台

1. 在左侧的“标记”工具中，使用“+”按钮添加以下标记：

    - 电钻
    - 锤子
    - 钳子
    - 螺丝刀

1. 现在，我们从“计算机视觉训练图像”中的相应文件夹添加每个标记的图像。 下面说明如何为“电钻”添加图像

    - 单击顶部行中的“添加图像”
    - 浏览到“计算机视觉训练”>“电钻”
    - 选择所有文件：单击一个文件，然后按 Ctrl-A
    - 单击“打开”
    - 在随后出现的“图像上传”对话框中，选择“我的标签”中的“电钻”，然后单击“上传 16 个文件”
    - 对锤子、钳子和螺丝刀的标记重复上述过程（稍后我们还要为“安全帽”执行此操作）

## <a name="add-images-and-train-a-model"></a>添加图像并训练模型

在 Ignite 教程中，上述步骤已在准备阶段提前完成。 只有剩下的步骤是在现场执行的，目的是节省时间。

1. 如果你尚未登录，请登录到 customvision.ai 并打开“工具”项目。

1. 已经为此项目提供了电钻、锤子、钳子和螺丝刀的图像。 让我们另外添加一些安全帽的图像。

- 单击顶部行中的“添加图像”
- 浏览到“计算机视觉训练”>“电钻”
- 选择所有文件：单击一个文件，然后按 Ctrl-A
- 单击“打开”
- 在随后出现的“图像上传”对话框中，选择“我的标签”中的“安全帽”，然后单击“上传 16 个文件”

1. 单击顶部菜单栏中的“性能”，然后单击绿色的“训练”按钮。 依次选择“快速训练”、“训练”

1. 单击左窗格中的最新迭代以查看结果。 应会获得 90.9% 的精准率（我们的模型准确预测了多少个训练图像？）、88.2% 的召回率（生成预测时，预测是否准确？）和 98.7% 的 AP（整体测量值）。 请注意，这些结果取决于概率阈值 - 若要避免误报，请设置较低的阈值。
   对于我们的零售应用，可以放心地设置高阈值。

1. 使用新图片测试模型。 单击“快速测试”和“浏览本地文件”，然后选择“test images”>“man in hardhat.jpg”。 将会看到，该模型认为该图片是安全帽的概率为 99.9%。 尝试使用“test images”>“drill.jpg”进行相同的测试，模型也会正确识别。

现在，我们以 ONNX 格式保存该模型，以便集成到 Tailwind Traders 应用中。

1. 单击“导出”，然后选择“ONNX”。 另请注意其他可用的特定于平台的格式。

1. 选择版本 ONNX 1.2，然后单击“导出”。 TWT 应用需要一个名为 products.onnx 的文件，我们将使用已保存在存储库中的一个文件。

## <a name="next-step"></a>后续步骤

[ONNX 部署](DEMO%20ONNX%20deployment.md)