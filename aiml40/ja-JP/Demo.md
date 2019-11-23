# <a name="aiml40---demo-instructions"></a>AIML40 - デモの手順

AIML40 のデモの手順 (必要な準備を含む) については、「[AIML40 公開資料](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/)」で詳しく説明されています。 そこで説明されている手順を繰り返しはしませんが、デモをよりよいものにする重要なテクニックをいくつか取り上げています (45 分以内)。 デモ シナリオを理解するには、まず公開資料をお読みください。

## <a name="demo-preparation"></a>デモの準備

「[AIML40 公開 Readme](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md)」に記載されているように、次の手順で準備します。

1. Azure ML ワークスペースを作成します (Azure テンプレートまたは CLI コマンドを使用)
2. 自動 ML デモ用のデータセットをワークスペースにアップロードします
3. デモを高速化するためにコンピューティング クラスターを作成します
4. Jupyter Notebook 環境をセットアップし、そこで `asba.ipynb` ファイルを開いて、実行できる状態にします。

そのため、デモの前に、ブラウザーで次の 3 つのページを開いておきます。
 - [Text Analytics のページ](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)
 - [Azure ML ワークスペース](http://ml.azure.com)
 - Jupyter Notebook と `asba.ipynb`

これらの手順に加えて、デモを迅速に行うため、次のことを行う必要があります。

1. **デモ 1 の場合:** ブラウザーで [Text Analytics ページ](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)を開き、下のテキスト ボックスに次のテキストを入力して、**[分析]** をクリックします。 
> ロンドンの店で購入した水玉模様のズボンが気に入っています

[デモ 1 へのビデオ リンク: Cognitive Services Text Analytics](https://youtu.be/QJxjm5BirOA)

2. **デモ 2 の場合:** 
   - [Azure ML ワークスペース](http://ml.azure.com)でページを開きます。 必要に応じて、適切なワークスペースを選択します。
   - データセットがアップロードされていることを確認します
   - Azure Machine Learning ワークスペースの **[Automated ML]\(自動 ML\)** タブに移動し、「[AIML40 公開 Readme](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md)」で説明されているように、自動 ML の実験を実行します。 実行にはかなりの時間がかかるため、前もって行っておきます。
   - デモを行うときにログインし直す必要がないように、プレゼンテーションの直前にページを更新してください。

[デモ 2 へのビデオ リンク: 自動化された機械学習](https://youtu.be/qrstXN6TLZk)

3. **デモ 3 の場合:** 
   - Jupyter 環境で `asba.ipynb` を開きます
   - コードに正しいサブスクリプション ID を貼り付けてあることを確認します (また、既定値を変更した場合は、クラスター名とリソース グループ名も)
   - ノートブックのすべてのセルを実行し、すべてのステップが正常に実行されることを確認します。 一部のステップの実行にはかなりの時間がかかるため、事前に準備しておきます。 (実験の実行には 3.5 時間近くかかります。そのため、コンピューティング クラスターを低優先度にして、コストを節約することが重要です)
   - 資格情報を再度入力する必要がないよう、デモの直前にノートブックの作業が完了するようにします。

[デモ 3 へのビデオ リンク: Azure Machine Learning SDK と Hyperdrive](https://youtu.be/sccNTPO3PwU)


## <a name="demo-time"></a>デモの時間です!

デモでは、以下を示すことをお勧めします。

1. **デモ 1.1**: [Text Analytics ページ](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)をブラウザーで開き、**[分析]** をクリックするだけにします。 ページはあらかじめ読み込んでおきます。
2. **デモ 1.2**:  
  - 同じページで、**[例 - 英語 - 肯定的]** をクリックして、既定の語句 "*I had a wonderful trip to Seattle last week and even visited the Space Needle two times*" に切り替え、**[分析]** をクリックします
  - 良好な正のスコアを確認します
  - "**wonderful**" という単語を削除します
  - **[分析]** クリックして、スコアが大きく下がることを確認します
3. **デモ 2:** Azure ML ワークスペースと自動 ML
  - ブラウザーで [Azure ML ワークスペース](http://ml.azure.com)を開きます。ページを事前に読み込んでおく必要があります
  - **[データセット]** に移動します
  - データセットを開きます
  - **[概要]** タブの **[使用例]** を展開し、コードを表示します
  - **[Explore]\(探索\)** に切り替えて、データを表示します
  - **[Automated ML]\(自動 ML\)** に切り替えます
  - 実験名を入力し、コンピューティングを選択して、データセット (clothing_automl.xlsx) を選択します
  - **[分類]** タスクを選択し、ターゲット列として **Rating** を選択します
  - **[詳細設定]** を展開し、使用可能なオプション (アルゴリズムの選択など) をデモンストレーションします
  - *[開始]* をクリックします (ただし、事前に実験を実行できる状態にしておきます)。これには時間がかかります。
  - **[Automated ML]\(自動 ML\)** タブをもう一度クリックし、準備段階で前に実行しておいた実験を表示します
  - さまざまなモデルの実行を示すグラフと、最適な実行がどれかを説明します
  - 最適なモデルをクリックして、**ROC**、**精度/再現率**、その他のメトリックのグラフを詳細に調べます
  - **[モデルの配置]** ボタンを使用して、モデルを簡単に配置できることを示します
4. **デモ 3:** Python SDK での Azure ML サービスの使用
  - このデモでは、`absa.ipynb` ノートブックのセルに従って説明する必要があります
  - 完全に安全にするには、まったく実行せずにコードを見せるだけでもかまいません。このようにすれば安全ですが、ライブ デモ モードで実行されているコードによる強い印象を与えることはできません
  - よりライブに近いデモにするには、[absa-instuctions.ipynb](absa-instuctions.ipynb) ノートブックを参照してください。このノートブックでは、デモ中に "*実行してはならない*" セルと、実行しても安全なセルが説明されています
  - 一般に、実行時間の長いタスクは避ける必要があります

## <a name="tear-down"></a>破棄

デモはリソースを大量に消費するため、以下のことを忘れないでください。
* コンピューティング クラスターを削除します (特に、このデモでは、クラスターの準備時間を節約するため、自動スケーリングがオフになっています)
* Azure Machine Learning コンピューティングで実行している場合は、最小ノード数を、ダウンタイムの間は 0、デモ時間中は 1 になるように編集します。このようにすると、コストを節約できます
* また、Azure ML ワークスペースとリソース グループを削除することもできます。手順については、[公開 Readme](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md) を参照してください

