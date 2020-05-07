# <a name="aiml20-speaker-notes"></a>AIML20: 발표자 노트

스크립팅된 텍스트 대신 글머리 기호로 작업하는 선호하는 경우 [presentations.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/presentations.md)에서 PPT 프레젠테이션 슬라이드의 주요 사항은 다음과 같습니다.

관련 데모 스크립트는 https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml20 에서 찾을 수 있습니다. `DEMO%20Setup.md`를 시작합니다.

## <a name="slide-notes"></a>슬라이드 노트

슬라이드는 제목만으로 식별됩니다.

### <a name="slide-microsoft-ignite-the-tour"></a>슬라이드: Microsoft Ignite 둘러보기

프레젠테이션 전 단계별 슬라이드

### <a name="slide-using-pre-built-ai-to-solve-business-problems"></a>슬라이드: 미리 빌드된 AI를 사용하여 비즈니스 문제 해결

본인 소개를 합니다.

컴퓨팅 리소스나 AI 전문 지식이 없는 경우에도 애플리케이션에 AI 기능을 추가하는 방법.

클라우드에서 미리 빌드된 AI 서비스 사용.

### <a name="slide-resources"></a>슬라이드: 리소스

많은 링크, 리소스 및 데모를 제공합니다.

여기의 링크에서 전체 소스 코드 및 앱에 대한 한 번 클릭 배포를 포함하여 모든 항목에 대한 링크를 제공합니다.

이 슬라이드는 끝부분에 다시 표시됩니다.

### <a name="slide-adding-humanlike-capabilities-to-apps"></a>슬라이드: 앱에 인간과 유사한 기능 추가

미리 빌드된 AI 서비스를 사용하여 애플리케이션에 인간과 유사한 기능을 추가할 것입니다. 이것은 무엇을 의미할까요? 자, 다음은 몇 가지 예입니다.

### <a name="slide-enhance-apps-with-humanlike-capabilities"></a>슬라이드: 인간과 유사한 기능을 사용하여 앱 향상

[클릭] 앱에 음성 기능(예: 채팅)을 부여하세요.
 
[클릭] 앱에 볼 수 있는 기능(이미지 파악)을 부여하세요.

[클릭] 앱에 인간 행동에 대한 직관력(인터페이스 적응)을 부여하세요.

[클릭] 앱에 이해력(어떤 언어로든 커뮤니케이션)을 부여하세요.

[클릭] 비정상적인 데이터 스트림을 검사하는 인간과 유사한 프로세스를 자동화하세요.

이는 몇 가지 예일 뿐입니다.

### <a name="slide-overview-of-azure-cognitive-services"></a>슬라이드: Azure Cognitive Services 개요

인간과 유사한 AI를 구현하는 데 대량의 데이터와 많은 기술 전문 지식이 필요하지 않나요?

아니요. Microsoft Research의 전문 지식을 활용하세요. 간단한 REST API 호출을 사용하여 기능을 추가합니다. 

이것이 바로 Azure Cognitive Services입니다.

### <a name="slide-azure-cognitive-services"></a>슬라이드: Azure Cognitive Services

Azure Cognitive Services는 20개 이상의 API를 포함합니다.

인간과 유사한 이 기능 범주 내의 서비스:

Vision: 사진, 그림, 텍스트, 필기 및 동영상의 콘텐츠 이해

음성: 음성을 이해 및 인식하며 사람처럼 자연스러운 음성을 생성하는 도구입니다.

언어: 작성된 문서와 텍스트의 콘텐츠를 이해하고 인간 언어로 번역합니다.

의사 결정: Azure Cognitive Services의 완전히 새로운 범주이며 데이터, 콘텐츠 및 애플리케이션 사용자 인터페이스에 대해 인간과 유사한 선택을 하는 관련 항목을 갖추고 있습니다.

검색: 구조화되지 않은 대규모 리포지토리의 콘텐츠에 대한 자연어 질문에 답변합니다. 

### <a name="slide-azure-cognitive-services-with-service-names"></a>슬라이드: Azure Cognitive Services(서비스 이름 포함)

“검색”은 이미 다루었습니다. 

소매 웹 사이트를 개선하기 위해 제공되는 다른 몇 가지 기타 서비스를 사용합니다. [클릭]

Computer Vision: 제품 사진의 콘텐츠를 분석하는 데 사용합니다.

Custom Vision: 소매점에서 판매하는 특정 제품을 식별하는 데 사용합니다.

