# <a name="aiml30--start-building-machine-learning-models-faster-than-you-think--train-the-trainer"></a>AIML30 - 생각보다 빠르게 기계 학습 모델 빌드 시작하기 - 강사 교육

Tailwind Traders는 사용자 지정 기계 학습 모델을 사용하여 소프트웨어 개발 수명 주기를 변경하지 않고 인벤토리 문제를 해결합니다! 어떻게 가능할까요? Azure Machine Learning 디자이너.
 
이 세션에서는 Tailwind Traders에서 사용하는 데이터 과학 프로세스를 알아보고, Azure Machine Learning 디자이너를 소개합니다. 데이터를 찾고, 가져오고, 준비하고, 기계 학습 알고리즘을 선택하고, 모델을 학습 및 테스트하고, API에 전체 모델을 배포하는 방법을 살펴봅니다. 개발팀과 함께 기계 학습 여정을 계속하고 첫 모델을 빌드하는 데 필요한 팁, 모범 사례 및 리소스를 받으세요.


## <a name="demo-environment-deployment"></a>데모 환경 배포
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>


## <a name="create-additional-resources-needed"></a>필요한 추가 리소스 만들기
기본 Azure Machine Learning Service 작업 영역을 만든 후에는 추가적인 컴퓨팅 리소스를 추가해야 합니다.
### <a name="create-compute-targets"></a>컴퓨팅 대상 만들기
1. Machine Learning 컴퓨팅을 만듭니다.
    * 탐색 창에서 “컴퓨팅”을 클릭합니다.
    * “새로 만들기”를 클릭합니다.
    * 리소스 이름을 입력합니다.
    * 드롭다운에서 “Machine Learning 컴퓨팅”을 선택합니다.
    * 머신 크기를 선택합니다.
    * 최소 및 최대 노드를 입력합니다(권장 최소값: 0, 최대값: 5).
    * “만들기” ![컴퓨팅 만들기](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif)를 클릭합니다.
2. Kubernetes 컴퓨팅 만들기
    * 탐색 창에서 “컴퓨팅”을 클릭합니다.
    * “새로 만들기”를 클릭합니다.
    * 리소스 이름을 입력합니다.
    * 드롭다운에서 “Kubernetes 서비스”를 선택합니다.
    * “만들기” ![Kubernetes 만들기](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif)를 클릭합니다.


## <a name="build-model-with-azure-machine-learning-visual-designer"></a>Azure Machine Learning 비주얼 디자이너를 사용하여 모델 빌드

### <a name="1-upload-the-dataset-to-the-datasets-in-aml"></a>1. AML의 데이터 세트에 데이터 세트 업로드
* [여기](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv)에서 로컬로 데이터 세트를 다운로드합니다.
* `Datasets`를 클릭합니다.
* `Create from local`를 클릭합니다.
* 양식을 작성하고 데이터 세트를 업로드합니다.

### <a name="2-start-building-the--model"></a>2. 모델 빌드 시작

* 왼쪽 탐색 창에서 `Designer`를 클릭합니다.
* 더하기 기호를 클릭하여 새 파이프라인을 만듭니다.
* `Datasets` 및 `My Datasets`를 확장합니다.
* 업로드된 데이터 세트를 실험 작업 영역에 끌어서 놓습니다.
* `Select Columns in Dataset`을 작업 영역으로 끌어옵니다.
    * 오른쪽의 매개 변수 메뉴에서 `Edit columns`를 클릭합니다.
    * `By Name`을 클릭합니다.
    * `Add All`을 클릭합니다.
    * `Time` 열에서 `Minus` 아이콘을 클릭하여 제외합니다.
* `Split Data`를 작업 영역으로 끌어옵니다.
    * 매개 변수를 편집하여 데이터를 70/30으로 분할합니다. 
    * 이는 규칙이 아니므로 다른 모델 요구 사항에 따라 달라질 수 있습니다.
* `Train Model`을 작업 영역으로 끌어옵니다.
    * 오른쪽의 매개 변수에서 레이블 열 이름 `Values`를 선택합니다.
* `Boosted Decision Tree Regression`을 작업 영역으로 끌어옵니다.
* `Score Model`을 작업 영역으로 끌어옵니다.
* `Evaluate`를 작업 영역으로 끌어옵니다.
* 학습 데이터를 가져오려면 `Split Data` 모듈을 `Train Model`에 연결하고 보이지 않는 데이터로 예측 결과의 점수를 매기려면 `Score Model`에 연결합니다.
* `Train Model`을 학습 알고리즘 `Boosted Decision Tree Regression` 모듈에 연결합니다.
* `Evaluate` 모듈을 사용하여 `Score Model`을 연결합니다.
* 하단 탐색 창에서 `Run` 단추를 클릭하고 [컴퓨팅]을 선택합니다. 

* 만든 열 `Scored Labels`의 이름을 `Forecast`로 바꿉니다.
    * `Edit Metadata`를 작업 영역으로 끌어옵니다.
    * `Edit Metadata` 모듈을 사용하여 `Score Model`을 연결합니다.
    * `Edit Metadata` 모듈의 `Parameters`에서 `Edit Columns`를 클릭합니다.
    * 텍스트 상자에 `Score Labels`를 입력합니다(기본값을 변경할 필요가 없음).
    * `Save`를 클릭합니다.
    * 다음으로 `Parameters`에서 `New Column Name` 필드를 `Forecast`로 업데이트합니다.
* 정규화된 값을 전체 항목 개수로 다시 변환
    * `Apply Math Operation`을 작업 영역으로 끌어옵니다.
    * `Edit Metadata`를 `Apply Math Operation`에 연결합니다.
    * `Basic math function`을 `Exp`로 설정합니다.
    * `Edit Columns`를 클릭하고 `Value` 및 `Forecast`를 입력합니다.
    * `Save`를 클릭합니다.
    * `Output mode`를 `Inplace`로 설정합니다.
