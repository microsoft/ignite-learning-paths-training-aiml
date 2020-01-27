# <a name="aiml20-using-pre-built-ai-to-solve-business-challenges"></a>AIML20：使用预先构建的 AI 解决业务难题

这是为 Microsoft Ignite 2019 和 Microsoft Ignite 的 Tour 2019-2020 讲座“使用预先构建的 AI 解决业务挑战”提供支持的存储库。 可在此处找到讲座中提到的资源的链接，还有重新创建讲座中提到的的演示所需的代码和脚本。

* [AIML20：使用预先构建的 AI 解决业务难题](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-SimplifiedChinese/aiml20)
* [AIML20：Uso da IA pré-criada para resolver desafios de negócios](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-PortugueseBrazil/aiml20)
* [AIML20:事前構築済み AI を使用してビジネスの課題を解決する](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-Japanese/aiml20)

## <a name="session-abstract"></a>讲座摘要

**使用预先构建的 AI 解决业务挑战**

作为一家数据驱动型公司，Tailwind Traders 明白使用人工智能改善业务流程和让客户满意至关重要。
在投资 AI 团队之前，他们现有的开发人员能够使用预先构建的 AI 技术展示一些快速取得成效的案例。 

在本会话中，我们演示如何使用 Azure 认知服务来实现 Tailwind Traders 网站中的“按照片购物”功能，并说明在计算机视觉情况下神经网络的工作原理。 我们还将演示如何自动改编网站布局，以优化匿名用户的参与，这归功于强化学习和个性化体验创建服务。

最后，我们将回顾一下在将 AI 投入生产之前应考虑的成本、数据法规和道德问题。

## <a name="table-of-contents"></a>目录
 

| 资源          | 链接                            |
|-------------------|----------------------------------|
| PowerPoint        | - [演示文稿](presentations.md) |
| 视频            | - [试运行排练](https://youtu.be/jRO-5g-HYuU) <br/>- [Microsoft Ignite 奥兰多记录](https://myignite.techcommunity.microsoft.com/sessions/82987?source=sessions) |
| 演示             | - [演示 1 - 设置 ](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md) <br/>- [演示 2 - 计算机视觉](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Computer%20Vision.md) <br/>- [演示 3 - 自定义视觉](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Custom%20Vision.md)<br/>- [演示 4 - ONNX 部署](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20ONNX%20deployment.md) <br/>- [演示 5 - 个性化体验创建服务](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Personalizer.md) | 

[在此处下载 AIML20 演示的幻灯片](presentations.md)。 （按第一个链接找到最新版本。）这些幻灯片采用 PPT 格式，里面有详细的演讲者备注和内嵌演示视频。

这些资源的短链接：[aka.ms/AIML20repo](https://aka.ms/AIML20repo)。 

也提供[此讲座的讲解者的资源](README-Presenters.md)。



## <a name="technologies-used"></a>使用的技术

* [Azure 认知服务](https://docs.microsoft.com/en-us/azure/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure 命令行界面 (CLI)](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest?WT.mc_id=msignitethetour2019-github-aiml20)
* [ONNX](https://github.com/onnx/onnx)
* [Visual Studio Code](https://code.visualstudio.com/)

## <a name="other-resources-mentioned-in-talk"></a>讲座中提到的其他资源

* 神经网络的工作原理，作者：Brandon Rohrer： http://brohrer.github.io/blog.html
* XKCD“任务”： https://xkcd.com/1425

### <a name="azure-cognitive-services-docs-and-apps"></a>Azure 认知服务文档和应用

* 认知服务计算机视觉：[https://aka.ms/try-computervision](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=ignitetour-talk-davidsmi)  
* 认知服务自定义视觉：[
          https://customvision.ai
          ](https://www.customvision.ai/?WT.mc_id=ignitethetour-github-davidsmi) 上的[文档](https://docs.microsoft.com/en-us/azure/cognitive-services/custom-vision-service/?WT.mc_id=ignitethetour-github-davidsmi)和应用程序
* ONNX 运行时： https://github.com/microsoft/onnxruntime
* 认知服务个性化体验创建服务：[https://aka.ms/personalizer-intro](https://docs.microsoft.com/en-us/azure/cognitive-services/personalizer/?WT.mc_id=msignitethetour2019-github-aiml20)
* 使用个性化体验创建服务强化学习： https://aka.ms/personalizerdemo
* 容器中的认知服务： https://aka.ms/cs-containers

### <a name="cognitive-services-information"></a>认知服务信息

* 认知服务定价： https://aka.ms/cs-pricing 
* 认知服务符合性和隐私： https://aka.ms/az-compliance
* Microsoft 的道德 AI 方法：[https://microsoft.com/AI/our-approach-to-ai](https://www.microsoft.com/AI/our-approach-to-ai?rtc=1&WT.mc_id=msignitethetour2019-github-aiml20)
* Microsoft Learn 中的认知服务培训课程： https://aka.ms/AIML20MSLearnCollection
* 经 Microsoft 认证的 Azure 数据科学家助理： https://aka.ms/DataScientistCert 
* 经 Microsoft 认证的 Azure AI 工程师助理： https://aka.ms/AIEngineerCert

## <a name="demonstrations"></a>演示

请使用以下链接来详细了解如何重新创建讲座中提供的演示。 需要 Azure 订阅才能运行这些演示；如果还没有该订阅，请单击此链接：[为新订户提供的 200 美元免费 Azure 额度](https://aka.ms/azure-free-credits)。

1. [设置](DEMO%20Setup.md)：创建帐户，部署并配置为以下演示提供支持的资源。 请按这些说明操作，然后尝试下面的任意演示。

1. [计算机视觉](DEMO%20Computer%20Vision.md)：通过 Web 应用程序和 Azure CLI 使用认知服务计算机视觉来分析图像。

1. [自定义视觉](DEMO%20Custom%20Vision.md)：创建一个自定义视觉模型，只检测由 Tailwind Traders 销售的产品。

1. [ONNX 部署](DEMO%20ONNX%20deployment.md)：以 ONNX 格式将自定义视觉模型部署到 Tailwind Traders 网站的“按图购买”功能

1. [个性化体验创建服务](DEMO%20Personalizer.md)：以动态方式重新配置 Tailwind Traders 网站“推荐”部分的布局，尽量提高匿名访问者单击“特色”产品的可能性。

## <a name="feedback-loop"></a>反馈和建议

想要提供意见、反馈、建议？ 针对内容更改/建议/反馈的最佳反馈循环是在此 GitHub 存储库中创建新问题。 若要获取有关如何创建 Issue 的所有详细信息，请参阅[贡献文档](../CONTRIBUTING.md)
