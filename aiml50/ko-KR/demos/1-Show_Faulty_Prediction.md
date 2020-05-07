# <a name="show-faulty-prediction-and-make-a-change"></a>잘못된 예측 표시 및 변경

> 💡 데모를 시작하기 전에 [설정](../DEMO.md)을 완료해야 합니다.

## <a name="show-the-faulty-prediction"></a>잘못된 예측 표시

* Tailwind Traders 웹 사이트로 이동합니다.
    * https://aiml50{eventname}.azurewebsites.net ({eventname} 이벤트를 데모 환경을 만드는 데 사용한 이벤트 이름 매개 변수로 바꿈)

* `start smart shopping by uploading a photo`를 클릭합니다.
* [테스트 이미지 폴더](../source/test-images)에서 이미지를 업로드합니다.
* 모델에서 잘못된 예측을 제공합니다.

## <a name="start-the-change"></a>변경 시작

* `setup_pipeline.py`를 변경하여 모델을 조정합니다.
  * 줄 162 - `epochs`를 20으로 변경
  * 줄 163 - `batch`를 10으로 변경
* 변경을 커밋하고 마스터로 푸시합니다.  그러면 모델의 빌드 및 배포가 트리거됩니다.  이 프로세스는 약 25~30분이 걸리며 설명이 끝날 무렵에 완료되어야 합니다.
* 잠시 후 돌아와서 설명이 끝나는 시점에 결과를 확인하겠습니다.

## <a name="example-demo"></a>예제 데모

* [2:36분부터 예행 연습 시작](https://youtu.be/UgM8_4fAni8?t=158)