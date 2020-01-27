# <a name="developers-guide-to-ai-a-data-story"></a>AI 开发人员指南：数据案例

本视频讲座将会演示数据科学过程及其应用方式。 从探索数据集到部署服务，所有这些都应用于有趣的数据案例。 会议内容还会针对 Azure AI 平台进行简短的介绍。

# <a name="demo-environment-deployment"></a>演示环境部署

若要开始，请下载此存储库中的所有代码和数据文件。 有一个代码和数据文件夹包含运行所有演示所需的所有信息

**需要：**
* Azure 订阅 - [在此处获取免费试用版](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml21)（如果需要）
* [Power BI Desktop（仅限 Windows）](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=msignitethetour2019-github-aiml21)- 如果在 MacOS/Linux 上运行，仍可以在任何新式 Web 浏览器中演示功能

**设置说明：**
* 使用下面的“部署到 Azure”按钮创建 Azure 机器学习工作区 

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

# <a name="delivery-of-assets"></a>资产交付

* [PowerPoint 演示文稿](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/presentations.md)
* [使用的数据集](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/data)
* [要运行的代码文件](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/code)
* 单独的演示视频： 
    * 演示 1 - [探索](https://youtu.be/-z6nfyq-WrI)
    * 演示 2 - [试验](https://youtu.be/c7p_4CRYT8k)
    * 演示 3 - [部署](https://youtu.be/7bkBO7NQd4Q)
    * 演示 4 - [呈现](https://youtu.be/g7aBaC9s9qQ)

# <a name="demo-1---explore"></a>演示 1 - 探索

> 💡 在尝试执行此演示之前，必须已完成[设置](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-attendee.md#demo-environment-deployment)。

### <a name="video-demo-with-voice-over-aiml21---demo-1---explorehttpsyoutube-z6nfyq-wri"></a>带语音的视频演示：[AIML21 - 演示 1 - 演示](https://youtu.be/-z6nfyq-WrI)

* 登录到 [Azure 门户](https://azure.microsoft.com/en-gb/?WT.mc_id=msignitethetour2019-github-aiml21)，并打开前面使用模板创建的“Azure 机器学习”试验 
* 单击“立即启动预览版”以启动预览版体验 
* 在左窗格中打开“计算” 
* 选择笔记本 VM 上的“Jupyter”链接 
* 根据需要使用 Azure 凭据登录 
* 打开 [**Explore.ipynb**](code/explore.ipynb)
* 按 SHIFT + ENTER 运行所有代码单元

# <a name="demo-2---experiment"></a>演示 2 - 试验

> 💡 在尝试执行此演示之前，必须已完成[设置](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-attendee.md#demo-environment-deployment)。

### <a name="video-demo-with-voice-over-aiml21---demo-2---experimenthttpsyoutubec7p_4cryt8k"></a>带语音的视频演示：[AIML21 - 演示 2 - 试验](https://youtu.be/c7p_4CRYT8k)

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

> 大约需要花费 15-20 分钟时间来完成运行 

* 完成后，检查模型运行的输出，并找到最佳模型

# <a name="demo-3---deploy"></a>演示 3 - 部署

> 💡 在尝试执行此演示之前，必须已完成[设置](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-attendee.md#demo-environment-deployment)。

### <a name="video-demo-with-voice-over-aiml21---demo-3---deployhttpsyoutube7bkbo7nqd4q"></a>带语音的视频演示：[AIML21 - 演示 3 - 部署](https://youtu.be/7bkBO7NQd4Q)

* 在演示 2 结束时
* 在正在运行自动化机器学习试验的屏幕上开始操作 
* 选择“部署最佳模型”按钮 
* 创建部署名称，例如 aiml21-v1
* 根据需要添加部署说明
* 计算类型设置为 ACI（Azure 容器实例）
* 将身份验证保持在启用状态
* 选择“部署”按钮 

>大约需要花费 20-30 分钟时间来完成运行

* 完成后，在左窗格中选择“终结点” 
* 选择 Azure 容器实例模型并查看详细信息
* 选择已打开“Jupyter”的浏览器标签页
* 打开 [**Deploy.ipynb**](code/deploy.ipynb)
* 确认 [config.json](code/config.json) 文件中已填写在设置阶段提供的正确信息
* 编辑第 2 个单元，以包含部署的 Web 服务名称
* 运行笔记本中的所有单元并查看输出

# <a name="demo-4---present"></a>演示 4 - 呈现

> 💡 在尝试执行此演示之前，必须已完成[设置](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-attendee.md#demo-environment-deployment)。

### <a name="video-demo-with-voice-over-aiml21---demo-4---presenthttpsyoutubeg7abac9s9qq"></a>带语音的视频演示：[AIML21 - 演示 4 - 呈现](https://youtu.be/g7aBaC9s9qQ)

* 打开 [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)
* 使用工作区凭据登录
* 在左窗格中单击“工作区”
* 单击“创建工作区”
* 输入工作区名称
* 输入工作区的说明
* 单击“保存”
* 打开 Power BI Desktop 并在其中打开 Present.pbix
* 与数据和视觉对象交互
* 单击“发布”按钮
* 选择刚刚创建的工作区名称
* 等待报表发布完成
* 返回 [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) 
* 根据需要刷新浏览器
* 在 Web 浏览器的左窗格中查看报表
* 单击报表，随即会加载该报表

# <a name="teardown-instructions"></a>清理说明

### <a name="full-teardown"></a>完全清理

* 进入 Azure 门户并删除 Azure 资源组，这样就可以删除此项目的所有资源

### <a name="to-save-costs"></a>节省成本

* 只要不使用笔记本 VM，都请确保在其上选择“关机” 
* 请**删除**终结点中不再使用的 Azure 容器实例

# <a name="resources-and-continued-learning"></a>资源和继续学习

**Microsoft Learn：**
* [探索 Azure 中的数据科学工具](https://docs.microsoft.com/en-us/learn/paths/explore-data-science-tools-in-azure/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Python 简介](https://docs.microsoft.com/en-us/learn/modules/intro-to-python/?WT.mc_id=msignitethetour2019-github-aiml21)
* [使用 Azure 机器学习服务自动选择机器学习模型](https://docs.microsoft.com/en-us/learn/modules/automate-model-selection-with-azure-automl/?WT.mc_id=msignitethetour2019-github-aiml21)
* [通过 Power BI 创建和使用分析报表](https://docs.microsoft.com/en-us/learn/paths/create-use-analytics-reports-power-bi/?WT.mc_id=msignitethetour2019-github-aiml21)

# <a name="feedback-loop"></a>反馈和建议

想要提供意见、反馈、建议？ 目前，针对内容更改/建议/反馈的最佳方法是在此 GitHub 存储库中创建新的 Issue。 若要获取有关如何创建 Issue 的所有详细信息，请参阅[贡献文档](../CONTRIBUTING.md)
