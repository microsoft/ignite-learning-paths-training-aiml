# <a name="demo-guide"></a>演示指南
> 💡 在尝试执行此演示之前，必须已完成[部署](demosetup.md)。

# <a name="demo-1-data-prep-demo-with-app"></a>演示 1：使用应用演示数据准备过程
第一个演示重点介绍时序模型幻灯片中讨论的数据准备。 逐步演练如何在 C# 演示应用中执行此操作。 请务必强调可在任何语言中完成此操作。

若要使用 `F12` 和 `CTRL-` 快捷键浏览代码，请从[此处](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vs-keybindings)下载适用于 VS Code 的 Visual Studio 快捷方式扩展。 此扩展极其有用，使你不必要滚动页面来查找内容。 （请注意，此扩展不适用于 mac 或 linux）

### <a name="data-prep-demo-video-herehttpsyoutubeu1ppyazunmot751"></a>[此处](https://youtu.be/u1ppYaZuNmo?t=751)提供了数据准备演示视频

> 💡 在尝试执行此演示之前，必须已完成[部署](demosetup.md)。

### <a name="1-open-the-igniteaimldataapp-app-i-personally-like-to-have-this-open-before-i-start-the-talk-so-i-can-just-flip-to-it"></a>1.打开 `IgniteAimlDataApp` 应用。 在开始讲解之前，我个人喜欢先打开它，以便随时可以切换到该应用。
* 打开 `Program.cs` 文件
* 单击右键并选择 `Go To Definition` 或点击 `F12`，转到 `GetProcessedDataForScore`
    * 从数据源加载数据。 在此示例中，我们将在解决方案中加载一个本地 Excel 文件。
* 按 `F12` 转到 `AddWeeksToPredict` 方法并介绍逻辑。
    * 获取最新日期，并添加从该日期算起的未来 4 周
    * 由于使用的是每周数据，并且我们想要知道该周内是否有任何假日，因此，我们需要计算该周内的所有日期并填充一个名为 `DatesInWeek` 的集合
    * 接下来，为添加到该集合的 4 个未来周创建时间 future。
* 在 `AddWeeksToPredict` 逻辑内部按 `F12` 转到 `CreateTimeFeatures` 方法并介绍逻辑。
    * 使用当前时间属性计算所需的时间和假日特征。
* 按 `CTRL-` 导航回到 `AddWeeksToPredict`
* 按 `F12` 转到 `CreateFourierFeatures`
    * 基于每周数据特征的季节性 52 计算傅立叶项特征。 
* 按 `CTRL-` 导航回到 `GetProcessedDataForScore`
* 按 `F12` 转到 `CreateLagFeatures` 方法并介绍逻辑。
    * 将前 26 个周销售额值添加到当前行。
* 按 `CTRL-` 导航回到 `GetProcessedDataForScore`

* 数据演示备份选项
    * 使用隐藏的幻灯片中嵌入的 mp4 视频。 按照此视频（静音）进行讲解。
    * 从幻灯片 21 开始，演示静态幻灯片步骤中的数据准备代码。

# <a name="demo-2-build-model-with-azure-machine-learning-designer"></a>演示 2：使用 Azure 机器学习设计器构建模型
💡 在尝试执行此演示之前，必须已完成[部署](demosetup.md)。

### <a name="full-model-building-live-demo-video-herehttpsyoutubeu1ppyazunmot1278"></a>[此处](https://youtu.be/u1ppYaZuNmo?t=1278)提供了完整的模型构建现场演示视频

### <a name="1-create-resource-and-upload-dataset"></a>1.创建资源并上传数据集

