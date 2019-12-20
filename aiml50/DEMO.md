# <a name="aiml50---demonstration-setup-instructions"></a>AIML50 - 데모 설정 지침

## <a name="create-demonstration-environment"></a>데모 환경 만들기

[연습 동영상](https://youtu.be/C9WtOZaUoyA)

### <a name="prerequisites"></a>필수 조건

* Azure 구독
* 확장 추가 권한이 있는 Azure DevOps 조직입니다.
  * 해당 조직의 PAT(개인용 액세스 토큰)입니다.
* GitHub 계정(이 리포지토리를 포크할 수 있음)

### <a name="fork-the-repository"></a>리포지토리 포크

GitHub에서는 제어할 수 있는 사용자 또는 조직에서 이 리포지토리의 [포크를 만듭니다](https://help.github.com/en/github/getting-started-with-github/fork-a-repo).  이 작업을 수행하려면 GitHub 리포지토리를 Azure DevOps에 연결할 수 있는 권한이 필요합니다.

### <a name="deploy-the-template"></a>템플릿 배포

이 환경은 아래의 “Azure에 배포” 링크를 통해 배포할 수 있습니다(또는 Azure PowerShell이나 Azure CLI 사용 가능).  배포할 지역에서 Azure 구독 및 사용 가능한 할당량이 필요합니다.

* Azure SQL Database
* Cosmos DB 데이터베이스
* Azure App Services
* Azure Machine Learning Service

Azure 구독 및 리소스 그룹을 선택하라는 메시지가 표시됩니다(이때 리소스 그룹을 만들 수 있음).

또한 리소스의 이름을 지정하는 데 사용되는 이벤트 식별자(또는 환경을 실행하는 이유)를 묻는 메시지가 표시됩니다.  길이는 짧을수록 좋습니다.

Azure SQL 인스턴스에 대한 데이터베이스 사용자 이름 및 암호를 제공해야 합니다.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fmicrosoft%2fignite-learning-paths-training-aiml%2fmaster%2faiml50%2ftemplate%2fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

배포에는 약 30~40분이 걸립니다.

배포가 진행 중이면(최소한 Azure Machine Learning Service가 생성되고 부트스트랩 컨테이너 Azure Container 인스턴스가 완료된 상태) Azure DevOps 환경 설정을 완료할 수 있습니다.  대부분의 환경이 구성되지만 몇 가지 수동 단계가 있습니다.

### <a name="set-up-azure-notebooks"></a>Azure Notebooks 설정

* [Azure Notebooks](https://notebooks.azure.com/)로 이동하여 시연할 Microsoft 계정으로 로그인합니다.
* 새 프로젝트를 추가합니다.  GitHub(주 리포지토리 또는 포크)에서 직접 가져오거나 또는 `aiml50/source` 디렉터리에서 직접 업로드할 수 있습니다.
* Azure Notebook의 `aiml50/source` 디렉터리에서 다음을 사용하여 `azureml-config`라는 json 파일을 만듭니다.
  * 구독 ID
  * ML 작업 영역을 포함하는 리소스 그룹 이름
  * 작업 영역 이름

예:

```
{
    "subscription_id": "cd400f31-6f94-40ab-863a-673192a3c0d0",
    "resource_group": "aiml50",
    "workspace_name": "aiml50demo"
}
```


* 또한 필요한 경우 `location` 매개 변수를 `deploymentconfig.json` 파일의 지역에 추가합니다. 기본 ACI 지역은 미국 서부입니다.

예:
```
{
   "containerResourceRequirements": {
       "cpu":        2,
       "memoryInGB": 4
    },
    "computeType":       "ACI",
    "enableAppInsights": "True",
    "location":          "westus"
}
```
참조: https://docs.microsoft.com/en-us/azure/container-instances/container-instances-region-availability

* 다음을 클릭합니다(새 탭에서 열림).
  * `seer_pipeline.ipynb`

#### <a name="seer_pipelineipynb"></a>seer_pipeline.ipynb

* 커널이 Python 3.6으로 설정되어 있어야 합니다.
* 스토리지 계정 키를 설정합니다.
* 4단계를 편집하고 스토리지 계정 이름을 설정합니다.
* 개별 단계를 실행합니다.  이를 실행하려면 Azure에 인증해야 합니다(Notebook의 프롬프트에 따름). 다음 작업을 시작하기 전에 개별 단계가 완료되도록 해야 합니다.

### <a name="setup-the-azure-devops-project"></a>Azure DevOps 프로젝트 설정

다음으로, 배포 템플릿에 지정한 Azure DevOps 조직에서 만든 AIML50 프로젝트로 이동합니다.

#### <a name="create-the-service-connections"></a>서비스 연결 만들기

프로젝트 페이지에서 `project settings`로 이동합니다.

![0-azure_devops_org](./images/0-azure_devops_org.png)
![1-azure_devops_project](./images/1-azure_devops_project.png)

`Pipelines`에서 `Service Connections`를 선택합니다.

![2-azure_devops_project_settings](./images/2-azure_devops_project_settings.png)

다음 두 개의 서비스 연결을 추가합니다.

* 첫 번째 연결 `aiml50`
  * 형식: Azure Resource Manager
  * 연결 이름: `aiml50`
    * 서비스 연결의 이름입니다. 이 이름은 이미 빌드에 설정되어 있으므로 일치해야 합니다.
  * 범위 수준: `Subscription`
    * 서비스 사용자에 대한 권한 부여의 범위입니다. 이 경우 `subscription`으로 설정합니다.
  * 구독: `Ignite The Tour`
    * 데모 환경을 배포한 구독입니다. 이는 위의 예와 다를 수 있습니다. Azure DevOps에 로그인한 사용자에 따라 드롭다운에서 구독을 선택할 수 있습니다.
  * 리소스 그룹: `aiml50` 또는 비어 있음
    * 자격 증명을 배포한 리소스 그룹으로 제한하거나 구독에서 해당 권한을 허용할 수 있습니다.

![4-azure_devops_service_connection](./images/4-azure_devops_service_connection.png)
![3-azure_devops_service_connection](./images/3-azure_devops_service_connection.png)

* 두 번째 연결: `aiml50-workspace`
  * 형식: Azure Resource Manager
  * 연결 이름: `aiml50`
    * 서비스 연결의 이름입니다. 이 이름은 이미 빌드에 설정되어 있으므로 일치해야 합니다.
  * 범위 수준: `AzureMLWorkspace`
    * 서비스 사용자에 대한 권한 부여의 범위입니다. 이 범위는 릴리스에 필요합니다.
  * 구독: `Ignite The Tour`
    * 데모 환경을 배포한 구독입니다. 이는 위의 예와 다를 수 있습니다. Azure DevOps에 로그인한 사용자에 따라 드롭다운에서 구독을 선택할 수 있습니다.
  * 리소스 그룹: `aiml50`
    * Azure Machine Learning 작업 영역이 포함된 리소스 그룹이어야 합니다.
  * Machine Learning 작업 영역: `aiml50demo`
    * 사용자 이름은 환경을 프로비저닝하는 데 사용하는 이벤트 또는 한정자에 따라 달라집니다.

![5-azure_devops_service_connection_add](./images/5-azure_devops_service_connection_add.png)
![6-azure_devops_service_connection_detail](./images/6-azure_devops_service_connection_detail.png)

#### <a name="enable-the-variable-group"></a>변수 그룹 사용

프로비저닝된 변수 그룹에는 빌드 및 릴리스에서 사용할 공유 값이 일부 포함되어 있습니다.  변수 그룹에 대한 파이프라인 액세스 권한을 부여해야 합니다.

* 라이브러리(Pipelines 아래)로 이동합니다.
* `aiml50-demo` 변수 그룹을 선택합니다.
* `Allow access to all pipelines`를 토글합니다.
* 변수 그룹을 저장합니다.

![7-azure_devops_library](./images/7-azure_devops_library.png)
![8-azure_devops_library_detail](./images/8-azure_devops_library_detail.png)

#### <a name="create-the-build"></a>빌드 만들기

이제 GitHub의 빌드 정의에 대해 Azure DevOps를 가리켜 빌드 정의를 만들어야 합니다.

* `Pipelines`(Pipelines 아래)로 이동합니다.
* `New Pipeline`을 선택합니다.

![9-azure_devops_pipeline_new](./images/9-azure_devops_pipeline_new.png)
![10-azure_devops_pipeline_new_source](./images/10-azure_devops_pipeline_new_source.png)


* GitHub 프로젝트인 [Ignite 학습 경로 교육 AI/ML](https://github.com/microsoft/ignite-learning-paths-training-aiml)의 포크에 연결합니다.

![11-azure_devops_pipeline_select_repo](./images/11-azure_devops_pipeline_select_repo.png)

![12-azure_devops_pipeline_select_build_definition](./images/12-azure_devops_pipeline_select_build_definition.png)

* 리포지토리에서 빌드 정의를 사용하도록 선택합니다(`aiml50/azure-pipelines.yml`).

![13-azure_devops_pipeline_select_build_definition_location](./images/13-azure_devops_pipeline_select_build_definition_location.png)

#### <a name="run-the-build"></a>빌드 실행

빌드를 소스 리포지토리에 연결한 후에는 빌드를 실행하여 Machine Learning 파이프라인 및 빌드 아티팩트를 만들어 릴리스 파이프라인 설정을 완료할 수 있도록 해야 합니다.

* 빌드 정의를 검토하고 빌드를 실행합니다. 빌드가 몇 분 내에 완료되고, 약 20~40분이 걸릴 수 있는 Machine Learning 파이프라인이 트리거됩니다.

![14-azure_devops_pipeline_review_build_definition](./images/14-azure_devops_pipeline_review_build_definition.png)
![15-azure_devops_pipeline_build_result](./images/15-azure_devops_pipeline_build_result.png)

#### <a name="update-the-release"></a>릴리스 업데이트

Machine Learning 파이프라인이 완료되면 릴리스 파이프라인을 업데이트할 수 있습니다.

* `Releases`(Pipelines 아래)로 이동합니다.

![16-azure_devops_release_new](./images/16-azure_devops_release_new.png)

* `Release Seer`, `Edit`를 차례로 선택합니다.

![17-azure_devops_release_edit](./images/17-azure_devops_release_edit.png)

  * `Add an artifact`
![18-azure_devops_release_artifact](./images/18-azure_devops_release_artifact.png)를 선택합니다.


  * `AzureML`의 `Source type`을 설정합니다.
  * 서비스 엔드포인트를 `aiml50-workspace`로 설정합니다.
  * 모델 이름을 `seer`로 설정합니다.  첫 번째 ML 파이프라인이 완료될 때까지 이 작업을 수행할 수 없습니다.
  * `Add`를 클릭합니다.
  * 새 아티팩트에서 번개 아이콘을 클릭하고 `Continuous deployment trigger`를 사용하도록 설정합니다.

![19-azure_devops_release_artifact_set](./images/19-azure_devops_release_artifact_set.png)


* 그런 다음, `Deploy to ACI` 환경을 엽니다.

![20-azure_devops_release_edit_2](./images/20-azure_devops_release_edit_2.png)

* `Agent Job`을 클릭합니다.
  * `Agent Pool`을 `Azure Pipelines`로 설정합니다.
  * `Agent Specification`을 `ubuntu-18.04`로 설정합니다.

![21-azure_devops_release_task_agent](./images/21-azure_devops_release_task_agent.png)

* `Download deployment and inferencing code`를 클릭합니다.
  * `Package name`을 `seer_deployment`로 설정합니다.

![22-azure_devops_release_task_edit](./images/22-azure_devops_release_task_edit.png)

* `Azure ML Model Deploy`를 클릭합니다.
  * Azure ML 작업 영역이 `$(subscription_workspace)` 또는 `aiml-workspace`로 설정되어 있는지 확인합니다.

![23-azure_devops_release_task_verify](./images/23-azure_devops_release_task_verify.png)

* 파이프라인을 저장하고 새 릴리스를 만듭니다.



## <a name="troubleshooting-and-reference"></a>문제 해결 및 참조

### <a name="checking-the-container-deployment-log"></a>컨테이너 배포 로그 확인

프로비저닝된 리소스 그룹에서 `bootstrap-container` 컨테이너 인스턴스로 이동합니다. 그러면 컨테이너에 대한 로그를 확인할 수 있으며 여기에는 수행된 단계 및 발생한 오류가 표시됩니다.

ACI에 모델을 배포한 후에는 **3**개의 모든 컨테이너가 실행되는지 확인하세요. 종료된 경우에는 ACI 인스턴스를 **다시 시작**하세요.

### <a name="provider-registration"></a>공급자 등록

Tailwind Traders 애플리케이션은 여러 Azure 서비스를 사용합니다. 경우에 따라 서비스를 구독에서 아직 사용하지 않은 경우 공급자 등록이 필요할 수 있습니다. 다음 명령은 구독에서 Tailwind Traders 애플리케이션을 실행할 수 있는지 확인합니다.

```
az provider register --namespace Microsoft.OperationalInsights
az provider register --namespace Microsoft.DocumentDB
az provider register --namespace Microsoft.DBforPostgreSQL
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.Sql
az provider register --namespace Microsoft.ContainerRegistry
```

### <a name="source-repositories"></a>소스 리포지토리

https://github.com/microsoft/TailwindTraders

https://github.com/microsoft/TailwindTraders-Backend

https://github.com/microsoft/TailwindTraders-Website
