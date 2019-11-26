# <a name="aiml20-using-pre-built-ai-to-solve-business-challenges"></a>AIML20: 事前構築済み AI を使用してビジネスの課題を解決する

これは、Microsoft Ignite 2019 および Microsoft Ignite the Tour 2019-2020 のトーク「事前構築済み AI を使用してビジネスの課題を解決する」をサポートするリポジトリです。 ここでは、トークで言及されているリソースへのリンク、およびトークで説明されているデモを再作成するために必要なコードとスクリプトを提供します。

[AIML20 プレゼンテーションのスライドをこちらでダウンロードしてください](presentations.md)。 (最新バージョンの最初のリンクを使用してください。)スライドは PPT 形式で、詳細な発表者ノートと埋め込みデモ ビデオが含まれています。

Microsoft Ignite Orlando、November 7 2019 での[このプレゼンテーションの録画をご覧ください](https://myignite.techcommunity.microsoft.com/sessions/82987?source=sessions)。

これらのリソースへのショートリンク: [aka.ms/AIML20repo](https://aka.ms/AIML20repo)。 

[このトークのプレゼンター向けリソース](README-Presenters.md)も提供されています。

## <a name="session-abstract"></a>セッションの要約

**事前構築済み AI を使用してビジネスの課題を解決する**

要約: データ主導型企業である Tailwind Traders 社は、人工知能を利用してビジネス プロセスを改善し、顧客を満足させることの重要性を理解しています。 AI チームに投資する前に、既存の開発者は、事前構築された AI テクノロジを使用していくつかの成果を簡単にデモンストレーションできました。 このセッションでは、Azure Cognitive Services を使用して、小売データから分析情報を抽出する方法を示します。 コンピューター ビジョンの背後にあるニューラル ネットワークについて詳しく説明し、独自の画像で事前構築された AI を拡張してカスタム画像認識アプリケーションを作成する方法について説明します。

## <a name="technologies-used"></a>使用されているテクノロジ

* [Azure Cognitive Services](https://docs.microsoft.com/en-us/azure/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure コマンド ライン インターフェイス (CLI)](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest?WT.mc_id=msignitethetour2019-github-aiml20)
* [ONNX](https://github.com/onnx/onnx)
* [Visual Studio Code](https://code.visualstudio.com/)

## <a name="other-resources-mentioned-in-talk"></a>トークで言及されている他のリソース

* ニューラル ネットワークの仕組み (Brandon Rohrer): http://brohrer.github.io/blog.html
* XKCD "Tasks": https://xkcd.com/1425

### <a name="azure-cognitive-services-docs-and-apps"></a>Azure Cognitive Services のドキュメントとアプリケーション

* Cognitive Services Computer Vision: [https://aka.ms/try-computervision](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=ignitetour-talk-davidsmi)  
* Cognitive Services Custom Vision: [ドキュメント](https://docs.microsoft.com/en-us/azure/cognitive-services/custom-vision-service/?WT.mc_id=ignitethetour-github-davidsmi) と [https://customvision.ai](https://www.customvision.ai/?WT.mc_id=ignitethetour-github-davidsmi) にあるアプリケーション
* ONNX Runtime: https://github.com/microsoft/onnxruntime
* Cognitive Services Personalizer: [https://aka.ms/personalizer-intro](https://docs.microsoft.com/en-us/azure/cognitive-services/personalizer/?WT.mc_id=msignitethetour2019-github-aiml20)
* Personalizer での強化学習: https://aka.ms/personalizerdemo
* コンテナーでの Cognitive Services: https://aka.ms/cs-containers

### <a name="cognitive-services-information"></a>Cognitive Services の情報

* Cognitive Services の価格: https://aka.ms/cs-pricing 
* Cognitive Services のコンプライアンスとプライバシー: https://aka.ms/az-compliance
* 倫理的な AI に対する Microsoft のアプローチ: [https://microsoft.com/AI/our-approach-to-ai](https://www.microsoft.com/AI/our-approach-to-ai?rtc=1&WT.mc_id=msignitethetour2019-github-aiml20)
* Microsoft Learn での Cognitive Services のトレーニング コース: https://aka.ms/AIML20MSLearnCollection
* Microsoft 認定 Azure Data Scientist Associate: https://aka.ms/DataScientistCert 
* Microsoft 認定 Azure AI Engineer Associate: https://aka.ms/AIEngineerCert

## <a name="demonstrations"></a>デモンストレーション

トークで説明されているデモを再作成する方法の詳細については、以下のリンクをご覧ください。 これらのデモを実行するには、Azure サブスクリプションが必要です。まだお持ちでない場合、[新規サブスクライバー向けの $200 の無料 Azure クレジット](https://aka.ms/azure-free-credits)へのリンクはこちらです。

1. [セットアップ](DEMO%20Setup.md): アカウントを作成し、以下のデモをサポートするためのリソースをデプロイして構成します。 以下のデモを試みる前に、次の手順に従ってください。

1. [Computer Vision](DEMO%20Computer%20Vision.md): Cognitive Services Computer Vision を使用して、Web アプリケーションと Azure CLI 経由で、画像を分析します。

1. [Custom Vision](DEMO%20Custom%20Vision.md): Tailwind Traders によって販売される製品のみを検出するカスタム ビジョン モデルを作成します。

1. [ONNX のデプロイ](DEMO%20ONNX%20deployment.md): ONNX 形式のカスタム ビジョン モデルを Tailwind Traders の Web サイトの "Shop by Photo" 機能にデプロイします

1. [Personalizer](DEMO%20Personalizer.md): Tailwind Traders Web サイトの "推奨" セクションのレイアウトを動的に再構成して、匿名ビジターが "おすすめ" 製品をクリックする可能性を最大にします。

## <a name="feedback-loop"></a>フィードバック ループ

コメント、フィードバック、ご提案はございますか。 コンテンツ変更/提案/フィードバックの最良のフィードバック ループは、この GitHub リポジトリで新しい問題を作成することです。 問題の作成方法については、[投稿に関するドキュメント](https://github.com/microsoft/ignite-learning-paths/blob/master/contributing.md)を参照してください
