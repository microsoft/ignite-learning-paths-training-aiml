# <a name="demo-guide"></a>デモ ガイド
> 💡 デモを実行する前に、[デプロイ](demosetup.md)を完了している必要があります。

# <a name="demo-1-data-prep-demo-with-app"></a>デモ 1:アプリを使用したデータ準備のデモ
最初のデモでは、タイム シリーズ モデル用のスライドで説明したデータ準備を強調します。 C# デモ アプリで、これを行う方法について順を追って説明します。 これはどの言語でも実行できることを必ず強調してください。

`F12` と `CTRL-` のショートカットを使用してコード間を移動するには、[こちらで](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vs-keybindings) VS Code 用の Visual Studio ショートカット拡張機能をダウンロードしてください。 これは非常に便利で、何かを探してスクロールする必要がなくなります。 (この拡張機能は、Mac と Linux では機能しません)

### <a name="data-prep-demo-video-herehttpsyoutubeu1ppyazunmot751"></a>データ準備のデモ ビデオは[こちら](https://youtu.be/u1ppYaZuNmo?t=751)

> 💡 デモを実行する前に、[デプロイ](demosetup.md)を完了している必要があります。

### <a name="1-open-the-igniteaimldataapp-app-i-personally-like-to-have-this-open-before-i-start-the-talk-so-i-can-just-flip-to-it"></a>1.`IgniteAimlDataApp` アプリを開きます。 個人的には、トークを開始する前にこれを開いておいて、すぐに移動できるようにしておくことをお勧めします。
* `Program.cs` ファイルを開きます
* 右クリックして `Go To Definition` を選択するか、`F12` キーを押すことで、`GetProcessedDataForScore` メソッドに移動します
    * データ ソースからデータを読み込みます。 この例では、ソリューション内にあるローカルの Excel ファイルに読み込みます。
* `AddWeeksToPredict` メソッドに `F12` して、ロジックについて説明します。
    * 最新の日付を取得し、その日付から先の 4 週間を追加します
    * データは週単位であり、週の間に休日があるかどうかを確認する必要があるため、週に含まれるすべての日付を計算し、`DatesInWeek` という名前のコレクションを設定します
    * 次に、コレクションに追加された未来の 4 週間に対する時刻の特徴を作成します。
* `AddWeeksToPredict` ロジック内から `CreateTimeFeatures` メソッドに `F12` して、ロジックについて説明します。
    * 現在の時刻のプロパティを使用して、必要な時刻と休日の特徴を計算します。
* `CTRL-` を使って `AddWeeksToPredict` に戻ります
* `CreateFourierFeatures` に `F12` します
    * 週単位のデータの特徴の 52 個の季節性からフーリエ項の特徴を計算します。 
* `CTRL-` を使って `GetProcessedDataForScore` に戻ります
* `CreateLagFeatures` メソッドに `F12` して、ロジックについて説明します。
    * 現在の行に、26 週間前の売上の値を追加します。
* `CTRL-` を使って `GetProcessedDataForScore` に戻ります

* データ デモのバックアップ オプション
    * 非表示スライド内の埋め込み mp4 ビデオを使用します。 音を消したこのビデオに沿ってトークを行います。
    * スライド 21 から開始し、静的なスライドの手順でデータ準備のコードを示します。

# <a name="demo-2-build-model-with-azure-machine-learning-designer"></a>デモ 2:Azure Machine Learning デザイナーを使用したモデルのビルド
💡 デモを実行する前に、[デプロイ](demosetup.md)を完了している必要があります。

### <a name="full-model-building-live-demo-video-herehttpsyoutubeu1ppyazunmot1278"></a>完全なモデル構築のライブ デモ ビデオは[こちら](https://youtu.be/u1ppYaZuNmo?t=1278)

### <a name="1-create-resource-and-upload-dataset"></a>1.リソースを作成し、データセットをアップロードします

