# <a name="demo-onnx-deployment"></a>데모: ONNX 배포

> 💡 데모를 시작하기 전에 [설정](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md)을 완료해야 합니다.

이 데모에서는 [Custom Vision](DEMO%20Custom%20Vision.md) 데모에서 내보낸 ONNX 파일을 사용하여 Tailwind Traders 웹 사이트에 배포합니다.

웹 사이트는 Shop by Photo 앱에 대한 `products.onnx`의 모델을 사용합니다. 업로드된 이미지는 “망치”, “드릴”, “플라이어”, “스크루드라이버” 또는 “안전모“ 중 하나를 생성하는 모델로 처리됩니다. 웹 사이트는 생성된 레이블의 제품 목록을 검색하고 검색 결과를 반환합니다.

## <a name="load-the-simple-onnx-model"></a>간단한 ONNX 모델 로드

(팁: 이 단계는 미리 수행할 수 있습니다. 동일한 배포 전에 이 데모를 실행한 경우에 이 단계가 필요합니다.)

웹앱의 products.onnx 파일은 “망치” 및 “드릴”이라는 두 가지 개체 범주만 인식하는 버전으로 대체됩니다.

1. Azure Portal에서 aiml20-demo 리소스 그룹을 방문합니다.

1. “aiml20” App Service 리소스를 클릭합니다.

1. 개발 도구의 왼쪽 메뉴에서 [고급 도구]를 클릭한 후 오른쪽 창에서 “이동”을 클릭하여 Kudu를 시작합니다.

1. 주 메뉴 모음에서 디버그 콘솔 > PowerShell을 클릭합니다.

1. 찾아보기: site/wwwroot/Standalone/ Onnxmodels

1. 탐색기를 사용하여 AIML20 리포지토리에서 `ONNX / simple model` 폴더를 엽니다.

1. Kudu 창의 왼쪽 중간으로 products.onnx를 끕니다. (중요: “여기로 끌어 업로드 및 압축 풀기” 상자로 끌지 마세요.) 이 모델은 드릴과 망치를 식별하는 방법만 알고 있습니다.

1. 웹 서버를 다시 시작합니다. “aiml20” App Service 리소스로 돌아가서 상단 메뉴 모음에서 “다시 시작“을 클릭합니다. 웹 사이트가 완전히 다시 시작될 때까지 2분 정도 기다립니다.

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>문제 정의: Shop by Photo가 제대로 작동하지 않습니다.

(참고: 이 섹션은 AIML20 프레젠테이션 시작 부분에서 수행되었음)

1. 이전에 배포한 Tailwind Traders 웹 사이트를 방문하세요. 

1. 웹 사이트의 “Shop by Photo” 섹션이 있는 아래로 스크롤합니다.

1. “Shop by Photo”를 클릭합니다.

1. AIML20 리포지토리에서 테스트 이미지 > drill.jpg를 선택합니다.

1. 해당 항목을 드릴로 올바르게 식별합니다. 좋습니다!

1. 홈페이지로 돌아가서 “Shop by Photo”를 다시 클릭합니다.

1. AIML20 리포지토리에서 테스트 이미지 > pliers.jpg를 선택합니다.

1. 저런! 이것은 망치로 식별되는군요. 나중에 이 문제를 해결하겠습니다. 실패한 원인을 먼저 알아봅시다.

## <a name="update-the-onnx-model-in-the-tailwind-traders-website"></a>Tailwind Traders 웹 사이트에서 ONNX 모델 업데이트

먼저 Netron에서 내보낸 모델을 봅니다.

1. https://lutzroeder.github.io/netron/ 으로 이동하여 [모델 열기]를 클릭합니다.

2. ONNX/Custom Model/products.onnx를 엽니다.

3. 신경망을 스크롤하여 다음을 확인합니다.

 - 상단에
 - 입력으로 224x224의 큰 이미지가 있습니다(감추고 싶은 비밀: Computer Vision은 시각이 매우 좋지 않음).
 - 하단을 추가하고 5개의 값을 출력합니다. 이 클래스 레이블에 대한 신뢰 점수입니다

다음으로, TWT filesystem로 내보낸 ONNX 파일을 삭제합니다.

1. Azure Portal에서 aiml20-demo 리소스 그룹을 방문합니다.

1. “aiml20” 웹앱 리소스를 클릭합니다.

1. 개발 도구에서 [고급 도구]를 클릭한 후 오른쪽 창에서 “이동”을 클릭하여 Kudu를 시작합니다.

1. 주 메뉴 모음에서 디버그 콘솔 > PowerShell을 클릭합니다.

1. 찾아보기: site/wwwroot/Standalone/ Onnxmodels

1. 탐색기를 사용하여 AIML20 리포지토리에서 `ONNX / custom model` 폴더를 엽니다.

1. Kudu 창의 왼쪽 중간으로 products.onnx를 끕니다. (중요: “여기로 끌어 업로드 및 압축 풀기” 상자로 끌지 마세요.)

1. 웹 서버를 다시 시작합니다. “onnx” 웹앱 리소스로 돌아가서 “다시 시작”을 클릭합니다.

Shop by Photo를 다시 실행하고 `test images / pliers.jpg`를 업로드합니다. 이제 작동됩니다!

## <a name="next-step"></a>다음 단계

[Personalizer](DEMO%20Personalizer.md)


