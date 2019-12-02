# <a name="aiml50---demonstration-setup-instructions"></a>AIML50 – Instruções de Instalação da Demonstração

## <a name="create-demonstration-environment"></a>Criar Ambiente de Demonstração

[Tutorial em vídeo](https://youtu.be/C9WtOZaUoyA)

### <a name="prerequisites"></a>Pré-requisitos

* Uma assinatura do Azure
* Uma organização do Azure DevOps à qual você tenha direitos para adicionar extensões.
  * Um PAT (Token de Acesso Pessoal) para sua organização.
* Uma conta do GitHub (na qual você poderá bifurcar este repositório)

### <a name="fork-the-repository"></a>Bifurcar o repositório

No GitHub, [crie uma bifurcação](https://help.github.com/en/github/getting-started-with-github/fork-a-repo) deste repositório em um usuário ou uma organização da qual tenha controle.  Será necessário obter permissões para conectar o repositório do GitHub ao Azure DevOps.

### <a name="deploy-the-template"></a>Implantar o modelo

Este ambiente pode ser implantado por meio do link abaixo "Implantar no Azure" (ou será possível usar o Azure PowerShell ou a CLI do Azure).  Será necessário ter uma assinatura do Azure e as cotas disponíveis em uma região para implantação:

* Bancos de Dados SQL do Azure
* Bancos de Dados Cosmos DB
* Serviços de Aplicativo do Azure
* Serviços do Azure Machine Learning

Será solicitado que você selecione uma assinatura do Azure e um grupo de recursos (será possível criar um grupo de recursos nesse momento).

Também será solicitado que você forneça um identificador de evento (ou o motivo para a rotação do ambiente) que será usado para ajudar a nomear os recursos.  Quanto mais curto, melhor.

Será necessário fornecer um nome de usuário e senha do banco de dados para a instância SQL do Azure.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fmicrosoft%2fignite-learning-paths-training-aiml%2fmaster%2faiml50%2ftemplate%2fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

A implantação leva aproximadamente de 30 a 40 minutos.

Depois que a implantação estiver em andamento (ao menos com o serviço do Azure Machine Learning criado e quando a instância de Contêiner do Azure de contêiner de inicialização tiver sido executada até a conclusão), será possível concluir a configuração do ambiente do Azure DevOps.  A maior parte do ambiente será configurada, mas existem algumas etapas manuais.

### <a name="set-up-azure-notebooks"></a>Configurar o Azure Notebooks

* Navegue até o [Azure Notebooks](https://notebooks.azure.com/) e entre com a conta Microsoft com a qual você está usando a demonstração.
* Adicione um novo projeto.  É possível importar diretamente do GitHub (o repositório principal ou sua bifurcação) ou ainda carregar o diretório `aiml50/source` diretamente.
* No diretório `aiml50/source` no Azure Notebook, crie um arquivo json chamado `azureml-config` com:
  * Sua ID da assinatura
  * O nome do grupo de recursos que contém o workspace do ML
  * O nome do workspace

Exemplo:

```
{
    "subscription_id": "cd400f31-6f94-40ab-863a-673192a3c0d0",
    "resource_group": "aiml50",
    "workspace_name": "aiml50demo"
}
```

* Clique em ativado (que será aberto em uma nova guia)
  * `setup_pipeline.ipynb`

#### <a name="seer_pipelineipynb"></a>seer_pipeline.ipynb

* Verifique se o kernel está definido como Python 3.6
* Defina sua chave de conta de armazenamento
* Edite a etapa 4 e defina o nome da conta de armazenamento
* Comece a executar as etapas individuais.  Será necessário se autenticar no Azure (siga os prompts no notebook). Lembre-se de permitir que etapas individuais sejam concluídas antes de iniciar a próxima.

### <a name="setup-the-azure-devops-project"></a>Configurar o projeto do Azure DevOps

Em seguida, navegue até o projeto AIML50 que foi criado na organização do Azure DevOps especificada para o modelo de implantação.

#### <a name="create-the-service-connections"></a>Criar as Conexões de Serviço

Na página do projeto, navegue até as configurações do projeto.

![0-azure_devops_org](./images/0-azure_devops_org.png)
![1-azure_devops_project](./images/1-azure_devops_project.png)

Selecione `Service Connections` em `Pipelines`.

![2-azure_devops_project_settings](./images/2-azure_devops_project_settings.png)

Adicionar duas conexões de serviço:

* Primeira conexão `aiml50`
  * Tipo: Azure Resource Manager
  * Nome da conexão: `aiml50`
    * Nome da conexão de serviço. Isso precisa corresponder, pois já está definido no build.
  * Nível de escopo: `Subscription`
    * Escopo de autorização para a entidade de serviço. Para isso, defina-o como `subscription`.
  * Assinatura: `Ignite The Tour`
    * A assinatura na qual você implantou o ambiente de demonstração. Isso pode ser diferente do exemplo acima. É possível escolher as assinaturas na lista suspensa com base no usuário com o qual fez logon no Azure DevOps.
  * Grupo de recursos: `aiml50` ou em branco
    * É possível restringir as credenciais para o grupo de recursos que você implantou ou permitir os direitos dele em toda a assinatura.

![4-azure_devops_service_connection](./images/4-azure_devops_service_connection.png)
![3-azure_devops_service_connection](./images/3-azure_devops_service_connection.png)

* Segunda conexão: `aiml50-workspace`
  * Tipo: Azure Resource Manager
  * Nome da conexão: `aiml50`
    * Nome da conexão de serviço. Isso precisa corresponder, pois já está definido no build.
  * Nível de escopo: `AzureMLWorkspace`
    * Escopo de autorização para a entidade de serviço. Isso será necessário para o lançamento.
  * Assinatura: `Ignite The Tour`
    * A assinatura na qual você implantou o ambiente de demonstração. Isso pode ser diferente do exemplo acima. É possível escolher as assinaturas na lista suspensa com base no usuário com o qual fez logon no Azure DevOps.
  * Grupo de Recursos: `aiml50`
    * Esse deve ser o grupo de recursos em seu Workspace do Azure Machine Learning.
  * Workspace do Machine Learning: `aiml50demo`
    * Seu nome variará de acordo com o evento ou qualificador usado para provisionar o ambiente.

![5-azure_devops_service_connection_add](./images/5-azure_devops_service_connection_add.png)
![6-azure_devops_service_connection_detail](./images/6-azure_devops_service_connection_detail.png)

#### <a name="enable-the-variable-group"></a>Habilitar Grupo de Variáveis

Existe um grupo de variáveis provisionado que tem alguns valores compartilhados a serem usados pelo build e pelo lançamento.  O acesso ao pipeline precisa ser concedido para o grupo de variáveis.

* Navegue até a Biblioteca (nos Pipelines).
* Selecione o grupo de variáveis `aiml50-demo`.
* Alterne o `Allow access to all pipelines`
* Salve o grupo de variáveis.

![7-azure_devops_library](./images/7-azure_devops_library.png)
![8-azure_devops_library_detail](./images/8-azure_devops_library_detail.png)

#### <a name="create-the-build"></a>Criar o Build

Precisamos criar agora uma definição de build apontando o Azure DevOps para nossa definição de build no GitHub.

* Navegue até `Pipelines` (nos Pipelines).
* Selecione `New Pipeline`
* Conecte-se à bifurcação do projeto do GitHub [Roteiros de Aprendizagem de IA/ML de Treinamento da Ignite](https://github.com/microsoft/ignite-learning-paths-training-aiml)
* Escolha usar a definição de build do repositório (`aiml50/azure-pipelines.yml`)

![9-azure_devops_pipeline_new](./images/9-azure_devops_pipeline_new.png)
![10-azure_devops_pipeline_new_source](./images/10-azure_devops_pipeline_new_source.png)
![11-azure_devops_pipeline_select_repo](./images/11-azure_devops_pipeline_select_repo.png)
![12-azure_devops_pipeline_select_build_definition](./images/12-azure_devops_pipeline_select_build_definition.png)
![13-azure_devops_pipeline_select_build_definition_location](./images/13-azure_devops_pipeline_select_build_definition_location.png)

#### <a name="run-the-build"></a>Executar o Build

Depois que o build estiver conectado ao repositório de origem, precisamos executar um build para criar o pipeline de Machine Learning e um artefato de compilação para que seja possível concluir a configuração do pipeline de lançamento.

* Examine a definição e execute o build. O build será concluído em alguns minutos, mas acionará um pipeline de Machine Learning que pode levar de 20 a 40 minutos.

![14-azure_devops_pipeline_review_build_definition](./images/14-azure_devops_pipeline_review_build_definition.png)
![15-azure_devops_pipeline_build_result](./images/15-azure_devops_pipeline_build_result.png)

#### <a name="update-the-release"></a>Atualizar o Lançamento

Após a conclusão do pipeline do Machine Learning, podemos atualizar o pipeline de lançamento.

* Navegue até `Releases` (nos Pipelines).
* Selecione `Release Seer` e escolha `Edit`
  * Selecione `Add an artifact`
  * Defina um `Source type` de `AzureML`
  * Defina o ponto de extremidade de serviço como `aiml50-workspace`
  * Defina os Nomes de Modelo como `seer`.  Não será possível fazer isso até que o primeiro Pipeline de ML termine.
  * Clique em `Add`
  * Clique no ícone relâmpago no novo artefato e habilite o `Continuous deployment trigger`
* Em seguida, abra o ambiente de `Deploy to ACI`.
* Clique em `Agent Job`
  * Defina `Agent Pool` como `Azure Pipelines`
  * Defina `Agent Specification` como `ubuntu-18.04`
* Clique em `Download deployment and inferencing code`
  * Defina `Package name` como `seer_deployment`
* Clique em `Azure ML Model Deploy`
  * Verifique se o Workspace do Azure ML está definido para `$(subscription_workspace)` ou `aiml-workspace`.
* Salve o pipeline e crie um novo lançamento.

![16-azure_devops_release_new](./images/16-azure_devops_release_new.png)
![17-azure_devops_release_edit](./images/17-azure_devops_release_edit.png)
![18-azure_devops_release_artifact](./images/18-azure_devops_release_artifact.png)
![19-azure_devops_release_artifact_set](./images/19-azure_devops_release_artifact_set.png)
![20-azure_devops_release_edit_2](./images/20-azure_devops_release_edit_2.png)
![21-azure_devops_release_task_agent](./images/21-azure_devops_release_task_agent.png)
![22-azure_devops_release_task_edit](./images/22-azure_devops_release_task_edit.png)
![23-azure_devops_release_task_verify](./images/23-azure_devops_release_task_verify.png)

## <a name="troubleshooting-and-reference"></a>Solução de problemas e Referência

### <a name="checking-the-container-deployment-log"></a>Verificar o log de implantação do contêiner

No grupo de recursos provisionado, navegue até a instância de contêiner `bootstrap-container`. Nela, é possível verificar os logs do contêiner que mostrarão as etapas executadas e os erros encontrados.

### <a name="provider-registration"></a>Registro do provedor

O aplicativo da Tailwind Traders usa vários serviços do Azure. Em alguns casos, se um serviço ainda não foi usado em sua assinatura, pode ser necessário obter um registro do provedor. Os comandos a seguir garantirão que sua assinatura seja capaz de executar o aplicativo da Tailwind Traders.

```
az provider register --namespace Microsoft.OperationalInsights
az provider register --namespace Microsoft.DocumentDB
az provider register --namespace Microsoft.DBforPostgreSQL
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.Sql
az provider register --namespace Microsoft.ContainerRegistry
```

### <a name="source-repositories"></a>Repositórios de Origem

https://github.com/microsoft/TailwindTraders

https://github.com/microsoft/TailwindTraders-Backend

https://github.com/microsoft/TailwindTraders-Website
