# <a name="aiml50---demonstration-setup-instructions"></a>AIML50 - デモのセットアップ手順

## <a name="create-demonstration-environment"></a>デモンストレーション環境を作成する

[ビデオ チュートリアル](https://youtu.be/C9WtOZaUoyA)

### <a name="prerequisites"></a>前提条件

* Azure サブスクリプション
* 拡張機能の追加権限をお持ちの Azure DevOps 組織。
  * その組織の個人用アクセス トークン (PAT)。
* GitHub アカウント (このリポジトリのフォーク先)

### <a name="fork-the-repository"></a>リポジトリをフォークする

GitHub で、管理対象のユーザーまたは組織の下に、このリポジトリの[フォークを作成](https://help.github.com/en/github/getting-started-with-github/fork-a-repo)します。  GitHub リポジトリを Azure DevOps に接続する権限が必要です。

### <a name="deploy-the-template"></a>テンプレートをデプロイする

この環境は、下の "Azure にデプロイする" リンクを使用してデプロイできます (Azure PowerShell または Azure CLI を使用することもできます)。  デプロイするリージョンの Azure サブスクリプションと使用可能なクォータが必要になります。

* Azure SQL データベース
* Cosmos DB データベース
* Azure App Service
* Azure Machine Learning service

Azure サブスクリプションとリソース グループを選択するよう求められます (リソース グループは、このとき作成することができます)。

また、リソースの名前を指定するために使用されるイベント識別子 (または、環境を起動する理由) も求められます。  短いものをお勧めします。

Azure SQL インスタンスのデータベース ユーザー名とパスワードを入力する必要があります。

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fmicrosoft%2fignite-learning-paths-training-aiml%2fmaster%2faiml50%2ftemplate%2fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

デプロイには約 30 分から 40 分かかります。

デプロイが進行し始めたら (少なくとも Azure Machine Learning service が作成され、ブートストラップコンテナーの Azure コンテナー インスタンスの実行が完了すること)、Azure DevOps 環境のセットアップを完了できます。  ほとんどの環境が構成されますが、手動の手順がいくつかあります。

### <a name="set-up-azure-notebooks"></a>Azure Notebooks を設定する

* [Azure Notebooks](https://notebooks.azure.com/) に移動し、デモに使用している Microsoft アカウントでサインインします。
* 新しいプロジェクトを追加します。  GitHub (メイン リポジトリまたはご自分のフォーク) から直接インポートするか、`aiml50/source` ディレクトリを直接アップロードすることができます。
* Azure Notebook の `aiml50/source` ディレクトリで、次を使用して `azureml-config` という名前の json ファイルを作成します。
  * サブスクリプション ID
  * ML ワークスペースを含むリソース グループの名前
  * ワークスペース名

例:

```
{
    "subscription_id": "cd400f31-6f94-40ab-863a-673192a3c0d0",
    "resource_group": "aiml50",
    "workspace_name": "aiml50demo"
}
```

* クリックします (新しいタブで開きます)
  * `setup_pipeline.ipynb`

#### <a name="seer_pipelineipynb"></a>seer_pipeline.ipynb

* カーネルが Python 3.6 に設定されていることを確認します
* ストレージ アカウント キーを設定します
* 手順 4 を編集し、ストレージ アカウント名を設定します
* 個々の手順の実行を開始します。  Azure に対して認証を行う必要があります (ノートブックの指示に従ってください)。 次の手順を開始する前に、個々の手順を完了させておきます。

### <a name="setup-the-azure-devops-project"></a>Azure DevOps プロジェクトを設定する

次に、デプロイ テンプレートに指定した Azure DevOps 組織で作成された AIML50 プロジェクトに移動します。

#### <a name="create-the-service-connections"></a>サービス接続を作成する

プロジェクト ページから、[プロジェクトの設定] に移動します。

![0-azure_devops_org](./images/0-azure_devops_org.png)
![1-azure_devops_project](./images/1-azure_devops_project.png)

[`Pipelines`] の下の [`Service Connections`] を選択します。

![2-azure_devops_project_settings](./images/2-azure_devops_project_settings.png)

サービス接続を 2 つ追加します。

* 1 番目の接続 `aiml50`
  * 型: Azure Resource Manager
  * 接続名: `aiml50`
    * サービス接続の名前。 これは、ビルドで既に設定されているものと一致する必要があります。
  * スコープ レベル: `Subscription`
    * サービス プリンシパルの承認のスコープ。 この場合は、`subscription` に設定します。
  * サブスクリプション: `Ignite The Tour`
    * デモ環境のデプロイ先のサブスクリプション。 これは、上記の例とは異なる場合があります。 Azure DevOps へのログインに使用したユーザーに基づいて、ドロップダウンからサブスクリプションを選択できます。
  * リソース グループ: `aiml50` または空白
    * 資格情報は、デプロイ先のリソース グループに制限することも、サブスクリプション全体にわたって権限を許可することもできます。

![4-azure_devops_service_connection](./images/4-azure_devops_service_connection.png)
![3-azure_devops_service_connection](./images/3-azure_devops_service_connection.png)

* 2 番目の接続: `aiml50-workspace`
  * 型: Azure Resource Manager
  * 接続名: `aiml50`
    * サービス接続の名前。 これは、ビルドで既に設定されているものと一致する必要があります。
  * スコープ レベル: `AzureMLWorkspace`
    * サービス プリンシパルの承認のスコープ。 これは、リリースに必要です。
  * サブスクリプション: `Ignite The Tour`
    * デモ環境のデプロイ先のサブスクリプション。 これは、上記の例とは異なる場合があります。 Azure DevOps へのログインに使用したユーザーに基づいて、ドロップダウンからサブスクリプションを選択できます。
  * リソース グループ: `aiml50`
    * これは、Azure Machine Learning ワークスペースのリソース グループである必要があります。
  * Machine Learning ワークスペース: `aiml50demo`
    * 名前は、環境のプロビジョニングに使用するイベントまたは修飾子によって異なります。

![5-azure_devops_service_connection_add](./images/5-azure_devops_service_connection_add.png)
![6-azure_devops_service_connection_detail](./images/6-azure_devops_service_connection_detail.png)

#### <a name="enable-the-variable-group"></a>変数グループを有効にする

ビルドとリリースで使用される共有値を持つ、プロビジョニングされた変数グループがあります。  変数グループには、パイプライン アクセス権が付与されている必要があります。

* [パイプライン] の下にある [ライブラリ] に移動します。
* `aiml50-demo` 変数グループを選択します。
* `Allow access to all pipelines` を切り替えます
* 変数グループを保存します。

![7-azure_devops_library](./images/7-azure_devops_library.png)
![8-azure_devops_library_detail](./images/8-azure_devops_library_detail.png)

#### <a name="create-the-build"></a>ビルドを作成する

ここで、GitHub のビルド定義に Azure DevOps を指定して、ビルド定義を作成する必要があります。

* [パイプライン] の下にある [`Pipelines`] に移動します。
* [`New Pipeline`] を選択します
* GitHub プロジェクト [Ignite Learning Paths トレーニング AI/ML](https://github.com/microsoft/ignite-learning-paths-training-aiml) のご自分のフォークに接続します
* リポジトリからビルド定義の使用を選択します (`aiml50/azure-pipelines.yml`)

![9-azure_devops_pipeline_new](./images/9-azure_devops_pipeline_new.png)
![10-azure_devops_pipeline_new_source](./images/10-azure_devops_pipeline_new_source.png)
![11-azure_devops_pipeline_select_repo](./images/11-azure_devops_pipeline_select_repo.png)
![12-azure_devops_pipeline_select_build_definition](./images/12-azure_devops_pipeline_select_build_definition.png)
![13-azure_devops_pipeline_select_build_definition_location](./images/13-azure_devops_pipeline_select_build_definition_location.png)

#### <a name="run-the-build"></a>ビルドを実行する

ビルドがソース リポジトリに接続されたら、ビルドを実行して Machine Learning パイプラインを作成し、ビルド成果物を作成して、リリース パイプラインの設定を完了できるようにする必要があります。

* ビルド定義を確認し、ビルドを実行します。 ビルドは数分で完了しますが、Machine Learning パイプラインがトリガーされます。これには約 20 分から 40 分かかります。

![14-azure_devops_pipeline_review_build_definition](./images/14-azure_devops_pipeline_review_build_definition.png)
![15-azure_devops_pipeline_build_result](./images/15-azure_devops_pipeline_build_result.png)

#### <a name="update-the-release"></a>リリースを更新する

Machine Learning パイプラインが終了したら、リリース パイプラインを更新できます。

* [パイプライン] の下にある [`Releases`] に移動します。
* [`Release Seer`] を選択して、[`Edit`] を選択します
  * [`Add an artifact`] を選択します
  * `AzureML` の `Source type` を設定します
  * サービス エンドポイントを `aiml50-workspace` に設定します
  * モデル名を `seer` に設定します。  最初の ML パイプラインが終了するまで、これを行うことはできません。
  * [`Add`] をクリックします
  * 新しい成果物の稲妻アイコンをクリックし、[`Continuous deployment trigger`] を有効にします
* 次に、`Deploy to ACI` 環境を開きます。
* [`Agent Job`] をクリックします
  * `Agent Pool` を `Azure Pipelines` に設定します
  * `Agent Specification` を `ubuntu-18.04` に設定します
* [`Download deployment and inferencing code`] をクリックします
  * `Package name` を `seer_deployment` に設定します
* [`Azure ML Model Deploy`] をクリックします
  * Azure ML ワークスペースが `$(subscription_workspace)` または `aiml-workspace` のいずれかに設定されていることを確認します。
* パイプラインを保存し、新しいリリースを作成します。

![16-azure_devops_release_new](./images/16-azure_devops_release_new.png)
![17-azure_devops_release_edit](./images/17-azure_devops_release_edit.png)
![18-azure_devops_release_artifact](./images/18-azure_devops_release_artifact.png)
![19-azure_devops_release_artifact_set](./images/19-azure_devops_release_artifact_set.png)
![20-azure_devops_release_edit_2](./images/20-azure_devops_release_edit_2.png)
![21-azure_devops_release_task_agent](./images/21-azure_devops_release_task_agent.png)
![22-azure_devops_release_task_edit](./images/22-azure_devops_release_task_edit.png)
![23-azure_devops_release_task_verify](./images/23-azure_devops_release_task_verify.png)

## <a name="troubleshooting-and-reference"></a>トラブルシューティングとリファレンス

### <a name="checking-the-container-deployment-log"></a>コンテナーのデプロイ ログを確認する

プロビジョニングされたリソース グループで、`bootstrap-container` コンテナー インスタンスに移動します。 そこから、コンテナーのログを確認できます。実行済みの手順と発生したエラーが表示されます。

### <a name="provider-registration"></a>プロバイダーの登録

Tailwind Traders アプリケーションでは、Azure サービスを数多く使用しています。 場合によっては、サブスクリプションでサービスがまだ使用されていないと、プロバイダーの登録が必要になることがあります。 次のコマンドを実行すると、サブスクリプションで Tailwind Traders アプリケーションを実行できるようになります。

```
az provider register --namespace Microsoft.OperationalInsights
az provider register --namespace Microsoft.DocumentDB
az provider register --namespace Microsoft.DBforPostgreSQL
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.Sql
az provider register --namespace Microsoft.ContainerRegistry
```

### <a name="source-repositories"></a>ソース リポジトリ

https://github.com/microsoft/TailwindTraders

https://github.com/microsoft/TailwindTraders-Backend

https://github.com/microsoft/TailwindTraders-Website
