# <a name="aiml50---demonstration-setup-instructions"></a>AIML50 - 示範設定指示

## <a name="create-demonstration-environment"></a>建立示範環境

[影片逐步解說](https://youtu.be/C9WtOZaUoyA)

### <a name="prerequisites"></a>必要條件

* Azure 訂用帳戶
* 您有權加入延伸模組的 Azure DevOps 組織。
  * 該組織的個人存取權杖 (PAT)。
* GitHub 帳戶 (您可以對其派生此存放庫)

### <a name="fork-the-repository"></a>派生存放庫

在 GitHub 中，在您擁有控制權的使用者或組織底下，[建立此存放庫的分支](https://help.github.com/en/github/getting-started-with-github/fork-a-repo)。  您需要權限，才能將 GitHub 存放庫連線到 Azure DevOps。

### <a name="deploy-the-template"></a>部署範本

您可以透過下方的 [部署至 Azure] 連結 (或是使用 Azure PowerShell 或 Azure CLI) 來部署此環境。  您需要 Azure 訂用帳戶及某個區域的可用配額，才能部署：

* Azure SQL 資料庫
* Cosmos DB 資料庫
* Azure 應用程式服務
* Azure Machine Learning 服務

系統會提示您選取 Azure 訂用帳戶和資源群組 (此時您可以建立資源群組)。

系統也會要求您提供事件識別碼 (或啟動環境的原因)，這將用來協助命名資源。  越短越好。

您將需要提供 Azure SQL 執行個體的資料庫使用者名稱和密碼。

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fmicrosoft%2fignite-learning-paths-training-aiml%2fmaster%2faiml50%2ftemplate%2fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

部署需要大約 30 到 40 分鐘的時間。

一旦部署正在進行 (至少已建立 Azure Machine Learning 服務，且 Azure 容器執行個體 bootstrap-container 已執行完成)，您就可以完成設定 Azure DevOps 環境。  這會設定大部分的環境，但有幾個手動步驟。

### <a name="set-up-azure-notebooks"></a>設定 Azure Notebooks

* 巡覽至 [Azure Notebooks](https://notebooks.azure.com/)，並使用您用來示範的 Microsoft 帳戶進行登入。
* 新增專案。  您可以直接從 GitHub (主要存放庫或您的分支) 匯入，或直接上傳 `aiml50/source` 目錄。
* 在 Azure 筆記本的 `aiml50/source` 目錄中，使用下列項目建立名為 `azureml-config` 的 JSON 檔案：
  * 您的訂用帳戶識別碼
  * 包含 ML 工作區的資源群組名稱
  * 工作區名稱

範例：

```
{
    "subscription_id": "cd400f31-6f94-40ab-863a-673192a3c0d0",
    "resource_group": "aiml50",
    "workspace_name": "aiml50demo"
}
```


* 此外，如有必要，請在 `deploymentconfig.json` 檔案中將 `location` 參數新增至您的區域。 預設的 ACI 區域為 westus。

範例：
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
參考： https://docs.microsoft.com/en-us/azure/container-instances/container-instances-region-availability

* 按一下 [開啟] (這會在新索引標籤中開啟)
  * `seer_pipeline.ipynb`

#### <a name="seer_pipelineipynb"></a>seer_pipeline.ipynb

* 確定核心已設定為 Python 3.6
* 設定儲存體帳戶金鑰
* 編輯步驟 4 並設定儲存體帳戶名稱
* 開始執行個別步驟。  您需要向 Azure 進行驗證 (請遵循筆記本中的提示進行)。 記得等候個別步驟完成，再開始下一個步驟。

### <a name="setup-the-azure-devops-project"></a>設定 Azure DevOps 專案

接下來，巡覽至您根據部署範本所指定 Azure DevOps 組織中建立的 AIML50 專案。

#### <a name="create-the-service-connections"></a>建立服務連線

從專案頁面，巡覽至 `project settings`。

![0-azure_devops_org](./images/0-azure_devops_org.png)
![1-azure_devops_project](./images/1-azure_devops_project.png)

在 `Pipelines` 下選取 `Service Connections`。

![2-azure_devops_project_settings](./images/2-azure_devops_project_settings.png)

新增兩個服務連線：

* 第一個連線 `aiml50`
  * 類型：Azure Resource Manager
  * 連線名稱：`aiml50`
    * 服務連線的名稱。 由於已在組建中設定，因此必須符合。
  * 範圍層級：`Subscription`
    * 服務主體的授權範圍。 針對這項，請將其設定為 `subscription`。
  * 訂用帳戶：`Ignite The Tour`
    * 您已部署示範環境的目標訂用帳戶。 這可能與上述範例不同。 您可以根據用來登入 Azure DevOps 的使用者，從下拉式清單選取訂用帳戶。
  * 資源群組：`aiml50` 或空白
    * 您可以將認證限制為已部署的目標資源群組，或授與其整個訂用帳戶的權限。

![4-azure_devops_service_connection](./images/4-azure_devops_service_connection.png)
![3-azure_devops_service_connection](./images/3-azure_devops_service_connection.png)

* 第二個連線：`aiml50-workspace`
  * 類型：Azure Resource Manager
  * 連線名稱：`aiml50`
    * 服務連線的名稱。 由於已在組建中設定，因此必須符合。
  * 範圍層級：`AzureMLWorkspace`
    * 服務主體的授權範圍。 發行將需要此範圍。
  * 訂用帳戶：`Ignite The Tour`
    * 您已部署示範環境的目標訂用帳戶。 這可能與上述範例不同。 您可以根據用來登入 Azure DevOps 的使用者，從下拉式清單選取訂用帳戶。
  * 資源群組：`aiml50`
    * 這應該是包含您 Azure Machine Learning 工作區的資源群組。
  * Machine Learning 工作區：`aiml50demo`
    * 該名稱會視您用來佈建環境的事件或限定詞而有所不同。

![5-azure_devops_service_connection_add](./images/5-azure_devops_service_connection_add.png)
![6-azure_devops_service_connection_detail](./images/6-azure_devops_service_connection_detail.png)

#### <a name="enable-the-variable-group"></a>啟用變數群組

有一個已佈建的變數群組，其中包含一些共用值可供組建和發行使用。  必須為變數群組授與管線存取權。

* 巡覽至 [程式庫] (在 [管線] 底下)。
* 選取 `aiml50-demo` 變數群組。
* 切換 `Allow access to all pipelines`
* 儲存變數群組。

![7-azure_devops_library](./images/7-azure_devops_library.png)
![8-azure_devops_library_detail](./images/8-azure_devops_library_detail.png)

#### <a name="create-the-build"></a>建立組建

現在，我們需要將 Azure DevOps 指向 GitHub 上的組建定義，以建立組建定義。

* 巡覽至 `Pipelines` (在 [管線] 底下)。
* 選取 `New Pipeline`

![9-azure_devops_pipeline_new](./images/9-azure_devops_pipeline_new.png)
![10-azure_devops_pipeline_new_source](./images/10-azure_devops_pipeline_new_source.png)


* 連線到 GitHub 專案的分支：[Ignite 學習路徑定型 AI/ML](https://github.com/microsoft/ignite-learning-paths-training-aiml)

![11-azure_devops_pipeline_select_repo](./images/11-azure_devops_pipeline_select_repo.png)

![12-azure_devops_pipeline_select_build_definition](./images/12-azure_devops_pipeline_select_build_definition.png)

* 選擇使用存放庫中的組建定義 (`aiml50/azure-pipelines.yml`)

![13-azure_devops_pipeline_select_build_definition_location](./images/13-azure_devops_pipeline_select_build_definition_location.png)

#### <a name="run-the-build"></a>執行組建

將組建連線到來源存放庫之後，我們需要執行組建來建立 Machine Learning 管線，並建立組建成品以便完成設定發行管線。

* 檢閱組建定義並執行組建。 組建會在幾分鐘內完成，但會觸發 Machine Learning 管線，而可能需要大約 20-40 分鐘的時間。

![14-azure_devops_pipeline_review_build_definition](./images/14-azure_devops_pipeline_review_build_definition.png)
![15-azure_devops_pipeline_build_result](./images/15-azure_devops_pipeline_build_result.png)

#### <a name="update-the-release"></a>更新發行

Machine Learning 管線完成之後，我們可以更新發行管線。

* 巡覽至 `Releases` (在 [管線] 底下)。

![16-azure_devops_release_new](./images/16-azure_devops_release_new.png)

* 選取 `Release Seer`，然後選擇 `Edit`

![17-azure_devops_release_edit](./images/17-azure_devops_release_edit.png)

  * 選取 `Add an artifact`
![18-azure_devops_release_artifact](./images/18-azure_devops_release_artifact.png)


  * 將 `Source type` 設定為 `AzureML`
  * 將 [服務端點] 設定為 `aiml50-workspace`
  * 將 [模型名稱] 設定為 `seer`。  在第一個 ML 管線完成之前，您將無法執行此動作。
  * 按一下 `Add`
  * 按一下新成品上的閃電圖示，然後啟用 `Continuous deployment trigger`

![19-azure_devops_release_artifact_set](./images/19-azure_devops_release_artifact_set.png)


* 接下來，開啟 `Deploy to ACI` 環境。

![20-azure_devops_release_edit_2](./images/20-azure_devops_release_edit_2.png)

* 按一下 `Agent Job`
  * 將 `Agent Pool` 設定為 `Azure Pipelines`
  * 將 `Agent Specification` 設定為 `ubuntu-18.04`

![21-azure_devops_release_task_agent](./images/21-azure_devops_release_task_agent.png)

* 按一下 `Download deployment and inferencing code`
  * 將 `Package name` 設定為 `seer_deployment`

![22-azure_devops_release_task_edit](./images/22-azure_devops_release_task_edit.png)

* 按一下 `Azure ML Model Deploy`
  * 確認 [Azure ML 工作區] 已設定為 `$(subscription_workspace)` 或 `aiml-workspace`。

![23-azure_devops_release_task_verify](./images/23-azure_devops_release_task_verify.png)

* 儲存管線並建立新的發行。



## <a name="troubleshooting-and-reference"></a>疑難排解和參考

### <a name="checking-the-container-deployment-log"></a>檢查容器部署記錄

在佈建的資源群組中，巡覽至 `bootstrap-container` 容器執行個體。 您可以從該處檢查容器的記錄，其中會顯示所採取步驟和遇到的任何錯誤。

將模型部署到 ACI 之後，請檢查所有 **3** 個容器都已執行。 如果已終止，請**重新啟動** ACI 執行個體。

### <a name="provider-registration"></a>提供者註冊

Tailwind Traders 應用程式使用許多 Azure 服務。 在某些情況下，如果您的訂用帳戶尚未使用某個服務，則可能需要提供者註冊。 下列命令可確保您的訂用帳戶能夠執行 Tailwind Traders 應用程式。

```
az provider register --namespace Microsoft.OperationalInsights
az provider register --namespace Microsoft.DocumentDB
az provider register --namespace Microsoft.DBforPostgreSQL
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.Sql
az provider register --namespace Microsoft.ContainerRegistry
```

### <a name="source-repositories"></a>來源存放庫

https://github.com/microsoft/TailwindTraders

https://github.com/microsoft/TailwindTraders-Backend

https://github.com/microsoft/TailwindTraders-Website
