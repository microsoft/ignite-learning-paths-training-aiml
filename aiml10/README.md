# <a name="aiml10-making-sense-of-your-unstructured-data-with-ai"></a>AIML10: AI를 사용하여 비정형 데이터 이해

## <a name="session-abstract"></a>세션 요약

Tailwind Traders에는 개발자가 앱에서 활용할 수 있는 이미지, 양식, PDF 파일 등 다양한 소스의 구조화되거나 비정형의 레거시 데이터가 많습니다. 이 세션에서는 팀이 Cognitive Search를 사용하여 짧은 시간 안에 이 데이터를 이해하고 놀라운 성공을 거둔 비결을 알아보겠습니다. 수집-보강-탐색 패턴, 기술 세트, 인지 기술, 자연어 처리, 컴퓨터 비전 등 수많은 AI 개념을 설명합니다.

## <a name="table-of-content"></a>목차
 

| 리소스          | 링크                            |
|-------------------|----------------------------------|
| PowerPoint        | - [프레젠테이션](presentations.md) |
| 동영상            | - [예행 연습](https://www.youtube.com/watch?v=dm0wDTSso0E) <br/>- [Microsoft Ignite 올랜도 녹화](https://myignite.techcommunity.microsoft.com/sessions/82986?source=sessions) |
| 데모             | - [데모 1 - Azure Cognitive Search ](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo1.md) <br/>- [데모 2 - Form Recognizer 서비스](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo2.md) <br/>- [데모 3 - 사용자 지정 청구서 판독기 기술 만들기](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo3.md)<br/>- [데모 4 - 모든 항목 요약](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo4.md) <br/>- [데모 5 - 지식 저장소](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo5.md) | 


# <a name="overview"></a>개요
이 솔루션에서는 일련의 구조화되지 않은 pdf 청구서를 가져오고, 사용자 지정 Form Recognizer 기술과 함께 Azure Cognitive Search를 사용하여 구조화된 테이블 형식 출력을 생성하는 프로세스를 개발합니다. 

이 솔루션을 만드는 경우 생성되는 몇 가지 Azure 리소스가 있습니다(필요한 경우 평가판은 [여기](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml10)에 있습니다). 다음 표에는 솔루션을 완전히 구현하는 데 필요한 각 리소스, 용도 및 특별 지침이 나와 있습니다. 발표에는 제시된 이름을 사용하지만 특정 솔루션의 경우 이름을 바꿔야할 수 있습니다.

![Azure 리소스](images/resources.png "Azure 리소스")

## <a name="azure-resources"></a>Azure 리소스

| 이름                       | 형식                            | 용도                    |
| -------------------------- | ------------------------------- | ------------------------- |
| **ttcognitivesearch**     | 리소스 그룹                  | 서비스를 함께 그룹화합니다.   |
| **ttinvoicestorage**      | 스토리지 계정                 | 청구서를 저장하는 데 사용     |
| **ttinvoicesearch**       | Search Service                  | 추천 서비스           |
| **ttinvoiceintelligence** | Cognitive Services (올인원) | Search Service에 사용됩니다. |
| **ttinvoicereader**       | Form Recognizer 서비스         | 이 서비스는 최종적으로 올인원 서비스에서 종료됩니다. 지금은 제한된 액세스 미리 보기로 제공됩니다. 미리 보기에 액세스하려면 [Form Recognizer 액세스 요청](https://aka.ms/FormRecognizerRequestAccess) 양식을 작성하여 제출하세요.  |
| **readerskillstorage**   | 스토리지 계정              | Azure 함수에 사용되는 스토리지 |
| **readerskill**          | 함수 앱                 | 인식 기술 앱 |
| **readerskill**          | App Insights                   | 함수 앱에 인사이트를 추가합니다. |
| **EastUS2LinuxDynamicPlan** | App Service 계획                   | 함수 앱을 실행하기 위한 소비 기반 계획입니다. |

# <a name="presentation"></a>프레젠테이션

* [PowerPoint 다운로드](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/aiml10.pptx)
* [Microsoft Ignite 올랜도 세션 동영상](https://myignite.techcommunity.microsoft.com/sessions/82986?source=sessions)


# <a name="demonstrations"></a>데모
이 발표는 5개의 데모로 구성되어 있습니다. 

- **데모 1**: [Azure Cognitive Search](demo1.md)
- **데모 2**: [Form Recognizer 서비스](demo2.md) - 이 데모를 실행하려면 Form Recognizer Preview에 액세스해야 합니다. 미리 보기에 액세스하려면 [Form Recognizer 액세스 요청](https://aka.ms/FormRecognizerRequestAccess) 양식을 작성하여 제출하세요.
- **데모 3**: [사용자 지정 청구서 판독기 기술 만들기](demo3.md)
- **데모 4**: [모든 항목 요약](demo4.md)
- **데모 5**: [지식 저장소](demo5.md)


# <a name="teardown-instructions"></a>해제 지침

### <a name="full-teardown"></a>전체 해제

* Azure Portal에 들어가서 만들었던 **Azure 리소스 그룹**을 삭제하여 이 프로젝트에 대한 모든 리소스를 제거합니다.


# <a name="resources-and-continued-learning"></a>리소스 및 지속적인 학습

**Microsoft Learn:**
* [Azure Search 소개](https://docs.microsoft.com/en-us/learn/modules/intro-to-azure-search/?WT.mc_id=msignitethetour2019-github-aiml10)
* [Microsoft Azure AI(인공 지능) 전략 및 솔루션](https://docs.microsoft.com/en-us/learn/modules/azure-artificial-intelligence/?WT.mc_id=msignitethetour2019-github-aiml10)

**Azure 설명서**
* [Azure Search에서 “Cognitive Search”란?](https://docs.microsoft.com/en-us/azure/search/cognitive-search-concept-intro/?WT.mc_id=msignitethetour2019-github-aiml10)
* [Azure Search의 지식 저장소란?](https://docs.microsoft.com/en-us/azure/search/knowledge-store-concept-intro)


# <a name="feedback-loop"></a>피드백 루프

의견, 피드백, 제안이 있으신가요? 현재 콘텐츠 변경/제안/피드백을 위한 최선의 피드백 루프는 이 GitHub 리포지토리에서 새로운 이슈를 생성하는 것입니다. 이슈 생성 방법에 대한 모든 세부 정보를 보려면 [기여](../CONTRIBUTING.md) 문서를 참조하세요.

## <a name="become-a-trained-presenter"></a>숙련된 발표자 되기

숙련된 발표자가 되려면 [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com)에 문의하세요. 메일에 다음을 포함해야 합니다.

- 전체 이름
- 이 프레젠테이션의 코드: aiml10
- 발표에 사용하는 동영상(최대 10분 길이)(예: 목록에 없는 YouTube 동영상)의 링크. 
  > 이 콘텐츠여야할 필요는 없습니다. 발표자의 발표 기술을 보여주는 것이 중요합니다.

멘토가 프로세스에 대한 정보를 제공해드립니다.

## <a name="trained-presenters"></a>숙련된 발표자

아래의 훌륭한 분들께 감사의 말씀을 전합니다([이모지 키](https://allcontributors.org/docs/en/emoji-key)).

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/sethjuarez">
        <img src="https://avatars2.githubusercontent.com/u/115409?s=460&v=4" width="100px;" alt="Seth Juarez"/><br />
        <sub><b>Seth Juarez</b></sub></a><br />
            <a href="Add link to powerpoint here" title="발표">📢</a>
            <a href="Add link to pull request here" title="문서">📖</a> 
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->