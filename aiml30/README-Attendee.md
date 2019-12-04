# <a name="aiml30--start-building-machine-learning-models-faster-than-you-think--train-the-trainer"></a>AIML30 - 予想よりも速く機械学習モデルの構築を開始する - トレーナー トレーニング

Tailwind Traders では、カスタムの機械学習モデルを使用することで、ソフトウェア開発のライフ サイクルを変えることなく、在庫問題を解決しています。 その方法をご紹介しましょう。 Azure Machine Learning のビジュアル インターフェイスです。
 
このセッションでは、Tailwind Traders で使用されているデータ サイエンス プロセスについて学習し、Azure Machine Learning のビジュアル インターフェイスの概要を理解します。 データの検索、インポート、準備、機械学習アルゴリズムの選択、モデルのトレーニングとテスト、完成したモデルを API にデプロイする方法について説明します。 あなたやあなたが属する開発チームが機械学習の導入を続け、最初のモデルを構築したりするために必要なヒント、ベスト プラクティス、リソースを手に入れてください。


## <a name="demo-environment-deployment"></a>デモ環境のデプロイ
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>


## <a name="create-additional-resources-needed"></a>必要な追加リソースを作成する
基本の Azure Machine Learning service ワークスペースを作成したら、コンピューティング リソースを追加する必要があります。
### <a name="create-compute-targets"></a>コンピューティング ターゲットを作成します
1. Machine Learning コンピューティングを作成します
    * ナビゲーションの [コンピューティング] をクリックします
    * [新規] をクリックします
    * リソースの名前を入力します
    * ドロップダウンから [Machine Learning コンピューティング] を選択します
    * マシンのサイズを選択します
    * 最小ノードと最大ノードを入力します (推奨最小値は 0、推奨最大値は 5)
    * [作成] をクリックします ![コンピューティングの作成](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif)
2. Kubernetes コンピューティングを作成します
    * ナビゲーションの [コンピューティング] をクリックします
    * [新規] をクリックします
    * リソースの名前を入力します
    * ドロップダウンから [Kubernetes Service] を選択します
    * [作成] をクリックします ![Kubernetes の作成](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif)


## <a name="build-model-with-azure-machine-learning-visual-designer"></a>Azure Machine Learning ビジュアル デザイナーでモデルをビルドする

### <a name="1-upload-the-dataset-to-the-datasets-in-aml"></a>1.AML 内のデータセットにこのデータセットをアップロードします
* データセットを[こちら](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv)からローカルにダウンロードします
* [`Datasets`] をクリックします
* [`Create from local`] をクリックします
* フォームに記入し、データセットをアップロードします

### <a name="2-start-building-the--model"></a>2.モデルの構築を開始します

* 左側のナビゲーションにある [`Visual Interface`] をクリックします
* [`Launch Visual Interface`] をクリックします
* 左下隅にある [`New`] をクリックします
* [`Blank Experiment`] をクリックします
* `Datasets` と `My Datasets` を展開します
* アップロードしたデータセットを実験ワークスペースにドラッグ アンド ドロップします
* `Select Columns in Dataset` をワークスペースにドラッグします
    * 右側のプロパティ メニューにある `Edit columns` をクリックします。
    * [`All Columns`] をクリックします
    * [`Exclude`] をクリックします
    * [`column names`] をクリックします
    * `Time` 列を除外します
    * `DatesInWeek` を除外します
    * 注:必要に応じて、アップロード中のデータ準備手順でワークスペースにデータセットをアップロードするときに、データ編集機能でこれらの列を除外します。
* `Split Data` をワークスペースにドラッグします
    * プロパティを編集し、データを 70/30 で分割します。 
    * これはルールではなく、さまざまなモデル ニーズに基づいて変更できると説明します。
* `Train Model` をワークスペースにドラッグします
    * 右側のプロパティからラベルの列名 `Values` を選択します
* `Boosted Decision Tree Regression` をワークスペースにドラッグします
* `Score Model` をワークスペースにドラッグします
* `Evaluate` をワークスペースにドラッグします
* `Split Data` モジュールはトレーニング データ用として `Train Model` に接続し、未知のデータによる予測結果にスコアを付ける目的で `Score Model` に接続します。
* `Train Model` をトレーニング アルゴリズム `Boosted Decision Tree Regression` モジュールに接続します。
* `Score Model` を `Evaluate` モジュールと接続します。
* 下部ナビゲーションにある [`Run`] ボタンをクリックし、[コンピューティング] を選択します。 

