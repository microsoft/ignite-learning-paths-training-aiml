# <a name="demo-instructions-for-presenters"></a>발표자를 위한 데모 지침

데모 스크립트는 이 리포지토리의 모든 사용자가 사용할 수 있습니다.

프레젠테이션을 위한 동일한 스크립트를 따라야 하지만 아래에 추가 노트를 제공합니다.

데모 기록은 [PPT 슬라이드](presentations.md)(및 아래에 링크된 몇 가지 추가 동영상)에서도 동영상으로 제공됩니다. 인터넷 문제나 기타 기술적인 문제가 발생한 경우 라이브 데모 대신 포함된 동영상을 사용할 수 있습니다. (이 경우 오디오를 음소거하고 동영상에 직접 말하는 것이 좋습니다.) [발표자 노트](speaker-notes.md)는 포함된 동영상의 이벤트에 시간이 맞춰집니다.

## <a name="demo-setup"></a>데모 설정

프레젠테이션 전에 아래 스크립트의 모든 지침을 실행합니다.

[데모 스크립트](DEMO%20Setup.md)

## <a name="demo-computer-vision"></a>DEMO Computer Vision

[데모 스크립트](DEMO%20Computer%20Vision.md)

### <a name="slide-demo--shop-by-photo"></a>슬라이드: 데모 / 사진 쇼핑

이 데모에 대한 실제 지침은 [여기](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)에 있습니다.

추가 데모 동영상: https://www.dropbox.com/s/ylxjuifg9x0h4n3/ITT-aiml20-demo1.mp4?dl=0 

### <a name="slide-demo--cognitive-services-computer-vision"></a>슬라이드: DEMO / 인지 서비스 컴퓨터 비전

[데모 스크립트](DEMO%20Computer%20Vision.md#using-computer-vision-via-the-web-interface)

## <a name="demo-custom-vision"></a>데모 Custom Vision

[데모 스크립트](DEMO%20Custom%20Vision.md)

데모의 첫 번째 부분을 미리 수행합니다.

### <a name="slide-demo--customized-object-recognition"></a>슬라이드: 데모 / 사용자 지정 개체 인식

"[이미지 추가 및 모델 학습](DEMO%20Custom%20Vision.md#add-images-and-train-a-model)"에서 라이브 데모를 시작합니다.

## <a name="demo-onnx-deployment"></a>데모 ONNX 배포

[데모 스크립트](DEMO%20ONNX%20deployment.md)

"[간단한 ONNX 모델 로드](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model)" 섹션을 미리 실행합니다.

프레젠테이션을 시작할 때 "[문제 정의](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)" 섹션을 완료했으므로 건너뜁니다.

### <a name="slide-demo--onnx"></a>슬라이드: 데모 / ONNX

"Tailwind Traders 웹 사이트의 ONNX 모델 업데이트"에서 라이브 데모를 시작합니다.

Netron에서 볼 경우 Custom Vision에서 직접 내보낸 파일을 보거나 리포지토리에서 사전 준비된 파일을 `ONNX/custom model/products.onnx`에서 사용할 수 있습니다.

이 파일을 배포할 때는 **반드시** 이름을 `products.onnx`로 지정해야 합니다. 내보낸 파일의 이름을 바꾸는 것보다 그 이름을 사용해 사전 준비된 파일을 데스크톱에서 가져오는 것이 가장 간편합니다.

### <a name="slide-demo--personalizer"></a>슬라이드: DEMO / Personalizer

[데모 스크립트](DEMO%20Personalizer.md)