Personalizer: 웹 사이트의 레이아웃을 자동으로 조정함 

그러나 Cognitive Services를 설정 및 사용하는 원칙은 모든 API에서 동일하므로 오늘 여기서 배우는 내용은 사용하려는 모든 AI 서비스에 적용됩니다.

### <a name="slide-computer-vision"></a>슬라이드: Computer Vision

먼저 Computer Vision용으로 미리 빌드한 AI를 살펴보겠습니다.

### <a name="slide-shop-by-photo"></a>슬라이드: Shop By Photo

하드웨어 소매점이자 가상 회사인 Tailwind Traders의 웹 사이트입니다. 

### <a name="slide-demo-shop-by-photo"></a>슬라이드: 데모: Shop by Photo

데모: “문제 정의: Shop by Photo가 중단되었습니다.”

### <a name="video-shop-by-photo"></a>동영상: Shop by Photo

Live Tailwind Traders 웹 사이트로 이동하겠습니다. [클릭]

AI 지원 기능 중 하나는 “Shop by Photo”라고 합니다. 고객이 구매할 수도 있는 제품의 사진을 업로드할 수 있도록 하는 이 기능은 제품이 제공되는지 앱에서 알려줍니다. 지금 사용해 보세요. 관심 있는 이 드릴 사진을 업로드하면 Tailwind Traders 앱이 사진을 분석하고 드릴임을 인식합니다. 그런 다음 Tailwind Traders가 판매하는 드릴과 매장에서 찾을 수 있는 위치를 보여줍니다.

다른 사진으로 시도해봅시다. 홈페이지로 돌아가서 “Shop by Photo” 기능을 다시 사용하고 이번에는 플라이어 한 개를 선택합니다. 안타깝지만 이번에는 앱이 해당 사진을 분석한 후 망치로 인식합니다. 확실히 재대로 작동하지 않습니다. 이제 무엇이 잘못되었는지 파악하고 Computer Vision을 사용하여 문제를 해결하는 방법을 찾아보세요. 

### <a name="slide-how-computer-vision-works"></a>슬라이드: Computer Vision 작동 방식

이제 이론을 약간 살펴보겠습니다. 수치 연산과 관련된 부분이 많지는 않습니다.

문제점과 해결 방법을 이해하는 데 도움이 될 것입니다.

### <a name="slide-tasks-xkcd-comic"></a>슬라이드: 작업(XKCD 만화)

(10초 일시 중지)

사진을 파악하는 컴퓨터는 말 그대로 공상 과학 소설에 나오는 소재였습니다.

5년이 지난 현재, 이 컴퓨터는 실현되었을 뿐 아니라 쉽게 작업을 수행합니다.

### <a name="slide-how-neural-networks-work-brandon-rohrer"></a>슬라이드: 신경망 작동 방식(Brandon Rohrer)

Brandon Rohrer의 허가하에 수정되었습니다.

AI 및 기계 학습의 여러 측면에 대한 자세한 설명과 함께 동영상 자습서 시리즈에 대한 Brandon의 블로그를 살펴보세요. 

### <a name="slide-computer-vision--convolutional-neural-network"></a>슬라이드: Computer Vision/나선형 신경망

AI는 “딥 러닝”을 통해 작동되지만 “딥”이 “심오함”을 가리키는 것은 아닙니다.

단순한 NN입니다. 실제 단어에는 더 많은 레이어가 있습니다.

5개의 개체만 감지하도록 설계되었습니다. 그 외는 인식할 수 없습니다.

### <a name="slide-trained-convolutional-nn"></a>슬라이드: 학습된 나선형 NN

입력 이미지가 왼쪽으로 이동합니다. 

각 노드는 원래 이미지를 처리하고 다시 결합하여 분류 신뢰도라는 단일 값이 될 때까지 축소합니다.

여기서 입력은 자전거이며 최대값이 있는 오른쪽의 노드는 “자전거”입니다. 이미지가 올바르게 식별되었습니다.

### <a name="slide-filters-1"></a>슬라이드: 필터(1)

시간을 건너뜁니다.

### <a name="slide-filters-2"></a>슬라이드: 필터(2)

시간을 건너뜁니다.

### <a name="slide-filters-3"></a>슬라이드: 필터(3)

시간을 건너뜁니다.

### <a name="slide-training-an-image-classifier"></a>슬라이드: 이미지 분류자 학습

그렇다면 이 작업을 수행하기 위해 NN을 어떻게 학습시키나요?

