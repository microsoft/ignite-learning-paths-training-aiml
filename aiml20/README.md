# <a name="aiml20-using-pre-built-ai-to-solve-business-challenges"></a>AIML20: 미리 빌드된 AI를 사용하여 비즈니스 과제 해결

Microsoft Ignite 2019 및 Microsoft Ignite Tour 2019-2020 대담인 “미리 빌드된 AI를 사용하여 비즈니스 과제 해결”을 지원하는 리포지토리입니다. 여기서는 설명에서 언급한 리소스 링크 및 제공된 데모를 다시 만드는 데 필요한 코드와 스크립트를 찾을 수 있습니다.

* [AIML20：使用预先构建的 AI 解决业务难题](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-SimplifiedChinese/aiml20)
* [AIML20: Uso da IA pré-criada para resolver desafios de negócios](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-PortugueseBrazil/aiml20)
* [AIML20:事前構築済み AI を使用してビジネスの課題を解決する](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-Japanese/aiml20)

## <a name="session-abstract"></a>세션 요약

**미리 빌드된 AI를 사용하여 비즈니스 과제 해결**

데이터 기반 회사인 Tailwind Traders에서는 비즈니스 프로세스 개선과 고객 만족을 위한 인공 지능 사용의 중요성을 잘 알고 있습니다.
AI 팀에 투자하기 전에 Tailwind Traders의 기존 개발자들은 미리 빌드된 AI 기술을 사용하여 몇 가지 단기적 성공을 보여줄 수 있었습니다. 

이 세션에서는 Azure Cognitive Services를 사용하여 Tailwind Traders 웹 사이트의 "Shop by Photo" 기능을 구현하는 방법과 Computer Vision에서의 신경망 기능을 설명합니다. 또한 보충 학습 및 Personalizer 서비스를 통해 웹 사이트 레이아웃이 익명 사용자의 참여를 최적화하도록 자동으로 조정되는 방법을 보여 줍니다.

마지막으로, AI를 프로덕션에 배치하기 전에 고려해야 하는 비용, 데이터 규정 및 윤리적 문제를 검토합니다.

## <a name="table-of-contents"></a>목차
 

