# <a name="aiml21-developers-guide-to-ai-a-data-story"></a>AIML21: AI 개발자 가이드: 데이터 스토리 

## <a name="train-the-trainer-guide"></a>학습 - 강사 가이드

### <a name="session-abstract"></a>세션 요약

이 극장식 세션에서는 데이터 과학 프로세스와 이를 적용하는 방법을 살펴봅니다. 데이터 세트 탐색부터 서비스 배포까지 모든 것이 흥미로운 데이터 스토리에 적용됩니다. 이를 통해 Azure AI 플랫폼을 간단히 둘러볼 수도 있습니다.

# <a name="how-to-use"></a>사용 방법

### <a name="welcome-presenter"></a>환영합니다. 발표자 여러분!

참여해 주셔서 감사드리며 이 놀라운 콘텐츠를 제공하게 되어 기쁘게 생각합니다. 숙련된 발표자로서 프레젠테이션하는 ‘방법’은 알고 계실 것이므로 이 가이드에서는 프레젠테이션해야 하는 ‘내용’에 초점을 맞추겠습니다. **** **** 프레젠테이션 디자인 팀에서 만든 전체 실행 프레젠테이션을 제공합니다.

프레젠테이션 동영상과 함께 본 문서는 PowerPoint 슬라이드 및 데모 지침과 코드를 포함하여 성공적으로 프레젠테이션하는 데 필요한 모든 자산에 연결됩니다.

* 문서 전체를 읽습니다.
* 동영상 프레젠테이션을 시청합니다.
* 리드 발표자에 대해 질문합니다.

# <a name="assets-in-train-the-trainer-kit"></a>강사 키트 학습의 자산