[클릭] 오른쪽 필터를 선택합니다. 각 필터는 작은 가중치 그리드(일반적으로 3x3 또는 5x5)로 제어됩니다.

[클릭] 분류가 알려진 많은 학습 이미지를 사용하여 가중치를 선택합니다. 올바른 분류를 선택하도록 가중치를 선택합니다(또는 적어도 대부분의 시간).

실제 시각 네트워크에서는 수백만 개의 가중치를 선택할 수 있습니다. 가중치는 어떻게 결정할까요?

### <a name="slide-learning-backpropagation"></a>슬라이드: 학습: 역전파

심도 있는 수치 연산이 관련됩니다.

그러나 AI 엔지니어가 아니라면 걱정하지 않아도 됩니다. 다른 사용자들이 최적화한 가중치가 있는 네트워크만 사용하면 됩니다.

아마도 애플리케이션의 약 80%를 차지할 것입니다. 그러나 자체 NN을 설계하고 가중치를 최적화해야 하는 경우 Tensorflow 및 PyTorch와 같은 도구가 있습니다. AIML40 및 AIML50에서 이에 대해 알아봅니다.

### <a name="slide-pre-trained-convolutional-nn"></a>슬라이드: 미리 학습된 나선형 NN

그러나 필요한 이미지를 감지할 수 있는 NN에 액세스할 수 있으면 이미지만 제공할 수 있으며 네트워크에서 해당 이미지를 분류합니다.

일부 모델은 분류뿐만 아니라 개체 위치를 감지하거나 다른 방식으로 이미지를 분석할 수도 있습니다.

### <a name="slide-demo-cognitive-services-computer-vision"></a>슬라이드: 데모: Cognitive Services Computer Vision

Cognitive Services Computer Vision은 수천 개의 개체를 분류할 수 있는 강력한 NN을 제공합니다.

aka.ms/try-computervision에서 사용할 수 있는 간단한 웹 기반 UI를

지금 사용해봅시다.

### <a name="video-computer-vision-via-web"></a>동영상: 웹을 통한 Computer Vision

[클릭] Cognitive Services Computer Vision 페이지입니다. 해당 페이지에서 약간 아래로 스크롤하면 웹 또는 로컬 파일로 분석할 이미지를 업로드할 수 있는 멋진 웹 기반 양식을 찾을 수 있습니다. 이제 안전모를 착용한 사람이 있는 사진을 업로드해 보겠습니다. 단 몇 초면 Computer Vision 서비스를 통해 해당 사진이 분석됩니다. 왼쪽에는 이미지에서 감지된 개체가 표시되고 오른쪽에는 세부 분석이 포함된 JSON 출력이 표시됩니다. 여기에는 이미지에서 감지된 개체의 이름과 위치, 이미지와 관련된 태그 또는 레이블 목록, 이미지에 대한 쉬운 설명(이 경우 "헬멧을 착용한 사람") 및 기타 유용한 정보가 포함됩니다.

### <a name="slide-cognitive-services-computer-vision"></a>슬라이드: Cognitive Services Computer Vision

개체 검색: 두 개의 개체인 안전모와 사람이 감지되었습니다.

태그를 확인합니다. 최고 신뢰도: 사람 다음은 머리쓰개입니다. 헬멧은 6번째입니다.
모델은 “안전모”에 대해 구체적으로 학습되지 않았습니다.

잠시 후에 이 문제를 해결하는 방법을 알아보겠습니다.

앱에 시각을 통합하려면 프로그래밍 방식으로 API에 액세스할 수 있습니다. 그럼 방법을 살펴보겠습니다.

### <a name="video-computer-vision-via-cli"></a>동영상: CLI를 통한 Computer Vision

HTTP 엔드포인트에 연결할 수 있는 언어를 사용하여 Cognitive Service API에 인터페이스할 수 있지만 여기[클릭]에 있는 것은 Azure CLI를 사용하여 리소스를 만들고, “curl”을 사용하여 Computer Vision API에 연결하는 Bash 스크립트입니다. 로컬 셸에 Azure CLI를 설치할 수 있지만 여기서는 Visual Studio Code의 “Azure 계정” 확장을 사용하여 Cloud Shell을 시작하므로 아무것도 설치할 필요가 없습니다. 셸이 준비되면 이 Bash 스크립트에서 직접 명령을 실행할 수 있습니다. 

