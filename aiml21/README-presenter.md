# <a name="aiml21-developers-guide-to-ai-a-data-story"></a>AIML21：AI 开发人员指南：数据案例 

## <a name="train-the-trainer-guide"></a>培训讲师指南

### <a name="session-abstract"></a>讲座摘要

本视频讲座将会演示数据科学过程及其应用方式。 从探索数据集到部署服务，所有这些都应用于有趣的数据案例。 会议内容还会针对 Azure AI 平台进行简短的介绍。

# <a name="how-to-use"></a>如何使用

### <a name="welcome-presenter"></a>欢迎演示者！

我们很高兴你使用这项服务，期待你讲述这一精彩内容。 作为经验丰富的演示者，我们知道你了解如何演示，因此本指南将重点介绍需要演示的内容。   它将为提供由演示文稿设计团队创建的演示的完整介绍。

除了演示文稿的视频外，本文档还将链接到成功演示所需的所有资产，其中包括 PowerPoint 幻灯片、演示说明和代码。

* 阅读完整的文档。
* 观看视频演示文稿
* 询问关于潜在客户演示者的问题

# <a name="assets-in-train-the-trainer-kit"></a>培训讲师工具包中的资产

* 本指南
* [PowerPoint 演示文稿](https://globaleventcdn.blob.core.windows.net/assets/aiml/AIML21_DevelopersGuidetoAI_ADataStory.pptx)
* [完整的演示文稿记录](https://youtu.be/K8upKkvtEI0)
* [使用的数据集](aiml21/data)
* [要运行的代码文件](aiml21/code)
* 单独的演示视频： 
    * 演示 1 - [探索](https://youtu.be/1Xtmrsfkzfs)
    * 演示 2 - [试验](https://youtu.be/sUKuRBRvo7U)
    * 演示 3 - [部署](https://youtu.be/IgSaMKsyexg)
    * 演示 4 - [呈现](https://youtu.be/g7aBaC9s9qQ)
* 演示说明

# <a name="demo-instructions"></a>演示说明：

若要开始，请下载此存储库中的所有代码和数据文件。 有一个代码和数据文件夹包含运行所有演示所需的所有信息

**需要：**
* Azure 订阅 - [在此处获取免费试用版](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml21)（如果需要）
* [Power BI Desktop（仅限 Windows）](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=msignitethetour2019-github-aiml21)- 如果在 MacOS/Linux 上运行，仍可以在任何新式 Web 浏览器中演示功能

**设置说明：**
* 使用下面的“部署到 Azure”按钮创建要在整个讲座中使用的 Azure 机器学习工作区 

[![部署到 Azure](https://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

* 登录到 Azure 门户和 Azure 机器学习服务
* 选择将工作区升级到**企业版（预览版）** [在此处查看当前定价详细信息](https://azure.microsoft.com/en-us/pricing/details/machine-learning/) - 需要使用企业版才能完成试验演示（演示 2）
* 启动**预览版 UI**
* 创建一个**笔记本 VM**
    * 在左窗格中选择“计算”
    * 选择“笔记本 VM”下的“新建”
    * 提供笔记本 VM 的名称（全小写）
    * 保留提供的默认大小 VM
    * 创建后，选择“Jupyter 链接”
    * 双击并输入用户文件夹
    * 选择上传按钮，然后上传下面列出的文件：
        * [data/data_train.csv](data/data_train.csv)
        * [code/explore.ipynb](code/explore.ipynb)
        * [code/deploy.ipynb](code/deploy.ipynb)
        * [code/config.json](code/config.json)
    * 打开 [config.json](code/config.json)，输入订阅密钥、资源组和 Azure 机器学习工作区名称，然后保存该文件

>[在此处详细了解笔记本 VM](https://azure.microsoft.com/en-us/blog/three-things-to-know-about-azure-machine-learning-notebook-vm/?WT.mc_id=msignitethetour2019-github-aiml21)

* 创建一个**计算实例**
    * 在左窗格中选择“计算”
    * 选择“训练群集”选项卡下的“新建”
    * 提供计算名称（全小写）
    * 选择 VM 大小
        * 对于标准计算，请选择类似于“Standard_DS2_v2”的选项
        * 对于 GPU 计算，请选择“Standard_NC6”
    * 选择“低优先级”作为虚拟机优先级
    * 最小节点数设置为 0（这样就会缩减到极致，从而降低成本）
    * 将最大节点数设置为 3-6
    * 单击“创建”

>[在此处详细了解 Azure 机器学习](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-set-up-training-targets#amlcompute/?WT.mc_id=msignitethetour2019-github-aiml21)

* 上传**数据集**
    * 在左窗格中选择“数据集”
    * 依次选择“创建数据集”、“从本地文件”
    * 选择“浏览”按钮并找到 data_train_experiment.csv 文件
    * 选择“下一步”
    * 检查数据，然后选择“下一步”、“下一步”
    * 最后检查数据集设置并选择“创建”

>[在此处详细了解如何创建数据集](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-create-register-datasets/?WT.mc_id=msignitethetour2019-github-aiml21)

* 创建 **Power BI 工作区**
    * 打开 [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)
    * 使用工作区凭据登录
    * 在左窗格中单击“工作区”
    * 单击“创建工作区”
    * 输入工作区名称
    * 输入工作区的说明
    * 单击“保存”
* 发布 **Power BI 报表**
    * 打开 Power BI Desktop 并在其中打开 Present.pbix
    * 单击“发布”
    * 选择刚刚创建的工作区名称
    * 等待报表发布完成
* 查看 **Power BI 报表**
    * 返回 [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) 
    * 根据需要刷新浏览器
    * 在 Web 浏览器的左窗格中查看报表
    * 单击报表，随即会加载该报表

## <a name="demo-1---explore"></a>演示 1 - 探索

### <a name="video-demo-with-voice-over-aiml21---demo-1---explorehttpsyoutube1xtmrsfkzfs"></a>带语音的视频演示：[AIML21 - 演示 1 - 演示](https://youtu.be/1Xtmrsfkzfs)

* 登录到 [Azure 门户](https://azure.microsoft.com/en-gb/?WT.mc_id=msignitethetour2019-github-aiml21)，并打开前面使用模板创建的“Azure 机器学习”试验 
* 单击“立即启动预览版”以启动预览版体验 
* 在左窗格中打开“计算” 
* 选择笔记本 VM 上的“Jupyter”链接 
* 根据需要使用 Azure 凭据登录 
* 打开 [**Explore.ipynb**](code/explore.ipynb)（建议打开所有这些选项卡并准备就绪） 
* 确保已清除笔记本中的所有输出单元 - **选择“单元”->“所有输出”->“清除”**
* **观看每个演示中所有论题的视频**
* 运行并简要解释前 6 个单元
* 请注意，有其他单元和可视化效果可供使用，参与者应从 **[aka.ms/AIML21repo](http://aka.ms/aiml21repo)** 下载代码

## <a name="demo-2---experiment"></a>演示 2 - 试验

### <a name="video-demo-with-voice-over-aiml21---demo-2---experimenthttpsyoutubesukurbrvo7u"></a>带语音的视频演示：[AIML21 - 演示 2 - 试验](https://youtu.be/sUKuRBRvo7U)

* 在 Azure 机器学习工作室中转到 [ml.azure.com](https://ml.azure.com/?WT.mc_id=msignitethetour2019-github-aiml21)。 可以通过 URL 直接访问此网站，然后登录并选择为此次讲座创建的适当工作区。 或者在 Azure 门户上的“Azure 机器学习服务”中选择“立即启动预览版”按钮 
* 在左窗格中选择“自动化机器学习” 
* **观看每个演示中所有论题的视频**
* 单击“新建自动化机器学习运行” 
* 选择训练数据集 (data_train_experiment-XXXXXX)
* 提供试验名称，例如 aiml21-regression-duration
* 为目标列选择“持续时间” 
* 选择前面设置的计算的“训练群集”
* 选择“下一步” 
* 为“预测任务”选择“回归” 
* 选择“查看其他配置设置”并将“主要”指标设置为“normalized_root_mean_squared_error”  
* 设置“并发”，将并发迭代数设置为 3
* 设置“退出条件”，将“训练作业时间(小时)”设置为 1
* 选择“保存” 
* 选择“完成” 

> 开始运行试验后，指出运行需要花费一段时间，然后请检查前面运行的示例。 

> 在即将实施该阶段之前，请确保已根据前面所述准备好一个完全运行的自动化机器学习回归

* 在左侧的“自动化机器学习”页中选择前面运行的试验，或者在刚刚提交的试验中按后退按钮
* 前面运行的试验具有一个较长的“运行 ID”，请选择此链接
* **观看每个演示中所有论题的视频**

## <a name="demo-3---deploy"></a>演示 3 - 部署

### <a name="video-demo-with-voice-over-aiml21---demo-3---deployhttpsyoutubeigsamksyexg"></a>带语音的视频演示：[AIML21 - 演示 3 - 部署](https://youtu.be/IgSaMKsyexg)

> 将使用前面已运行的且已检查过的试验进行部署

* 在正在运行自动化机器学习试验的屏幕上开始操作 
* 选择“部署最佳模型”按钮 
* 创建部署名称，例如 aiml21-v1
* 根据需要添加部署说明
* 计算类型设置为 ACI（Azure 容器实例）
* 将身份验证保持在启用状态
* 选择“部署”按钮 
* 对部署可能需要的时间进行注释，你可从左侧的“终结点”选项卡中查看此信息

>在实施该阶段之前，请确保具有一个已部署到 ACI 且完全运行的自动化机器学习回归试验

* 在左窗格中选择“终结点” 
* 选择已创建的 Azure 容器实例模型
* **观看每个演示中所有论题的视频**
* 选择包含“Jupyter”的浏览器标签页
* 打开 [Deploy.ipynb](code/deploy.ipynb)
* 确保已清除笔记本中的所有输出单元 - **选择“单元”->“所有输出”->“清除”**
* 确认 config.json 文件中已填写正确的信息
* 编辑第 2 个单元，以包含部署的 Web 服务名称
* 运行笔记本中的所有单元并解释代码 - **观看每个演示中所有论题的视频**

## <a name="demo-4---present"></a>演示 4 - 呈现

### <a name="video-demo-with-voice-over-aiml21---demo-4---presenthttpsyoutubeg7abac9s9qq"></a>带语音的视频演示：[AIML21 - 演示 4 - 呈现](https://youtu.be/g7aBaC9s9qQ)

>在实施该阶段之前，请打开 Power BI Desktop，然后在其中加载 [Present.pbix](code/Present.pbix) 和 [https://powerbi.microsoft.com/](https://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)（其中打开了上述设置中创建的工作区和报表）

* 打开 Present.pbix 
* **观看每个演示中所有论题的视频**
* 显示“发布”按钮
* 打开 [https://powerbi.microsoft.com/](https://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)
* **观看每个演示中所有论题的视频**

# <a name="teardown-instructions"></a>清理说明

### <a name="full-teardown"></a>完全清理

* 进入 Azure 门户并删除 Azure 资源组，这样就可以删除此项目的所有资源

### <a name="to-save-costs"></a>节省成本

* 只要不使用笔记本 VM，都请确保在其上选择“关机”
* 请删除终结点中不再使用的 Azure 容器实例

# <a name="resources-and-continued-learning"></a>资源和继续学习

**Microsoft Learn：**
* [探索 Azure 中的数据科学工具](https://docs.microsoft.com/en-us/learn/paths/explore-data-science-tools-in-azure/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Python 简介](https://docs.microsoft.com/en-us/learn/modules/intro-to-python/?WT.mc_id=msignitethetour2019-github-aiml21)
* [使用 Azure 机器学习服务自动选择机器学习模型](https://docs.microsoft.com/en-us/learn/modules/automate-model-selection-with-azure-automl/?WT.mc_id=msignitethetour2019-github-aiml21)
* [通过 Power BI 创建和使用分析报表](https://docs.microsoft.com/en-us/learn/paths/create-use-analytics-reports-power-bi/?WT.mc_id=msignitethetour2019-github-aiml21)


# <a name="feedback-loop"></a>反馈循环

所有发言人都有机会参加每月举行的**培训讲师问答讲座**（两个讲座，涵盖所有时区）。当你在讲台上讲述相关内容以后，我们希望你能参加我们组织的**反馈讲座**，与我们共享你对相关内容的体验，并且可以针对任何内容提供反馈或建议。 

想要提供意见、反馈、建议？ 目前，针对内容更改/建议/反馈的最佳反馈循环是在此 GitHub 存储库中创建新问题。 若要获取有关如何创建问题的所有详细信息，请参阅[贡献文档](https://github.com/microsoft/ignite-learning-paths/blob/master/contributing.md)

## <a name="become-a-trained-presenter"></a>成为训练有素的演示者

若要成为训练有素的演示者，请联系 [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com)。 在电子邮件中，请提供：

- 全名
- 此演示文稿的代码：aiml21
- 演示视频（约 10 分钟长）（例如：未列出的 YouTube 视频）链接。 
  > 无需是此内容，重要的是展示演示者技能

导师会将有关此过程的信息反馈给你。

## <a name="trained-presenters"></a>训练有素的演示者

感谢以下优秀参与者（[表情符号键](https://allcontributors.org/docs/en/emoji-key)）：

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/amynic">
        <img src="https://avatars3.githubusercontent.com/u/13828867?s=400&u=f6aca8528d65d6c191114d3a7328b46137eda162&v=4" width="100px;" alt="Amy Boyd"/><br />
        <sub><b>Amy Boyd</b></sub></a><br />
            <a href="https://globaleventcdn.blob.core.windows.net/assets/aiml/AIML21_DevelopersGuidetoAI_ADataStory.pptx" title="讲座">📢</a>
            <a href="https://github.com/microsoft/ignite-learning-paths-training/pulls?q=is%3Apr+author%3Aamynic+is%3Aclosed" title="文档">📖</a> 
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->
