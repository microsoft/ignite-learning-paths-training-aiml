# <a name="demo-guide"></a>데모 가이드
> 💡 데모를 시작하기 전에 [배포](demosetup.md)를 완료해야 합니다.

# <a name="demo-1-data-prep-demo-with-app"></a>데모 1: 앱을 사용한 데이터 준비 데모
첫 번째 데모에서는 시계열 모델 슬라이드에서 설명한 데이터 준비를 강조합니다. C# 데모 앱에서 이 작업을 수행하는 방법을 단계별로 안내합니다. 이 작업은 어떤 언어로든 수행할 수 있음을 강조해야 합니다.

`F12` 및 `CTRL-` 바로 가기로 코드를 탐색하려면 [여기](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vs-keybindings)에서 VS Code용 Visual Studio 바로 가기 확장을 다운로드합니다. 이 방법은 매우 유용하며 항목을 찾을 때까지 스크롤할 필요가 없습니다. (이 확장은 mac 또는 linux에서 작동하지 않음)

### <a name="data-prep-demo-video-herehttpsyoutubeu1ppyazunmot751"></a>데이터 준비 데모 동영상 [여기](https://youtu.be/u1ppYaZuNmo?t=751)

> 💡 데모를 시작하기 전에 [배포](demosetup.md)를 완료해야 합니다.

### <a name="1-open-the-igniteaimldataapp-app-i-personally-like-to-have-this-open-before-i-start-the-talk-so-i-can-just-flip-to-it"></a>1. 
          `IgniteAimlDataApp` 앱을 엽니다. 화면을 간단하게 전환할 수 있기 때문에 개인적으로는 설명을 시작하기 전에 앱을 열어 두는 것을 선호합니다.
* `Program.cs` 파일을 엽니다.
* 마우스 오른쪽 단추를 클릭하여 `GetProcessedDataForScore` 메서드로 이동하고, `Go To Definition`을 선택하거나 `F12` 키를 누릅니다.
    * 데이터 원본에서 데이터를 로드합니다. 이 예제에서는 솔루션의 로컬 excel 파일을 로드합니다.
* `F12` 키를 눌러 `AddWeeksToPredict` 메서드로 이동하고 논리를 설명합니다.
    * 최신 날짜를 가져오고 해당 날짜에서 향후 4주를 추가합니다.
    * 데이터가 주 단위이므로 주중에 공휴일이 있는지 알아보고자 합니다. 그래서 주중에 발생한 모든 날짜를 계산하고 `DatesInWeek`라는 컬렉션을 채웁니다.
    * 그런 다음, 컬렉션에 추가된 향후 4주에 해당하는 시간을 만듭니다.
* `F12` 키를 눌러 `AddWeeksToPredict` 논리 내의 `CreateTimeFeatures` 메서드로 이동하고 논리를 설명합니다.
    * 현재 시간 속성을 사용하여 필요한 시간 및 공휴일 기능을 계산할 수 있습니다.
* `CTRL-` 키를 눌러 `AddWeeksToPredict`로 돌아갑니다.
* `F12` 키를 눌러 `CreateFourierFeatures`로 이동합니다.
    * 주간 데이터 기능에 대한 52개의 계절성 주기에서 푸리에 항(Fourier Term) 기능을 계산합니다. 
* `CTRL-`키를 눌러 `GetProcessedDataForScore`로 돌아갑니다.
* `F12` 키를 눌러 `CreateLagFeatures` 메서드로 이동하고 논리를 설명합니다.
    * 현재 행에 26주 전의 판매액을 추가합니다.
* `CTRL-`키를 눌러 `GetProcessedDataForScore`로 돌아갑니다.

* 데이터 데모 백업 옵션
    * 숨겨진 슬라이드에 포함된 mp4 동영상을 사용합니다. 음소거 상태로 이 동영상을 틀고 이야기를 나누세요.
    * 슬라이드 21에서 시작하여 정적 슬라이드 단계에서 데이터 준비 코드를 표시합니다.