이 첫 번째 명령은 API를 인증하는 데 필요한 키를 보유하기 위해 사용할 리소스 그룹을 만듭니다.

다음 단계에서는 키를 만듭니다. 여기서는 Computer Vision을 비롯한 많은 서비스에서 사용할 수 있는 일괄 Cognitive Services 키를 만듭니다.

그러면 터미널에서 키를 직접 표시할 수 있습니다. [대기] 이러한 키 중 하나를 사용하여 API와 인터페이스할 수 있으므로 여기에서 첫 번째 키를 환경 변수에 저장합니다.

해당 키를 사용하여 Computer Vision 서비스에서 제공하는 엔드포인트 URL에 연결할 수 있으므로 환경 변수에도 이 URL을 저장하겠습니다.

그러면 분석할 이미지를 선택할 수 있습니다. 여기서는 이미지의 URL을 제공합니다. 잠시 전에 본 안전모를 착용한 사람 이미지와 같습니다.

이제 curl을 사용하는 JSON 입력을 전달하여 키 및 이미지 URL을 엔드포인트로 전달할 수 있습니다. 몇 밀리초 안에 JSON으로 이미지 분석을 다시 받을 수 있습니다. 잠시 전에 웹 인터페이스에서 본 것과 동일한 출력을 볼 수 있습니다.

물론 원하는 이미지를 사용하여 이 작업을 수행할 수도 있습니다. 다른 이미지(이 경우 드릴 사진)를 사용하여 다시 시도해 보겠습니다. 다시 강조하지만, curl을 사용하는 API에 이미지를 전달할 수 있습니다. [대기] 흥미로운 점은 이 이미지와 관련된 상단 태그는 “카메라”인데, 안타깝게도 실제 도구를 검색하는 데는 도움이 되지 않습니다. 우리는 “드릴”을 원하기 때문이죠.

### <a name="slide-adapting-computer-vision-models-with-your-own-data"></a>슬라이드: 사용자 고유의 데이터를 사용하여 Computer Vision 모델 적용

Computer Vision API는 Shop by Photo에서 작동하지 않습니다. 

너무 많은 종류의 개체를 감지하도록 학습되었습니다.

다행히 이 문제는 해결할 수 있습니다. 잠시 후에 해당 이론을 다시 살펴보겠습니다.

수천 개의 개체에 대해 모델을 조정하고 원하는 개체만 감지하도록 조정하는 방법이 있습니다. 원본 모델에 속하지 않는 경우에도 마찬가지입니다. 

전이 학습이라고 하는 AI 기술을 사용하는 방법을 알아보겠습니다. 

### <a name="slide-transfer-learning"></a>슬라이드: 전이 학습

이전과 동일한 CNN으로, 마지막 레이어가 제거된 상태입니다.

마지막에서 두 번째 레이어는 숫자의 벡터로 간주하는 “기능”을 제공합니다. 각 이미지는 다른 기능 세트를 생성합니다.

기능이 나타내는 항목을 알 수는 없지만 일반적으로 이미지 분류에 유용합니다.

요령: 이러한 기능을 사용하여 새 개체 세트를 분류할 수 있습니다.

### <a name="slide-transfer-learning-training-1---with-the-hammer"></a>슬라이드: 전이 학습(1 - 망치 포함)

전이 학습을 사용하여 망치와 안전모를 식별하는 모델을 만듭니다.

망치 그림을 전달하고 기능 및 “망치”의 이진 표시기를 수집합니다. 망치가 많은 경우 이 작업을 반복합니다.

### <a name="slide-transfer-learning-training-2---with-the-white-hard-hat"></a>슬라이드: 전이 학습(2 - 흰색 안전모 포함)

이제 안전모 사진을 사용하여 동일한 작업을 수행합니다.

각 경우에도 개별 이미지에 대한 8개의 데이터 벡터와 이진 표시기를 수집합니다.

모두 합치면 각 항목이 이진 결과와 관련된 데이터 벡터 컬렉션입니다. 

이를 통해 간단한 예측 모델을 만들 수 있습니다.

### <a name="slide-transfer-learning-trained-model"></a>슬라이드: 전이 학습이 학습된 모델

이 기능은 놀랍게도 제대로 작동됩니다.

이미지 또는 컴퓨팅 기능이 많이 필요하지 않습니다.

이것은 모형 예시지만 원칙은 큰 모델에도 적용됩니다.

### <a name="slide-microsoft-cognitive-services-custom-vision"></a>슬라이드: Microsoft Cognitive Services Custom Vision