* 创建 Azure 机器学习工作室资源，并导航到新工作区。
    * 大致了解幻灯片中所述不同工具的位置。
    * 此步骤的视频资源：
        * [此处](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateAMLNavToWorkspace.mp4)提供了此步骤的静音视频。
        * [此处](https://youtu.be/u1ppYaZuNmo?t=1278)提供了演示如何创建包含音频的资源的视频。
* 将数据集上传到 AML 中的数据集
    * 单击`Datasets`
    * 单击 `Create from datastore` 或从本地（以你喜欢的方式）
        * 注意：在演示设置步骤中，应该已将数据集上传到数据存储中。
    * 填写必填字段并选择 `workspaceblobstorage` 选项
    * 单击 `Create`
    * 可选：使用数据准备功能逐步完成 AML 的数据集上传过程

### <a name="2-launch-designer-and-explain-tool-features"></a>2.启动设计器并说明工具功能

* 在工作室中左侧导航栏上选择“设计器”
* 汇总了左侧导航栏中的测试数据集等不同模块。

### <a name="3-start-building-the--model"></a>3.开始构建模型

* 将数据集拖放到试验工作区
    * 请注意用于将数据放入工作区的文件上传模块
* 将 `Select Columns in Dataset` 拖放到工作区
    * 在右侧的参数菜单中单击 `Edit columns`。
    * 单击`By Name`
    * 单击`Add All`
    * 单击 `Time` 列上的 `Minus` 图标以排除它
* 将 `Split Data` 拖放到工作区
    * 编辑参数以将数据拆分为 70/30。 
    * 拆分百分比不是一条规则，可以根据不同的模型需求进行更改。
* 将 `Train Model` 拖放到工作区
    * 在右侧的参数中选择标签列名称 `Value`
* 将 `Boosted Decision Tree Regression` 拖放到工作区
* 将 `Score Model` 拖放到工作区
* 将 `Evaluate` 拖放到工作区
* 将 `Split Data` 模块连接到 `Train Model` 以训练数据，并连接到 `Score Model` 以便对包含不可见数据的预测结果进行评分。
* 将 `Train Model` 连接到训练算法 `Boosted Decision Tree Regression` 模块。
* 将 `Score Model` 连接到 `Evaluate` 模块。
* 通常会在此模块中运行模型，但是，在本演示中运行模型需要太长的时间。  单击底部导航栏中的 `Run` 按钮，然后选择“计算”。 现在很适合讨论如何在 AML 中创建计算资源。

* 将创建的列 `Scored Labels` 重命名为 `Forecast`
    * 将 `Edit Metadata` 拖放到工作区
    * 将 `Score Model` 连接到 `Edit Metadata` 模块
    * 在 `Edit Metadata` 模块的 `Parameters` 中。 单击 `Edit Columns`
    * 在文本框中键入 `Score Labels`（无需更改任何默认值）
    * 单击 `Save`
    * 接下来，将 `Parameters` 上的 `New Column Name` 字段更新为 `Forecast`
* 将规范化值转换回完全项计数
    * 将 `Apply Math Operation` 拖放到工作区
    * 将 `Edit Metadata` 连接到 `Apply Math Operation`
    * 将 `Basic math function` 设置为 `Exp`
    * 单击 `Edit Columns`，然后键入 `Value` 和 `Forecast`
    * 单击 `Save`
    * 将 `Output mode` 设置为 `Inplace`
* 将 `Select Columns in Dataset` 模块拖放到工作区
* 将 `Apply Math Operation` 连接到 `Select Columns in Dataset`
* 单击 `Edit Columns`，然后键入以下列名称 `ID1,ID2,Value,Forecast`

### <a name="4-discuss-compute-target-creation"></a>4.介绍如何创建计算目标

* 单击 `Compute` 导航项
* 单击 `Add`
* 介绍不同的计算类型及其用途。 本演示中的计算是用于训练的 `Machine Learning Compute`，以及用于部署 API 的 `Kubernetes Service`。

### <a name="5-explain-trained-model"></a>5.解释已训练的模型
* 导航回到视觉设计器
* 右键单击模型中的第二个模块（很可能是 `Select Columns in Dataset`）以可视化数据
* 快速滚动数据以演示数据的外观。
* 单击某列，并演示工具如何在右侧面板中创建可视化效果。
* 可视化 `Score Model` 模块以演示模型如何预测不可见的数据
* 可视化 `Evaluate Model` 模块并介绍用于评分的指标。
    * 在参数的右面板中单击 `More Help`。
    * 强调每个模块都会在参数中提供一个文档链接，这些文档解释了该模块正在执行的操作。
    * 向下滚动并显示模型文档中的指标说明。
    
### <a name="6-create-inference-pipeline-and-deploy-the-model"></a>6.创建推理管道并部署模型
通常在此阶段创建 `Inference Pipeline`，并将其部署到 Web 服务。但是，我们已提前完成了这些步骤。  
* 讨论这些步骤，但不要在现场执行： 
    * 单击 `Create inference pipeline`，然后选择 `Real-time inference pipeline`
    * 确保 `Web Service Output` 连接到上一个数据处理步骤模块 `Select Columns in Dataset`
    * 单击 `Run`
    * 单击 `Deploy`
* 讨论创建 `Inference Pipeline` 的步骤后，从左侧导航栏导航到已部署的 Web 服务。
* 单击提前创建的 Web 服务的名称。
* 单击 `Test`，并显示模型对评分数据项的表现。
* 单击 `Consume`，并显示模型提供用于集成 Web 服务的示例代码。


# <a name="demo-3-testing-api-with-c-console-app-dotnet-core"></a>演示 3：使用 C# 控制台应用测试 API (.NET Core)

> 💡 在尝试执行此演示之前，必须已完成[部署](demosetup.md)。

### <a name="api-demo-test-video-herehttpsyoutubeu1ppyazunmot2136"></a>[此处](https://youtu.be/u1ppYaZuNmo?t=2136)提供了 API 演示测试视频

* 从 `Consume` 选项卡复制 API 密钥
* 打开 `App.config` 并将其粘贴到 value 属性中
* 从 `Consume` 选项卡复制 `Request-Response Url`
* 打开 `Program.cs` 并将值粘贴到 `client.BaseAddress = new Uri("");` 中
* 右键单击 `Program.cs` 并选择 `Open in Terminal`
* 键入命令 `dotnet run` 以运行控制台应用
* 若要使用 StoreID (ID1) 默认值 2 和 ItemID (ID2) 默认值 1，以及要预测的默认周数， 只需键入 `y`
* 此命令将会运行，并且应会返回未来 4 周的预测值。
