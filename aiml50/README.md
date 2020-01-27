# <a name="machine-learning-operations--applying-devops-to-data-science"></a>机器学习操作 - 将 DevOps 应用到数据科学

## <a name="session-abstract"></a>本节摘要

虽然许多公司已采用 DevOps 做法来改进其软件交付，但很少有人将这些技术应用于机器学习项目。 开发人员和数据科学家之间的协作受到限制，通常无法以一致且可靠的方法将模型部署到生产环境。

在本节中，你将了解如何使用 Azure DevOps 和 Azure 机器学习服务将 DevOps 做法应用于机器学习项目。 我们将设置对版本控制模型的自动化训练、评分和存储，并将模型打包在 Docker 容器中，然后将其部署到 Azure 容器实例和 Azure Kubernetes 服务。 我们甚至会收集有关模型行为的持续反馈，以便了解何时重新训练。

* [机器学习操作 - 将 DevOps 应用到数据科学](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-SimplifiedChinese/aiml50)

## <a name="table-of-content"></a>目录
 

| 资源          | 链接                            |
|-------------------|----------------------------------|
| PowerPoint        | - [演示文稿](presentations.md) |
| 视频            | - [进行排练](https://youtu.be/UgM8_4fAni8) <br/>- [Microsoft Ignite 奥兰多录制内容](https://myignite.techcommunity.microsoft.com/sessions/83003) |
| 演示             | - [演示 1 - 展示错误的预测并进行更改](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/demos/1-Show_Faulty_Prediction.md) <br/>- [演示 2 - 使用 Jupyter Notebook 生成管道](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/demos/2-Build_a_Pipeline_With_Notebooks.md) <br/>- [演示 3 - 展示进行中的生成](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/demos/3-Show_The_Build.md) <br/>- [演示 4 - 展示发布过程](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/demos/4-Show_The_Release.md)|

## <a name="how-to-use"></a>使用方式

欢迎你，讲师！

欢迎使用此演示文稿，期待你精彩呈现其中的优秀内容。 我们知道你拥有丰富的讲演经验和卓越的讲演技巧，因此本指南将重点介绍需要演示的内容。 它将完整地介绍由演示文稿设计团队创建的演示文稿。

除演示文稿的视频外，本文档还将链接到成功讲演所需的所有资料，包括 PowerPoint 幻灯片、演示说明和代码。

1. 阅读完整的文档。
2. 观看视频演示
3. 向首席讲师提问

## <a name="assets-in-train-the-trainer-kit"></a>讲师培训工具包中的资产

- 本指南
- PowerPoint 演示文稿，包含[此处](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/aiml50.pptx)或 [presentations.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/presentations.md) 中的的每个幻灯片的备注
  - [导出的演讲者备注](./SpeakerNotes.md)
- 可在[此处](https://myignite.techcommunity.microsoft.com/sessions/83003)查看 Microsoft Ignite 2019 年奥兰多大会上的研讨会
- 可在[此处](https://youtu.be/UgM8_4fAni8)查看完整的演示记录
- 可直接播放的实际操作演示独立录像
  - [演示 #1](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_1.mp4)
  - [演示 #2](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_2.mp4)
  - [演示 #3](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_3.mp4)
  - [演示 #4](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_4.mp4)
- 演示指南
  - [设置](./DEMO.md)和[视频演练](https://youtu.be/C9WtOZaUoyA)
  - [演示 #1](./demos/1-Show_Faulty_Prediction.md)
  - [演示 #2](./demos/2-Build_a_Pipeline_With_Notebooks.md)
  - [演示 #3](./demos/3-Show_The_Build.md)
  - [演示 #4](./demos/4-Show_The_Release.md)

## <a name="become-a-trained-presenter"></a>成为经培训的讲师

若要成为经培训的讲师，请联系 [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com)。 在电子邮件中，请提供：

- 你的全名：
- 此演示文稿的代码：AIML50
- 你的讲演视频（约 10 分钟）的链接（例如未加入播放单的 YouTube 视频）。

> 不一定要提供这项内容，重要的是展示你的讲师技能

## <a name="trained-presenters"></a>经训练的讲师

感谢以下优秀参与者（[表情符号密钥](https://allcontributors.org/docs/en/emoji-key)）：

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/Damovisa">
        <img src="https://avatars2.githubusercontent.com/u/1887732?s=460&v=4" width="100px;" alt="Damian Brady"/><br />
        <sub><b>Damian Brady</b></sub></a><br />
        <a href="" title="讲课">📢</a>
    </td>
    <td align="center"><a href="https://github.com/smurawski">
        <img src="https://avatars1.githubusercontent.com/u/4006985?s=460&v=4" width="100px;" alt="Steven Murawski"/><br />
        <sub><b>Steven Murawski</b></sub></a><br />
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/pull/9" title="文档">📖</a>
    </td>
    <td align="center"><a href="https://github.com/sethjuarez">
        <img src="https://avatars2.githubusercontent.com/u/115409?s=460&v=4" width="100px;" alt="Seth Juarez"/><br />
        <sub><b>Seth Juarez</b></sub></a><br />
            <a href="Add link to powerpoint here" title="讲座">📢</a>
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->