전이 학습 모델을 직접 학습시키지 않아도 됩니다.

Microsoft의 미리 학습된 시각 모델 중 하나를 사용하고 Custom Vision으로 사용자 고유의 개체 이미지에 맞게 조정합니다.

지금 사용해 봅시다. Shop by Photo에 대한 시각 모델을 빌드해 보겠습니다.

### <a name="slide-demo-customized-object-recognition"></a>슬라이드: 데모: 사용자 지정 개체 인식

데모 지침: https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Custom%20Vision.md

### <a name="video-customvisionai"></a>동영상: customvision.ai

[클릭] 자, 여기 Custom Vision 웹 기반 인터페이스가 있습니다. 여기에서는 전이 학습 분석을 위한 새 이미지를 제공할 수 있는 멋진 UI를 제공합니다. 이 프로젝트에서 많은 사진을 이미 업로드한 것을 확인할 수 있습니다. 내 사용자 지정 모델을 학습시키는 데 사용할 스크루드라이버, 플라이어, 드릴 및 망치 사진을 업로드했습니다. 또한 Tailwind Traders가 판매하는 다른 제품 중 하나인 안전모도 감지하려고 합니다. “이미지 추가”를 클릭하고 몇 장의 안전모 사진을 수집한 내 하드 드라이브의 폴더로 이동하여 모든 항목을 선택하고, 학습에 사용할 “안전모” 레이블을 제공하는 동안 서비스에 추가해 보겠습니다.

이러한 파일을 업로드하는 데 몇 분 정도 걸리지만 이 작업을 수행하는 동안 이 프로젝트에는 이미지가 그다지 많지 않습니다(약 180개 또는 5개 범주 각각에 대해 수십여 개). 경우에 따라 더 적을 수도 있습니다. 그럼에도 5가지의 내 개체 형식이 매우 고유하기 때문에 모델이 매우 잘 작동됩니다.

계속해서 [학습] 단추를 클릭하여 전이 학습을 시작하겠습니다. [빠른 학습]을 선택합니다. 이제 복잡한 시각 모델을 통해 모든 이미지를 실행하고, 전이 학습을 사용하여 5가지 범주에 대한 예측 모델을 만듭니다. 이 작업은 단 몇 초면 완료되며 모델도 매우 잘 작동됩니다.
확률 임계값은 분류를 전혀 예측하지 않을 제한을 설정합니다. 신뢰도가 50% 이상인 분류만 수락하는 경우 해당 예측의 90.9 %가 정확합니다. 이것이 “정밀도”입니다. 모델은 전체 이미지의 88.2%를 정확하게 분류합니다. 즉, “재현율”이라고 합니다. 앱에서 잘못된 호출을 수행하는 것과 호출을 전혀 수행하지 않는 것을 비교한 허용 오차에 따라 임계값을 선택합니다. Tailwind Traders의 경우 고객에게 잘못된 제품을 제안하는 것은 그리 큰일은 아니기 때문에 낮은 기준의 임계값을 설정할 수 있습니다. 암 감지 앱인 경우에는 다른 호출을 할 가능성이 높습니다.

이제 이전에 확인되지 않은 몇 가지 새 이미지에 대한 모델을 사용해 보겠습니다. "빠른 테스트" 단추를 클릭하여 이 작업을 수행합니다. “test images” 폴더에서 새 파일을 업로드합니다. 안전모를 착용한 사람 사진을 사용해 보겠습니다. 그러면 예측에서 99.9% 확률의 “안전모”라는 것을 확인할 수 있으므로 선택하는 거의 모든 임계값을 사용하여 호출을 수행합니다.

다른 이미지(드릴)를 사용해 보겠습니다. 모델은 94.5% 확률의 드릴로 이미지를 식별합니다. 마지막으로 99.9% 신뢰도로 식별되는 플라이어 사진을 사용해 보겠습니다.

따라서 모델은 200개 미만의 이미지에 대해 학습된 경우에도 잘 작동됩니다.
이는 Tailwind Traders에서 판매하는 제품에만 잠재적 레이블을 제한했기 때문입니다.

이제 모델이 만족스러우므로 해당 모델을 내보내 앱에 통합할 수 있습니다. [내보내기] 단추를 클릭하면 iOS 또는 Android용 모델을 컨테이너로 또는 유니버설 ONNX 형식으로 내보낼 수 있습니다. 하드 드라이브에 모델을 다운로드했습니다.

