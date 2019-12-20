# <a name="aiml40---taking-models-to-the-next-level-with-azure-machine-learning-best-practices"></a>AIML40 - Azure Machine Learning 모범 사례를 사용하여 모델 개선

## <a name="session-information"></a>세션 정보

인공 지능 및 기계 학습은 다양한 방식으로 비즈니스 프로세스의 생산성을 높이고, 구조화되지 않은 데이터 흐름 내에서 이미지, 텍스트 및 추세를 분석하여 의미 있는 인사이트를 수집할 수 있습니다. 기존 모델을 사용하여 많은 작업을 해결할 수 있지만 경우에 따라 더 구체적인 작업이나 정확도를 높이기 위해 고유한 모델을 학습시켜야 합니다. 

이 세션에서는 텍스트 분석 지능형 서비스를 [Tailwind Traders](http://tailwindtraders.com)의 비즈니스 프로세스에 통합하는 전체 경로를 살펴보겠습니다. [Cognitive Services](https://azure.microsoft.com/services/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml40)로 제공되는 미리 빌드된 모델에서 시작하여 [Azure Machine Learning Service](https://azure.microsoft.com/services/machine-learning-service/?wt.mc_id=msignitethetour2019-github-aiml40)를 사용해 [Intel NLP Architect](http://nlp_architect.nervanasys.com/)의 일부로 제공되는 [측면 기반 감정 분석](https://www.intel.ai/introducing-aspect-based-sentiment-analysis-in-nlp-architect/)에 대한 타사 신경망 사용자 지정 모델까지 학습합니다. 사용자 지정 모델이 필요한 경우를 설명하고, [AutoML](https://docs.microsoft.com/azure/machine-learning/service/concept-automated-ml/?wt.mc_id=msignitethetour2019-github-aiml40)을 사용하여 이러한 모델을 처음부터 만드는 빠른 방법을 보여주며 [HyperDrive](https://docs.microsoft.com/azure/machine-learning/service/how-to-tune-hyperparameters/?wt.mc_id=msignitethetour2019-github-aiml40)를 사용하여 모델 하이퍼 매개 변수를 세밀하게 조정하는 방법을 알려드립니다.

## <a name="table-of-content"></a>목차
 

| 리소스          | 링크                            |
|-------------------|----------------------------------|
| PowerPoint        | - [프레젠테이션](presentations.md) |
| 동영상            | - [예행 연습](https://youtu.be/If9IQm3gWVQ) <br/>- [Microsoft Ignite 올랜도 녹화](https://myignite.techcommunity.microsoft.com/sessions/83002?source=sessions) |
| 데모             | - [데모 1 - Cognitive Services Text Analytics](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#demo-1-text-analytics-cognitive-service) <br/>- [데모 2 - 자동화된 Machine Learning](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#demo-2-azure-automl) <br/>- [데모 3 - Azure Machine Learning SDK 및 Hyperdrive](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#demo-3-using-azure-ml-workspace-with-python-sdk) |

## <a name="delivery-assets"></a>자산 전송

* [PowerPoint 데크](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/presentations.md)
* [추가 발표자 리소스](README-Instructor.md)
* 데모 동영상:
    * 데모 1 - [Cognitive Services Text Analytics](https://youtu.be/QJxjm5BirOA)
    * 데모 2 - [자동화된 Machine Learning](https://youtu.be/qrstXN6TLZk)
    * 데모 3 - [Azure Machine Learning SDK 및 Hyperdrive](https://youtu.be/sccNTPO3PwU)


## <a name="overview-of-demonstrations"></a>데모 개요

이 프레젠테이션에서는 다음 데모를 수행합니다.

1. [Cognitive Services Text Analytics](https://azure.microsoft.com/services/cognitive-services/text-analytics/?wt.mc_id=msignitethetour2019-github-aiml40)를 사용하여 의류 검토에 대한 감정을 도출합니다.
2. [Azure 자동화된 ML](https://docs.microsoft.com/azure/machine-learning/service/concept-automated-ml/?wt.mc_id=msignitethetour2019-github-aiml40)을 사용하여 코드가 거의 없는 상태에서도 텍스트 분류자를 빌드합니다.
3. [Azure Machine Learning Service](https://azure.microsoft.com/services/machine-learning-service/?wt.mc_id=msignitethetour2019-github-aiml40)를 사용하여 측면 기반 감정 분석 모델을 학습시킵니다.

## <a name="starting-fast"></a>빠른 시작

바로 시작하려는 경우 Azure 템플릿을 통해 필요한 모든 리소스를 배포할 수 있습니다. 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml40%2Ftemplate%2Fazuredeploy.json" target="_blank">
 <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

아래에서는 데모에 대한 세부 지침을 제공하므로 표시되는 개념을 완전히 이해하도록 단계를 수동으로 수행할 수 있습니다.

## <a name="initial-environment-setup"></a>초기 환경 설정

데모의 2단계와 3단계를 수행하려면 다음을 수행해야 합니다.

1. Azure Machine Learning 작업 영역을 만듭니다.
2. AutoML 학습에 사용되는 데이터 업로드 - [clothing_automl.xlsx](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_automl.xlsx)

#### <a name="creating-azure-machine-learning-workspace"></a>Azure Machine Learning 작업 영역 만들기

Azure ML 작업 영역은 다음 방법 중 하나로 만들 수 있습니다.
* [Azure Portal](http://portal.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40)에서 수동으로 만들기([여기에서 완전한 연습 가능](https://docs.microsoft.com/azure/machine-learning/service/how-to-manage-workspace/?wt.mc_id=msignitethetour2019-github-aiml40))
* 제공된 Azure 템플릿에서 배포됨
* [Azure CLI](https://docs.microsoft.com/ru-ru/cli/azure/?view=azure-cli-latest&wt.mc_id=msignitethetour2019-github-aiml40)를 통해 만듦

> *참고: (이 예제에서는 `absa`를 이름으로, *미국 서부 2*를 데이터 센터로 사용하며 언제든지 변경할 수 있음)*

```shell
az extension add -n azure-cli-ml
az group create -n absa -l westus2
az ml workspace create -w absa_space -g absa
```

또한 `az account list`를 실행하여 얻을 수 있는 구독 ID를 알고 있어야 합니다.

#### <a name="uploading-data-to-the-workspace"></a>작업 영역에 데이터 업로드

이 데모에서는 다음과 같은 몇 가지 데이터 세트를 사용합니다.
* 자동화된 ML 데모의 데이터 세트 - [clothing_automl.xlsx](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_automl.xlsx)
* 데모 3에 대한 전체 측면 기반 감정 분석 모델을 학습시키기 위한 대규모 데이터 세트 [clothing_absa_train.csv](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_absa_train.csv)
* 측면 기반 감정 분석 모델에 대한 소규모 디버깅 데이터 세트 [clothing_absa_train_small.csv](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_absa_train_small.csv)
* 모델을 테스트하는 별도의 유효성 검사 세트 [clothing-absa-validation.json](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing-absa-validation.json)

자동화된 ML 데모를 따르려면 데이터 세트를 작업 영역에 업로드하세요. [Azure ML Portal](http://ml.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40)을 통해 수동으로 수행하거나, 제공된 `upload_dataset.py` 파일(csv/xlsx 파일은 현재 디렉터리에 있어야 하며 구독에 따라 `[subscription_id]`를 대체해야 함)을 사용할 수 있습니다.

```shell
python upload_dataset.py -s [subscription_id] -w absa_space -g absa -f clothing_automl.xlsx
```

자동화된 ML 의류 데이터 세트는 데모 코드를 통해 AML 서비스 데이터 저장소로 업로드됩니다.

#### <a name="using-the-azure-ml-demo-code"></a>Azure ML 데모 코드 사용

모든 Jupyter Notebook 환경에서 데모 코드를 실행할 수 있습니다. 다음 옵션 중 하나를 사용할 수 있습니다.
 - **Python 환경 설치** 하단에 설명된 대로 Python 환경을 로컬로 설치합니다.
 - Azure ML 작업 영역 내에서 Jupyter Notebooks를 사용합니다. 이러한 작업을 하려면 다음을 수행합니다.
     - [Azure ML 포털](https://ml.azure.com/)로 이동합니다.
     - 왼쪽 메뉴에서 **Notebooks**를 선택합니다.
     - `absa.ipynb` 파일을 업로드하고 선택합니다.
     - **Notebook VM을 만들지** 묻는 메시지가 표시됩니다. 이제 포털에서 바로 Notebook을 사용할 수 있습니다.
 - [Azure Notebooks](https://docs.microsoft.com/azure/notebooks/azure-notebooks-overview/?wt.mc_id=absa-notebook-abornst)를 사용합니다. 이 경우 `absa.ipynb` 파일을 새 Azure Notebooks 프로젝트에 업로드해야 합니다. 또한 Azure Notebooks의 여유 컴퓨팅 제한(1GB 디스크 공간)으로 인해 [여기](https://docs.microsoft.com/azure/notebooks/use-data-science-virtual-machine/?wt.mc_id=msignitethetour2019-github-aiml40)에 설명된 것처럼 이 Notebook을 가상 머신에서만 실행할 수 있습니다. 

#### <a name="python-environment-installation"></a>Python 환경 설치

Azure Notebooks를 사용하지 않고 로컬 Python 환경을 사용하려는 경우에는 Python Azure ML SDK를 설치하고 Notebooks 및 contrib을 설치해야 합니다.

```shell
conda create -n azureml -y Python=3.6
source activate azureml
pip install --upgrade azureml-sdk[notebooks,contrib] 
conda install ipywidgets
jupyter nbextension install --py --user azureml.widgets
jupyter nbextension enable azureml.widgets --user --py
```

설치한 후에 Jupyter를 다시 시작해야 합니다. 자세한 지침은 [여기](https://docs.microsoft.com/azure/machine-learning/service/quickstart-create-workspace-with-python/?WT.mc_id=msignitethetour2019-github-aiml40)에 나와 있습니다.

시작하기 위한 평가판 계정이 필요한 경우 [여기](https://azure.microsoft.com/offers/ms-azr-0044p/?WT.mc_id=msignitethetour2019-github-aiml40)에서 받을 수 있습니다.

#### <a name="pre-creating-compute-cluster"></a>컴퓨팅 클러스터 미리 만들기

마지막 두 데모의 경우 컴퓨팅 클러스터가 필요합니다. 데모용으로 하나의 노드만 구성된 클러스터를 만들어 보겠습니다. 이 작업은 다음 세 가지 방법 중 하나로 수행할 수 있습니다.

1. [Azure ML Portal](http://ml.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40)을 통해 **컴퓨팅** 섹션으로 이동하고, *Standard_DS3_v2* VM을 사용하여 Azure ML 컴퓨팅 클러스터를 수동으로 만듭니다(노드 지정 번호=1). 클러스터 이름을 `absa-cluster`로 지정합니다.
2. 제공된 `create_cluster.py` 스크립트를 실행하여 위와 같은 매개 변수를 제공합니다.
```shell
python create_cluster.py -s [subscription_id] -w absa_space -g absa
```
3. 클러스터를 만들 `absa.ipynb` Notebook에서 처음 몇 개의 셀을 실행합니다.

## <a name="demos"></a>데모

### <a name="demo-1-text-analytics-cognitive-service"></a>데모 1: Text Analytics Cognitive Service

> 💡 데모를 시작하기 전에 [환경 설정](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#starting-fast)을 완료해야 합니다.

이 데모에서는 웹 인터페이스에서 구를 감정 분석할 수 Text Analytics 방법을 보여줍니다.

1. [Text Analytics 페이지](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)를 엽니다.
2. **작업에 표시** 섹션이 있는 아래로 스크롤하고 ‘런던 매장에서 구매한 도트 패턴 바지가 마음에 들었어요’ 구를 입력합니다(기본 구를 유지하고 요점을 보여줄 수도 있음). 
3. 다음 결과를 얻으려면 **분석**을 누릅니다.

![Azure Text Analytics의 스크린샷](images/analytics.png)

Text Analytics는 감정을 제공할 뿐만 아니라 텍스트에서 위치와 키워드를 추출합니다.

### <a name="demo-2-azure-automl"></a>데모 2: Azure AutoML

> 💡 데모를 시작하기 전에 [환경 설정](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#starting-fast)을 완료해야 합니다.

이 데모에서는 코딩을 수행하지 않고도 자동화된 ML을 사용하여 ML 모델을 빌드하는 방법을 보여줍니다.

1. [http://ml.azure.com](http://ml.azure.com/?WT.mc_id=msignitethetour2019-github-aiml40)의 Azure ML 작업 영역(위에서 만듦)으로 이동합니다.
2. **데이터 세트**로 이동 - 이전에 업로드한 데이터 세트가 표시되어야 합니다(clothing_automl.xlsx). 포털을 통해 여기에서 업로드할 수도 있습니다.
3. 데이터 세트를 선택합니다.
4. **개요** 탭에서 **샘플 사용량**을 펼치고, 필요한 경우 프로그래밍 방식으로 데이터에 액세스하는 데 사용할 수 있는 코드를 표시합니다.
5. **탐색** 탭에서 데이터를 확인합니다.
6. **자동화된 ML** 탭으로 이동하고 **새 실험**을 클릭합니다.
7. 사용할 실험 이름 및 컴퓨팅을 선택합니다.
8. 데이터 세트를 선택합니다.
9. 예측 작업의 형식인 **분류**를 선택합니다.
10. 대상 열(**등급**)을 선택합니다.
11. **시작**을 클릭합니다.

다양한 알고리즘을 조사하므로 실험을 수행하는 데 오랜 시간이 걸립니다. 데모를 표시하는 경우 이 작업을 미리 실행하고 결과를 표시하는 것이 좋습니다.

### <a name="demo-3-using-azure-ml-workspace-with-python-sdk"></a>데모 3: Python SDK와 함께 Azure ML 작업 영역 사용

> 💡 데모를 시작하기 전에 [환경 설정](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#starting-fast)을 완료해야 합니다.

이 데모에서는 Python Azure ML SDK를 사용하는 사용자 지정 Python 코드를 실행하고 ABSA (사용자 지정 측면 기반 감정 분석) 모델을 학습, 최적화 및 사용합니다.

데모의 이 부분에 대한 모든 지침은 Jupyter Notebook 자체에 포함되어 있습니다. 위에서 설명한 방법 중 하나를 사용하여 Notebook(Azure Notebooks 또는 로컬로)을 실행하고 여기에 있는 지침을 따르세요. 

## <a name="tear-down"></a>분해

데모 중에 사용되는 클라우드 리소스를 확보하려면 Azure ML 작업 영역 및 리소스 그룹을 삭제해야 합니다.

```shell
az ml workspace delete --w absa_space -g absa
az group delete -n absa
```

## <a name="presenter-resources"></a>발표자 리소스

이 콘텐츠를 표시하려면 [추가 발표자 리소스](README-Instructor.md)를 살펴보세요.

## <a name="resources-and-continue-learning"></a>리소스 및 지속적인 학습

### <a name="getting-started-series"></a>시리즈 시작

* [Azure Cognitive Services Text Analytics API](https://aka.ms/TextCogSvc)
* [자동화된 Machine Learning](https://aka.ms/AutomatedMLDoc)
* [하이퍼 매개 변수 튜닝](https://aka.ms/AzureMLHyperDrive)
* [Azure ML 서비스 및 Python SDK](https://aka.ms/AA3dzht) 

### <a name="other-materials"></a>기타 자료

* [프로덕션 Machine Learning에 대한 9가지 고급 팁](http://aka.ms/9TipsProdML)
* [Intel 측면 기반 감정 분석 페이지](https://www.intel.ai/introducing-aspect-based-sentiment-analysis-in-nlp-architect/)
* Azure ML 모범 사례 리포지토리:
    * [자연어 처리](https://github.com/microsoft/nlp/)
    * [Computer Vision](https://github.com/microsoft/ComputerVision)
    * [추천](https://github.com/microsoft/Recommenders)


## <a name="feedback-loop"></a>피드백 루프

의견, 피드백, 제안이 있으신가요? 현재 콘텐츠 변경/제안/피드백을 위한 최선의 피드백 루프는 이 GitHub 리포지토리에서 새로운 이슈를 생성하는 것입니다. 이슈 생성 방법에 대한 모든 세부 정보를 보려면 [기여](../../contributing.md) 문서를 참조하세요.
