# <a name="demo-setup"></a>데모 설정
라이브 데모에 대한 환경을 준비하려면 아래 단계를 수행합니다. 이 설정을 완료하면 [데모 가이드](demoguide.md)를 따릅니다.

## <a name="create-azure-machine-learninge-resources-with-the-deploy-to-azure-button-below"></a>아래 [Azure에 배포] 단추를 사용하여 Azure Machine Learninge 리소스 만들기
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>

> 만든 후에는 Azure Machine Learning 리소스를 이 세션의 Enterprise Edition으로 업그레이드하세요. 이 작업을 완료하려면 '업그레이드' 단추가 표시되어야 합니다. 현재는 미리 보기로 제공되며 가격 책정 구조는 [여기](https://azure.microsoft.com/en-us/pricing/details/machine-learning/)에 설명되어 있습니다.

## <a name="create-additional-resources-needed"></a>필요한 추가 리소스 만들기

* **'새 Azure Machine Learning 스튜디오 시작'** 을 선택합니다.

기본 Azure Machine Learning Service를 만든 후에는 추가적인 컴퓨팅 리소스를 추가해야 합니다.
### <a name="create-compute-targets"></a>컴퓨팅 대상 만들기
1. Machine Learning 컴퓨팅을 만듭니다.
    * 탐색 창에서 “컴퓨팅”을 클릭합니다.
    * '학습 클러스터'를 선택합니다.
    * “새로 만들기”를 클릭합니다.
    * 리소스 이름을 입력합니다.
    * 머신 크기를 선택합니다(예: Standard_DS2_v2).
    * 최소 및 최대 노드를 입력합니다(권장 최소값: 0, 최대값: 5).
    * “만들기” ![컴퓨팅 만들기](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif)를 클릭합니다.
2. Kubernetes 컴퓨팅 만들기
    * 탐색 창에서 “컴퓨팅”을 클릭합니다.
    * '유추 클러스터'를 선택합니다.
    * “새로 만들기”를 클릭합니다.
    * 리소스 이름을 입력합니다.
    * 지역을 선택합니다.
    * '가상 머신 크기'를 기본값으로 유지합니다.
    * 클러스터 용도를 'Dev-test'로 설정합니다.
    * “만들기” ![Kubernetes 만들기](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif)를 클릭합니다.
3. Notebook 가상 머신 만들기
    * 탐색 창에서 “컴퓨팅”을 클릭합니다.
    * 'Notebook VM'을 선택합니다.
    * “새로 만들기”를 클릭합니다.
    * Notebook에 고유한 이름을 지정합니다.
    * VM 크기를 선택합니다.
    * “만들기” ![VM 만들기](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif)를 클릭합니다.


## <a name="upload-dataset-to-workspace-blob-storage-and-save-to-local"></a>작업 영역 Blob Storage에 데이터 세트 업로드 및 로컬에 저장
데모가 향후 주를 예측할 수 있도록 업데이트된 날짜로 매주 필요한 데이터 세트가 생성됩니다. 다음은 새 데이터 세트를 가져와서 Azure Machine Learning 스토리지 계정 및 데모 데이터 앱에 추가하는 단계입니다.

1. [여기](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv)에서 로컬로 데이터 세트를 다운로드합니다.
2. Azure Storage Explorer 열기 - [여기에서 다운로드합니다](https://azure.microsoft.com/en-us/features/storage-explorer/).
3. `azureml-blobstore-<guid>`로 이동합니다.
4. `datasets`라는 새 폴더를 만듭니다.
5. 데이터 세트를 업로드합니다.
6. 향후 날짜를 예측하도록 C# 데모 앱에서 로컬 ForecastingData.csv 파일을 바꿉니다. 기본 csv가 있지만 업데이트된 데이터가 아닙니다.

## <a name="get-the-c-demo-app"></a>C# 데모 앱 받기
첫 번째 데모는 VS Code 및 C# IgniteAimlDataApp이 함께 제공됩니다. 이는 데이터 처리 방식을 설명하고 어떤 언어로든 수행할 수 있음을 강조하기 위한 것입니다.

1. [여기에서 VS Code 다운로드](https://code.visualstudio.com/download)
2. 로컬에 [.NET Core SDK 2.1.0](https://dotnet.microsoft.com/download/dotnet-core/2.1)이 설치되어 있어야 합니다.
3. 다음 명령을 사용하여 앱을 복제합니다.
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
4. 프로젝트 경로로 이동합니다.
    * `cd ignite-learning-paths-training-aiml/aiml30/C#/IgniteAimlDataApp/IgniteAimlDataApp`
5. VS Code에서 프로젝트를 엽니다.
    * `code .`
6. 로컬 데이터 세트를 `IgniteAimlDataApp/Datasets` 폴더의 위 단계에서 다운로드한 데이터 세트로 바꿉니다.
7. 앱을 실행하려면 다음을 수행합니다.
    * `Program.cs`를 마우스 오른쪽 단추로 클릭하고 `Open in Terminal`을 선택합니다.
    * `dotnet run` 명령을 실행합니다.
    * 그러면 `Would you like to run the default params` 질문 형식`y`으로 메시지가 표시됩니다.
    * API에 도달하기 위해 사용을 시도하지만 아직 생성되지 않았으므로 실패합니다.

## <a name="run-through-the-live-demo"></a>라이브 데모를 통해 실행
라이브 데모를 완전히 실행하여 백업 모델을 완료하고 최종 결과를 표시합니다.

#### <a name="there-will-not-be-enough-time-to-run-the-model-during-the-live-demo-make-sure-to-build-the-model-_without_-running-it-in-the-live-session-once-you-have-added-all-the-modules-to-the-experiment-workspace-then-navigate-to-the-model-you-created-and-trained-prior-to-the-session"></a>라이브 데모 중에는 모델을 실행할 시간이 충분하지 않습니다. 라이브 세션에서 모델을 실행하지 _않고_ 모델을 빌드해야 합니다. 모든 모듈을 실험 작업 영역에 추가하면 세션 전에 만들고 학습시킨 모델로 이동합니다.

[다음 - 라이브 데모 단계](demoguide.md)
