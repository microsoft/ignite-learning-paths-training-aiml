# AIML20: Using Pre-Built AI to Solve Business Challenges

This is the repository supporting the Microsoft Ignite 2019 and Microsoft Ignite
the Tour 2019-2020 talk, "Using Pre-Built AI to Solve Business Challenges". Here
you will find links to the resources mentioned in the talk, and the code and
scripts you will need to recreate the demos given in the talk.

Short-link to these resources: [aka.ms/AIML20repo](https://aka.ms/AIML20repo). [Resources for presenters of this talk](#Notes-for-Presenters) are also provided.

## Feedback Loop

Do you have a comment, feedback, suggestion? The best feedback loop for content changes/suggestions/feedback is to create a new issue on this GitHub repository. To get all the details about how to create an issue please refer to the [Contributing docs](https://github.com/microsoft/ignite-learning-paths/blob/master/contributing.md)

## Session Abstract

**Using Pre-Built AI to Solve Business Challenges**

Abstract: As a data-driven company, Tailwind Traders understands the importance of using Artificial Intelligence to improve business processes and delight customers. Before investing in an AI team, their existing developers were able to demonstrate some quick wins using pre-built AI technologies. In this session, we will show how you can use Azure Cognitive Services to extract insights from retail data. We’ll go into the neural networks behind computer vision, and show how you can augment the pre-built AI with your own images for custom image recognition applications.

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

* Cognitve Services pricing: https://aka.ms/cs-pricing 
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

# Notes for Presenters

Welcome, Presenter! 

We're glad you are here and look forward to your delivery of this amazing
content. As an experienced presenter, we know you know HOW to present so this
guide will focus on WHAT you need to present. It will provide you a full
run-through of the presentation created by the presentation design team. 

Along with the video of the presentation, this document will link to all the
assets you need to successfully present including PowerPoint slides and demo
instructions & code.

1.  Read document in its entirety.
2.  Watch the video presentation
3.  Ask questions of the Lead Presenter

## Assets in Train-The-Trainer kit

- This guide
- [PowerPoint presentation](presentations.md). Includes embedded demo videos and complete talk track in notes.
- [Speaker notes](speaker-notes.md) as a single file (also in PPT notes)
- [Demo Instructions](#Demonstrations) and [Demo notes for presenters](demo-instructions.md)
- [Full-length recording of presentation](https://youtu.be/jRO-5g-HYuU) 

## Become a Trained Presenter

To become a trained presenter, contact [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com). In your email please include:

- Complete name:
- The code of this presentation: AIML20
- Link (ex: unlisted YouTube video) to a video of you presenting (~10 minutes). 
  > It doesn't need to be this content, the important is to show your presenter skills

A mentor will get back to you with the information on the process.

## Trained Presenters

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="">
        <img src="https://avatars0.githubusercontent.com/u/152948?s=460&v=4" width="100px;" alt="David Smith"/><br />
        <sub><b>David Smith</b></sub></a><br />
            <a href="https://github.com/microsoft/ignite-learning-paths/commits?author=revodavid" title="talk">📢</a>
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/commits?author=revodavid" title="Documentation">📖</a> 
    </td>
    <td align="center"><a href="">
        <img src="https://avatars2.githubusercontent.com/u/4598064?s=460&v=4" width="100px;" alt="Chris Noring"/><br />
        <sub><b>Chris Noring</b></sub></a><br />
            <a href="https://github.com/neilpeterson/ignite-tour-fy20/commits?author=neilpeterson" title="talk">🎨</a>
            <a href="https://github.com/neilpeterson/ignite-tour-fy20/commits?author=neilpeterson" title="design">📖</a> 
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->