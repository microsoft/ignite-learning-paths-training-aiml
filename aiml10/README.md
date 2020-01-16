# <a name="aiml10-making-sense-of-your-unstructured-data-with-ai"></a>AIML10:AI を使用して非構造化データを理解する

### <a name="session-abstract"></a>セッションの要約

Tailwind Traders には大量のレガシ データが存在しており、それをアプリで利用することが開発者に求められています。ソースは様々で、構造化と非構造化の両方があり、画像、フォーム、PDF ファイルなど、多くの形式が含まれています。 このセッションでは、チームが Cognitive Search を使用して短時間でこのデータを理解し、すばらしい成功を収めた方法について学びます。 取り込み - 強化 - 探索パターン、スキルセット、コグニティブ スキル、自然言語処理、コンピューター ビジョンなど、多くの AI の概念について説明します。

# <a name="overview"></a>概要
このソリューションでは、構造化されていない PDF の請求書のセットを取得し、Azure Cognitive Search とカスタマイズされた Form Recognizer スキルを使用して、構造化された表形式の出力を生成するプロセスを開発します。 

このソリューションを作成するときに、いくつかの Azure リソースが作成されます (必要な場合は、[こちらに無料試用版があります](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml10))。 次の表に、各リソースとその目的、およびソリューションを完全に実装するために必要な特別な手順を示します (トーク中に提示された名前が使用されていますが、ご自身の特定のソリューション用に名前を変更する必要があります)。

![Azure リソース](images/resources.png "Azure リソース")

## <a name="azure-resources"></a>Azure リソース

| 名前                       | 種類                            | 目的                    |
| -------------------------- | ------------------------------- | ------------------------- |
| **ttcognitivesearch**     | リソース グループ                  | サービスをグループにまとめます   |
| **ttinvoicestorage**      | ストレージ アカウント                 | 請求書の格納に使用します     |
| **ttinvoicesearch**       | 検索サービス                  | おすすめのサービスです           |
| **ttinvoiceintelligence** | Cognitive Services (オールインワン) | 検索サービスで使用されます |
| **ttinvoicereader**       | Form Recognizer サービス         | このサービスは、最終的にオールインワン サービスになります。 現時点では、アクセス制限付きのプレビューです。 プレビューへのアクセスを取得するには、[Form Recognizer アクセス要求](https://aka.ms/FormRecognizerRequestAccess)フォームに記入して送信します。  |
| **readerskillstorage**   | ストレージ アカウント              | Azure 関数に使用されるストレージ |
| **readerskill**          | Function App                 | コグニティブ スキル アプリ |
| **readerskill**          | App Insights                   | 関数アプリに分析情報を追加します |
| **EastUS2LinuxDynamicPlan** | App Service プラン                   | 関数アプリを実行するための従量課金制プラン |

# <a name="presentation"></a>プレゼンテーション

* [PowerPoint のダウンロード](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/ja-JP/aiml10-translation.ja-JP.pptx)
* [Microsoft Ignite Orland セッション ビデオ](https://myignite.techcommunity.microsoft.com/sessions/82986?source=sessions)


# <a name="demonstrations"></a>デモンストレーション
このトークは、以下に示す 5 つのデモで構成されます。 

- **デモ 1**:[Azure Cognitive Search](demo1.md)
- **デモ 2**:[Form Recognizer サービス](demo2.md) - このデモでは、Form Recognizer プレビューにアクセスする必要があります。 プレビューへのアクセスを取得するには、[Form Recognizer アクセス要求](https://aka.ms/FormRecognizerRequestAccess)フォームに記入して送信します。
- **デモ 3**:[カスタム請求書リーダー スキルを作成する](demo3.md)
- **デモ 4**:[まとめ](demo4.md)
- **デモ 5**:[ナレッジ ストア](demo5.md)


# <a name="teardown-instructions"></a>破棄の手順

### <a name="full-teardown"></a>完全破棄

* Azure portal に入り、作成した **Azure リソース グループ**を削除して、このプロジェクトのすべてのリソースを削除します


# <a name="resources-and-continued-learning"></a>リソースと継続学習

**Microsoft Learn:**
* [Azure Search の概要](https://docs.microsoft.com/en-us/learn/modules/intro-to-azure-search/?WT.mc_id=msignitethetour2019-github-aiml10)
* [Microsoft Azure 人工知能 (AI) の戦略とソリューション](https://docs.microsoft.com/en-us/learn/modules/azure-artificial-intelligence/?WT.mc_id=msignitethetour2019-github-aiml10)

**Azure のドキュメント**
* [Azure Search での "コグニティブ検索" とは?](https://docs.microsoft.com/en-us/azure/search/cognitive-search-concept-intro/?WT.mc_id=msignitethetour2019-github-aiml10)
* [Azure Search 内のナレッジ ストアとは](https://docs.microsoft.com/en-us/azure/search/knowledge-store-concept-intro)


# <a name="feedback-loop"></a>フィードバック ループ

コメント、フィードバック、ご提案はございますか。 現在のところ、コンテンツ変更/提案/フィードバックの最良のフィードバック ループは、この GitHub リポジトリで新しいイシューを作成することです。 イシューの作成方法については、[共同作成に関するドキュメント](https://github.com/microsoft/ignite-learning-paths/blob/master/contributing.md)を参照してください

## <a name="become-a-trained-presenter"></a>熟練した発表者になる

熟練した発表者になるには、[scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com) にお問い合わせください。 メールには以下の内容をご記載ください。

- フル ネーム
- このプレゼンテーションのコード: aiml10
- ご自身のプレゼンテーション ビデオ (最長 10 分間) のリンク (例: 非公開の YouTube ビデオ)。 
  > このコンテンツを使用する必要はなく、ご自身の発表者としてのスキルをお示しいただくことが重要です

指導者からプロセスに関する情報提供があります。

## <a name="trained-presenters"></a>熟練した発表者

次の素晴らしい方々に深く感謝いたします ([Emoji キー](https://allcontributors.org/docs/en/emoji-key))。

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/sethjuarez">
        <img src="https://avatars2.githubusercontent.com/u/115409?s=460&v=4" width="100px;" alt="Seth Juarez"/><br />
        <sub><b>Seth Juarez</b></sub></a><br />
            <a href="Add link to powerpoint here" title="トーク">📢</a>
            <a href="Add link to pull request here" title="ドキュメント">📖</a> 
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->