* `Execute Python Script` モジュールをワークスペースにドラッグし、`Score Model` モジュールをそれに接続します。 
* このコードをコピーし、次の場所に貼り付けます。
    * `import pandas as pd` </br>
       `import numpy as np` </br>
        `def azureml_main(dataframe1 = None, dataframe2 = None):` </br>
            `print(f'Input pandas.DataFrame #1: {dataframe1}')`</br>
            `df = dataframe1`</br>
            `df['Value'] = np.exp(df['Value'])`</br>
            `df['Forecast'] = np.exp(df['Scored Labels'])`</br>
            `return df`
* `Select Columns in Dataset` をドラッグします
* 列 `ID1`、`ID2`、`Value`、`Forecast` を選択します
* これらは、完成してデプロイしたモデルから結果を取得する目的でポストしたときにデータ デモ アプリから求められる列です。
* トレーニングを実行します

### <a name="4-create-predictive-experiment-and-deploy-the-model"></a>4.予測実験を作成し、モデルをデプロイします

* `Create` 予測実験をクリックします。 `Predictive Experiment` モデルは、Web サービスにデプロイされる運用モデルとお考えください。 `Training Experiment` は開発モデルです。
* 作成された予測実験に `Execute Python Script` モジュールと `Select Columns in Dataset` モジュールを追加します。
* 実験を実行します
* [`Deploy Web Service`] をクリックします
* 左側のナビゲーションから、デプロイした Web サービスに移動します。
* 作成した Web サービスの名前をクリックします。
* [`Test`] をクリックし、スコア付けされたデータ項目に対してどのように実行されるか確認します。
* [`Consume`] をクリックし、Web サービスを統合するためのサンプル コードを表示します。

### <a name="5-testing-api-with-c-console-app-dotnet-core"></a>5.C# コンソール アプリで API をテストします (dotnet core)

1. [こちらから VS Code をダウンロードします](https://code.visualstudio.com/download)
2. 次のコマンドを使用してアプリを複製します
    * `git clone https://github.com/microsoft/ignite-learning-paths.git`
3. プロジェクト パスに移動します
    * `cd ignite-learning-paths\aiml\aiml30\C#\IgniteAimlDataApp`
4. VS Code でプロジェクトを開きます
    * `code .`
5. `IgniteAimlDataApp/Datasets` フォルダーで、上記の手順でダウンロードしたデータセットでローカル データセットを置換します。
6. テストを実行するには
    * [`Consume`] タブから API キーをコピーします
    * `App.config` を開き、値属性にそれを貼り付けます
    * [`Consume`] タブから `Request-Response Url` をコピーします
    * `Program.cs` を開き、`client.BaseAddress = new Uri("");` に値を貼り付けます
    * `Program.cs` を右クリックし、[`Open in Terminal`] を選択します
    * コマンド `dotnet run` を入力し、コンソール アプリを実行します
    * StoreID (ID1) の既定値 2、ItemID (ID2) の既定値 1、既定の週数を使用して予測するには。 「`y`」を入力します
    * これで実行され、次の 4 週間分の予測値が返されるはずです。

## <a name="delivery-assets"></a>プレゼンテーション用アセット

このプレゼンテーションには次のアセットを使用できます。

- [PowerPoint デッキ](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/AIML30_How%20to%20Build%20Machine%20Learning%20Models.pptx)
- [デモンストレーション ビデオ](https://www.youtube.com/watch?v=u1ppYaZuNmo&feature=youtu.be)

## <a name="resources-and-continue-learning"></a>リソースと継続学習

関連するトレーニングとドキュメントの一覧を次に示します。

- [Azure Machine Learning 用のビジュアル インターフェイスとは](https://docs.microsoft.com/en-us/azure/machine-learning/service/ui-concept-visual-interface?WT.mc_id=msignitethetour-slides-cxa)
- [Microsoft Azure Machine Learning を使用して機械学習の実験を公開する](https://docs.microsoft.com/en-us/learn/paths/publish-experiment-with-ml-studio/)


## <a name="feedback-loop"></a>フィードバック ループ

コメント、フィードバック、ご提案はございますか。 現在のところ、コンテンツへの変更、提案、またはフィードバックをお送りいただく場合、最良のフィードバック ループとしてこの GitHub リポジトリで新しいイシューを作成していただくことをお勧めします。 イシューの作成方法については、[共同作成](../../contributing.md)に関するドキュメントをご覧ください
