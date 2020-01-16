# <a name="demo-setup"></a>デモのセットアップ
以下の手順でライブ デモの環境を準備します。 このセットアップが完了したら、[デモ ガイド](demoguide.md)に従ってください。

## <a name="create-azure-machine-learninge-resources-with-the-deploy-to-azure-button-below"></a>下の [Azure にデプロイする] ボタンで Azure Machine Learninge リソースを作成する
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>

> 作成したら、Azure Machine Learning リソースをこのセッション用に Enterprise Edition にアップグレードしてください。 この操作を完了するための [アップグレード] ボタンが表示されます。 これは現在プレビュー段階ですが、価格体系については[こちら](https://azure.microsoft.com/en-us/pricing/details/machine-learning/)をご覧ください

## <a name="create-additional-resources-needed"></a>必要な追加リソースを作成する

* **[Launch the new Azure Machine Learning studio]\(新しい Azure Machine Learning Studio を起動する\)** を選択します

基本の Azure Machine Learning service を作成したら、追加のコンピューティング リソースを追加する必要があります。
### <a name="create-compute-targets"></a>コンピューティング ターゲットを作成します
1. Machine Learning コンピューティングを作成します
    * ナビゲーションの [コンピューティング] をクリックします
    * [クラスターのトレーニング] を選択します
    * [新規] をクリックします
    * リソースの名前を入力します
    * マシンのサイズを選択します (例:Standard_DS2_v2)
    * 最小ノードと最大ノードを入力します (推奨最小値は 0、推奨最大値は 5)
    * [作成] をクリックします ![コンピューティングの作成](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif)
2. Kubernetes コンピューティングを作成します
    * ナビゲーションの [コンピューティング] をクリックします
    * [推論クラスター] を選択します
    * [新規] をクリックします
    * リソースの名前を入力します
    * リージョンを選択します
    * [仮想マシンのサイズ] を既定値のままにします
    * クラスターの目的を "Dev-test" に設定します
    * [作成] をクリックします ![Kubernetes の作成](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif)
3. ノートブック仮想マシンを作成します
    * ナビゲーションの [コンピューティング] をクリックします
    * [ノートブック VM] を選択します
    * [新規] をクリックします
    * ノートブックに一意の名前を付けます
    * VM のサイズを選択します
    * [作成] をクリックします。 ![VM の作成](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif)


## <a name="upload-dataset-to-workspace-blob-storage-and-save-to-local"></a>データセットをワークスペース Blob Storage にアップロードし、ローカルに保存する
更新後の日付で必要なデータセットが毎週作成され、デモで将来の週を予測できるようになります。 新しいデータセットを取得して Azure Machine Learning ストレージ アカウントとデモ データ アプリに追加する手順を次に示します。

1. データセットを[こちら](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv)からローカルにダウンロードします
2. Azure Storage Explorer を開きます - [こちらからダウンロードします](https://azure.microsoft.com/en-us/features/storage-explorer/)。
3. `azureml-blobstore-<guid>` に移動します
4. `datasets` という名前で新しいフォルダーを作成します
5. データセットをアップロードします
6. 将来の日付について予測するために、C# デモ アプリのローカルの ForecastingData.csv ファイルを置換します。 既定の csv がありますが、更新後のデータにはなりません。

## <a name="get-the-c-demo-app"></a>C# デモ アプリを入手する
最初のデモには VS Code と C# IgniteAimlDataApp を使用します。 これは、データ処理方法をデモンストレーションし、それがどの言語でも実行できることを強調することを目的としています。

1. [こちらから VS Code をダウンロードします](https://code.visualstudio.com/download)
2. [.NET Core SDK 2.1.0](https://dotnet.microsoft.com/download/dotnet-core/2.1) がローカルにインストールされていることを確認します
3. 次のコマンドを使用してアプリを複製します
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
4. プロジェクト パスに移動します
    * `cd ignite-learning-paths-training-aiml/aiml30/C#/IgniteAimlDataApp/IgniteAimlDataApp`
5. VS Code でプロジェクトを開きます
    * `code .`
6. `IgniteAimlDataApp/Datasets` フォルダーで、上記の手順でダウンロードしたデータセットでローカル データセットを置換します。
7. アプリを実行するには
    * `Program.cs` を右クリックして [`Open in Terminal`] を選択します。
    * `dotnet run` コマンドを実行します。
    * 質問 `Would you like to run the default params` が表示されるので「`y`」と入力します。
    * これで API が呼び出されますが、まだ作成されていないため、失敗します。

## <a name="run-through-the-live-demo"></a>ライブ デモを実行する
ライブ デモを最初から最後まで実行し、完了したバックアップ モデルを開いて、最終結果を表示します。

#### <a name="there-will-not-be-enough-time-to-run-the-model-during-the-live-demo-make-sure-to-build-the-model-_without_-running-it-in-the-live-session-once-you-have-added-all-the-modules-to-the-experiment-workspace-then-navigate-to-the-model-you-created-and-trained-prior-to-the-session"></a>ライブ デモ中はモデルを実行するだけの時間はないでしょう。 ライブ セッションでは、モデルを構築し、実行は "_しない_" ようにしてください。 すべてのモジュールを実験ワークスペースに追加したら、セッションに先立って作成してトレーニングしたモデルに移動しておきます。

[次 - ライブ デモの手順](demoguide.md)
