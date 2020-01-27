# <a name="demo-setup"></a>演示设置
请按以下步骤操作，使环境做好实时演示的准备。 完成此设置后，请按[演示指南](demoguide.md)操作。

## <a name="create-azure-machine-learninge-resources-with-the-deploy-to-azure-button-below"></a>使用下面的“部署到 Azure”按钮创建 Azure 机器学习资源
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>

> 创建后，请将 Azure 机器学习资源升级到企业版供本研讨会使用。 你应会看到一个“升级”按钮用来完成此操作。 此按钮当前为预览版，定价结构可参见[此处](https://azure.microsoft.com/en-us/pricing/details/machine-learning/)

## <a name="create-additional-resources-needed"></a>创建所需的其他资源

* 选择“启动新的 Azure 机器学习工作室” 

创建基础 Azure 机器学习服务后，需添加其他计算资源。
### <a name="create-compute-targets"></a>创建计算目标
1. 创建机器学习计算
    * 单击导航栏“计算”
    * 选择“训练群集”
    * 单击“新建”
    * 输入资源的名称
    * 选择计算机大小（例如，Standard_DS2_v2）
    * 输入最小和最大节点数（建议的最小节点数为 0，最大节点数为 5）
    * 单击“创建”![创建计算](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif)
2. 创建 Kubernetes 计算
    * 单击导航栏“计算”
    * 选择“引用群集”
    * 单击“新建”
    * 输入资源的名称
    * 选择区域
    * 将“虚拟机大小”保留为默认值
    * 将群集目标设置为“开发测试”
    * 单击“创建”![创建 Kubernetes](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif)
3. 创建笔记本虚拟机
    * 单击导航栏“计算”
    * 选择“笔记本虚拟机”
    * 单击“新建”
    * 为笔记本提供唯一名称
    * 选择 VM 大小
    * 单击“创建”![创建 VM](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif)


## <a name="upload-dataset-to-workspace-blob-storage-and-save-to-local"></a>将数据集上传到工作区 Blob 存储并保存到本地
所需数据集每周创建一次并会对日期进行更新，这样你的演示就可以预测未来数周。 下面是获取新数据集并将其添加到 Azure 机器学习存储帐户和演示版数据应用的步骤。

1. 将数据集从[此处](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv)下载到本地
2. 打开 Azure 存储资源管理器 - [在此处下载](https://azure.microsoft.com/en-us/features/storage-explorer/)。
3. 导航到 `azureml-blobstore-<guid>`
4. 创建名为 `datasets` 的新文件夹
5. 上传数据集
6. 替换 C# 演示应用中的本地 ForecastingData.csv 文件，以便针对未来日期进行预测。 有一个默认 csv，但它不会是更新的数据。

## <a name="get-the-c-demo-app"></a>获取 C# 演示应用
第一个演示是使用 VS Code 和 C# IgniteAimlDataApp。 这是为了演示如何进行数据处理，并突出显示它可以使用任何语言来完成。

1. [在此处下载 VS Code](https://code.visualstudio.com/download)
2. 确保在本地安装了 [.NET Core SDK 2.1.0](https://dotnet.microsoft.com/download/dotnet-core/2.1)
3. 使用以下命令克隆应用
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
4. 导航到项目路径
    * `cd ignite-learning-paths-training-aiml/aiml30/C#/IgniteAimlDataApp/IgniteAimlDataApp`
5. 在 VS Code 中打开项目
    * `code .`
6. 在 `IgniteAimlDataApp/Datasets` 文件夹中将本地数据集替换为在上面的步骤中下载的数据集。
7. 若要运行应用，请执行以下步骤
    * 右键单击 `Program.cs`，选择`Open in Terminal`
    * 运行 `dotnet run` 命令
    * 它会提示你回答问题：`Would you like to run the default params`，请键入 `y`
    * 此操作会尝试命中 API，但会失败，因为该 API 尚未创建。

## <a name="run-through-the-live-demo"></a>执行实时演示
请进行完整的实时演示，通过一个完成的备份模型打开并显示最终结果。

#### <a name="there-will-not-be-enough-time-to-run-the-model-during-the-live-demo-make-sure-to-build-the-model-_without_-running-it-in-the-live-session-once-you-have-added-all-the-modules-to-the-experiment-workspace-then-navigate-to-the-model-you-created-and-trained-prior-to-the-session"></a>在实时演示期间，将没有足够的时间运行该模型。 确保生成该模型，但不在实时会话中运行它。  将所有模块添加到试验工作区以后，请在该会话之前导航到已创建并训练的模型。

[下一步 - 实时演示步骤](demoguide.md)
