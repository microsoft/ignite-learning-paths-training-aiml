# <a name="using-pre-built-ai-to-understand-images"></a>미리 빌드한 AI를 사용하여 이미지 이해

> 💡 데모를 시작하기 전에 [설정](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md)을 완료해야 합니다.

이 데모에서는 Azure Computer Vision을 사용하여 이미지가 나타내는 개체 형식을 감지합니다. 

먼저 Computer Vision 온라인 웹 양식을 사용하여 이미지를 업로드하고 결과를 관찰합니다.

그런 다음, Computer Vision API를 사용하여 curl을 통해 동일한 정보를 프로그래밍 방식으로 수집합니다.

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>문제 정의: Shop by Photo가 제대로 작동하지 않습니다.

이 설명의 원인이 되는 문제는 Tailwind Traders 웹 사이트의 Shop by Photo 도구가 제품을 올바르게 식별하지 못한다는 것입니다. 이 시점에서 [ONNX 배포](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)의 이 섹션을 실행하여 장면을 설정하는 것이 유용합니다.

## <a name="using-computer-vision-via-the-web-interface"></a>웹 인터페이스를 통해 Computer Vision 사용

하드웨어 제품 그림에서 Computer Vision을 사용해 보겠습니다. Tailwind Traders가 판매하는 제품을 이름으로 식별할 수 있으면 “Shop by Photo” 앱의 카탈로그에서 해당 이름을 검색할 수 있습니다.

1. [https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=msignitethetour2019-github-aiml20)에서 Computer Vision 웹 페이지를 방문하세요.

2. “이미지 분석” 섹션이 있는 아래로 스크롤합니다. 다음과 같이 표시됩니다.

![“Computer Vision: 이미지 분석”](img/Computer%20Vision%20Analyze%20an%20Image.png)

3. “찾아보기” 단추를 클릭하고 “CV 학습 이미지”의 “테스트 이미지” 폴더에서 “man in hardhat.jpg”를 선택합니다.

4. 잠시 후 오른쪽 창에 이미지 분석이 표시됩니다. 다음과 같이 표시됩니다.

```
FEATURE NAME:   VALUE

Objects [ { "rectangle": { "x": 138, "y": 27, "w": 746, "h": 471 }, "object": "headwear", "confidence": 0.616 }, { "rectangle": { "x": 52, "y": 33, "w": 910, "h": 951 }, "object": "person", "confidence": 0.802 } ]

Tags    [ { "name": "man", "confidence": 0.999212 }, { "name": "headdress", "confidence": 0.99731946 }, { "name": "person", "confidence": 0.995057464 }, { "name": "clothing", "confidence": 0.991814733 }, { "name": "wearing", "confidence": 0.9827137 }, { "name": "hat", "confidence": 0.9691986 }, { "name": "helmet", "confidence": 0.9227209 }, { "name": "headgear", "confidence": 0.840476155 }, { "name": "personal protective equipment", "confidence": 0.8358513 }, { "name": "looking", "confidence": 0.832229853 }, { "name": "hard hat", "confidence": 0.8004248 }, { "name": "human face", "confidence": 0.785058737 }, { "name": "green", "confidence": 0.774940848 }, { "name": "fashion accessory", "confidence": 0.706475437 } ]

Description { "tags": [ "man", "headdress", "person", "clothing", "wearing", "hat", "helmet", "looking", "green", "jacket", "shirt", "standing", "head", "suit", "glasses", "yellow", "white", "large", "phone", "holding" ], "captions": [ { "text": "a man wearing a helmet", "confidence": 0.8976638 } ] }

Image format    "Jpeg"

Image dimensions    1000 x 1000

Clip art type   0

Line drawing type   0

Black and white false

Adult content   false

Adult score 0.0126242451

Racy    false

Racy score  0.0156497136

Categories  [ { "name": "people_", "score": 0.69140625 } ]

Faces   [ { "age": 37, "gender": "Male", "faceRectangle": { "top": 419, "left": 363, "width": 398, "height": 398 } } ]

Dominant color background   "White"

Dominant color foreground   "White"

Accent Color    #90A526
```