### <a name="slide-portable-deep-learning-models"></a>슬라이드: 이식 가능 딥 러닝 모델

사용자 지정 모델을 ONNX 형식으로 내보냈습니다.

ONNX(Open Neural Network Exchange)는 AI 모델의 무료 교환 및 배포를 촉진하고, 광범위한 애플리케이션 및 기술 공급업체에서 지원하는 Microsoft 및 Facebook에서 시작한 개방형 표준입니다.

ONNX Runtime을 사용하여 내보낸 모델을 웹 사이트에 통합했습니다.

### <a name="slide-onnximagesearchtermpredictorcs"></a>슬라이드: ONNXImageSearchTermPredictor.cs

InferenceSession은 내보낸 .onnx 파일을 참조합니다.

모델은 검색에 전달되는 분류 레이블을 생성합니다.

### <a name="slide-demo-onnx"></a>슬라이드: 데모: ONNX

데모: ONNX 배포

### <a name="video-kudu"></a>동영상: Kudu

[클릭] Custom Vision에서 방금 내보낸 모델은 실제 ONNX 파일인 model.onnx를 포함하는 ZIP 파일이며, 방금 만든 신경망의 텍스트 표현이자 매니페스트 파일입니다. 

기존의 Tailwind Traders 웹 사이트는 이미 products.onnx라는 ONNX 파일로 표시되는 Computer Vision 모델을 사용합니다. 문제는 이 모델이 Tailwind Traders에서 판매하는 많은 제품을 제대로 인식하지 못한다는 것입니다. Custom Vision에서 방금 내보낸 model.onnx 파일 이름을 products.onnx로 바꾸고 웹앱에서 교체하므로 학습시킨 5개의 제품을 Shop by Photo가 모두 인식할 수 있습니다.

Azure Portal에서는 Tailwind Traders 웹 사이트를 실행하는 App Service 리소스를 볼 수 있습니다. 현재 이 App Service 내에서 수행할 수 있는 작업을 알아보려면 [개발 도구] 섹션으로 이동하여 [고급 도구] 기능을 선택합니다. 그러면 Kudu 인터페이스가 시작됩니다. 시작되면 디버그 콘솔을 사용하여 웹 사이트 파일 시스템을 탐색할 수 있습니다. Products.onnx 파일이 있는 사이트, W 루트, 독립 실행형, OnnxModels로 이동하겠습니다. 이제 Custom Vision을 사용하여 만든 새 버전의 products.onnx 파일로 바꿀 수 있습니다.

App Service로 돌아가면 웹 서버를 다시 시작할 수 있습니다. 그러면 이 웹 서버에서 Shop by Photo 기능의 새 ONNX 모델을 사용할 수 있습니다.

### <a name="video-netron"></a>동영상: Netron

[클릭] 웹 사이트가 다시 시작되기를 기다리는 동안 방금 설치한 ONNX 모델을 살펴보겠습니다. Lutz Roeder의 Netron이라는 멋진 웹앱이 있습니다. 이 웹앱을 통해 ONNX 파일의 신경망을 검사할 수 있습니다. 계속해서 해당 products.onnx 파일을 엽니다. 여기에서 모델이 나타내는 신경망의 실제 레이어를 확인할 수 있습니다. 조금 더 확대하여 상단의 입력을 살펴보겠습니다. 입력은 이미지입니다. 224x224 픽셀 크기의 3레이어 RGB 이미지입니다. 사실 ONNX 런타임에 이미지를 제공하기 전에 사용자가 제공한 이미지를 자르고 축소해야 했습니다. Computer Vision 시스템의 시각이 다소 부실하다는 것은 감추고 싶은 비밀입니다. 이미지 해상도가 매우 낮지만 그럼에도 여전히 잘 작동됩니다.

이제 네트워크를 축소하고 스크롤하겠습니다. 이 설명의 앞부분에서 배운 것처럼 Custom Vision으로 생성된 신경망의 모든 레이어를 볼 수 있습니다. 각 레이어는 입력 이미지를 변환하고, 필터를 적용하며 출력 이미지를 다시 결합합니다. 그러나 마지막에 출력 레이어를 살펴보면 출력이 5가지 값, 즉 우리가 학습시킨 5가지 제품(망치, 안전모 등) 목록이라는 것을 알 수 있습니다. 이 목록은 모델이 각 범주에 대해 예측하는 신뢰도인 “손실”이라는 레이블이 함께 제공됩니다. 앱에서 신뢰도를 높이는 데 필요한 고유한 임계값을 선택합니다.

