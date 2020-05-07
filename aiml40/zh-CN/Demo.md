# <a name="aiml40---demo-instructions"></a>AIML40 - 演示说明

[AIML40 公开材料](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/)提供了 AIML40 中的演示的详细说明，包括所需的准备工作。 我们不会重复该文档中所述的步骤，而是重点介绍一些可以改善演示的重要技巧（适合在 45 分钟内完成）。 请先阅读公开材料，以熟悉演示场景。

## <a name="demo-preparation"></a>演示准备工作

如 [AIML40 公开自述文件](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md)中所述，需要完成以下准备步骤：

1. 创建 Azure 机器学习工作区（使用 Azure 模板或 CLI 命令）
2. 将自动化机器学习演示数据集上传到工作区
3. 创建计算群集以加速演示
4. 设置 Jupyter Notebook 环境并在其中打开 `asba.ipynb` 文件，以做好执行准备。

在演示之前，请在浏览器中打开以下 3 个页面：
 - [文本分析页](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)
 - [Azure 机器学习工作区](http://ml.azure.com)
 - 包含 `asba.ipynb` 的 Jupyter Notebook

除上述步骤外，为确保快速完成演示，还需要执行以下操作：

> 💡 在尝试执行此演示之前，必须已完成[环境设置](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/Demo.md#demo-preparation)。

1. **对于演示 1：** 在浏览器中打开[文本分析页](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)，在下面的文本框中输入以下文本，然后按“分析”：  
> I loved the polka dot pants that I bought in the london store

[演示 1 的视频链接：认知服务文本分析](https://youtu.be/QJxjm5BirOA)

2. **对于演示 2：**
   - 打开包含 [Azure 机器学习工作区](http://ml.azure.com)的页面。 如果需要，请选择正确的工作区。
   - 请确保数据集已上传
   - 在 Azure 机器学习工作区中转到“自动化机器学习”选项卡，然后根据 [AIML40 公共自述文件](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md)中所述执行自动机器学习试验。  运行此试验需要花费很长时间，因此请提前开始。
   - 请务必在演示开始前的那一刻刷新页面，以便在执行演示时无需再次登录

[演示 2 的视频链接：自动化机器学习](https://youtu.be/qrstXN6TLZk)

3. **对于演示 3：**
   - 在 Jupyter 环境中打开 `asba.ipynb`
   - 请务必在代码中粘贴正确的订阅 ID（如果更改了默认值，则还要粘贴正确的群集名称/资源组名称）
   - 运行笔记本中的所有单元，并确保所有步骤正常运行。 某些步骤需要花费很长的时间才能完成运行，因此请提前做好准备。 （运行试验大约需要 3.5 个小时 - 正因如此，必须将计算群集设置为低优先级资源，以节省资金）
   - 确保在演示之前的那一刻处理完笔记本，以免再次输入凭据。

[演示 3 的视频链接：Azure 机器学习 SDK 和 Hyperdrive](https://youtu.be/sccNTPO3PwU)


## <a name="demo-time"></a>演示时间！

在演示过程中，我们建议演示以下内容：

1. **演示 1.1**：只需打开包含[文本分析页](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)的浏览器，然后单击“分析”。  页面应已预先加载。
2. **演示 1.2**： 
  - 在同一页上，单击“Example-English-Positive”以切换到默认短语“I had a wonderful trip to Seattle last week and even visited the Space Needle two times”，然后单击“分析”   
  - 可以看到，预测评分相当不错
  - 删除单词 **wonderful**
  - 单击“分析”，将会看到评分明显下降 
3. **演示 2：** Azure 机器学习工作区和自动化机器学习
  - 打开包含 [Azure 机器学习工作区](http://ml.azure.com)的浏览器 -- 页面应已预先加载
  - 导航到“数据集” 
  - 打开数据集
  - 在“概述”选项卡上展开“示例用法”以显示代码  
  - 切换到“浏览”以显示数据 
  - 切换到“自动化机器学习” 
  - 输入试验名称，选择计算，然后选择数据集 (clothing_automl.xlsx)
  - 选择“分类”任务，并选择“评级”作为目标列  
  - 展开“高级设置”并演示可用的选项，包括算法选择 
  - 单击“启动”（但请确保事先做好运行试验的准备，因为这需要很长时间！） 
  - 再次单击“自动化机器学习”选项卡，并启动前面在准备阶段执行的前一个试验 
  - 解释显示不同的模型运行以及最佳运行的图
  - 单击最佳模型以更详细地浏览“ROC”、“精准率-召回率”和其他指标图  
  - 演示如何使用“部署模型”按钮来方便地部署模型 
4. **演示 3：** 通过 Python SDK 使用 Azure 机器学习服务
  - 在进行此项演示的过程中，应遵循并解释 `absa.ipynb` 笔记本的单元
  - 若要充分保证安全，可以只演示代码而完全不要运行它 - 这种做法比较安全，但不会产生一种在现场演示模式下执行代码的印象
  - 若要进行更真实的演示，请参阅 [absa-instuctions.ipynb](absa-instuctions.ipynb) 笔记本，其中解释了在演示期间不应运行哪些单元，以及可以安全运行哪些单元 
  - 一般情况下，我们希望避免长时间运行的任务

## <a name="tear-down"></a>清理

由于演示需要消耗大量的资源，因此请不要忘记：
* 删除计算群集（特别是因为我们的演示中已关闭自动缩放，以节省群集准备时间）
* 如果使用 Azure 机器学习计算运行了演示，请确保在关闭时将最小节点数编辑为 0，并在演示期间编辑为 1 - 这可以节省成本
* 还可以删除 Azure 机器学习工作区和资源组 -- [公开自述文件](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md)中提供了相关说明