* `Select Columns in Dataset` 모듈을 작업 영역으로 끌어옵니다.
* `Apply Math Operation`을 `Select Columns in Dataset`에 연결합니다.
* `Edit Columns`를 클릭하고 열 이름(`ID1,ID2,Value,Forecast`)을 입력합니다.
* 완료 및 배포된 모델에서 결과를 얻기 위해 게시할 때 데이터 데모 앱에 필요한 열입니다.
* 학습 실행

### <a name="4-create-inference-pipeline-and-deploy-the-model"></a>4. 유추 파이프라인 만들기 및 모델 배포
* `Create inference pipeline`을 클릭한 다음 `Real-time inference pipeline`을 선택합니다.
* `Web Service Output`이 마지막 데이터 처리 단계 모듈에 연결되어 있는지 확인합니다. `Select Columns in Dataset`
* `Run`을 클릭합니다.
* `Deploy`를 클릭합니다.
* 왼쪽 탐색 창에서 배포된 웹 서비스로 이동합니다.
* 미리 만든 웹 서비스의 이름을 클릭합니다.
* `Test`를 클릭하여 점수가 매겨진 데이터 항목에서 수행하는 방법을 확인합니다.
* `Consume`을 클릭하고 웹 서비스 통합을 위해 제공된 샘플 코드를 확인합니다.

### <a name="5-test-api-with-c-console-app-dotnet-core"></a>5. C# 콘솔 앱을 사용하여 API 테스트(dotnet core)

1. [여기에서 VS Code 다운로드](https://code.visualstudio.com/download)
2. 다음 명령을 사용하여 앱을 복제합니다.
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
3. 프로젝트 경로로 이동합니다.
    * `cd ignite-learning-paths\aiml\aiml30\C#\IgniteAimlDataApp`
4. VS Code에서 프로젝트를 엽니다.
    * `code .`
5. 로컬 데이터 세트를 `IgniteAimlDataApp/Datasets` 폴더의 위 단계에서 다운로드한 데이터 세트로 바꿉니다.
6. 테스트를 실행하려면 다음을 수행합니다.
    * `Consume` 탭에서 API 키를 복사합니다.
    * `App.config`를 열고 value 특성에 붙여넣습니다.
    * `Consume` 탭에서 `Request-Response Url`을 복사합니다.
    * `Program.cs`를 열고 `client.BaseAddress = new Uri("");`에 값을 붙여넣습니다.
    * `Program.cs`를 마우스 오른쪽 단추로 클릭하고 `Open in Terminal`을 선택합니다.
    * `dotnet run` 명령을 입력하여 콘솔 앱을 실행합니다.
    * StoreID(ID1)의 기본값 2와 ItemID(ID2)의 1 및 예측 주 수를 사용하려면 `y`만 입력합니다.
    * 이 작업을 실행하면 다음 4주에 대한 예측 값을 반환해야 합니다.


### <a name="6-optional-additionally-test-api-with-python-in-notebook-vms-using-jupyter-notebooks"></a>6. 선택 사항: Jupyter Notebooks를 사용하여 Notebook VM에서 Python으로 API 테스트
1. `Compute`로 이동 및 새 Notebook VM 만들기 ![컴퓨팅 만들기](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif)
2. `Application URI` 열 아래에 만들어지면 `Jupyter Lab` 옵션을 클릭합니다. (VM이 `running` 상태가 될 때까지 표시되지 않습니다.)
3. Jupyter 랩의 홈페이지에서 터미널을 클릭합니다.
4. Jupyter 랩의 터미널에서 리포지토리를 복제합니다.
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
5. 터미널 `pip install holidays`에도 복제합니다.
6. 복제된 폴더 `ignite-learning-paths-training-aiml`을 열고 파일 `ignite-ailml30-get-prediction.ipynb`로 이동한 후 클릭하여 엽니다.
    * 전체 경로는 다음과 같습니다. `ignite-learning-paths-training-aiml\aiml30\Python\ignite-ailml30-get-prediction.ipynb`
7. csv 파일, 엔드포인트 및 키에 대한 경로를 업데이트합니다.
8. `SHIFT + Enter` 또는 최상위 메뉴의 각 셀에서 [재생]을 클릭하여 각 셀 실행

## <a name="powerpoint-deck-and-video-demo"></a>PowerPoint 데크 및 동영상 데모

- [PowerPoint 데크](presentations.md)

- [데모 동영상](https://www.youtube.com/watch?v=u1ppYaZuNmo&feature=youtu.be)

## <a name="resources-and-continue-learning"></a>리소스 및 지속적인 학습

다음은 관련 학습 및 설명서 목록입니다.

- [Azure Machine Learning 디자이너란 무엇인가요?](https://docs.microsoft.com/en-us/azure/machine-learning/service/ui-concept-visual-interface?WT.mc_id=msignitethetour-slides-cxa)
- [Microsoft Azure Machine Learning으로 Machine Learning 실험 게시](https://docs.microsoft.com/en-us/learn/paths/publish-experiment-with-ml-studio/)


## <a name="feedback-loop"></a>피드백 루프

의견, 피드백, 제안이 있으신가요? 현재 콘텐츠 변경/제안/피드백을 위한 최선의 피드백 루프는 이 GitHub 리포지토리에서 새로운 이슈를 생성하는 것입니다. 이슈 생성 방법에 대한 모든 세부 정보를 보려면 [기여](../../contributing.md) 문서를 참조하세요.
