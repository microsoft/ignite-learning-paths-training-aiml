# <a name="bootstrap-container"></a>부트스트랩 컨테이너

이 컨테이너 이미지는 프로비저닝 프로세스의 간격을 메우는 데 도움이 됩니다.

## <a name="contents"></a>콘텐츠

PowerShell Core 컨테이너 기반

소프트웨어:

* Curl
* Wget
* Azure CLI
* Az CLI에 대한 Azure DevOps 확장
* AzCopy
* VSTeam PowerShell 모듈(및 지원 모듈)

콘텐츠 파일:

* ReleaseSeer.json - Azure DevOps 릴리스 템플릿
* 이미지 - 웹 사이트에 대한 학습 이미지 및 제품 이미지(컨테이너 빌드 시 이벤트 CDN에서 끌어옴)

## <a name="bootstrap-process"></a>부트스트랩 프로세스

컨테이너는 다음 순서로 PowerShell 스크립트를 시작합니다.

* 대상 Azure DevOps 조직에서 `AIML50`이라는 프로젝트를 확인하거나 만듭니다.
* `ms-air-aiagility/vss-services-azureml` 확장을 확인하거나 조직에 추가합니다.
* `SeerPackages`라는 아티팩트 피드를 확인하거나 만듭니다.
* `aiml50-demo`라는 변수 그룹을 확인하거나 만듭니다.
* ReleaseSeer 릴리스 정의를 확인하거나 가져옵니다.
* 배포 템플릿으로 만든 Azure 스토리지에 이미지 파일을 복사합니다.
* Tailwind Traders 사이트가 가동 및 실행될 수 있도록 폴링을 시작합니다. (10초마다 폴링합니다.)
  * 이 폴링은 사이트가 실행되고 나면 데이터베이스 프로젝트의 스캐폴딩을 트리거하여 다음 단계를 계속 진행할 수 있도록 합니다.
* Azure SQL Database에 연결하여 렌치에 대한 레코드를 삽입합니다. 120 절전 모드로 매 시도 간에 최대 5회까지 시도합니다.
  * 기존 ID 번호를 확인하고 누락된 경우 삽입합니다.

부트스트랩 컨테이너가 실행되지 않으면 이미 구성된 파트에 영향을 주지 않고 다시 실행할 수 있습니다.
