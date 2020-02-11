# AIML20: Using Pre-Built AI to Solve Business Challenges

This is the repository supporting the Microsoft Ignite 2019 and Microsoft Ignite
the Tour 2019-2020 talk, "Using Pre-Built AI to Solve Business Challenges". Here
you will find links to the resources mentioned in the talk, and the code and
scripts you will need to recreate the demos given in the talk.

* [AIML20：使用预先构建的 AI 解决业务难题](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-SimplifiedChinese/aiml20)
* [AIML20：使用預先建立的 AI 解決商務挑戰](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-TraditionalChinese/aiml20)
* [AIML20: Uso da IA pré-criada para resolver desafios de negócios](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-PortugueseBrazil/aiml20)
* [AIML20: Uso de inteligencia artificial pregenerada para superar desafíos empresariales](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-Spanish/aiml20)
* [AIML20:事前構築済み AI を使用してビジネスの課題を解決する](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-Japanese/aiml20)
* [AIML20: 미리 빌드된 AI를 사용하여 비즈니스 과제 해결](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-Korean/aiml20)

## Session Abstract

**Using Pre-Built AI to Solve Business Challenges**

As a data-driven company, Tailwind Traders understands the importance of using
artificial intelligence to improve business processes and delight customers.
Before investing in an AI team, their existing developers were able to
demonstrate some quick wins using pre-built AI technologies. 

In this session, we show how you can use Azure Cognitive Services to implement
the "Shop by Photo" feature in the Tailwind Traders website, and explain the
workings of the neural networks behind computer vision. We will also show how
the website layout automatically adapts to optimize engagement of anonymous
users thanks to reinforcement learning and the Personalizer service.

Finally, we'll review the cost, data regulation, and ethical concerns you should
think about before putting AI into production.

## Table of Contents
 

| Resources          | Links                            |
|-------------------|----------------------------------|
| PowerPoint        | - [Presentation](presentations.md) |
| Videos            | - [Dry Run Rehearsal](https://youtu.be/jRO-5g-HYuU) <br/>- [Microsoft Ignite Orlando Recording](https://myignite.techcommunity.microsoft.com/sessions/82987?source=sessions) |
| Demos             | - [Demo 1 - Setup ](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md) <br/>- [Demo 2 - Computer Vision](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Computer%20Vision.md) <br/>- [Demo 3 - Custom Vision](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Custom%20Vision.md)<br/>- [Demo 4 - ONNX Deployment](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20ONNX%20deployment.md) <br/>- [Demo 5 - Personalizer](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Personalizer.md) | 

[Download the slides for the AIML20 presentation here](presentations.md). (Use
the first link for the latest version.) The slides are in PPT format and include
detailed speaker notes and embedded demo videos.

Short-link to these resources: [aka.ms/AIML20repo](https://aka.ms/AIML20repo). 

[Resources for presenters of this talk](README-Presenters.md) are also provided.



## Technologies used

* [Azure Cognitive Services](https://docs.microsoft.com/en-us/azure/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure Command Line Interface (CLI)](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest?WT.mc_id=msignitethetour2019-github-aiml20)
* [ONNX](https://github.com/onnx/onnx)
* [Visual Studio Code](https://code.visualstudio.com/)

## Other resources mentioned in talk

* How Neural Networks Work, by Brandon Rohrer: http://brohrer.github.io/blog.html
* XKCD "Tasks": https://xkcd.com/1425

### Azure Cognitive Services docs and apps

* Cognitive Services Computer Vision: [https://aka.ms/try-computervision](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=ignitetour-talk-davidsmi)  
* Cognitive Services Custom Vision: [Documentation](https://docs.microsoft.com/en-us/azure/cognitive-services/custom-vision-service/?WT.mc_id=ignitethetour-github-davidsmi) and application at [https://customvision.ai](https://www.customvision.ai/?WT.mc_id=ignitethetour-github-davidsmi)
* ONNX Runtime: https://github.com/microsoft/onnxruntime
* Cognitive Services Personalizer: [https://aka.ms/personalizer-intro](https://docs.microsoft.com/en-us/azure/cognitive-services/personalizer/?WT.mc_id=msignitethetour2019-github-aiml20)
* Reinforcement Learning with Personalizer: https://aka.ms/personalizerdemo
* Cognitive Services in containers: https://aka.ms/cs-containers

### Cognitive Services information

* Cognitive Services pricing: https://aka.ms/cs-pricing 
* Cognitive Services compliance and privacy: https://aka.ms/az-compliance
* Microsoft's approach to ethical AI: [https://microsoft.com/AI/our-approach-to-ai](https://www.microsoft.com/AI/our-approach-to-ai?rtc=1&WT.mc_id=msignitethetour2019-github-aiml20)
* Cognitive Services training courses in Microsoft Learn: https://aka.ms/AIML20MSLearnCollection
* Microsoft Certified Azure Data Scientist Associate: https://aka.ms/DataScientistCert 
* Microsoft Certified Azure AI Engineer Associate https://aka.ms/AIEngineerCert

## Demonstrations

Follow the links below for details on how to recreate the demos given in the
talk. You will need an Azure Subscription to run these demos; if you don't have
one yet, here is a link for [$200 Free Azure Credits for new
subscribers](https://aka.ms/azure-free-credits).

1. [Setup](DEMO%20Setup.md): Create accounts and deploy and configure resources
   to support the demos below. Follow these instructions before attempting any
   of the demos below.

1. [Computer Vision](DEMO%20Computer%20Vision.md): Use Cognitive Services
   Computer Vision to analyze an image, via a web application and via the Azure
   CLI.

1. [Custom Vision](DEMO%20Custom%20Vision.md): Create a custom vision model to
   detect only products sold by Tailwind Traders.

1. [ONNX Deployment](DEMO%20ONNX%20deployment.md): Deploy a custom vision model in
   the ONNX format to the Tailwind Traders website "Shop by Photo feature

1. [Personalizer](DEMO%20Personalizer.md): Dynamically reconfigure the layout of
   the "Recommended" section of the Tailwind Traders website, to optimize
   likelihood of an anonymous visitor clicking on the "featured" product.

## Feedback Loop

Do you have a comment, feedback, suggestion? The best feedback loop for content changes/suggestions/feedback is to create a new issue on this GitHub repository. To get all the details about how to create an issue please refer to the [Contributing docs](../CONTRIBUTING.md)
