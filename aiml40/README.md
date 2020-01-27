# <a name="aiml40---taking-models-to-the-next-level-with-azure-machine-learning-best-practices"></a>AIML40 - 利用 Azure 机器学习最佳做法升级模型

## <a name="session-information"></a>本节信息

可以通过多种方式使用人工智能和机器学习，通过分析非结构化数据流中的图像、文本和趋势来提高业务流程的工作效率和收集有意义的见解。 虽然使用现有模型可以解决许多任务，但在某些情况下，还需要训练自己的模型才能实现更具体的任务或提高准确性。 

在本讲座中，我们将介绍将文本分析智能服务集成到 [Tailwind Traders](http://tailwindtraders.com) 的业务流程中的完整路径，其中包括可用作[认知服务](https://azure.microsoft.com/services/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml40)的预构建模型、使用 [Azure 机器学习服务](https://azure.microsoft.com/services/machine-learning-service/?wt.mc_id=msignitethetour2019-github-aiml40)的适用于[基于方面的情绪分析](https://www.intel.ai/introducing-aspect-based-sentiment-analysis-in-nlp-architect/)的第三方神经自定义模型，它是 [Intel NLP Architect](http://nlp_architect.nervanasys.com/) 的一部分。 我们将讨论需要自定义模型的情况，并演示使用 [AutoML](https://docs.microsoft.com/azure/machine-learning/service/concept-automated-ml/?wt.mc_id=msignitethetour2019-github-aiml40) 从头开始创建这种模型的快捷方法，并展示如何使用 [HyperDrive](https://docs.microsoft.com/azure/machine-learning/service/how-to-tune-hyperparameters/?wt.mc_id=msignitethetour2019-github-aiml40) 微调模型超参数

## <a name="table-of-content"></a>目录
 

| 资源          | 链接                            |
|-------------------|----------------------------------|
| PowerPoint        | - [演示文稿](presentations.md) |
| 视频            | - [进行排练](https://youtu.be/If9IQm3gWVQ) <br/>- [Microsoft Ignite 奥兰多录制内容](https://myignite.techcommunity.microsoft.com/sessions/83002?source=sessions) |
| 演示             | - [演示 1 - 认知服务文本分析](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#demo-1-text-analytics-cognitive-service) <br/>- [演示 2 - 自动化机器学习](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#demo-2-azure-automl) <br/>- [演示 3 - Azure 机器学习 SDK 和 Hyperdrive](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#demo-3-using-azure-ml-workspace-with-python-sdk) |

## <a name="delivery-assets"></a>发送资产

* [PowerPoint 幻灯片](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/presentations.md)
* [其他讲师资源](README-Instructor.md)
* 演示视频：
    * 演示 1 - [认知服务文本分析](https://youtu.be/QJxjm5BirOA)
    * 演示 2 - [自动化机器学习](https://youtu.be/qrstXN6TLZk)
    * 演示 3 - [Azure 机器学习 SDK 和 Hyperdrive](https://youtu.be/sccNTPO3PwU)


## <a name="overview-of-demonstrations"></a>演示概述

在此演示文稿中，我们进行了以下演示：

1. 使用[认知服务文本分析](https://azure.microsoft.com/services/cognitive-services/text-analytics/?wt.mc_id=msignitethetour2019-github-aiml40)了解服装评论的情绪
2. 通过使用 [Azure 自动化 ML](https://docs.microsoft.com/azure/machine-learning/service/concept-automated-ml/?wt.mc_id=msignitethetour2019-github-aiml40)，几乎不使用任何代码，便可构建文本分类器
3. 使用 [Azure 机器学习服务](https://azure.microsoft.com/services/machine-learning-service/?wt.mc_id=msignitethetour2019-github-aiml40)训练基于方面的情绪分析模型。

## <a name="starting-fast"></a>快速开始

如果要立即开始，可以通过 Azure 模板部署所有必需的资源。 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml40%2Ftemplate%2Fazuredeploy.json" target="_blank">
 <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

下面我们提供了更详细的演示说明，以便你可以手动执行这些步骤，以完全理解所显示的概念。

## <a name="initial-environment-setup"></a>初始环境设置

若要执行演示的步骤 2 和步骤 3，我们需执行以下操作：

1. 创建 Azure 机器学习工作区
2. 上传用于 AutoML 训练的数据 - [clothing_automl.xlsx](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_automl.xlsx)

#### <a name="creating-azure-machine-learning-workspace"></a>创建 Azure 机器学习工作区

可以通过以下两种方式创建 Azure ML 工作区：
* 从 [Azure 门户](http://portal.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40)手动创建（[这里有完整的演练](https://docs.microsoft.com/azure/machine-learning/service/how-to-manage-workspace/?wt.mc_id=msignitethetour2019-github-aiml40)）
* 从提供的 Azure 模板进行部署
* 通过 [Azure CLI](https://docs.microsoft.com/ru-ru/cli/azure/?view=azure-cli-latest&wt.mc_id=msignitethetour2019-github-aiml40) 创建

> 注意：（在本示例中，我们使用 `absa` 作为名称，并使用美国西部 2 数据中心，但你可以随意更改它们）

```shell
az extension add -n azure-cli-ml
az group create -n absa -l westus2
az ml workspace create -w absa_space -g absa
```

还需要知道你的订阅 ID，可以通过运行 `az account list` 获取它。

#### <a name="uploading-data-to-the-workspace"></a>将数据上传到工作区

在演示中，我们使用几个数据集：
* 用于自动化 ML 演示的数据集 - [clothing_automl.xlsx](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_automl.xlsx)
* 大型数据集 [clothing_absa_train.csv](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_absa_train.csv)，用于训练完全基于方面的情绪分析模型供演示 3 使用
* 用于基于方面的情绪分析模型的小型调试数据集 [clothing_absa_train_small.csv](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_absa_train_small.csv)
* 用于测试模型的单独验证集 [clothing-absa-validation.json](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing-absa-validation.json)

若要按照自动化 ML 演示操作，请将数据集上传到工作区。 可以通过 [Azure ML 门户](http://ml.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40)手动上传，也可以使用提供的文件 `upload_dataset.py` 进行上传（csv/xlsx 文件应位于当前目录中，请根据你的订阅替换 `[subscription_id]`）：

```shell
python upload_dataset.py -s [subscription_id] -w absa_space -g absa -f clothing_automl.xlsx
```

演示代码会将自动化 ML 服装数据集上传到 AML 服务数据存储中。

#### <a name="using-the-azure-ml-demo-code"></a>使用 Azure ML 演示代码

你可以从任何 Jupyter Notebook 环境执行演示代码。 可以使用以下任一选项：
 - 在本地安装 Python 环境，如“Python 环境安装”中所述
 - 从 Azure ML 工作区中使用 Jupyter Notebook。 若要执行该操作：
     - 导航到 [Azure ML 门户](https://ml.azure.com/)
     - 从左侧菜单中选择“笔记本”
     - 上传 `absa.ipynb` 文件并选择它
     - 系统将提示你创建笔记本 VM。 现在，可以直接从门户使用笔记本。
 - 使用 [Azure Notebooks](https://docs.microsoft.com/azure/notebooks/azure-notebooks-overview/?wt.mc_id=absa-notebook-abornst)。 在本例中，应将 `absa.ipynb` 文件上传到新的 Azure Notebooks 项目。 此外，由于 Azure Notebooks 中有可用计算的限制（1 Gb 磁盘空间），因此你只能在虚拟机上运行此笔记本，如[此处](https://docs.microsoft.com/azure/notebooks/use-data-science-virtual-machine/?wt.mc_id=msignitethetour2019-github-aiml40)所述。 

#### <a name="python-environment-installation"></a>Python 环境安装

如果决定不使用 Azure Notebooks，而更愿意使用本地 Python 环境，则必须安装 Python Azure ML SDK，并确保安装笔记本和 contrib：

```shell
conda create -n azureml -y Python=3.6
source activate azureml
pip install --upgrade azureml-sdk[notebooks,contrib] 
conda install ipywidgets
jupyter nbextension install --py --user azureml.widgets
jupyter nbextension enable azureml.widgets --user --py
```

进行此操作后需要重启 Jupyter。 [此处](https://docs.microsoft.com/azure/machine-learning/service/quickstart-create-workspace-with-python/?WT.mc_id=msignitethetour2019-github-aiml40)提供了详细说明

如果需要使用免费的试用帐户，可以在[此处](https://azure.microsoft.com/offers/ms-azr-0044p/?WT.mc_id=msignitethetour2019-github-aiml40)获得一个帐户

#### <a name="pre-creating-compute-cluster"></a>预先创建计算群集

为完成最后两个演示，需要一个计算群集。 出于演示目的，我们将创建一个只包含一个节点的群集。 可以通过以下三种方式之一来完成此操作：

1. 通过 [Azure ML 门户](http://ml.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40)，转到“计算”部分，手动创建包含 Standard_DS3_v2 VM 的 Azure ML 计算群集，并将节点数指定为 1。 将群集命名为 `absa-cluster`。
2. 运行提供的 `create_cluster.py` 脚本，并提供上述参数：
```shell
python create_cluster.py -s [subscription_id] -w absa_space -g absa
```
3. 运行 `absa.ipynb` 笔记本中的前几个单元格，这将创建一个群集。

## <a name="demos"></a>演示

### <a name="demo-1-text-analytics-cognitive-service"></a>演示 1：文本分析认知服务

> 💡 在尝试执行此演示之前，必须已完成[环境设置](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#starting-fast)。

在本演示中，我们将展示文本分析如何对 Web 界面中的短语进行情绪分析。

1. 打开[文本分析页](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)
2. 向下滚动至“在操作中查看”部分，然后输入短语“我喜欢我在伦敦商店购买的圆点长裤”（也可以保留默认短语以阐明要点）。
3. 按“分析”，你将得到以下结果：

![Azure 文本分析的屏幕截图](images/analytics.png)

请注意，文本分析不仅提供情绪，而且还从文本中提取位置和关键字。

### <a name="demo-2-azure-automl"></a>演示 2：Azure AutoML

> 💡 在尝试执行此演示之前，必须已完成[环境设置](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#starting-fast)。

在本演示中，我们演示了如何使用自动化 ML 构建 ML 模型而无需编写代码。

1. 在 [http://ml.azure.com](http://ml.azure.com/?WT.mc_id=msignitethetour2019-github-aiml40) 中导航到（你在上面创建的）Azure ML 工作区
2. 转到“数据集”，应可看到之前上传的数据集 (clothing_automl.xlsx)。 请注意，你也可以通过门户将其上传到此处。
3. 选择数据集。
4. 在“概述”选项卡上，展开“样本使用情况”，并显示可用于以编程方式访问数据的代码（如果需要）。
5. 在“浏览”选项卡中，查看数据。
6. 转到“自动化 ML”选项卡，然后单击“新试验”
7. 选择要使用的试验名称和计算。
8. 选择数据集。
9. 选择预测任务的类型 - 分类。
10. 选择目标列 - 评级。
11. 单击“开始”。

由于要研究不同的算法，因此本试验将花费相当长的时间才能运行完毕。 如果要播放演示，最好提前运行本试验，只在最后显示结果。

### <a name="demo-3-using-azure-ml-workspace-with-python-sdk"></a>演示 3：通过 Python SDK 使用 Azure ML 工作区

> 💡 在尝试执行此演示之前，必须已完成[环境设置](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#starting-fast)。

在本演示中，我们将运行自定义 Python 代码，该代码使用 Python Azure ML SDK 训练、优化和使用自定义的基于方面的情绪分析 (ABSA) 模型。

Jupyter Notebook 本身包含此演示部分的所有说明。 使用上述某个方法（在 Azure Notebooks 中或在本地）运行 Notebook，并按照其中的说明进行操作。 

## <a name="tear-down"></a>清理空间

为释放演示期间使用的云资源，需要删除 Azure ML 工作区和资源组：

```shell
az ml workspace delete --w absa_space -g absa
az group delete -n absa
```

## <a name="presenter-resources"></a>讲师资源

如果要演示此内容，请查看[其他讲师资源](README-Instructor.md)。

## <a name="resources-and-continue-learning"></a>相关资源和继续学习

### <a name="getting-started-series"></a>入门系列

* [Azure 认知服务文本分析 API](https://aka.ms/TextCogSvc)
* [自动化机器学习](https://aka.ms/AutomatedMLDoc)
* [超参数优化](https://aka.ms/AzureMLHyperDrive)
* [Azure ML 服务和 Python SDK](https://aka.ms/AA3dzht) 

### <a name="other-materials"></a>其他资料

* [关于生产机器学习的 9 个进阶提示](http://aka.ms/9TipsProdML)
* [基于 Intel 方面的情绪分析页面](https://www.intel.ai/introducing-aspect-based-sentiment-analysis-in-nlp-architect/)
* Azure 机器学习最佳做法存储库：
    * [自然语言处理](https://github.com/microsoft/nlp/)
    * [计算机视觉](https://github.com/microsoft/ComputerVision)
    * [推荐者](https://github.com/microsoft/Recommenders)


## <a name="feedback-loop"></a>反馈和建议

想要提供意见、反馈、建议？ 目前，针对内容更改/建议/反馈的最佳方法是在此 GitHub 存储库中创建新的 Issue。 若要获取有关如何创建 Issue 的所有详细信息，请参阅[投稿](../../contributing.md)文档
