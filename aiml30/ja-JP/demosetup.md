# <a name="demo-setup"></a>デモ セットアップ
以下の手順でライブ デモのために環境を準備します。 このセットアップが完了したら、[デモ ガイド](demoguide.md)に従ってください。

## <a name="create-azure-machine-learninge-resources-with-the-deploy-to-azure-button-below"></a>下の [Azure にデプロイ] ボタンで Azure Machine Learninge リソースを作成する
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>

> 作成したら、Azure Machine Learning リソースをこのセッション用に Enterprise Edition にアップグレードしてください。 この操作を完了するための [アップグレード] ボタンが表示されます。 これは現在プレビューの段階ですが、価格体系については[こちら](https://azure.microsoft.com/en-us/pricing/details/machine-learning/)を参照してください

## <a name="create-additional-resources-needed"></a>必要な追加リソースを作成する

* **[新しい Azure Machine Learning studio を起動する]** を選択します

基本の Azure Machine Learning サービスを作成したら、追加のコンピューティング リソースを追加する必要があります。
### <a name="create-compute-targets"></a>コンピューティング ターゲットを作成します
1. Machine Learning コンピューティングを作成します。
    * [コンピューティング] をクリックします
    * [クラスターのトレーニング] を選択します
    * [新規] をクリックします
    * リソースの名前を入力します
    * マシンのサイズを選択します (例:Standard_DS2_v2)
    * 最小ノードと最大ノードを選択します (推奨最小値は 0、推奨最大値は 5)
    * [作成] をクリックします。 ![コンピューティングの作成](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif)
2. Kubernetes コンピューティングを作成します。
    * [コンピューティング] をクリックします
    * [推論クラスター] を選択します
    * [新規] をクリックします
    * リソースの名前を入力します
    * リージョンを選択します
    * [仮想マシンのサイズ] を既定値のままにします
    * クラスターの目的を "Dev-test" に設定します
    * [作成] をクリックします。![Kubernetes の作成](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif)
3. ノートブック仮想マシンを作成します
    * NAV の [コンピューティング] をクリックします
    * [ノートブック VM] を選択します
    * [新規] をクリックします
    * ノートブックに一意の名前を付けます。
    * VM のサイズを選択します。
    * [作成] をクリックします。 ![VM の作成](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif)


## <a name="upload-dataset-to-workspace-blob-storage-and-save-to-local"></a>データセットをワークスペース Blob Storage にアップロードし、ローカルに保存します。
更新後の日付で必要なデータセットが毎週作成され、デモで将来の週を予測できるようになります。 新しいデータセットを取得し、それを Azure Machine Learning ストレージ アカウントとデモ データ アプリに追加する手順を次に示します。

1. [こちら](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv)からデータセットをローカルにダウンロードします
2. Azure Storage Explorer を開きます - [こちらからダウンロードしてください](https://azure.microsoft.com/en-us/features/storage-explorer/)。
3. `azureml-blobstore-<guid>` に移動します。
4. `datasets` という名前で新しいフォルダーを作成します。
5. データセットをアップロードします。
6. 将来の日付を予測する目的で、C# デモ アプリのローカル ForecastingData.csv ファイルを置換します。 既定の csv がありますが、更新後のデータにはなりません。

## <a name="get-the-c-demo-app"></a>C# デモ アプリを入手する
最初のデモには VS Code と C# IgniteAimlDataApp が使用されます。 これは、データの処理方法を実演し、それがあらゆる言語でできることを強調することを目的としています。

1. [こちらから VS Code をダウンロードしてください](https://code.visualstudio.com/download)
2. [.NET Core SDK 2.1.0](https://dotnet.microsoft.com/download/dotnet-core/2.1) がローカルにインストールされていることを確認します
3. 次のコマンドでアプリを複製します
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
4. プロジェクト パスに移動します。
    * `cd ignite-learning-paths-training-aiml/aiml30/C#/IgniteAimlDataApp/IgniteAimlDataApp`
5. VS Code でプロジェクトを開く
    * `code .`
6. `IgniteAimlDataApp/Datasets` フォルダーで、上の手順でダウンロードしたデータセットでローカル データセットを置換します。
7. アプリを実行するには
    * `Program.cs` を右クリックして [`Open in Terminal`] を選択します
    * コマンド `dotnet run` を実行する Mac ユーザー向けのメモ: プログラムがインポートしたファイルを見つけることができないというエラーが表示された場合は、Program.cs の 14 行目にスラッシュ `string sourceFile = $"{Environment.CurrentDirectory}//Datasets//{fileName}.csv";` を含めるように変更します
    * 質問 `Would you like to run the default params` が表示されるので「`y`」と入力します
    * これで API が呼び出されますが、まだ作成されていないため、失敗します。

## <a name="run-through-the-live-demo"></a>ライブ デモをとおして実行する
最終的な結果を提示する目的で、ライブ デモを最後までとおして実行し、完全なバックアップ モデルを生成しておきます。

#### <a name="there-will-not-be-enough-time-to-run-the-model-during-the-live-demo-make-sure-to-build-the-model-_without_-running-it-in-the-live-session-once-you-have-added-all-the-modules-to-the-experiment-workspace-then-navigate-to-the-model-you-created-and-trained-prior-to-the-session"></a>ライブ デモ中は、モデルを実行する時間はないでしょう。 ライブ セッションでは、実行_せずに_モデルを構築してください。 すべてのモジュールが実験ワークスペースに追加されたら、セッションに先立って作成し、トレーニングしたモデルに移動します。

[次 - ライブ デモの手順](demoguide.md)
