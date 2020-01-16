# <a name="aiml30--start-building-machine-learning-models-faster-than-you-think--train-the-trainer"></a>AIML30 - 予想よりも速く機械学習モデルの構築を開始する - トレーナー トレーニング

Tailwind Traders では、カスタムの機械学習モデルを使用することで、ソフトウェア開発のライフ サイクルを変えることなく、在庫問題を解決しています。 方法を知りたいですか。 Azure Machine Learning デザイナーを使用しているのです。
 
このセッションでは、Tailwind Traders で使用されているデータ サイエンス プロセスについて学習し、Azure Machine Learning デザイナーの概要を説明します。 データの検索、インポート、準備を行う方法や、機械学習アルゴリズムを選択する方法、モデルのトレーニングとテストを行う方法、完全なモデルを API にデプロイする方法について確認します。 あなたやあなたが属する開発チームが機械学習の導入を続け、最初のモデルを構築したりするために必要なヒント、ベスト プラクティス、リソースを手に入れてください。


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

* 左側のナビゲーションにある [`Designer`] をクリックします
* プラス記号をクリックして新しいパイプラインを作成します
* [`Datasets`] と [`My Datasets`] を展開します
* アップロードしたデータセットを実験ワークスペースにドラッグ アンド ドロップします
* `Select Columns in Dataset` をワークスペースにドラッグします
    * 右側のパラメーター メニューにある [`Edit columns`] をクリックします。
    * [`By Name`] をクリックします
    * [`Add All`] をクリックします
    * [`Time`] 列の [`Minus`] アイコンをクリックして除外します
* `Split Data` をワークスペースにドラッグします
    * パラメーターを編集して、データを 70/30 に分割します。 
    * これは決まりではなく、モデルのニーズによってベースを変更できます。
* `Train Model` をワークスペースにドラッグします
    * 右側のパラメーターからラベルの列名 [`Values`] を選択します
* `Boosted Decision Tree Regression` をワークスペースにドラッグします
* `Score Model` をワークスペースにドラッグします
* `Evaluate` をワークスペースにドラッグします
* `Split Data` モジュールはトレーニング データ用として `Train Model` に接続し、未知のデータによる予測結果にスコアを付ける目的で `Score Model` に接続します。
* `Train Model` をトレーニング アルゴリズム `Boosted Decision Tree Regression` モジュールに接続します。
* `Score Model` を `Evaluate` モジュールと接続します。
* 下部ナビゲーションにある [`Run`] ボタンをクリックし、コンピューティングを選択します。 

* 作成した列の名前を「`Scored Labels`」から「`Forecast`」に変更します
    * `Edit Metadata` をワークスペースにドラッグします
    * `Score Model` を `Edit Metadata` モジュールと接続します
    * `Edit Metadata` モジュールの `Parameters` で、 [`Edit Columns`] をクリックします
    * テキスト ボックスに「`Score Labels`」と入力します (既定値を変更する必要はありません)
    * [`Save`] をクリックします
    * 次に、[`Parameters`] の [`New Column Name`] フィールドを「`Forecast`」に更新します
* 正規化された値を完全な項目数に変換します
    * `Apply Math Operation` をワークスペースにドラッグします
    * `Edit Metadata` を `Apply Math Operation` に接続します
    * [`Basic math function`] を [`Exp`] に設定します
    * [`Edit Columns`] をクリックし、「`Value`」と「`Forecast`」を入力します
    * [`Save`] をクリックします
    * [`Output mode`] を [`Inplace`] に設定します
* `Select Columns in Dataset` モジュールをワークスペースにドラッグします
* `Apply Math Operation` を `Select Columns in Dataset` に接続します
* [`Edit Columns`] をクリックし、列名「`ID1,ID2,Value,Forecast`」を入力します
* これらは、ポストして完成したデプロイ済みモデルから結果を取得するときに、データ デモ アプリで想定される列です。
* トレーニングを実行します

### <a name="4-create-inference-pipeline-and-deploy-the-model"></a>4.推論パイプラインを作成してモデルをデプロイします
* [`Create inference pipeline`] をクリックして、[`Real-time inference pipeline`] を選択します
* `Web Service Output` が、最後のデータ処理手順モジュール `Select Columns in Dataset` に接続されるようにします
* [`Run`] をクリックします
* [`Deploy`] をクリックします
* 左側のナビゲーションから、デプロイした Web サービスに移動します。
* あらかじめ作成されている Web サービスの名前をクリックします。
* [`Test`] をクリックし、スコア付けされたデータ項目に対してどのように実行されるか確認します。
* [`Consume`] をクリックし、Web サービスの統合用に提供されているサンプル コードを表示します。

### <a name="5-test-api-with-c-console-app-dotnet-core"></a>5.C# コンソール アプリを使用して API をテストします (dotnet core)

1. [こちらから VS Code をダウンロードします](https://code.visualstudio.com/download)
2. 次のコマンドを使用してアプリを複製します
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
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


### <a name="6-optional-additionally-test-api-with-python-in-notebook-vms-using-jupyter-notebooks"></a>6.省略可能:さらに、Jupyter Notebook を使用して Notebook VM で Python を使用して API をテストします
1. [`Compute`] に移動し、新しい Notebook VM を作成します ![コンピューティングの作成](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif)
2. [`Application URI`] 列の下に作成されたら、[`Jupyter Lab`] オプションをクリックします。 (これは、VM が [`running`] 状態になるまで表示されません。)
3. Jupyter Lab のホームページからターミナルをクリックします
4. Jupyter Lab でターミナルからリポジトリをクローンします
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
5. ターミナルで、`pip install holidays` も実行します
6. クローンされた `ignite-learning-paths-training-aiml` フォルダーを開き、`ignite-ailml30-get-prediction.ipynb` ファイルに移動し、クリックしてファイルを開きます。
    * 完全なパスは次のようになります: `ignite-learning-paths-training-aiml\aiml30\Python\ignite-ailml30-get-prediction.ipynb`
7. csv ファイルへのパス、エンドポイント、およびキーを更新します。
8. `SHIFT + Enter` キーを押すか、上部のメニューの各セルで [再生] をクリックして、各セルを実行します

## <a name="powerpoint-deck-and-video-demo"></a>PowerPoint デッキとビデオ デモ

- [PowerPoint デッキ](presentations.md)

- [デモンストレーション ビデオ](https://www.youtube.com/watch?v=u1ppYaZuNmo&feature=youtu.be)

## <a name="resources-and-continue-learning"></a>リソースと継続学習

関連するトレーニングとドキュメントの一覧を次に示します。

- [Azure Machine Learning デザイナーとは](https://docs.microsoft.com/en-us/azure/machine-learning/service/ui-concept-visual-interface?WT.mc_id=msignitethetour-slides-cxa)
- [Microsoft Azure Machine Learning Studio を使用して Machine Learning の実験を公開する](https://docs.microsoft.com/en-us/learn/paths/publish-experiment-with-ml-studio/)


## <a name="feedback-loop"></a>フィードバック ループ

コメント、フィードバック、ご提案はございますか。 現在のところ、コンテンツへの変更、提案、またはフィードバックをお送りいただく場合、最良のフィードバック ループとしてこの GitHub リポジトリで新しいイシューを作成していただくことをお勧めします。 イシューの作成方法については、[共同作成](../../contributing.md)に関するドキュメントをご覧ください
