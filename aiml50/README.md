# <a name="machine-learning-operations--applying-devops-to-data-science"></a>기계 학습 작업: 데이터 과학에 DevOps 적용

## <a name="session-abstract"></a>세션 요약

많은 회사가 소프트웨어 제공 개선을 위해 DevOps 방식을 채택했지만 기계 학습 프로젝트에는 이와 동일한 기술이 거의 적용되지 않습니다. 그 결과, 개발자와 데이터 과학자의 협업이 제한될 수 있고, 일관되고 신뢰할 수 있는 방법으로 모델을 프로덕션에 배포하는 것이 이뤄질 수 없는 꿈으로 그치는 경우가 많습니다.

이 세션에서는 Azure DevOps와 Azure Machine Learning Service를 사용하여 기계 학습 프로젝트에 DevOps 방식을 적용하는 방법을 알아봅니다. 버전이 있는 모델의 자동화된 학습, 채점, 스토리지를 설정하고, Docker 컨테이너로 모델을 래핑하여 Azure Container Instances 또는 Azure Kubernetes Service에 배포합니다. 나아가 재학습할 시기를 알 수 있도록 모델 동작에 대한 지속적인 피드백도 수집합니다.

* [机器学习操作 - 将 DevOps 应用到数据科学](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-SimplifiedChinese/aiml50)

## <a name="table-of-content"></a>목차
 

| 리소스          | 링크                            |
|-------------------|----------------------------------|
| PowerPoint        | - [프레젠테이션](presentations.md) |
| 동영상            | - [예행 연습](https://youtu.be/UgM8_4fAni8) <br/>- [Microsoft Ignite 올랜도 녹화](https://myignite.techcommunity.microsoft.com/sessions/83003) |
| 데모             | - [데모 1 - 잘못된 예측 표시 및 변경](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/demos/1-Show_Faulty_Prediction.md) <br/>- [데모 2 - Jupyter Notebooks를 사용하여 파이프라인 빌드](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/demos/2-Build_a_Pipeline_With_Notebooks.md) <br/>- [데모 3 - 진행 중인 빌드 표시](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/demos/3-Show_The_Build.md) <br/>- [데모 4 - 릴리스 프로세스 표시](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/demos/4-Show_The_Release.md)|

## <a name="how-to-use"></a>사용 방법

환영합니다. 발표자 여러분!

참여해 주셔서 감사드리며 이 놀라운 콘텐츠를 제공하게 되어 기쁘게 생각합니다. 숙련된 발표자로서 프레젠테이션하는 방법은 알고 계실 것이므로 이 가이드에서는 프레젠테이션해야 하는 내용에 초점을 맞추겠습니다. 프레젠테이션 디자인 팀에서 만든 전체 실행 프레젠테이션을 제공합니다.

프레젠테이션 동영상과 함께 본 문서는 PowerPoint 슬라이드 및 데모 지침과 코드를 포함하여 성공적으로 프레젠테이션하는 데 필요한 모든 자산에 연결됩니다.

1. 문서 전체를 읽습니다.
2. 동영상 프레젠테이션을 시청합니다.
3. 리드 발표자에 대해 질문합니다.

## <a name="assets-in-train-the-trainer-kit"></a>강사 키트 학습의 자산

- 이 가이드
- 각 슬라이드에 대한 메모를 포함하는 PowerPoint 프레젠테이션은 [여기](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/aiml50.pptx) 또는 [presentations.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/presentations.md)에 있습니다.
  - [내보낸 발표자 노트](./SpeakerNotes.md)
- Microsoft Ignite 2019 올랜도 세션[여기](https://myignite.techcommunity.microsoft.com/sessions/83003)
- 프레젠테이션의 전체 녹화는 [여기](https://youtu.be/UgM8_4fAni8)에서 제공됩니다.
- 발표 준비가 완료된 실습 데모의 개별 녹화는 다음과 같습니다.
  - [데모 #1](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_1.mp4)
  - [데모 #2](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_2.mp4)
  - [데모 #3](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_3.mp4)
  - [데모 #4](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_4.mp4)
- 데모 가이드
  - [설정](./DEMO.md) 및 [연습 동영상](https://youtu.be/C9WtOZaUoyA)
  - [데모 #1](./demos/1-Show_Faulty_Prediction.md)
  - [데모 #2](./demos/2-Build_a_Pipeline_With_Notebooks.md)
  - [데모 #3](./demos/3-Show_The_Build.md)
  - [데모 #4](./demos/4-Show_The_Release.md)

## <a name="become-a-trained-presenter"></a>숙련된 발표자 되기

*숙련된 발표자*가 되려면 [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com)에 문의하세요. 메일에 다음을 포함해야 합니다.

- 전체 이름:
- 이 프레젠테이션의 코드: AIML50
- 프레젠테이션하는 동영상(10분) 링크(예: 목록에 없는 YouTube 동영상).

> 해당 동영상은 이 콘텐츠를 포함할 필요가 없으며 발표자 기술을 보여주는 것이 중요합니다.

## <a name="trained-presenters"></a>숙련된 발표자

아래의 훌륭한 분들께 감사의 말씀을 전합니다([이모지 키](https://allcontributors.org/docs/en/emoji-key)).

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/Damovisa">
        <img src="https://avatars2.githubusercontent.com/u/1887732?s=460&v=4" width="100px;" alt="Damian Brady"/><br />
        <sub><b>Damian Brady</b></sub></a><br />
        <a href="" title="발표">📢</a>
    </td>
    <td align="center"><a href="https://github.com/smurawski">
        <img src="https://avatars1.githubusercontent.com/u/4006985?s=460&v=4" width="100px;" alt="Steven Murawski"/><br />
        <sub><b>Steven Murawski</b></sub></a><br />
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/pull/9" title="설명서">📖</a>
    </td>
    <td align="center"><a href="https://github.com/sethjuarez">
        <img src="https://avatars2.githubusercontent.com/u/115409?s=460&v=4" width="100px;" alt="Seth Juarez"/><br />
        <sub><b>Seth Juarez</b></sub></a><br />
            <a href="Add link to powerpoint here" title="발표">📢</a>
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->
