# <a name="aiml21-developers-guide-to-ai-a-data-story"></a>AIML21:AI 開発者ガイド:データ ストーリー 

## <a name="train-the-trainer-guide"></a>トレーナー トレーニング ガイド

### <a name="session-abstract"></a>セッションの要約

このシアター セッションでは、データ サイエンスのプロセスとその適用方法について説明します。 データ セットの探索からサービスのデプロイまで、すべてが興味深いデータ ストーリーに適用されます。 Azure AI プラットフォームの概要についても簡単に説明します。

# <a name="how-to-use"></a>使用方法

### <a name="welcome-presenter"></a>プレゼンターの皆様、ようこそ。

こちらをご覧いただきありがとうございます。この素晴らしいコンテンツが発表されることを楽しみにしています。 経験豊富な発表者として、プレゼンテーションの "**方法**" はご存知であると考え、このガイドでは、"**何**" についてプレゼンテーションを行う必要があるかということに焦点を絞ります。 プレゼンテーション デザイン チームが作成したプレゼンテーションを、全体にわたってリハーサルします。

プレゼンテーションのビデオに加えて、このドキュメントは、PowerPoint のスライドやデモの手順とコードなど、プレゼンテーションを成功させるために必要なすべての資産にリンクしています。

* ドキュメント全体を読む。
* ビデオ プレゼンテーションを見る
* リード プレゼンターに質問する

# <a name="assets-in-train-the-trainer-kit"></a>トレーナー トレーニング キットの資産