이제 Tailwind Traders 웹 사이트가 다시 시작되었으므로 홈페이지로 돌아가 새로운 시각 모델의 작동 방식을 알아보겠습니다. 계속해서 사진을 업로드하고 테스트 이미지 중 하나를 다시 시도하겠습니다. 특히 이전에 제대로 작동하지 않았던 플라이어 이미지를 살펴보겠습니다. 실제로는 웹 사이트에서 망치라고 생각하기보다는 “플라이어”를 검색하여 제공되는 모든 제품을 보여주었습니다.

### <a name="slide-optimizing-app-ui-with-cognitive-services-personalizer"></a>슬라이드: Cognitive Services Personalizer를 사용하여 앱 UI 최적화

하나 이상의 간단한 예시 시간: Personalizer.

“Personalizer” 서비스를 통해 사용자 동작을 학습하여 실시간으로 앱 인터페이스를 사용자 지정할 수 있습니다.

### <a name="slide-recommended-screenshot"></a>슬라이드: 권장(스크린샷)

권장 섹션에는 몇 개의 작은 이미지와 결합된 하나의 큰 “주인공” 이미지가 표시됩니다.

Personalizer는 표시되는 주문 섹션을 선택합니다.

“보충 학습”이라는 AI 기술을 사용합니다.

### <a name="slide-personalizer-in-action"></a>슬라이드: 작동 중인 Personalizer

Personalizer는 수년에 걸쳐 Microsoft에서 개발되었습니다. 

XBox와 Bing 및 MSN 뉴스에서 사용됩니다.

이제 자신의 앱에서도 Personalizer를 사용할 수 있습니다.

### <a name="slide-reinforcement-learning"></a>슬라이드: 보충 학습

Personalizer는 보충 학습이라는 AI 기술을 구현합니다. 작동 방식은 다음과 같습니다.

[클릭] 사용자에게 “주인공” 작업을 표시한다고 가정해 보겠습니다. [클릭] 사용자는 다음에 수행할 작업을 모를 수도 있어[클릭] 몇 가지 제안 중 하나를 표시해줄 수 있습니다. 게임 앱의 경우[클릭] “게임 플레이”, “영화 시청” 또는 “클랜 참여”를 표시할 수 있습니다. [클릭] Personalizer 서비스는 해당 사용자의 기록 및 기타 컨텍스트 정보(예: 위치, 시간 및 요일)를 기반으로[클릭] 가능한 작업 순위를 매기고[클릭] 장려하는 최적의 작업을 제안합니다[클릭]. 

사용자가 만족하기를 바라지만[클릭] 어떻게 확신할 수 있을까요? 이는 사용자가 다음에 수행하는 작업 및 사용자가 수행하길 바랐던 작업 여부에 따라 달라집니다.
비즈니스 논리에 따라,[클릭] 다음에 발생할 작업에 0과 1 사이의 “보상 점수”를 할당합니다. 예를 들어 게임을 플레이하는 데 더 많은 시간을 할애하거나, 문서를 읽거나, 스토어에서 더 큰 비용을 지출하면 보상 점수가 높아질 수 있습니다. [클릭] Personalizer는 다음번에 활동을 추천해야 할 때 해당 정보를 순위 시스템에 다시 제공합니다.

### <a name="slide-discovering-patterns-and-causality"></a>슬라이드: 패턴 및 인과 관계 검색

추천 시스템일 뿐입니다.

탐색 모드는 지정하는 속도로 기타 옵션을 표시합니다.

실시간 A/B 테스트와 비슷합니다.

### <a name="slide-personalizer-for-tailwind-traders"></a>슬라이드: Tailwind Traders용 Personalizer

컨텍스트: 시간, 요일 및 브라우저 OS  

보상 점수: 추천 범주를 클릭하면 1이고, 클릭하지 않으면 0입니다.

탐색 빈도: 20%

### <a name="slide-demo-personalizer"></a>슬라이드: 데모: Personalizer

