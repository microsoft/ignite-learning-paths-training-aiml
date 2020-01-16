# <a name="aiml20-using-pre-built-ai-to-solve-business-challenges"></a>AIML20:事前構築済み AI を使用してビジネスの課題を解決する

これは、Microsoft Ignite 2019 および Microsoft Ignite the Tour 2019-2020 のトーク「事前構築済み AI を使用してビジネスの課題を解決する」をサポートするリポジトリです。 ここには、トークで言及されているリソースや、トーク内で行われるデモを再作成するために必要なコードとスクリプトへのリンクが記載されています。

* [AIML20：使用预先构建的 AI 解决业务难题](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-SimplifiedChinese/aiml20)
* [AIML20:Uso da IA pré-criada para resolver desafios de negócios](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-PortugueseBrazil/aiml20)
* [AIML20:事前構築済み AI を使用してビジネスの課題を解決する](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-Japanese/aiml20)

## <a name="session-abstract"></a>セッションの要約

**事前構築済み AI を使用してビジネスの課題を解決する**

データドリブン企業である Tailwind Traders は、人工知能を利用してビジネス プロセスを改善し、顧客満足を実現することの重要性を理解しています。
AI チームに投資する前、既存の開発者は、事前構築された AI テクノロジを使用していくつかの成果を簡単にデモンストレーションできました。 

このセッションでは、Azure Cognitive Services を使用して、Tailwind Traders の Web サイトの "Shop by Photo" 機能を実装する方法と、コンピューター ビジョンの背後にあるニューラル ネットワークのしくみについて説明します。 また、強化学習と Personalizer サービスの結果、Web サイトのレイアウトが、匿名ユーザーのエンゲージメントを最適化するように自動的に適合される方法についても説明します。

最後に、AI を運用環境に配置する前に考慮する必要があるコスト、データ規則、および倫理的な問題について確認します。

## <a name="table-of-contents"></a>目次
 

| リソース          | リンク                            |
|-------------------|----------------------------------|
| PowerPoint        | - [プレゼンテーション](presentations.md) |
| ビデオ            | - [ドライ ラン リハーサル](https://youtu.be/jRO-5g-HYuU) <br/>- [Microsoft Ignite Orland レコーディング](https://myignite.techcommunity.microsoft.com/sessions/82987?source=sessions) |
| デモ             | - [デモ 1 - セットアップ ](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md) <br/>- [デモ 2 - Computer Vision](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Computer%20Vision.md) <br/>- [デモ 3 - Custom Vision](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Custom%20Vision.md)<br/>- [デモ 4 - ONNX のデプロイ](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20ONNX%20deployment.md) <br/>- [デモ 5 - Personalizer](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Personalizer.md) | 

[AIML20 プレゼンテーションのスライドをこちらでダウンロードしてください](presentations.md)。 (最新バージョン用の最初のリンクを使用してください。)スライドは PPT 形式で、詳細な発表者ノートと埋め込みデモ ビデオが含まれています。

これらのリソースへのショートリンク: [aka.ms/AIML20repo](https://aka.ms/AIML20repo)。 

[このトークの発表者向けリソース](README-Presenters.md)も提供されています。



## <a name="technologies-used"></a>使用されているテクノロジ

* [Azure Cognitive Services](https://docs.microsoft.com/en-us/azure/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure コマンド ライン インターフェイス (CLI)](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest?WT.mc_id=msignitethetour2019-github-aiml20)
* [ONNX](https://github.com/onnx/onnx)
* [Visual Studio Code](https://code.visualstudio.com/)

## <a name="other-resources-mentioned-in-talk"></a>トークで言及されている他のリソース

* ニューラル ネットワークの仕組み (作者: Brandon Rohrer): http://brohrer.github.io/blog.html
* XKCD "Tasks": https://xkcd.com/1425

### <a name="azure-cognitive-services-docs-and-apps"></a>Azure Cognitive Services に関するドキュメントおよびアプリ

* Cognitive Services Computer Vision: [https://aka.ms/try-computervision](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=ignitetour-talk-davidsmi)  
* Cognitive Services Custom Vision:[ドキュメント](https://docs.microsoft.com/en-us/azure/cognitive-services/custom-vision-service/?WT.mc_id=ignitethetour-github-davidsmi)および [https://customvision.ai](https://www.customvision.ai/?WT.mc_id=ignitethetour-github-davidsmi) にあるアプリケーション
* ONNX Runtime: https://github.com/microsoft/onnxruntime
* Cognitive Services Personalizer: [https://aka.ms/personalizer-intro](https://docs.microsoft.com/en-us/azure/cognitive-services/personalizer/?WT.mc_id=msignitethetour2019-github-aiml20)
* Personalizer での強化学習: https://aka.ms/personalizerdemo
* コンテナーでの Cognitive Services: https://aka.ms/cs-containers

### <a name="cognitive-services-information"></a>Cognitive Services の情報

* Cognitive Services の価格: https://aka.ms/cs-pricing 
* Cognitive Services のコンプライアンスとプライバシー: https://aka.ms/az-compliance
* 倫理的な AI に対する Microsoft のアプローチ: [https://microsoft.com/AI/our-approach-to-ai](https://www.microsoft.com/AI/our-approach-to-ai?rtc=1&WT.mc_id=msignitethetour2019-github-aiml20)
* Microsoft Learn の Cognitive Services トレーニング コース: https://aka.ms/AIML20MSLearnCollection
* Microsoft 認定 Azure Data Scientist Associate: https://aka.ms/DataScientistCert 
* Microsoft 認定 Azure AI Engineer Associate: https://aka.ms/AIEngineerCert

## <a name="demonstrations"></a>デモンストレーション

トーク内で行われているデモを再作成する方法の詳細については、以下のリンクをご覧ください。 これらのデモを行うには、Azure サブスクリプションが必要です。まだお持ちでない場合は、こちらの[新規サブスクライバー向けの $200 相当の Azure クレジット](https://aka.ms/azure-free-credits)へのリンクをご参照ください。

1. [セットアップ](DEMO%20Setup.md):アカウントを作成し、以下のデモをサポートするためのリソースをデプロイして構成します。 以下のデモを試みる前に、次の手順に従ってください。

1. [Computer Vision](DEMO%20Computer%20Vision.md):Cognitive Services Computer Vision を使用して、Web アプリケーションと Azure CLI 経由で、画像を分析します。

1. [Custom Vision](DEMO%20Custom%20Vision.md):Tailwind Traders によって販売されている製品のみを検出する、カスタム ビジョン モデルを作成します。

1. [ONNX のデプロイ](DEMO%20ONNX%20deployment.md):ONNX 形式のカスタム ビジョン モデルを Tailwind Traders Web サイトの "Shop by Photo" 機能にデプロイします

1. [Personalizer](DEMO%20Personalizer.md):Tailwind Traders Web サイトの "推奨" セクションのレイアウトを動的に再構成して、匿名ビジターが "おすすめ" 製品をクリックする可能性を最大限に高めます。

## <a name="feedback-loop"></a>フィードバック ループ

コメント、フィードバック、ご提案はございますか。 コンテンツの変更/提案/フィードバックのための最良のフィードバック ループは、この GitHub リポジトリに新しいイシューを作成することです。 イシューの作成方法については、[共同作成に関するドキュメント](../CONTRIBUTING.md)を参照してください
