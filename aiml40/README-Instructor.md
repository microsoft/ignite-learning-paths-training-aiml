# <a name="aiml40---taking-models-to-the-next-level-with-azure-machine-learning-best-practices"></a>AIML40 - Azure Machine Learning 모범 사례를 사용하여 모델 개선

## <a name="session-abstract"></a>세션 요약

인공 지능 및 기계 학습은 다양한 방식으로 비즈니스 프로세스의 생산성을 높이고, 구조화되지 않은 데이터 흐름 내에서 이미지, 텍스트 및 추세를 분석하여 의미 있는 인사이트를 수집할 수 있습니다. 기존 모델을 사용하여 많은 작업을 해결할 수 있지만 경우에 따라 더 구체적인 작업이나 정확도를 높이기 위해 고유한 모델을 학습시켜야 합니다. 

이 세션에서는 텍스트 분석 지능형 서비스를 [Tailwind Traders](http://tailwindtraders.com)의 비즈니스 프로세스에 통합하는 전체 경로를 살펴보겠습니다. [Cognitive Services](https://azure.microsoft.com/services/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml40)로 제공되는 미리 빌드된 모델에서 시작하여 [Azure Machine Learning Service](https://azure.microsoft.com/services/machine-learning-service/?wt.mc_id=msignitethetour2019-github-aiml40)를 사용해 [Intel NLP Architect](http://nlp_architect.nervanasys.com/)의 일부로 제공되는 [측면 기반 감정 분석](https://www.intel.ai/introducing-aspect-based-sentiment-analysis-in-nlp-architect/)에 대한 타사 신경망 사용자 지정 모델까지 학습합니다. 사용자 지정 모델이 필요한 경우를 설명하고, [AutoML](https://docs.microsoft.com/azure/machine-learning/service/concept-automated-ml/?wt.mc_id=msignitethetour2019-github-aiml40)을 사용하여 이러한 모델을 처음부터 만드는 빠른 방법을 보여주며 [HyperDrive](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-tune-hyperparameters/?wt.mc_id=msignitethetour2019-github-aiml40)를 사용하여 모델 하이퍼 매개 변수를 세밀하게 조정하는 방법을 알려드립니다.

## <a name="how-to-use"></a>사용 방법

환영합니다. 발표자 여러분! 

참여해 주셔서 감사드리며 이 놀라운 콘텐츠를 제공하게 되어 기쁘게 생각합니다. 숙련된 발표자로서 프레젠테이션하는 ‘방법’은 알고 계실 것이므로 이 가이드에서는 프레젠테이션해야 하는 ‘내용’에 초점을 맞추겠습니다.   프레젠테이션 디자인 팀에서 만든 전체 실행 프레젠테이션을 제공합니다. 

프레젠테이션 동영상과 함께 본 문서는 PowerPoint 슬라이드 및 데모 지침과 코드를 포함하여 성공적으로 프레젠테이션하는 데 필요한 모든 자산에 연결됩니다.

1.  문서 전체를 읽습니다.
2.  동영상 프레젠테이션을 시청합니다.
3.  리드 발표자에 대해 질문합니다.

## <a name="assets-in-train-the-trainer-kit"></a>강사 키트 학습의 자산

- 이 가이드
- 각 슬라이드에 대한 메모를 포함하는 PowerPoint 프레젠테이션은 [여기](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml40/aiml40.pptx) 또는 [presentations.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/presentations.md)에 있습니다.
- 프레젠테이션의 전체 녹화는 [여기](https://youtu.be/If9IQm3gWVQ)에서 제공됩니다.
- 발표 준비가 완료된 실습 데모의 개별 녹화는 다음과 같습니다.
    * 데모 1 - [Cognitive Services Text Analytics](https://youtu.be/QJxjm5BirOA)
    * 데모 2 - [자동화된 Machine Learning](https://youtu.be/qrstXN6TLZk)
    * 데모 3 - [Azure Machine Learning SDK 및 Hyperdrive](https://youtu.be/sccNTPO3PwU)
- 데모 가이드 [여기](Demo.md)

## <a name="become-a-trained-presenter"></a>숙련된 발표자 되기

*숙련된 발표자*가 되려면 [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com)에 문의하세요. 메일에 다음을 포함해야 합니다.

- 전체 이름:
- 이 프레젠테이션의 코드: \<세션 코드(예: aiml40)\>
- 프레젠테이션하는 동영상(10분) 링크(예: 목록에 없는 YouTube 동영상). 

> 이 콘텐츠여야할 필요는 없습니다. 발표자의 발표 기술을 보여주는 것이 중요합니다.


## <a name="trained-presenters"></a>숙련된 발표자

아래의 훌륭한 분들께 감사의 말씀을 전합니다([이모지 키](https://allcontributors.org/docs/en/emoji-key)).

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/aribornstein">
        <img src="https://avatars3.githubusercontent.com/u/3045407?s=460&v=4" width="100px;" alt="Ari Bornstein"/><br />
        <sub><b>Ari Bornstein</b></sub></a><br />
            <a href="" title="발표">📢</a>
    </td>
    <td align="center"><a href="https://github.com/shwars">
        <img src="https://avatars0.githubusercontent.com/u/2892110?s=460&v=4" width="100px;" alt="Dmitri Soshnikov"/><br />
        <sub><b>Dmitri Soshnikov</b></sub></a><br />
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/pull/4" title="설명서">📖</a> 
    </td>
        <td align="center"><a href="https://github.com/amynic">
        <img src="https://avatars3.githubusercontent.com/u/13828867?s=400&u=f6aca8528d65d6c191114d3a7328b46137eda162&v=4" width="100px;" alt="Amy Boyd"/><br />
        <sub><b>Amy Boyd</b></sub></a><br />
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml30/presentations.md" title="발표">📢</a>
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->
