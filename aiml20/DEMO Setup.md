# <a name="setup-for-aiml20-demos"></a>AIML20 데모 설정

이러한 작업은 AIML20 프레젠테이션에서 미리 수행되었습니다. 나머지 데모 스크립트를 준비하려면 동일한 다음 단계를 따릅니다.

## <a name="clone-the-repository-to-your-local-machine"></a>로컬 컴퓨터에 리포지토리를 복제합니다.

로컬 컴퓨터에 https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml20 의 콘텐츠가 필요합니다. 이 작업을 수행하는 가장 쉬운 방법은 [AI 학습 경로 리포지토리에 대한 개발자 안내서](https://github.com/microsoft/ignite-learning-paths-training-aiml)를 방문하여 “복제 또는 다운로드” 단추를 클릭하는 것입니다. `aiml20` 폴더와 관련된 파일을 참조합니다.

## <a name="sign-up-for-an-azure-subscription"></a>Azure 구독에 가입

Azure 구독이 아직 없는 경우 [여기에서 등록](https://azure.microsoft.com/free/?WT.mc_id=msignitethetour2019-github-aiml20)할 수 있으며 사용할 무료 Azure 크레딧으로 200 달러를 받을 수도 있습니다. 

## <a name="find-your-azure-subscription-id"></a>Azure 구독 ID 찾기

[Azure Portal](https://portal.azure.com)에 로그인하고 왼쪽 메뉴 모음에서 “구독”을 클릭합니다. 사용할 구독 이름을 클릭하고 표시된 “구독 ID”를 복사합니다. 나중에 리소스를 만들 때 필요합니다.

또는 Azure CLI에서 `az account show`를 실행하고 표시된 `id` 값을 복사합니다.

## <a name="start-fresh"></a>새로 시작합니다.

 이전에 데모를 실행한 적이 있으면 해당 리소스 그룹을 삭제합니다(있는 경우).
 
 - `aiml20-demo`

 Azure Portal을 사용하거나 Azure CLI에서 다음 명령을 실행할 수 있습니다.

 ```sh
 az group delete --name aiml20-demo
 ```

## <a name="deploy-the-tailwind-traders-website"></a>Tailwind Traders 웹 사이트를 배포합니다.

아래 단추를 클릭합니다. 그러면 ARM 템플릿을 사용해 Github에서 [TailwindTraders-Website](https://github.com/Microsoft/TailwindTraders-Website)를 배포하여 Personalizer 통합 및 ONNX 기반 Shop by Photo 기능을 사용할 수 있습니다. ([이 배포에 대한 세부 정보](https://github.com/microsoft/TailwindTraders-Website/blob/master/Source/Tailwind.Traders.Web/Standalone/README.md))

[![Azure에 배포](https://azuredeploy.net/deploybutton.svg)](https://portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoft%2FTailwindTraders-Website%2Fmaster%2Fazuredeploy.json)

표시되는 양식에서 다음 옵션을 선택합니다.

* 구독: 리소스를 배포할 구독을 선택합니다.

* 리소스 그룹: 지정하는 리소스 그룹에 리소스가 생성됩니다.
  “새로 만들기”를 선택하고 이름에 `aiml20-demo`를 입력하는 것이 좋습니다. 작업을 완료하면 이 리소스 그룹을 삭제하여 사이트를 종료하고, 관련된 모든 리소스를 삭제할 수 있습니다.

* 위치: 리소스가 배포될 Azure 지역입니다. SQL Database 및 App Services를 해당 지역에 배포할 수 있어야 합니다. 

  참고: Personalizer는 현재 WestUS2 및 WestEurope에서만 사용할 수 있으므로 선택하는 항목에 관계없이 배포됩니다.

* 사이트 이름: 사이트 URL에 사용되고 공개적으로 표시되며, 전역적으로 고유해야 합니다. 충돌을 방지하려면 `xy`를 사용자의 이니셜로 바꾸는 `aiml20-xy`를 선택합니다. 그러나 이러한 스크립트에서는 이 이름을 `aiml20`으로 지칭합니다. (사용 중인 이름을 선택하면 배포 중에 “충돌” 오류가 발생합니다.)

* 사이트 위치: 위에 있는 “위치”의 짧은 버전을 입력합니다(예: `westus2`).
  (`az account
  list-locations -o table`을 사용하여 Azure CLI에서 짧은 이름 목록을 가져올 수 있습니다.)

* 배포 모드: `standalone`을 선택합니다.

* SQL 로그인: `twt`를 입력합니다.

* SQL 암호: 보안 암호를 생성하고 사용합니다 (문장 부호와 대/소문자 혼합을 포함해야 하지만 `;`는 사용하지 않음). 데모에는 필요하지 않으므로 작성하지 않아도 됩니다.

* Personalizer 사용: `true`를 선택합니다.

* 리포지토리 URL: 기본값인 `https://github.com/microsoft/TailwindTraders-Website`를 적용합니다.

* 분기: 기본값인 `master`를 적용합니다.

(백업으로 분기 `aiml20`과 함께 리포지토리 URL `https://github.com/revodavid/TailwindTraders-Website`를 사용할 수도 있습니다.
이 항목은 2019년 10월 25일에 분기되었으며 작동하는 것으로 알려져 있습니다.)

“사용 약관에 동의함”을 선택하고 “구매”를 클릭합니다.

사이트가 배포될 때까지 15분 이상 기다립니다. 

배포된 웹 사이트 URL은 SITENAME.azurewebsites.net 형식(위에서 제공한 사이트 이름 사용)이거나 다음과 같이 확인할 수 있습니다.

* “다음 단계”에서 “리소스로 이동”을 클릭합니다.

* “App Service” 리소스를 클릭합니다.

* 오른쪽 창에 표시된 “URL” 값을 확인합니다.

웹 사이트 URL이 “소스 제어 설정” 단계 다음에 표시되거나 “App Service” 리소스를 검사할 수 있습니다.

### <a name="install-the-simple-onnx-model"></a>“간단한” ONNX 모델 설치

“간단한 ONNX 모델 로드” 제목 아래에 있는 [DEMO ONNX deployment.md](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model)의 지침을 따릅니다. 그러면 앱에서 망치 및 드릴만 인식하여 “Shop by Photo” 도구의 성능이 저하됩니다.

## <a name="configure-visual-studio-code"></a>Visual Studio Code 구성

[Azure 계정](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account) 확장을 설치합니다.
(Windows에서는 [node.js도 설치](https://nodejs.org/)해야 합니다.) VS Code에서 “Azure: Sign In” 명령을 사용하여 로그인합니다(명령 팔레트를 열려면 Ctrl+Shift+P 사용). VS Code의 스크립트에서 Azure CLI 명령을 실행하려면 “터미널: Azure 터미널에서 선택한 텍스트 실행”을 사용하여 명령을 복사합니다.

또는 로컬 Windows, MacOS 또는 Linux 컴퓨터에 [Azure CLI를 설치](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=https://docs.microsoft.com/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=msignitethetour2019-github-aiml20)할 수 있습니다. 아직 설치하지 않은 경우 [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20)을 시작하고 브라우저 창에서 이러한 명령을 실행할 수도. 있습니다. 

## <a name="prepare-visual-studio-for-demo"></a>데모용 Visual Studio 준비

- `vision_demo.sh`를 엽니다.
- “Azure: Open Bash In Cloud Shell”을 사용하여 Cloud Shell을 시작합니다. (원하는 경우 Azure CLI를 로컬로 사용할 수 있음)   

## <a name="open-browser-pages-ready-to-demo"></a>데모에 사용할 수 있는 브라우저 페이지를 엽니다.

* 배포된 Tailwind Trader 앱 
* https://portal.azure.com/?feature.customportal=false#home (리소스 찾아보기 - 이 링크는 액세스 권한이 있는 해당 버전의 미리 보기 버전이 아니라, 공개 포털을 표시함)  
* https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/
* https://customvision.ai
* https://lutzroeder.github.io/netron/

## <a name="find-the-image-files-on-your-local-machine"></a>로컬 컴퓨터에서 이미지 파일 찾기

리포지토리를 복제한 후 `aiml20/CV Training Images` 폴더에서 학습 이미지를 찾을 수 있습니다. 이러한 이미지를 사용하여 Custom Vision 모델을 학습합니다. 폴더에는 다음 하위 폴더가 포함되어 있습니다.

* drills
* hammers
* hard hats
* pliers
* Screwdrivers

이러한 이미지는 Computer Vision 서비스를 테스트하고 Custom Vision 서비스를 통해 모델을 만드는 데 사용됩니다.

이러한 이미지는 Wikimedia Commons에서 소싱되며 해당 Creative Commons 라이선스에 따라 사용됩니다. 자세한 내용은 [ATTRIBUTIONS.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/CV%20training%20images/ATTRIBUTIONS.md) 파일을 참조하세요.

추가 테스트 이미지는 `test images` 폴더에서 찾을 수 있습니다. 이러한 이미지는 학습에 사용되지 않지만 모델이 작동하는지 테스트하는 데 사용됩니다.

## <a name="next-step"></a>다음 단계

[Computer Vision](DEMO%20Computer%20Vision.md)