* 本ガイド
* [PowerPoint プレゼンテーション](https://globaleventcdn.blob.core.windows.net/assets/aiml/AIML21_DevelopersGuidetoAI_ADataStory.pptx)
* [プレゼンテーションの全記録](https://youtu.be/K8upKkvtEI0)
* [使用されたデータセット](aiml21/data)
* [実行するコード ファイル](aiml21/code)
* 個別デモ ビデオ: 
    * デモ 1 - [調査](https://youtu.be/1Xtmrsfkzfs)
    * デモ 2 - [実験](https://youtu.be/sUKuRBRvo7U)
    * デモ 3 - [デプロイ](https://youtu.be/IgSaMKsyexg)
    * デモ 4 - [プレゼンテーション](https://youtu.be/g7aBaC9s9qQ)
* デモ手順

# <a name="demo-instructions"></a>デモ手順:

まず、このリポジトリ内のコードとデータ ファイルをすべてダウンロードしてください。 すべてのデモを実行するために必要なあらゆる情報が含まれるコードとデータ フォルダーです

**以下のものが必要になります。**
* Azure サブスクリプション - 必要であれば、[こちらから無料の試用版](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml21)を取得してください
* [Power BI Desktop (Windows のみ)](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=msignitethetour2019-github-aiml21) - MacOS/Linux 上で実行している場合も、最新の Web ブラウザーからこの機能を実演できます

**セットアップの手順:**
* 下の **[Azure にデプロイする] ボタン**を使用し、セッションをとおして使用します。Azure Machine Learning ワークスペースを作成します。

[![Azure にデプロイする](https://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

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

>データセット作成の詳細については[こちら](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-create-register-datasets/?WT.mc_id=msignitethetour2019-github-aiml21)を参照してください。

* **Power BI ワークスペース**を作成します。
    * [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) を開きます。
    * ご自分のワークスペース資格情報でログインします
    * 左側のペインで [ワークスペース] をクリックします
    * [ワークスペースの作成] をクリックします
    * ワークスペース名を入力します
    * ワークスペースの説明を入力します
    * [保存] をクリックします。
* **Power BI レポート**を発行します。
    * Present.pbix で Power BI Desktop を開きます。
    * [発行] をクリックします。
    * 先ほど作成したワークスペース名を選択します。
    * レポートが発行されるのを待ちます。
* **Power BI レポート**を表示します。
    * [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) に戻ります。 
    * 必要に応じてブラウザーを更新します
    * Web ブラウザーの左側のペインでレポートを確認します
    * レポートをクリックすると、レポートが読み込まれます。

## <a name="demo-1---explore"></a>デモ 1 - 調査

### <a name="video-demo-with-voice-over-aiml21---demo-1---explorehttpsyoutube1xtmrsfkzfs"></a>ナレーション付きビデオ デモ:[AIML21 - デモ 1 - 調査](https://youtu.be/1Xtmrsfkzfs)

* [Azure portal](https://azure.microsoft.com/en-gb/?WT.mc_id=msignitethetour2019-github-aiml21) にサインインし、上のテンプレートで作成した **Azure Machine Learning** を開きます
* **[プレビューを今すぐ起動]** をクリックし、プレビュー エクスペリエンスを開始します
* 左側のペインから **[コンピューティング]** を開きます
* Notebook VM で **[Jupyter]** リンクを選択します
* *必要であれば、Azure の資格情報でログインします。*
* [**Explore.ipynb**](code/explore.ipynb) を開きます *(タブをすべて開き、準備しておくことを推奨)* 。
* ノートブックの出力セルがすべてクリアされていることを確認します - **[セルの選択]、[All Output]\(すべての出力\)、[クリア]** の順に選択します。
* **各デモの論点について動画を確認します。**
* 最初の 6 セルをとおして実行し、簡単に説明します。
* 他のセルや視覚エフェクトも利用できます。参加者は **[aka.ms/AIML21repo](http://aka.ms/aiml21repo)** からコードをダウンロードしてください。

## <a name="demo-2---experiment"></a>デモ 2 - 実験

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
* **[View additional configuration settings]\(追加の構成設定を表示します。\)** を選択し、[プライマリ] メトリックを **[normalized_root_mean_squared_error]** に設定します。
* [Concurrency, Max concurrent iterations]\(コンカレンシー、最大コンカレンシー\) を 3 に設定します。
* [Exit criterion, Training job time (hours)]\(終了条件、トレーニング ジョブ時間 (時間)\) を 1 に設定します
* **[保存]** を選択します
* **[完了]** を選択します

> 実行が開始したら、実験の実行には少しばかり時間がかかることとこれから前に実行した列を確認することを説明します。 

> 始める前に説明した自動 ML 回帰を完全に実行していることを確認してください。

* 左側の [自動 ML] ページから前に実行した実験を選択するか、上で先ほど送信した実験から [戻る] ボタンを押します。
* 前に実行した実験には長い "実行 ID" が与えられます (このリンクを選択する)。
* **各デモの論点について動画を確認します。**

## <a name="demo-3---deploy"></a>デモ 3 - デプロイ

### <a name="video-demo-with-voice-over-aiml21---demo-3---deployhttpsyoutubeigsamksyexg"></a>ナレーション付きビデオ デモ:[AIML21 - デモ 3 - デプロイ](https://youtu.be/IgSaMKsyexg)

> 上で確認した、前に実行した実験を使用してデプロイします。

* 実行した**自動 ML 実験**の画面から開始します
* **[Deploy Best Model]\(最適なモデルのデプロイ\)** ボタンを選択します
* デプロイに "example/ aiml21-v1" という名前を付けます
* 必要に応じてデプロイの説明を追加します
* "ACI" に設定されるコンピューティングの種類 (Azure Container Instance)
* 認証を有効にしたままにする
* **[デプロイ]** ボタンを選択します
* デプロイにかかると思われる時間についてコメントします。これは、左側の [エンドポイント] タブで確認できます

>実稼働前に ACI にデプロイした自動 ML 回帰実験を完全に実行していることを確認してください

* 左側のウィンドウの **[エンドポイント]** を選択します。
* 既に作成した Azure Container Instance モデルを選択します。
* **各デモの論点について動画を確認します。**
* Jupyter を含む [ブラウザー] タブを選択します。
* [Deploy.ipynb](code/deploy.ipynb) を開きます。
* ノートブックの出力セルがすべてクリアされていることを確認します - **[セルの選択]、[All Output]\(すべての出力\)、[クリア]** の順に選択します。
* config.json ファイルに正しい情報が入力されていることを確認します。
* 2 番目のセルを編集し、デプロイした Web サービスの名前を含めます。
* ノートブックの全セルを実行し、コードについて説明します - **各デモの論点について動画を確認します。**

## <a name="demo-4---present"></a>デモ 4 - プレゼンテーション

### <a name="video-demo-with-voice-over-aiml21---demo-4---presenthttpsyoutubeg7abac9s9qq"></a>ナレーション付きビデオ デモ:[AIML21 - デモ 4 - プレゼンテーション](https://youtu.be/g7aBaC9s9qQ)

>登壇する前に、[Present.pbix](code/Present.pbix) で Power BI Desktop を開き、ワークスペースで [https://powerbi.microsoft.com/](https://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) を開き、上の設定でレポートを開きます。

* Present.pbix を開きます。 
* **各デモの論点について動画を確認します。**
* [発行] ボタンを表示します。
* [https://powerbi.microsoft.com/](https://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) を開きます。
* **各デモの論点について動画を確認します。**

# <a name="teardown-instructions"></a>破棄の手順

### <a name="full-teardown"></a>完全破棄

* Azure portal に入り、Azure リソース グループを削除してこのプロジェクトのすべてのリソースを削除します

### <a name="to-save-costs"></a>コストを削減するには

* 使用していないときは必ずノートブック VM でシャットダウンを選択してください。
* 使用していないとき、エンドポイントの Azure Container Instance を削除します。

# <a name="resources-and-continued-learning"></a>リソースと継続学習

**Microsoft Learn:**
* [Azure のデータ サイエンス ツールを試す](https://docs.microsoft.com/en-us/learn/paths/explore-data-science-tools-in-azure/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Python の概要](https://docs.microsoft.com/en-us/learn/modules/intro-to-python/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Azure Machine Learning service で ML モデルの選択を自動化する](https://docs.microsoft.com/en-us/learn/modules/automate-model-selection-with-azure-automl/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Power BI で分析レポートを作成して使用する](https://docs.microsoft.com/en-us/learn/paths/create-use-analytics-reports-power-bi/?WT.mc_id=msignitethetour2019-github-aiml21)


# <a name="feedback-loop"></a>フィードバック ループ

すべての話者には毎月、**トレーナー トレーニング Q&A セッション**に出席する機会が与えられます (2 回のセッションであらゆる時間帯を網羅します)。また、壇上で発表後、**フィールド セッション**にご参加いただくことをお願いしております。このセッションは、自分のプレゼンテーション体験を語ったり、フィードバックやアイデアを披露したりする場として用意されます。 

コメント、フィードバック、ご提案はございますか。 現在のところ、コンテンツ変更/提案/フィードバックの最良のフィードバック ループは、この GitHub リポジトリで新しいイシューを作成することです。 イシューの作成方法については、[投稿に関するドキュメント](https://github.com/microsoft/ignite-learning-paths/blob/master/contributing.md)を参照してください。

## <a name="become-a-trained-presenter"></a>トレーニングされたプレゼンターになる

トレーニングされたプレゼンターになるには、[scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com) にお問い合わせください。 メールには、次を含めてください。

- フル ネーム
- このプレゼンテーションのコード: aiml21
- プレゼンテーション ビデオ (最長 10 分間) のリンク (例: リストにない YouTube ビデオ)。 
  > プレゼンターとしてのスキルを示すことが重要であり、このコンテンツである必要はありません

指導者からプロセスに関する情報提供があります。

## <a name="trained-presenters"></a>トレーニングされたプレゼンター

次の素晴らしい方々に感謝を捧げます ([絵文字キー](https://allcontributors.org/docs/en/emoji-key))。

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/amynic">
        <img src="https://avatars3.githubusercontent.com/u/13828867?s=400&u=f6aca8528d65d6c191114d3a7328b46137eda162&v=4" width="100px;" alt="Amy Boyd"/><br />
        <sub><b>Amy Boyd</b></sub></a><br />
            <a href="https://globaleventcdn.blob.core.windows.net/assets/aiml/AIML21_DevelopersGuidetoAI_ADataStory.pptx" title="トーク">📢</a>
            <a href="https://github.com/microsoft/ignite-learning-paths-training/pulls?q=is%3Apr+author%3Aamynic+is%3Aclosed" title="ドキュメント">📖</a> 
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->