[클릭] 이제 작동 중인 Personalizer를 살펴보겠습니다. Tailwind Traders 홈페이지로 돌아갑시다. 앞에서 언급하지 않은 내용은 이 권장 섹션에서 제품 부서의 주문은 Personalizer에 의해 결정된다는 것입니다.
이 경우에는 전기 부서를 주인공 이미지로 제시합니다. 또한 웹 사이트를 몇 번 새로 고치면 “탐색” 동작을 볼 수 있습니다.
현재 Personalizer는 여기에서 지금 내가 사용 중인 브라우저와 운영 체제를 사용하여 Garden Center가 익명 사용자로부터 최고의 참여도를 얻는다고 판단하지만 결국은 다른 범주를 시도하게 됩니다. 여기서 배관이 생겼으며 Personalizer는 이를 사용하여 참여도를 측정할 것입니다.

### <a name="slide-pre-built-ai-in-production"></a>슬라이드: 프로덕션 환경의 미리 빌드된 AI

AI를 프로덕션으로 전환하기 위한 몇 가지 고려 사항을 요약합니다.

### <a name="slide-cost-considerations"></a>슬라이드: 비용 고려 사항

첫 번째 고려 사항: 비용. 

Azure를 처음 사용하세요? 이 링크를 사용하여 등록하고 무료 크레딧으로 200 달러를 받으세요.

[클릭] 일반적으로 무료인 개발-확장 워크로드 

[클릭] 요금이 부과될 프로덕션 볼륨

[클릭] 이 링크에서 서비스 및 지역별 특정 세부 정보

### <a name="slide-data-considerations"></a>슬라이드: 데이터 고려 사항

데이터가 사용될 위치와 사용 방법을 고려해 보세요.

데이터는 유추를 위해 업로드되지만 사용 후 즉시 삭제됩니다. 이 링크의 세부 정보입니다.

대역폭이 이슈이거나 데이터가 규제된 경우 컨테이너를 고려하세요.

### <a name="slide-deployment-with-containers"></a>슬라이드: 컨테이너를 사용한 배포

일부 서비스는 다운로드할 수 있는 컨테이너에서 사용할 수 있습니다.

방화벽 뒤에 컨테이너를 설치하면 Microsoft로 이동되는 데이터가 없습니다.

인터넷 연결은 요금 청구 시에만 사용됩니다. 일반 요금으로 청구됩니다.

### <a name="slide-ethical-considerations"></a>슬라이드: 윤리적 고려 사항

가장 중요한 슬라이드입니다.

AI 앱이 사람들에게 영향을 미치는 윤리적 의미를 이해합니다.

윤리적 프레임워크를 포함합니다.

인간이 이미 수행하고 있는 일에서 더 높은 성과를 거둘 수 있도록 ‘지원’합니다(사람을 대체하지 않음). 

모든 사람이 애플리케이션에서 동일한 혜택을 받을 수 있도록 모든 유형의 사용자를 ‘포함’합니다. 

공정하고 투명해야 합니다.

AI는 학습된 데이터만큼만 유용하는 점을 기억합니다. 애플리케이션이 잠재적인 모든 사용자에게 작동되도록 해야 합니다.

윤리적 프레임워크를 설정하지 않은 경우 좋은 시작점은 인공 지능에 대한 Microsoft의 자체 원칙이며 이 링크에서 자세한 내용을 살펴볼 수 있습니다.

### <a name="slide-wrapping-up"></a>슬라이드: 요약

미리 빌드된 모델이 모든 작업을 수행할 수 있는 것은 아니지만 사용자가 편리하게 작업할 수 있도록 지원합니다. 

AI는 데이터를 기반으로 합니다. 항상 데이터를 염두에 두고 어떤 문제가 발생할 수 있는지 확인하세요.

사용해 보세요! 많은 전문 지식이 필요하지는 않지만 윤리적 영향을 고려해야 합니다.

### <a name="slide-docs-alert"></a>슬라이드: 문서 알림

시작 가이드 및 참조를 포함하는 Azure Cognitive Services에 대한 모든 세부 정보를 보려면 Microsoft Docs를 확인하세요.

### <a name="slide-ms-learn-alert"></a>슬라이드: MS 학습 알림

또한 Cognitive Services를 사용하는 방법을 알아보려면 단계별로 안내하는 Microsoft Learn에 대한 무료 과정이 있습니다.

### <a name="slide-resources"></a>슬라이드: 리소스

Github 리포지토리의 모든 링크 및 코드입니다.

AI 또는 데이터 과학 분야에서 Microsoft Certification을 받으려면 오늘 참석자를 위해 제공하는 특수한 무료 자격 획득 기회를 확인하세요. 자세한 내용은 이 링크에서 확인할 수 있습니다.

언제든지 답변을 드릴 준비가 되어 있습니다. (및...)

감사합니다.
