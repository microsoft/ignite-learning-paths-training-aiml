# <a name="developers-guide-to-ai-a-data-story"></a>AI 開発者ガイド:データ ストーリー

このシアター セッションでは、データ サイエンスのプロセスとその適用方法について説明します。 データ セットの探索からサービスのデプロイまで、すべてが興味深いデータ ストーリーに適用されます。 Azure AI プラットフォームの概要についても簡単に説明します。

# <a name="demo-environment-deployment"></a>デモ環境のデプロイ

まず、このリポジトリ内のコードとデータ ファイルをすべてダウンロードしてください。 すべてのデモを実行するために必要なあらゆる情報が含まれるコードとデータ フォルダーです

**以下のものが必要になります。**
* Azure サブスクリプション - 必要であれば、[こちらから無料の試用版](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml21)を取得してください
* [Power BI Desktop (Windows のみ)](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=msignitethetour2019-github-aiml21) - MacOS/Linux 上で実行している場合も、最新の Web ブラウザーからこの機能を実演できます

**セットアップの手順:**
* 下の **[Azure にデプロイする] ボタン**を使用して、Azure Machine Learning ワークスペースを作成します

[![Azure へのデプロイ](https://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

* Azure portal と Azure Machine Learning service にログインします
* [Upgrade the workspace to the **Enterprise edition (Preview)** ]\(Enterprise edition (プレビュー) にワークスペースをアップグレードします。\) を選択します。[現行価格の詳細はこちらをご覧ください](https://azure.microsoft.com/en-us/pricing/details/machine-learning/)。実験デモ (デモ 2) を完了するには Enterprise Edition が必要になります
* **Preview UI** を起動します
* **ノートブック VM** を作成します
    * 左側のペインから [コンピューティング] を選択します
    * [ノートブック VM] の下で [新規] を選択します
    * [ノートブック VM 名] を指定します (すべて小文字)
    * 既定サイズの VM を維持します
    * 作成後、[Jupyter リンク] を選択します
    * ダブルクリックでユーザー フォルダーに入ります
    * アップロード ボタンを選択し、次に示すファイルをアップロードします。
        * [data/data_train.csv](data/data_train.csv)
        * [code/explore.ipynb](code/explore.ipynb)
        * [code/deploy.ipynb](code/deploy.ipynb)
        * [code/config.json](code/config.json)
    * [config.json](code/config.json) を開き、お使いのサブスクリプション キー、リソース グループ、Azure ML ワークスペース名を入力し、ファイルを保存します

>[ノートブック VM の詳細についてはこちら](https://azure.microsoft.com/en-us/blog/three-things-to-know-about-azure-machine-learning-notebook-vm/?WT.mc_id=msignitethetour2019-github-aiml21)を参照してください

* **コンピューティング インスタンス**を作成します
    * 左側のペインから [コンピューティング] を選択します
    * [トレーニング クラスター] タブの下で [新規] を選択します
    * [コンピューティング名] を指定します (すべて小文字)
    * VM サイズを選択する
        * 標準コンピューティングの場合、たとえば、[Standard_DS2_v2] を選択します
        * GPU コンピューティングの場合は [Standard_NC6] を選択します
    * 仮想マシンの優先度に [低優先度] を選択します
    * ノードの最小数を 0 に設定します (その後、完全にスケールダウンされ、コストが下がります)
    * ノードの最大数を設定します (3 から 6 まで)
    * [作成] をクリックします

>[Azure Machine Learning コンピューティングの詳細についてはこちら](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-set-up-training-targets#amlcompute/?WT.mc_id=msignitethetour2019-github-aiml21)を参照してください

* **データセット**をアップロードします
    * 左側のペインから [データセット] を選択します
    * [データセットの作成] を選択した後、[ローカル ファイルから] を選択します
    * [参照] ボタンを選択し、data_train_experiment.csv ファイルを見つけます
    * [次へ] を選択します
    * データを見直し、[次へ] を 2 回選択します
    * 最後にデータセット設定を見直し、[作成] を選択します

>[データセット作成の詳細についてはこちら](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-create-register-datasets/?WT.mc_id=msignitethetour2019-github-aiml21)を参照してください

# <a name="delivery-of-assets"></a>資産の配信

* [PowerPoint プレゼンテーション](https://globaleventcdn.blob.core.windows.net/assets/aiml/AIML21_DevelopersGuidetoAI_ADataStory.pptx)
* [使用されたデータセット](aiml21/data)
* [実行するコード ファイル](aiml21/code)
* 個別デモ ビデオ: 
    * デモ 1 - [調査](https://youtu.be/1Xtmrsfkzfs)
    * デモ 2 - [実験](https://youtu.be/sUKuRBRvo7U)
    * デモ 3 - [デプロイ](https://youtu.be/IgSaMKsyexg)
    * デモ 4 - [プレゼンテーション](https://youtu.be/g7aBaC9s9qQ)

# <a name="demo-1---explore"></a>デモ 1 - 調査

### <a name="video-demo-with-voice-over-aiml21---demo-1---explorehttpsyoutube1xtmrsfkzfs"></a>ナレーション付きビデオ デモ:[AIML21 - デモ 1 - 調査](https://youtu.be/1Xtmrsfkzfs)

* [Azure portal](https://azure.microsoft.com/en-gb/?WT.mc_id=msignitethetour2019-github-aiml21) にサインインし、上のテンプレートで作成した **Azure Machine Learning** を開きます
* **[プレビューを今すぐ起動]** をクリックし、プレビュー エクスペリエンスを開始します
* 左側のペインから **[コンピューティング]** を開きます
* Notebook VM で **[Jupyter]** リンクを選択します
* "*必要に応じて、ご自身の Azure 資格情報でログインします*"
* [**Explore.ipynb**](code/explore.ipynb) を開きます
* SHIFT + ENTER キーを使用して、すべてのコード セルを実行します

# <a name="demo-2---experiment"></a>デモ 2 - 実験

### <a name="video-demo-with-voice-over-aiml21---demo-2---experimenthttpsyoutubesukurbrvo7u"></a>ナレーション付きビデオ デモ:[AIML21 - デモ 2 - 実験](https://youtu.be/sUKuRBRvo7U)

* [ml.azure.com](https://ml.azure.com/?WT.mc_id=msignitethetour2019-github-aiml21) Azure Machine Learning studio に移動します。 これには URL から直接アクセスできます。その後、サインインして、今回のトーク用に作成した正しいワークスペースを選択します。 あるいは、Azure portal の Azure Machine Learning service から、 **[プレビューを今すぐ起動]** ボタンを選択します
* 左側のペインで **[自動 ML]** を選択します
* **各デモの論点について動画を確認します**
* **[New automated ML run]\(新しい自動 ML の実行\)** をクリックします
* トレーニング データ データセットを選択します (data_train_experiment-XXXXXX)
* 実験名として「example/ aiml21-regression-duration」を指定します
* [ターゲット] 列に **[期間]** を選択します
* 上で設定したコンピューティングの [トレーニング クラスター] を選択します
* **[次へ]** を選択します
* 予測タスクに **[回帰]** を選択します
* **[View additional configuration settings]\(追加の構成設定を表示します。\)** を選択し、[プライマリ] メトリックを **[normalized_root_mean_squared_error]** に設定します
* [Concurrency, Max concurrent iterations]\(同時実行、最大同時実行\) を 3 に設定します
* [Exit criterion, Training job time (hours)]\(終了条件、トレーニング ジョブ時間 (時間)\) を 1 に設定します
* **[保存]** を選択します
* **[完了]** を選択します

> 実行には時間がかかります (15-20 分) 

* 完了したら、モデル実行の出力を確認し、最適なモデルを見つけます

# <a name="demo-3---deploy"></a>デモ 3 - デプロイ

### <a name="video-demo-with-voice-over-aiml21---demo-3---deployhttpsyoutubeigsamksyexg"></a>ナレーション付きビデオ デモ:[AIML21 - デモ 3 - デプロイ](https://youtu.be/IgSaMKsyexg)

* デモ 2 の最後から
* 実行した**自動 ML 実験**の画面から開始します
* **[Deploy Best Model]\(最適なモデルのデプロイ\)** ボタンを選択します
* デプロイに "example/ aiml21-v1" という名前を付けます
* 必要に応じてデプロイの説明を追加します
* "ACI" に設定されるコンピューティングの種類 (Azure Container Instance)
* 認証を有効にしたままにする
* **[デプロイ]** ボタンを選択します

>実行には時間がかかります (20-30 分)

* 完了したら、左側のペインの **[エンドポイント]** を選択します
* お使いの Azure Container Instance モデルを選択し、その詳細を確認します
* Jupyter を開いた状態で [ブラウザー] タブを選択します
* [**Deploy.ipynb**](code/deploy.ipynb) を開きます
* [config.json](code/config.json) ファイルに、セットアップ段階の正しい情報が入力されていることを確認します
* 2 番目のセルを編集し、デプロイした Web サービスの名前を含めます
* ノートブックのすべてのセルを実行し、出力を確認します

# <a name="demo-4---present"></a>デモ 4 - プレゼンテーション

### <a name="video-demo-with-voice-over-aiml21---demo-4---presenthttpsyoutubeg7abac9s9qq"></a>ナレーション付きビデオ デモ:[AIML21 - デモ 4 - プレゼンテーション](https://youtu.be/g7aBaC9s9qQ)

* [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) を開きます
* ご自分のワークスペース資格情報でログインします
* 左側のペインで [ワークスペース] をクリックします
* [ワークスペースの作成] をクリックします
* ワークスペース名を入力します
* ワークスペースの説明を入力します
* [保存] をクリックします
* Present.pbix で Power BI Desktop を開きます
* データとビジュアルを操作します
* [発行] ボタンをクリックします
* 先ほど作成したワークスペース名を選択します
* レポートが発行されるのを待ちます
* [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) に戻ります 
* 必要に応じてブラウザーを更新します
* Web ブラウザーの左側のペインでレポートを確認します
* レポートをクリックすると、レポートが読み込まれます

# <a name="teardown-instructions"></a>破棄の手順

### <a name="full-teardown"></a>完全破棄

* Azure portal に入り、Azure リソース グループを削除してこのプロジェクトのすべてのリソースを削除します

### <a name="to-save-costs"></a>コストを削減するには

* 使用していないときは、必ずお使いのノートブック VM で**シャットダウン**を選択してください
* 使用していないとき、エンドポイントの Azure Container Instance を**削除**します

# <a name="resources-and-continued-learning"></a>リソースと継続学習

**Microsoft Learn:**
* [Azure のデータ サイエンス ツールを試す](https://docs.microsoft.com/en-us/learn/paths/explore-data-science-tools-in-azure/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Python の概要](https://docs.microsoft.com/en-us/learn/modules/intro-to-python/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Azure Machine Learning service で ML モデルの選択を自動化する](https://docs.microsoft.com/en-us/learn/modules/automate-model-selection-with-azure-automl/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Power BI で分析レポートを作成して使用する](https://docs.microsoft.com/en-us/learn/paths/create-use-analytics-reports-power-bi/?WT.mc_id=msignitethetour2019-github-aiml21)

# <a name="feedback-loop"></a>フィードバック ループ

コメント、フィードバック、ご提案はございますか。 現在のところ、コンテンツ変更/提案/フィードバックの最良のフィードバック ループは、この GitHub リポジトリで新しいイシューを作成することです。 イシューの作成方法については、[投稿に関するドキュメント](https://github.com/microsoft/ignite-learning-paths/blob/master/contributing.md)を参照してください。
