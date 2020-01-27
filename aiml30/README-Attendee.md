# <a name="aiml30--start-building-machine-learning-models-faster-than-you-think--train-the-trainer"></a>AIML30 - 比想象中更快地开始构建机器学习模型 - 培训讲师

Tailwind Traders 使用自定义机器学习模型，无需更改其软件开发生命周期，即可解决其库存问题！ 怎么做到的？ Azure 机器学习设计器。
 
在本讲座中，你将了解 Tailwind Traders 使用的数据科学过程，并获取 Azure 机器学习设计器的简介。 你将了解如何查找、导入和准备数据，如何选择机器学习算法，如何训练和测试模型，以及如何将完整模型部署到 API。 获取你和你的开发团队所需的相关提示、最佳做法和资源，以便继续机器学习之旅、构建第一个模型以及执行其他操作。


## <a name="demo-environment-deployment"></a>演示环境部署
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>


## <a name="create-additional-resources-needed"></a>创建所需的其他资源
创建基础 Azure 机器学习服务工作区以后，需添加其他计算资源。
### <a name="create-compute-targets"></a>创建计算目标
1. 创建机器学习计算
    * 单击导航栏“计算”
    * 单击“新建”
    * 输入资源的名称
    * 从下拉列表中选择“机器学习计算”
    * 选择计算机大小
    * 输入最小和最大节点数（建议的最小节点数为 0，最大节点数为 5）
    * 单击“创建”![创建计算](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif)
2. 创建 Kubernetes 计算
    * 单击导航栏“计算”
    * 单击“新建”
    * 输入资源的名称
    * 从下拉列表中选择“Kubernetes 服务”
    * 单击“创建”![创建 Kubernetes](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif)


## <a name="build-model-with-azure-machine-learning-visual-designer"></a>使用 Azure 机器学习视觉设计器构建模型

### <a name="1-upload-the-dataset-to-the-datasets-in-aml"></a>1.将数据集上传到 AML 中的数据集
* 将数据集从[此处](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv)下载到本地
* 单击 `Datasets`
* 单击 `Create from local`
* 填写表单并上传数据集

### <a name="2-start-building-the--model"></a>2.开始构建模型

* 在左侧导航中单击`Designer`。
* 单击加号以创建新管道
* 展开 `Datasets` 和 `My Datasets`
* 将上传的数据集拖放到试验工作区
* 将 `Select Columns in Dataset` 拖放到工作区
    * 在右侧的参数菜单中单击 `Edit columns`。
    * 单击`By Name`
    * 单击`Add All`
    * 单击 `Time` 列上的 `Minus` 图标以排除它
* 将 `Split Data` 拖放到工作区
    * 编辑参数以将数据拆分为 70/30。 
    * 这不是一条规则，可以根据不同的模型需求进行更改。
* 将 `Train Model` 拖放到工作区
    * 在右侧的参数中选择标签列名称 `Values`
* 将 `Boosted Decision Tree Regression` 拖放到工作区
* 将 `Score Model` 拖放到工作区
* 将 `Evaluate` 拖放到工作区
* 将 `Split Data` 模块连接到 `Train Model` 以训练数据，并连接到 `Score Model` 以便对包含不可见数据的预测结果进行评分。
* 将 `Train Model` 连接到训练算法 `Boosted Decision Tree Regression` 模块。
* 将 `Score Model` 连接到 `Evaluate` 模块。
* 单击底部导航栏中的 `Run` 按钮，然后选择“计算”。 

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
* 这些列是我们通过 POST 从已完成并部署的模型获取结果时，数据演示应用所需的列。
* 进行训练

### <a name="4-create-inference-pipeline-and-deploy-the-model"></a>4.创建推理管道并部署模型
* 单击 `Create inference pipeline`，然后选择 `Real-time inference pipeline`
* 确保 `Web Service Output` 连接到上一个数据处理步骤模块 `Select Columns in Dataset`
* 单击 `Run`
* 单击 `Deploy`
* 从左侧导航栏导航到已部署的 Web 服务。
* 单击提前创建的 Web 服务的名称。
* 单击`Test`，了解模型在评分数据项上的表现。
* 单击`Consume`，查看模型提供用于集成 Web 服务的示例代码。

### <a name="5-test-api-with-c-console-app-dotnet-core"></a>5.使用 C# 控制台应用测试 API (.NET Core)

1. [在此处下载 VS Code](https://code.visualstudio.com/download)
2. 使用以下命令克隆应用
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
3. 导航到项目路径
    * `cd ignite-learning-paths\aiml\aiml30\C#\IgniteAimlDataApp`
4. 在 VS Code 中打开项目
    * `code .`
5. 在 `IgniteAimlDataApp/Datasets` 文件夹中将本地数据集替换为在上面的步骤中下载的数据集。
6. 运行测试的步骤
    * 从 `Consume` 选项卡复制 API 密钥
    * 打开 `App.config` 并将其粘贴到 value 属性中
    * 从 `Consume` 选项卡复制 `Request-Response Url`
    * 打开 `Program.cs` 并将值粘贴到 `client.BaseAddress = new Uri("");` 中
    * 右键单击 `Program.cs` 并选择 `Open in Terminal`
    * 键入命令 `dotnet run` 以运行控制台应用
    * 若要使用 StoreID （ID1） 默认值 2 和 ItemID (ID2) 默认值 1，以及要预测的默认周数， 只需键入 `y`
    * 此命令将会运行，并且应会返回未来 4 周的预测值。


### <a name="6-optional-additionally-test-api-with-python-in-notebook-vms-using-jupyter-notebooks"></a>6.可选：使用 Jupyter Notebook 在笔记本 VM 中通过 Python 额外测试 API
1. 导航到 `Compute` 并新建笔记本 VM ![创建计算](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif)
2. 在列 `Application URI` 下创建后，单击 `Jupyter Lab` 选项。 （直到 VM 处于 `running` 状态时才会显示。）
3. 在 Jupyter 实验室的主页中单击终端
4. 从 Jupyter 实验室中的终端克隆存储库
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
5. 也在终端 `pip install holidays` 中克隆
6. 打开 `ignite-learning-paths-training-aiml` 克隆文件夹，导航到 `ignite-ailml30-get-prediction.ipynb` 文件，然后单击将其打开。
    * 完整路径应如下所示：`ignite-learning-paths-training-aiml\aiml30\Python\ignite-ailml30-get-prediction.ipynb`
7. 更新 csv 文件、终结点和密钥的路径。
8. `SHIFT + Enter` 或在顶部菜单中单击每个单元上的“播放”以运行每个单元

## <a name="powerpoint-deck-and-video-demo"></a>PowerPoint 资料和视频演示

- [PowerPoint 幻灯片](presentations.md)

- [演示视频](https://www.youtube.com/watch?v=u1ppYaZuNmo&feature=youtu.be)

## <a name="resources-and-continue-learning"></a>相关资源和继续学习

下面是一个列表，其中包含相关的培训和文档。

- [什么是 Azure 机器学习设计器？](https://docs.microsoft.com/en-us/azure/machine-learning/service/ui-concept-visual-interface?WT.mc_id=msignitethetour-slides-cxa)
- [使用 Microsoft Azure 机器学习发布机器学习实验](https://docs.microsoft.com/en-us/learn/paths/publish-experiment-with-ml-studio/)


## <a name="feedback-loop"></a>反馈和建议

想要提供意见、反馈、建议？ 目前，针对内容更改/建议/反馈的最佳方法是在此 GitHub 存储库中创建新的 Issue。 若要获取有关如何创建 Issue 的所有详细信息，请参阅[投稿](../../contributing.md)文档