* 이 가이드
* [PowerPoint 프레젠테이션](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/presentations.md)
* [프레젠테이션의 전체 녹화](https://youtu.be/K8upKkvtEI0)
* [사용된 데이터 세트](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/data)
* [실행할 코드 파일](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/code)
* 별도 데모 동영상: 
    * 데모 1 - [탐색](https://youtu.be/-z6nfyq-WrI)
    * 데모 2 - [실험](https://youtu.be/c7p_4CRYT8k)
    * 데모 3 - [배포](https://youtu.be/7bkBO7NQd4Q)
    * 데모 4 - [표시](https://youtu.be/g7aBaC9s9qQ)
* 데모 지침

# <a name="demo-instructions"></a>데모 지침:

시작하려면 이 리포지토리의 모든 코드와 데이터 파일을 다운로드하세요. 모든 데모를 실행하는 데 필요한 모든 정보를 포함한 코드 및 데이터 폴더가 있습니다.

**필요한 항목은 다음과 같습니다.**
* Azure 구독 - 필요한 경우 [여기에서 평가판](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml21)을 받으세요.
* [Power BI Desktop (Windows만 해당)](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=msignitethetour2019-github-aiml21) - MacOS/Linux에서 실행하는 경우 최신 웹 브라우저에서 기능을 계속 데모할 수 있습니다.

**설정 지침:**
* 아래의 **Azure에 배포 단추**를 사용해 Azure Machine Learning 작업 영역을 만들어 세션 내내 사용할 수 있습니다.

[![Azure에 배포](https://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

* Azure Portal 및 Azure Machine Learning Service에 로그인
* 작업 영역을 **Enterprise Edition(미리 보기)** 로 업그레이드하도록 선택합니다. [여기에서 현재 가격 책정에 대해 자세히 알아보세요.](https://azure.microsoft.com/en-us/pricing/details/machine-learning/) 실험 데모를 완료하려면 Enterprise Edition(데모 2)이 필요합니다.
* **미리 보기 UI**를 시작합니다.
* **Notebook VM**을 만듭니다.
    * 왼쪽 창에서 '컴퓨팅'을 선택합니다.
    * 'Notebook VM'에서 '새로 만들기'를 선택합니다.
    * 'Notebook VM 이름'(모두 소문자)을 제공합니다.
    * 제공된 기본 크기 VM을 유지합니다.
    * 만든 후에 ' Jupyter 링크'를 선택합니다.
    * 사용자 폴더를 두 번 클릭하여 입력합니다.
    * [업로드] 단추를 선택하고 아래에 나열된 파일을 업로드합니다.
        * [data/data_train.csv](data/data_train.csv)
        * [code/explore.ipynb](code/explore.ipynb)
        * [code/deploy.ipynb](code/deploy.ipynb)
        * [code/config.json](code/config.json)
    * [config.json](code/config.json)을 열고 구독 키, 리소스 그룹 및 Azure ML 작업 영역 이름을 입력한 후 파일을 저장합니다.

>[여기에서 Notebook VM](https://azure.microsoft.com/en-us/blog/three-things-to-know-about-azure-machine-learning-notebook-vm/?WT.mc_id=msignitethetour2019-github-aiml21)에 대해 자세히 알아보세요.

* **컴퓨팅 인스턴스**를 만듭니다.
    * 왼쪽 창에서 '컴퓨팅'을 선택합니다.
    * '학습 클러스터' 탭에서 '새로 만들기'를 선택합니다.
    * '컴퓨팅 이름'(모두 소문자)을 제공합니다.
    * VM 크기를 선택합니다.
        * 표준 컴퓨팅의 경우 'Standard_DS2_v2'와 같은 항목을 선택합니다.
        * GPU 컴퓨팅의 경우 'Standard_NC6'을 선택합니다.
    * 가상 머신 우선 순위에 대해 ' 낮은 우선 순위'를 선택합니다.
    * 최소 노드 개수를 0으로 설정합니다(그러면 완전히 축소되고 비용이 절감됨).
    * 3~6 중 최대 노드를 설정합니다.
    * '만들기'를 클릭합니다.

>[여기에서 Azure Machine Learning 컴퓨팅](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-set-up-training-targets#amlcompute/?WT.mc_id=msignitethetour2019-github-aiml21)에 대해 자세히 알아봅니다.

* **데이터 세트**를 업로드합니다.
    * 왼쪽 창에서 '데이터 세트'를 선택합니다.
    * '데이터 세트 만들기', '로컬 파일에서'를 차례로 선택합니다.
    * '찾아보기' 단추를 선택하고 data_train_experiment.csv 파일을 찾습니다.
    * '다음'을 선택합니다.
    * 데이터를 검토하고 '다음'을 선택한 후 '다음 '을 다시 선택합니다.
    * 마지막으로 데이터 세트 설정을 검토하고 '만들기'를 선택합니다.

>[여기에서 데이터 세트 만들기](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-create-register-datasets/?WT.mc_id=msignitethetour2019-github-aiml21)에 대해 자세히 알아보세요.

* **Power BI 작업 영역** 만들기
    * [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)을 엽니다.
    * 작업 영역 자격 증명으로 로그인합니다.
    * 왼쪽 창에서 작업 영역을 클릭합니다.
    * [작업 영역 만들기]를 클릭합니다.
    * 작업 영역 이름을 입력합니다.
    * 작업 영역에 대한 설명을 입력합니다.
    * [저장]을 클릭합니다.
* **Power BI 보고서** 게시
    * Present.pbix를 사용하여 Power BI Desktop을 엽니다.
    * [게시]를 클릭합니다.
    * 방금 만든 작업 영역 이름을 선택합니다.
    * 보고서가 게시될 때까지 대기합니다.
* **Power BI 보고서** 보기
    * [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)으로 돌아갑니다. 
    * 필요한 경우 브라우저를 새로 고칩니다.
    * 웹 브라우저의 왼쪽 창에서 보고서를 참조하세요.
    * 보고서를 클릭하면 보고서가 로드됩니다.

## <a name="demo-1---explore"></a>데모 1 - 탐색

> 💡 데모를 시작하기 전에 [설정](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-presenter.md#demo-instructions)을 완료해야 합니다.

### <a name="video-demo-with-voice-over-aiml21---demo-1---explorehttpsyoutube-z6nfyq-wri"></a>음성 전달이 포함된 동영상 데모: [AIML21 - 데모 1 - 탐색](https://youtu.be/-z6nfyq-WrI)

* [Azure Portal](https://azure.microsoft.com/en-gb/?WT.mc_id=msignitethetour2019-github-aiml21)에 로그인하고 위의 템플릿으로 만든 **Azure Machine Learning**을 엽니다.
* **'지금 미리 보기 시작'** 을 클릭하여 미리 보기 환경을 시작합니다.
* 왼쪽 창에서 **'컴퓨팅'** 을 엽니다.
* Notebook VM에서 **'Jupyter'** 링크를 선택합니다.
* ‘필요한 경우 Azure 자격 증명을 사용하여 로그인’합니다. 
* [**Explore.ipynb**](code/explore.ipynb)를 엽니다 *(이러한 모든 탭을 열고 미리 준비하는 것이 좋음).*
* Notebook의 모든 출력 셀이 선택 취소되어 있는지 확인합니다. **셀 선택 -> 모든 출력 -> 선택 취소**
* **각 데모에 대한 핵심 요지 동영상을 검토**합니다.
* 처음 6개 셀을 예행 연습으로 실행하고 간단히 설명합니다.
* 추가 셀 및 시각화를 사용할 수 있으며 참석자는 **[aka.ms/AIML21repo](http://aka.ms/aiml21repo)** 에서 코드를 다운로드해야 합니다.

## <a name="demo-2---experiment"></a>데모 2 - 실험

> 💡 데모를 시작하기 전에 [설정](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-presenter.md#demo-instructions)을 완료해야 합니다.

### <a name="video-demo-with-voice-over-aiml21---demo-2---experimenthttpsyoutubec7p_4cryt8k"></a>음성 전달이 포함된 동영상 데모: [AIML21 - 데모 2 - 실험](https://youtu.be/c7p_4CRYT8k)

* [ml.azure.com](https://ml.azure.com/?WT.mc_id=msignitethetour2019-github-aiml21) Azure Machine Learning 스튜디오로 이동합니다. URL을 통해 여기에 직접 액세스하여 로그인하고, 이 설명을 위해 만든 올바른 작업 영역을 선택할 수 있습니다. 또는 Azure Portal의 Azure Machine Learning Service에서 **'지금 미리 보기 시작'** 단추를 선택합니다.
* 왼쪽 창에서 **자동화된 ML**을 선택합니다.
* **각 데모에 대한 핵심 요지 동영상을 검토**합니다.
* **'자동화된 새 ML 실행'** 을 클릭합니다.
* 학습 데이터 데이터 세트(data_train_experiment-XXXXXX)를 선택합니다.
* 실험 이름(예: aiml21-regression-duration)을 제공합니다.
* 대상 열에 대한 **기간**을 선택합니다.
* 위에서 설정한 컴퓨팅의 ' 학습 클러스터'를 선택합니다.
* **다음**을 선택합니다.
* 예측 작업에 대해 **회귀**를 선택합니다.
* **'추가 구성 설정 보기'** 를 선택하고 주 메트릭을 **'normalized_root_mean_squared_error'** 로 설정합니다.
* 동시성, 최대 동시 반복 수를 3으로 설정합니다.
* 종료 조건, 학습 작업 시간(시간)을 1로 설정합니다.
* **'저장'** 을 선택합니다.
* **마침**을 선택합니다.

> 실행되면 실험을 실행하는 데 시간이 걸리고 이전에 실행한 예제를 검토할 것임을 설명합니다. 

> 발표를 시작하기 전에 설명된 대로 완전히 자동화된 ML 회귀가 실행되고 있는지 확인하세요.

* 왼쪽의 자동화된 ML 페이지에서 이전에 실행한 실험을 선택하거나, 위에서 방금 제출한 실험에서 [뒤로] 단추를 누릅니다.
* 이전에 실행한 실험의 '실행 ID'가 길면 이 링크를 선택합니다.
* **각 데모에 대한 핵심 요지 동영상을 검토**합니다.

## <a name="demo-3---deploy"></a>데모 3 - 배포

> 💡 데모를 시작하기 전에 [설정](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-presenter.md#demo-instructions)을 완료해야 합니다.

### <a name="video-demo-with-voice-over-aiml21---demo-3---deployhttpsyoutube7bkbo7nqd4q"></a>음성 전달이 포함된 동영상 데모: [AIML21 - 데모 3 - 배포](https://youtu.be/7bkBO7NQd4Q)

> 위에서 검토한 이전에 실행된 실험을 사용하여 배포합니다.

* **자동화된 ML 실험**을 실행하여 화면에서 시작합니다.
* **'최적 모델 배포'** 단추를 선택합니다.
* 배포 이름(예:aiml21-v1)을 만듭니다.
* 원하는 경우 배포 설명을 추가합니다.
* 컴퓨팅 형식을 ACI(Azure Container Instance)로 설정합니다.
* 인증 사용을 유지합니다.
* **배포** 단추를 선택합니다.
* 배포에 소요되는 시간에 대한 설명은 왼쪽의 '엔드포인트' 탭에서 검토할 수 있습니다.

>발표를 시작하기 전에 ACI에 이미 배포된 자동화된 ML 회귀 실험을 완전히 실행했는지 확인하세요.

* 왼쪽 창에서 **엔드포인트**를 선택합니다.
* 이미 만든 Azure Container Instance 모델을 선택합니다.
* **각 데모에 대한 핵심 요지 동영상을 검토**합니다.
* Jupyter를 사용하여 [브라우저] 탭을 선택합니다.
* [Deploy.ipynb](code/deploy.ipynb)를 엽니다.
* Notebook의 모든 출력 셀이 선택 취소되어 있는지 확인합니다. **셀 선택 -> 모든 출력 -> 선택 취소**
* 올바른 정보로 구성된 config.json 파일이 완료되었는지 확인합니다.
* 배포된 웹 서비스의 이름을 포함하도록 두 번째 셀을 편집합니다.
* Notebook의 모든 셀을 실행하고 코드(**각 데모에 대한 모든 핵심 요지 동영상 검토**)를 설명합니다.

## <a name="demo-4---present"></a>데모 4 - 표시

> 💡 데모를 시작하기 전에 [설정](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-presenter.md#demo-instructions)을 완료해야 합니다.

### <a name="video-demo-with-voice-over-aiml21---demo-4---presenthttpsyoutubeg7abac9s9qq"></a>음성 전달이 포함된 동영상 데모: [AIML21 - 데모 4 - 표시](https://youtu.be/g7aBaC9s9qQ)

>발표를 시작하기 전에 [Present.pbix](code/Present.pbix) 및 [https://powerbi.microsoft.com/](https://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)을 사용하여 위 설정에 열려 있는 작업 영역 및 보고서와 함께 Power BI Desktop을 엽니다.

* Present.pbix를 엽니다. 
* **각 데모에 대한 핵심 요지 동영상을 검토**합니다.
* [게시] 단추를 표시합니다.
* [https://powerbi.microsoft.com/](https://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)을 엽니다.
* **각 데모에 대한 핵심 요지 동영상을 검토**합니다.

# <a name="teardown-instructions"></a>해제 지침

### <a name="full-teardown"></a>전체 해제

* Azure Portal에 들어가서 Azure 리소스 그룹을 삭제하여 이 프로젝트에 대한 모든 리소스를 제거합니다.

### <a name="to-save-costs"></a>비용 절감

* 사용하지 않을 때마다 Notebook VM에서 종료를 선택해야 합니다.
* 사용하지 않는 경우 엔드포인트에서 Azure Container Instance를 삭제합니다.

# <a name="resources-and-continued-learning"></a>리소스 및 지속적인 학습

**Microsoft Learn:**
* [Azure에서 데이터 과학 도구 살펴보기](https://docs.microsoft.com/en-us/learn/paths/explore-data-science-tools-in-azure/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Python 소개](https://docs.microsoft.com/en-us/learn/modules/intro-to-python/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Azure Machine Learning Service로 ML 모델 선택 자동화](https://docs.microsoft.com/en-us/learn/modules/automate-model-selection-with-azure-automl/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Power BI로 분석 보고서 생성 및 사용](https://docs.microsoft.com/en-us/learn/paths/create-use-analytics-reports-power-bi/?WT.mc_id=msignitethetour2019-github-aiml21)


# <a name="feedback-loop"></a>피드백 루프

모든 발표자는 매월 **교육 - 강사 Q&A 세션**에 참석할 기회가 있으며(모든 시간대를 포함하는 두 개의 세션), 무대에서 콘텐츠를 발표한 후에는 콘텐츠 경험을 공유하고 원하는 피드백과 아이디어를 제공하기 위해 구성된 **피드백 세션**에 꼭 참여하시기 바랍니다. 

의견, 피드백, 제안이 있으신가요? 현재 콘텐츠 변경/제안/피드백을 위한 최선의 피드백 루프는 이 GitHub 리포지토리에서 새로운 이슈를 생성하는 것입니다. 이슈 생성 방법에 대한 모든 세부 정보를 보려면 [기여](../CONTRIBUTING.md) 문서를 참조하세요.

## <a name="become-a-trained-presenter"></a>숙련된 발표자 되기

숙련된 발표자가 되려면 [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com)에 문의하세요. 메일에 다음을 포함해야 합니다.

- 전체 이름
- 이 프레젠테이션의 코드는 aiml21입니다.
- 발표에 사용하는 동영상(최대 10분 길이)(예: 목록에 없는 YouTube 동영상)의 링크. 
  > 이 콘텐츠여야할 필요는 없습니다. 발표자의 발표 기술을 보여주는 것이 중요합니다.

멘토가 프로세스에 대한 정보를 제공해드립니다.

## <a name="trained-presenters"></a>숙련된 발표자

아래의 훌륭한 분들께 감사의 말씀을 전합니다([이모지 키](https://allcontributors.org/docs/en/emoji-key)).

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/amynic">
        <img src="https://avatars3.githubusercontent.com/u/13828867?s=400&u=f6aca8528d65d6c191114d3a7328b46137eda162&v=4" width="100px;" alt="Amy Boyd"/><br />
        <sub><b>Amy Boyd</b></sub></a><br />
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/commits?author=amynic" title="발표">📢</a>
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/commits?author=amynic" title="문서">📖</a> 
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->