(참고: 위의 분석은 추후 변경될 수 있습니다. Computer Vision 모델은 정기적으로 업데이트됩니다.)

첫 번째 “개체” 결과에서 두 가지 개체인 “모자”와 “사람”이 감지되고 이미지의 해당 위치가 지정됩니다. 감지할 개체는 “모자”로 분류되지만 애플리케이션의 경우 “안전모”와 같이 더욱 구체적인 분류가 필요합니다. 그러나 “안전모”는 Computer Vision에서 현재 감지하는 개체 형식이 아닙니다. (이 문제는 나중에 Custom Vision으로 해결함) 또한 각 개체 분류에 대해 신뢰 점수가 제공됩니다.

두 번째 “태그” 결과는 전체 이미지와 관련된 레이블 목록을 제공합니다. 신뢰도가 가장 높은 태그(먼저 나열됨)는 “사람”이며, 그다지 도움이 되지는 않습니다. 두 번째 태그 “머리쓰개”는 찾는 결과와 정확히 일치하지 않습니다.

기타 응답도 흥미롭지만 이러한 응답은 데모에서 다루지 않습니다. 하지만 무엇이 포함되어 있는지 한 번 살펴보세요.

* 설명 필드에서 사진의 캡션(“헬멧을 착용한 사람”)입니다.

* 이미지 기능(흑백 및 선 그리기 여부)

* 이미지에서 감지된 얼굴에 대한 세부 정보(이 경우 37세 남성으로 식별됨)

* 이미지 콘텐츠의 점수: “성인” 또는 “외설” 콘텐츠인가요?

* 이미지의 색 분석: 주조 전경, 강조 및 배경색

Microsoft는 목적에 부합하는 “태그” 필드에만 관심이 있으므로 다음 섹션에서는 프로그래밍 방식으로 추출하는 방법을 알아보겠습니다.

## <a name="using-computer-vision-via-the-api"></a>API를 통해 Computer Vision 사용

[해당 REST API를 사용하여 프로그래밍 방식으로 Computer Vision을 제어](https://docs.microsoft.com/en-us/azure/cognitive-services/computer-vision/vision-api-how-to-topics/howtocallvisionapi?WT.mc_id=msignitethetour2019-github-aiml20)할 수 있습니다.
웹에 대한 액세스 권한이 있는 모든 언어 또는 애플리케이션에서 이 작업을 수행할 수 있지만, URL과 상호 작용하고 해당 출력을 수집하기 위해 일반 명령줄 애플리케이션인 [curl](https://curl.haxx.se/)을 사용합니다. 이 애플리케이션은 대부분의 Linux 배포 및 최신 버전의 Windows 10(1706 이상)에 미리 설치되어 제공됩니다. 

[`vision_demo.sh`](vision_demo.sh) 파일에서 명령을 실행합니다. 로컬 Azure CLI 또는 Azure Cloud Shell을 사용할 수 있지만, bash를 셸로 사용해야 합니다.

이 스크립트의 명령은 다음 작업을 수행합니다.

1. Azure 구독에 로그인합니다(Cloud Shell을 사용하는 경우 이 단계는 필요하지 않음).
2. Azure 리소스 그룹 만들기
3. Cognitive Service 키를 만듭니다. (참고: 이 키는 나중에 Custom Vision에도 사용할 수 있는 일괄 키임)
4. 키 찾기
5. CURL을 사용하여 두 이미지를 분석합니다.

## <a name="manually-generating-keys-for-use-with-computer-vision"></a>Computer Vision에서 사용할 키를 수동으로 생성합니다.

[vision_demo sh](vision_demo.sh) 스크립트에서 Azure 명령줄 인터페이스를 사용하여 프로그래밍 방식으로 Cognitive Services 키를 만들려면 “키 만들기” 섹션을 실행합니다.
(원하는 경우 [Azure Portal에서 키를 대화형으로 만들 수 있음](https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account?tabs=multiservice%2Clinux&WT.mc_id=msignitethetour2019-github-aiml20))

## <a name="next-step"></a>다음 단계

[Custom Vision](DEMO%20Custom%20Vision.md)