* Azure Machine Learning Studio のリソースを作成し、新しいワークスペースに移動します。
    * スライドで説明した各種ツールが存在する場所を確認します。
    * この手順のビデオ リソース:
        * この手順の音のないビデオは[こちら](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateAMLNavToWorkspace.mp4)です。
        * リソースの作成方法に関する音声ありのビデオは[こちら](https://youtu.be/u1ppYaZuNmo?t=1278)です。
* AML のデータセットにデータセットをアップロードします
    * [`Datasets`] をクリックします
    * [`Create from datastore`] または [ローカルから] のいずれかをクリックします
        * 注: デモのセットアップ手順で、データセットを既にデータストアにアップロードしている必要があります。
    * 必須フィールドに入力し、`workspaceblobstorage` オプションを選択します
    * `Create` をクリックします
    * 省略可能:AML へのデータセットのアップロードで、データ準備の機能を説明します

### <a name="2-launch-designer-and-explain-tool-features"></a>2.デザイナーを起動してツールの機能を説明します

* Studio で、左側のナビゲーションの [デザイナー] を選択します
* 左側のナビゲーションに含まれる、テスト データセットなどのさまざまなモジュールの概要を説明します。

### <a name="3-start-building-the--model"></a>3.モデルの構築を開始します

* データセットを実験ワークスペースにドラッグ アンド ドロップします
    * ワークスペースにデータを追加するためのオプションとしてファイルのアップロード モジュールに言及してください
* `Select Columns in Dataset` をワークスペースにドラッグします
    * 右側のパラメーター メニューにある [`Edit columns`] をクリックします。
    * [`By Name`] をクリックします
    * [`Add All`] をクリックします
    * [`Time`] 列の [`Minus`] アイコンをクリックして除外します
* `Split Data` をワークスペースにドラッグします
    * パラメーターを編集して、データを 70/30 に分割します。 
    * この分割率は決まりではなく、モデルのニーズによってベースを変更できます。
* `Train Model` をワークスペースにドラッグします
    * 右側のパラメーターからラベルの列名 [`Value`] を選択します
* `Boosted Decision Tree Regression` をワークスペースにドラッグします
* `Score Model` をワークスペースにドラッグします
* `Evaluate` をワークスペースにドラッグします
* `Split Data` モジュールはトレーニング データ用として `Train Model` に接続し、未知のデータによる予測結果にスコアを付ける目的で `Score Model` に接続します。
* `Train Model` をトレーニング アルゴリズム `Boosted Decision Tree Regression` モジュールに接続します。
* `Score Model` を `Evaluate` モジュールと接続します。
* このデモで実行するには時間がかかりすぎる "_としても_"、通常はここでモデルを実行します。 下部ナビゲーションにある [`Run`] ボタンをクリックし、コンピューティングを選択する方法について説明します。 これにより、AML でコンピューティング リソースを作成する方法の説明にスムーズに移行できます。

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

### <a name="4-discuss-compute-target-creation"></a>4.コンピューティング先の作成について説明します

* [`Compute`] ナビゲーション項目をクリックします
* `Add` をクリックします
* さまざまなコンピューティングの種類とその用途について説明します。 このデモで使用されるコンピューティングは、トレーニング用の `Machine Learning Compute` と、API をデプロイするための `Kubernetes Service` です。

### <a name="5-explain-trained-model"></a>5.トレーニング済みのモデルを説明する
* ビジュアル デザイナーに戻ります
* モデル内の 2 番目のモジュールを右クリックして、データを視覚化します (ほとんどの場合 `Select Columns in Dataset`)
* データをすばやくスクロールして、データの外観を示します。
* 列をクリックし、ツールによって右側のパネルに視覚化がどのように作成されるかを示します。
* `Score Model` モジュールを視覚化し、モデルによって未知のデータに対するどのような予測が行われたかを示します
* `Evaluate Model` モジュールを視覚化し、スコア付けに使用されるメトリックについて説明します。
    * パラメーターの右側のパネルで [`More Help`] をクリックします。
    * すべてのモジュールのパラメーターには、そのモジュールの機能を説明するドキュメントへのリンクが含まれていることを強調します。
    * 下にスクロールし、そのモデルのドキュメント内のメトリックに関する説明を示します。
    
### <a name="6-create-inference-pipeline-and-deploy-the-model"></a>6.推論パイプラインを作成してモデルをデプロイします
通常、ここでは `Inference Pipeline` を作成して Web サービスにデプロイします。"_ただし_"、このデモでは、これらの手順は事前に実行済みです。 
* 次の手順について説明します ("_ライブでは行わないでください_")
    * [`Create inference pipeline`] をクリックして、[`Real-time inference pipeline`] を選択します
    * `Web Service Output` が、最後のデータ処理手順モジュール `Select Columns in Dataset` に接続されるようにします
    * [`Run`] をクリックします
    * [`Deploy`] をクリックします
* `Inference Pipeline` を作成する手順について説明した後、左側のナビゲーションからデプロイした Web サービスに移動します。
* あらかじめ作成した Web サービスの名前をクリックします。
* `Test` をクリックし、それがスコア付けされたデータ項目に対してどのように実行されるかを示します。
* `Consume` をクリックし、Web サービスを統合するためのサンプル コードを示します。


# <a name="demo-3-testing-api-with-c-console-app-dotnet-core"></a>デモ 3:C# コンソール アプリを使用した API のテスト (dotnet core)

> 💡 デモを実行する前に、[デプロイ](demosetup.md)を完了している必要があります。

### <a name="api-demo-test-video-herehttpsyoutubeu1ppyazunmot2136"></a>API デモ テストのビデオは[こちら](https://youtu.be/u1ppYaZuNmo?t=2136)

* `Consume` タブから API キーをコピーします
* `App.config` を開き、値属性にそれを貼り付けます
* `Consume` タブから `Request-Response Url` をコピーします
* `Program.cs` を開き、`client.BaseAddress = new Uri("");` に値を貼り付けます
* `Program.cs` を右クリックし、`Open in Terminal` を選択します
* コマンド「`dotnet run`」を入力し、コンソール アプリを実行します
* StoreID (ID1) の既定値 2、ItemID (ID2) の既定値 1、予測する週の数を使用するには、 ただ「`y`」と入力します
* これで実行され、次の 4 週間分の予測値が返されるはずです。