# <a name="demo-2-build-model-with-azure-machine-learning-designer"></a>데모 2: Azure Machine Learning 디자이너를 사용하여 모델 빌드
💡 데모를 시작하기 전에 [배포](demosetup.md)를 완료해야 합니다.

### <a name="full-model-building-live-demo-video-herehttpsyoutubeu1ppyazunmot1278"></a>전체 모델 빌드 라이브 데모 동영상 [여기](https://youtu.be/u1ppYaZuNmo?t=1278)

### <a name="1-create-resource-and-upload-dataset"></a>1. 리소스 만들기 및 데이터 세트 업로드

* Azure Machine Learning Studio 리소스를 만들고 새 작업 영역으로 이동합니다.
    * 슬라이드에서 설명했던 다양한 도구가 있는 상위 수준을 검토합니다.
    * 이 단계의 동영상 리소스:
        * [여기](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateAMLNavToWorkspace.mp4)서는 음소거 상태인 이 단계의 동영상을 제공합니다.
        * [여기](https://youtu.be/u1ppYaZuNmo?t=1278)서는 오디오를 사용하여 리소스를 만드는 방법에 대한 동영상을 제공합니다.
* AML의 데이터 세트에 데이터 세트 업로드
    * `Datasets`를 클릭합니다.
    * `Create from datastore`를 클릭하거나 로컬에서 원하는 항목을 클릭합니다.
        * 참고: 데모 설정 단계에서는 데이터 세트가 데이터 저장소에 이미 업로드되어 있어야 합니다.
    * 필수 필드를 입력하고 `workspaceblobstorage` 옵션을 선택합니다.
    * `Create`를 클릭합니다.
    * 선택 사항: AML의 데이터 세트 업로드에서 데이터 준비 기능을 단계별로 실행합니다.

### <a name="2-launch-designer-and-explain-tool-features"></a>2. 디자이너 시작 및 도구 기능 설명

* 스튜디오의 왼쪽 탐색 창에서 '디자이너'를 선택합니다.
* 테스트 데이터 세트를 포함하여 왼쪽 탐색 창의 여러 모듈을 요약합니다.

### <a name="3-start-building-the--model"></a>3. 모델 빌드 시작

* 데이터 세트를 실험 작업 영역으로 끌어서 놓습니다.
    * 작업 영역으로 데이터를 가져오는 옵션으로 파일 업로드 모듈이 있습니다.
* `Select Columns in Dataset`을 작업 영역으로 끌어옵니다.
    * 오른쪽의 매개 변수 메뉴에서 `Edit columns`를 클릭합니다.
    * `By Name`을 클릭합니다.
    * `Add All`을 클릭합니다.
    * `Time` 열에서 `Minus` 아이콘을 클릭하여 제외합니다.
* `Split Data`를 작업 영역으로 끌어옵니다.
    * 매개 변수를 편집하여 데이터를 70/30으로 분할합니다. 
    * 분할 백분율은 정해진 규칙이 아니며 모델 요구 사항에 따라 달라질 수 있습니다.
* `Train Model`을 작업 영역으로 끌어옵니다.
    * 오른쪽의 매개 변수에서 레이블 열 이름 `Value`를 선택합니다.
* `Boosted Decision Tree Regression`을 작업 영역으로 끌어옵니다.
* `Score Model`을 작업 영역으로 끌어옵니다.
* `Evaluate`를 작업 영역으로 끌어옵니다.
* 학습 데이터를 가져오려면 `Split Data` 모듈을 `Train Model`에 연결하고 보이지 않는 데이터로 예측 결과의 점수를 매기려면 `Score Model`에 연결합니다.
* `Train Model`을 학습 알고리즘 `Boosted Decision Tree Regression` 모듈에 연결합니다.
* `Evaluate` 모듈을 사용하여 `Score Model`을 연결합니다.
* 이곳은 일반적으로 모델을 실행하는 _위치지만_ 데모에서 실행하는 데 시간이 너무 오래 걸립니다. 하단 탐색 창에서 `Run` 단추를 클릭하고 컴퓨팅을 선택하는 방법을 알아보세요. 이 방법은 AML에서 컴퓨팅 리소스를 만드는 방법에 관한 설명으로 이어집니다.

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

### <a name="4-discuss-compute-target-creation"></a>4. 컴퓨팅 대상 만들기 논의

* `Compute` 탐색 항목을 클릭합니다.
* `Add`를 클릭합니다.
* 다양한 컴퓨팅 형식 및 사용되는 방법에 대해 설명합니다. 이 데모에 사용되는 컴퓨팅은 학습용 `Kubernetes Service` 및 API 배포용 `Machine Learning Compute`입니다.

### <a name="5-explain-trained-model"></a>5. 학습된 모델 설명
* [비주얼 디자이너]로 돌아갑니다.
* 모델의 두 번째 모듈을 마우스 오른쪽 단추로 클릭하여 데이터를 시각화합니다(`Select Columns in Dataset`인 경우가 가장 많음).
* 데이터를 빠르게 스크롤하여 데이터 모양을 표시합니다.
* 열을 클릭하고 도구가 오른쪽 패널에서 시각화를 만드는 방법을 표시합니다.
* `Score Model` 모듈을 시각화하여 보이지 않는 데이터에 대한 모델 예측 방법을 표시합니다.
* `Evaluate Model` 모듈을 시각화하고 점수를 매기는 데 사용되는 메트릭에 대해 논의합니다.
    * 매개 변수의 오른쪽 패널에서 `More Help`를 클릭합니다.
    * 모듈에서 수행하는 작업을 설명하는 매개 변수의 문서 링크가 모든 모듈에 있음을 강조 표시합니다.
    * 아래로 스크롤하여 모델에 대한 문서에서 메트릭 설명을 표시합니다.
    
### <a name="6-create-inference-pipeline-and-deploy-the-model"></a>6. 유추 파이프라인 만들기 및 모델 배포
여기서는 일반적으로 `Inference Pipeline`을 만들어 웹 서비스에 배포_하지만_ 우리는 해당 작업 단계를 미리 수행했습니다. 
* _라이브에서 수행하지 않는 작업_ 단계에 대해 논의하세요.
    * `Create inference pipeline`을 클릭한 다음 `Real-time inference pipeline`을 선택합니다.
    * `Web Service Output`이 마지막 데이터 처리 단계 모듈에 연결되어 있는지 확인합니다. `Select Columns in Dataset`
    * `Run`을 클릭합니다.
    * `Deploy`를 클릭합니다.
* `Inference Pipeline`을 만드는 단계를 논의한 후에는 왼쪽 탐색 창에서 배포된 웹 서비스로 이동합니다.
* 미리 만든 웹 서비스의 이름을 클릭합니다.
* `Test`를 클릭하고 점수가 매겨진 데이터 항목에서 수행하는 방법을 표시합니다.
* `Consume`을 클릭하고 웹 서비스 통합을 위해 제공된 샘플 코드를 표시합니다.


# <a name="demo-3-testing-api-with-c-console-app-dotnet-core"></a>데모 3: C# 콘솔 앱을 사용하여 API 테스트(dotnet core)

> 💡 데모를 시작하기 전에 [배포](demosetup.md)를 완료해야 합니다.

### <a name="api-demo-test-video-herehttpsyoutubeu1ppyazunmot2136"></a>API 데모 테스트 동영상 [여기](https://youtu.be/u1ppYaZuNmo?t=2136)

* `Consume` 탭에서 API 키를 복사합니다.
* `App.config`를 열고 value 특성에 붙여넣습니다.
* `Consume` 탭에서 `Request-Response Url`을 복사합니다.
* `Program.cs`를 열고 `client.BaseAddress = new Uri("");`에 값을 붙여넣습니다.
* `Program.cs`를 마우스 오른쪽 단추로 클릭하고 `Open in Terminal`을 선택합니다.
* `dotnet run` 명령을 입력하여 콘솔 앱을 실행합니다.
* StoreID(ID1)의 기본값 2와 ItemID(ID2)의 1 및 예측값( 주 단위)을 사용하려면 `y`만 입력합니다.
* 이 작업을 실행하면 다음 4주에 대한 예측 값을 반환해야 합니다.