| 리소스          | 링크                            |
|-------------------|----------------------------------|
| PowerPoint        | - [프레젠테이션](presentations.md) |
| 동영상            | - [예행 연습](https://youtu.be/jRO-5g-HYuU) <br/>- [Microsoft Ignite 올랜도 녹화](https://myignite.techcommunity.microsoft.com/sessions/82987?source=sessions) |
| 데모             | - [데모 1 - 설정 ](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md) <br/>- [데모 2 - Computer Vision](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Computer%20Vision.md) <br/>- [데모 3 - Custom Vision](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Custom%20Vision.md)<br/>- [데모 4 - ONNX 배포](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20ONNX%20deployment.md) <br/>- [데모 5 - Personalizer](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Personalizer.md) | 

[여기에서 AIML20 프레젠테이션의 슬라이드를 다운로드합니다](presentations.md). (최신 버전의 첫 번째 링크를 사용합니다.) 슬라이드는 PPT 형식이며 자세한 발표자 노트와 포함된 데모 동영상이 있습니다.

이 리소스에 대한 짧은 링크: [aka.ms/AIML20repo](https://aka.ms/AIML20repo) 

[이 설명의 발표자 리소스](README-Presenters.md)도 제공됩니다.



## <a name="technologies-used"></a>사용 기술

* [Azure Cognitive Services](https://docs.microsoft.com/en-us/azure/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure CLI(명령줄 인터페이스)](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest?WT.mc_id=msignitethetour2019-github-aiml20)
* [ONNX](https://github.com/onnx/onnx)
* [Visual Studio Code](https://code.visualstudio.com/)

## <a name="other-resources-mentioned-in-talk"></a>설명에 언급된 기타 리소스

* 신경망 작동 방식(Brandon Rohrer): http://brohrer.github.io/blog.html
* XKCD “작업”: https://xkcd.com/1425

### <a name="azure-cognitive-services-docs-and-apps"></a>Azure Cognitive Services 문서 및 앱

* Cognitive Services Computer Vision: [https://aka.ms/try-computervision](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=ignitetour-talk-davidsmi)  
* Cognitive Services Custom Vision: [설명서](https://docs.microsoft.com/en-us/azure/cognitive-services/custom-vision-service/?WT.mc_id=ignitethetour-github-davidsmi) 및 애플리케이션: [https://customvision.ai](https://www.customvision.ai/?WT.mc_id=ignitethetour-github-davidsmi)
* ONNX 런타임: https://github.com/microsoft/onnxruntime
* Cognitive Services Personalizer: [https://aka.ms/personalizer-intro](https://docs.microsoft.com/en-us/azure/cognitive-services/personalizer/?WT.mc_id=msignitethetour2019-github-aiml20)
* Personalizer를 사용하여 보충 학습: https://aka.ms/personalizerdemo
* 컨테이너에서의 Cognitive Services: https://aka.ms/cs-containers

### <a name="cognitive-services-information"></a>Cognitive Services 정보

* Cognitive Services 가격: https://aka.ms/cs-pricing 
* Cognitive Services 규정 준수 및 개인 정보: https://aka.ms/az-compliance
* 윤리적 AI에 대한 Microsoft의 접근 방식: [https://microsoft.com/AI/our-approach-to-ai](https://www.microsoft.com/AI/our-approach-to-ai?rtc=1&WT.mc_id=msignitethetour2019-github-aiml20)
* Microsoft Learn의 Cognitive Services 학습 과정: https://aka.ms/AIML20MSLearnCollection
* Microsoft Certified Azure 데이터 과학자 협회: https://aka.ms/DataScientistCert 
* Microsoft Certified Azure AI 엔지니어 협회 https://aka.ms/AIEngineerCert

## <a name="demonstrations"></a>데모

설명에 제공된 데모를 다시 만드는 방법에 관한 자세한 내용은 아래 링크를 참조하세요. 이러한 데모를 실행하려면 Azure Subscription이 필요합니다. 아직 계정이 없는 경우 [새 구독자를 위한 200 달러의 무료 Azure 크레딧](https://aka.ms/azure-free-credits) 링크가 있습니다.

1. [설정](DEMO%20Setup.md): 계정을 만들고 아래 데모를 지원할 리소스를 배포 및 구성합니다. 아래 데모를 사용해보기 전에 다음 지침을 따르세요.

1. [Computer Vision](DEMO%20Computer%20Vision.md): Cognitive Services Computer Vision을 사용하여 웹 애플리케이션 및 Azure CLI를 통해 이미지를 분석할 수 있습니다.

1. [Custom Vision](DEMO%20Custom%20Vision.md): Tailwind Traders에서 판매되는 제품만 검색하는 Custom Vision 모델을 만듭니다.

1. [ONNX 배포](DEMO%20ONNX%20deployment.md): ONNX 형식의 Custom Vision 모델을 Tailwind Traders 웹 사이트의 “Shop by Phot” 기능에 배포

1. [Personalizer](DEMO%20Personalizer.md): Tailwind Traders 웹 사이트의 “권장” 섹션에서 레이아웃을 동적으로 다시 구성하여 익명 방문자가 “추천” 제품을 클릭할 가능성을 최적화합니다.

## <a name="feedback-loop"></a>피드백 루프

의견, 피드백, 제안이 있으신가요? 콘텐츠 변경/제안/피드백을 위한 최상의 피드백 루프는 이 GitHub 리포지토리에서 새로운 이슈를 생성하는 것입니다. 이슈 생성 방법에 대한 모든 세부 정보를 보려면 [기여](../CONTRIBUTING.md) 문서를 참조하세요.
