# <a name="aiml50---demonstration-setup-instructions"></a>AIML50 - 演示设置说明

## <a name="create-demonstration-environment"></a>创建演示环境

[视频演练](https://youtu.be/C9WtOZaUoyA)

### <a name="prerequisites"></a>先决条件

* 一个 Azure 订阅
* 一个你有权向其添加扩展的 Azure DevOps 组织。
  * 一个适用于该组织的个人访问令牌 (PAT)
* 一个可将此存储库分支到的 GitHub 帐户

### <a name="fork-the-repository"></a>为存储库创建分支

在 GitHub 中，在你可以控制的用户或组织下[创建此存储库的分支](https://help.github.com/en/github/getting-started-with-github/fork-a-repo)。  需要将 GitHub 存储库连接到 Azure DevOps 的权限。

### <a name="deploy-the-template"></a>部署模板

可以通过下面的“部署到 Azure”链接（或者可以使用 Azure PowerShell 或 Azure CLI）部署此环境。  你需要一个 Azure 订阅和一个区域中的可用配额才能进行部署：

* Azure SQL 数据库
* Cosmos DB 数据库
* Azure 应用服务
* Azure 机器学习服务

系统将提示你选择一个 Azure 订阅和资源组（此时你可以创建一个资源组）。

系统还会要求你提供事件标识符（或转换环境的原因），以用于帮助命名资源。  标识符越短越好。

你需要提供 Azure SQL 实例的数据库用户名和密码。

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fmicrosoft%2fignite-learning-paths-training-aiml%2fmaster%2faiml50%2ftemplate%2fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

部署大约需要 30 到 40 分钟。

部署过程中（至少在创建 Azure 机器学习服务且启动容器 Azure 容器实例运行完毕后），可以完成 Azure DevOps 环境设置。  将完成大部分环境配置，但有一些步骤需要手动执行。

### <a name="set-up-azure-notebooks"></a>设置 Azure Notebooks

* 导航到 [Azure Notebooks](https://notebooks.azure.com/)，并使用用于演示的 Microsoft 帐户登录。
* 添加新项目。  可以直接从 GitHub（主存储库或分支）导入，也可以直接上传 `aiml50/source` 目录。
* 在 Azure Notebooks 的 `aiml50/source` 目录中，创建一个名为 `azureml-config` 的 json 文件，其中包括：
  * 订阅 ID
  * 包含 ML 工作区的资源组名称
  * 工作区名称

示例:

```
{
    "subscription_id": "cd400f31-6f94-40ab-863a-673192a3c0d0",
    "resource_group": "aiml50",
    "workspace_name": "aiml50demo"
}
```


* 另外，如有必要，请将 `location` 参数添加到 `deploymentconfig.json` 文件中的你的区域。 默认 ACI 区域为 westus。

示例:
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
参考： https://docs.microsoft.com/en-us/azure/container-instances/container-instances-region-availability

* 单击（将在新选项卡中打开）
  * `seer_pipeline.ipynb`

#### <a name="seer_pipelineipynb"></a>seer_pipeline.ipynb

* 确保将内核设置为 Python 3.6
* 设置存储帐户密钥
* 编辑步骤 4 并设置存储帐户名称
* 开始运行各个步骤。  需向 Azure 进行身份验证（请按照笔记本中的提示进行操作）。 请记住，请先完成一个步骤再开始下一个。

### <a name="setup-the-azure-devops-project"></a>设置 Azure DevOps 项目

接下来，导航到在指定到部署模板的 Azure DevOps 组织中创建的 AIML50 项目。

#### <a name="create-the-service-connections"></a>创建服务连接

从“项目”页，导航到 `project settings`。

![0-azure_devops_org](./images/0-azure_devops_org.png)
![1-azure_devops_project](./images/1-azure_devops_project.png)

选择 `Pipelines` 下的 `Service Connections`。

![2-azure_devops_project_settings](./images/2-azure_devops_project_settings.png)

添加两个服务连接：

* 第一个连接 `aiml50`
  * 类型：Azure 资源管理器
  * 连接名称：`aiml50`
    * 服务连接的名称。 该名称必须一致，因为它已在生成中设置。
  * 范围级别：`Subscription`
    * 服务主体的授权范围。 对于此连接，请将其设置为 `subscription`。
  * 订阅：`Ignite The Tour`
    * 将演示环境部署到的订阅。 该订阅可以与上面的示例不同。 可以登录到 Azure DevOps 的用户身份，从下拉列表中选择订阅。
  * 资源组：`aiml50` 或空白
    * 你可以将凭据限制于已部署到的资源组，或允许在整个订阅中使用它。

![4-azure_devops_service_connection](./images/4-azure_devops_service_connection.png)
![3-azure_devops_service_connection](./images/3-azure_devops_service_connection.png)

* 第二个连接：`aiml50-workspace`
  * 类型：Azure 资源管理器
  * 连接名称：`aiml50`
    * 服务连接的名称。 该名称必须一致，因为它已在生成中设置。
  * 范围级别：`AzureMLWorkspace`
    * 服务主体的授权范围。 发布要求设置此项。
  * 订阅：`Ignite The Tour`
    * 将演示环境部署到的订阅。 该订阅可以与上面的示例不同。 可以登录到 Azure DevOps 的用户身份，从下拉列表中选择订阅。
  * 资源组：`aiml50`
    * 这应该是包含 Azure 机器学习工作区的资源组。
  * 机器学习工作区：`aiml50demo`
    * 名称取决于用于预配环境的事件或限定符。

![5-azure_devops_service_connection_add](./images/5-azure_devops_service_connection_add.png)
![6-azure_devops_service_connection_detail](./images/6-azure_devops_service_connection_detail.png)

#### <a name="enable-the-variable-group"></a>启用变量组

我们提供一个预配的变量组，其中包含生成和发布都会使用的一些共享值。  需要为变量组授予管道访问权限。

* 导航到“库”（位于“管道”下）。
* 选择 `aiml50-demo` 变量组。
* 切换 `Allow access to all pipelines`
* 保存变量组。

![7-azure_devops_library](./images/7-azure_devops_library.png)
![8-azure_devops_library_detail](./images/8-azure_devops_library_detail.png)

#### <a name="create-the-build"></a>创建生成

现在，我们需要通过将 Azure DevOps 指向 GitHub 上的生成定义来创建生成定义。

* 导航到 `Pipelines`（位于“管道”下）。
* 选择 `New Pipeline`

![9-azure_devops_pipeline_new](./images/9-azure_devops_pipeline_new.png)
![10-azure_devops_pipeline_new_source](./images/10-azure_devops_pipeline_new_source.png)


* 连接到 GitHub 项目 [Ignite 学习路径训练 AI/ML](https://github.com/microsoft/ignite-learning-paths-training-aiml) 的相应分支

![11-azure_devops_pipeline_select_repo](./images/11-azure_devops_pipeline_select_repo.png)

![12-azure_devops_pipeline_select_build_definition](./images/12-azure_devops_pipeline_select_build_definition.png)

* 选择使用存储库中的生成定义 (`aiml50/azure-pipelines.yml`)

![13-azure_devops_pipeline_select_build_definition_location](./images/13-azure_devops_pipeline_select_build_definition_location.png)

#### <a name="run-the-build"></a>运行生成

将生成连接到源存储库后，我们需要运行生成才能创建机器学习管道和创建生成工件，以便我们可以完成发布管道的设置。

* 查看生成定义并运行生成。 生成将在几分钟内完成，但它会触发机器学习管道，这可能需要 20 - 40 分钟。

![14-azure_devops_pipeline_review_build_definition](./images/14-azure_devops_pipeline_review_build_definition.png)
![15-azure_devops_pipeline_build_result](./images/15-azure_devops_pipeline_build_result.png)

#### <a name="update-the-release"></a>更新发布

机器学习管道完成后，我们就可以更新发布管道。

* 导航到 `Releases`（位于“管道”下）。

![16-azure_devops_release_new](./images/16-azure_devops_release_new.png)

* 选择 `Release Seer` 并选择 `Edit`

![17-azure_devops_release_edit](./images/17-azure_devops_release_edit.png)

  * 选择 `Add an artifact`
![18-azure_devops_release_artifact](./images/18-azure_devops_release_artifact.png)


  * 设置 `AzureML` 的 `Source type`
  * 将服务终结点设置为 `aiml50-workspace`
  * 将模型名称设置为 `seer`。  只有第一个 ML 管道完成后，你才能执行此操作。
  * 单击 `Add`
  * 单击新项目中的闪电图标，然后启用 `Continuous deployment trigger`

![19-azure_devops_release_artifact_set](./images/19-azure_devops_release_artifact_set.png)


* 接下来，打开 `Deploy to ACI` 环境。

![20-azure_devops_release_edit_2](./images/20-azure_devops_release_edit_2.png)

* 单击 `Agent Job`
  * 将 `Agent Pool` 设置为 `Azure Pipelines`
  * 将 `Agent Specification` 设置为 `ubuntu-18.04`

![21-azure_devops_release_task_agent](./images/21-azure_devops_release_task_agent.png)

* 单击 `Download deployment and inferencing code`
  * 将 `Package name` 设置为 `seer_deployment`

![22-azure_devops_release_task_edit](./images/22-azure_devops_release_task_edit.png)

* 单击 `Azure ML Model Deploy`
  * 验证是否已将 Azure ML 工作区设置为 `$(subscription_workspace)` 或 `aiml-workspace`。

![23-azure_devops_release_task_verify](./images/23-azure_devops_release_task_verify.png)

* 保存管道并创建新发布。



## <a name="troubleshooting-and-reference"></a>疑难解答和参考

### <a name="checking-the-container-deployment-log"></a>检查容器部署日志

在已预配的资源组中，导航到 `bootstrap-container` 容器实例。 你可以在此处检查容器的日志，其中将显示所执行的步骤和遇到的所有错误。

将模型部署到 ACI 后，请检查所有 3 个容器运行  。 如果已终止，请重启 ACI 实例  。

### <a name="provider-registration"></a>提供程序注册

Tailwind Traders 应用程序使用多个 Azure 服务。 在某些情况下，如果订阅中尚未使用某项服务，则可能需要进行提供程序注册。 以下命令将确认你的订阅能够运行 Tailwind Traders 应用程序。

```
az provider register --namespace Microsoft.OperationalInsights
az provider register --namespace Microsoft.DocumentDB
az provider register --namespace Microsoft.DBforPostgreSQL
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.Sql
az provider register --namespace Microsoft.ContainerRegistry
```

### <a name="source-repositories"></a>源存储库

https://github.com/microsoft/TailwindTraders

https://github.com/microsoft/TailwindTraders-Backend

https://github.com/microsoft/TailwindTraders-Website
