# <a name="personalizer-demo"></a>Personalizer のデモ

このデモでは、強化学習と [Cognitive Services Personalizer](https://docs.microsoft.com/en-us/azure/cognitive-services/personalizer/?WT.mc_id=msignitethetour2019-github-aiml20) を使用して、Web サイトのレイアウトをビジターのアクションに適合させる方法を確認します。

Personalizer を使うと、インターフェイスを動的に再構成し、匿名ビジターがお勧めセクションのおすすめのカテゴリをクリックする可能性を最大にすることができます。

1. Tailwind Traders Web サイト アプリをデプロイします (`DEMO Setup.md` でまだ行っていない場合)

2. Tailwind Traders のホーム ページにアクセスします

3. "お勧め" セクションとおすすめのカテゴリの順序を確認します。

4. ページを最新の情報に更新します (これは何回か行うことが必要になる場合があります)。 レイアウトが変更されたことを確認します。

Personalizer サービスを使うと、匿名ビジターを追跡し、カテゴリをクリックしたときの時刻、曜日、および使われたブラウザー OS を記録できます。 "報酬" は、大きなおすすめのセクションがクリックされたかどうかです。 

時間が経過すると、Personalizer により、時刻、曜日、OS に基づいて、おすすめする最適なカテゴリが決定されます。 また、時間の 20% は、埋もれているカテゴリを発掘するための "探索" に充てられます。
