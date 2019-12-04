# <a name="demo-onnx-deployment"></a>デモ:ONNX のデプロイ

このデモでは、[Custom Vision](DEMO%20Custom%20Vision.md) デモでエクスポートした ONNX ファイルを取得し、Tailwind Traders Web サイトにそれをデプロイします。

Web サイトでは、Shop by Photo アプリ用に `products.onnx` でモデルを使用します。 アップロードされる画像はモデルによって処理され、次の 5 つのいずれかのラベルが生成されます: "hammer (ハンマー)"、"drill (ドリル)"、"pliers (ペンチ)"、"screwdriver (ドライバー)"、"hard hat (ヘルメット)"。 Web サイトにより、生成されたラベルの製品リストが検索され、検索結果が返されます。

## <a name="load-the-simple-onnx-model"></a>シンプルな ONNX モデルを読み込む

(ヒント:事前にこの手順を行っておくことが可能です。 同じデプロイで以前にこのデモを行っている場合は、この手順が必要です。)

Web アプリの products.onnx ファイルを、2 つのオブジェクト カテゴリ ("hammer" と "drill") だけが認識されるバージョンに置き換えます。

1. Azure portal で、aiml20-demo リソース グループにアクセスします

1. "aiml20" App Service リソースをクリックします

1. 左側のメニューの [開発ツール] で、[高度なツール] をクリックし、右側のペインで [移動] をクリックして Kudu を起動します。

1. メイン メニュー バーで、[デバッグ コンソール] > [PowerShell] をクリックします

1. 次に移動します: site / wwwroot / Standalone / Onnxmodels

1. エクスプローラーで、AIML20 リポジトリから `ONNX / simple model` フォルダーを開きます

1. products.onnx を、Kudu ウィンドウの "左半分" にドラッグします。 (重要:"アップロードして解凍するにはここにドラッグしてください" と表示されているボックスにはドラッグしないでください。)このモデルでは、ドリルとハンマーの認識のみを行えます。

1. Web サーバーを再起動します。 "aiml20" App Service リソースに戻り、上部のメニュー バーで [再起動] をクリックします。 Web サイトが完全に再起動するまで 2 分間待機します。

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>問題の定義:Shop by Photo が正しく機能しない

(注:このセクションは、AIML20 プレゼンテーションの冒頭で行われました。)

1. 以前にデプロイした Tailwind Traders Web サイトにアクセスします。 

1. Web サイトの "Shop by Photo" セクションまで下にスクロールします

1. [Shop by Photo]\(写真でのショッピング\) をクリックします

1. AIML20 リポジトリで、[test images]\(テスト画像\) > [drill.jpg] を選択します

1. ドリルとして正しく認識されます。 やりました。

1. ホーム ページに戻り、[Shop by Photo]\(写真でのショッピング\) をもう一度クリックします

1. AIML20 リポジトリで、[test images]\(テスト画像\) > [pliers.jpg] を選択します

1. おっと! ハンマーとして認識されます。 これは後で修正しますが、まずは失敗した理由を確認しましょう。

## <a name="update-the-onnx-model-in-the-tailwind-traders-website"></a>Tailwind Traders Web サイトの ONNX モデルを更新する

最初に、Netron でエクスポートされたモデルを表示します。

1. https://lutzroeder.github.io/netron/ に移動し、[モデルを開く] をクリックします

2. ONNX / Custom Model / products.onnx を開きます

3. ニューラル ネットワークをスクロールします。次の点に注意してください。

 - サイズが大きいこと
 - 上部に、入力として 224x224 の画像があります (残念なことに、コンピューター ビジョン モデルの解像度はかなり低いです)
 - 下部には、5 つの値が出力されます。これらはクラス ラベルの信頼度スコアです

次に、エクスポートした ONNX ファイルを TWT ファイルシステムにドロップします

1. Azure portal で、aiml20-demo リソース グループにアクセスします

1. "aiml20" Web アプリ リソースをクリックします

1. [開発ツール] で、[高度なツール] をクリックし、右側のペインで [移動] をクリックして Kudu を起動します。

1. メイン メニュー バーで、[デバッグ コンソール] > [PowerShell] をクリックします

1. 次に移動します: site / wwwroot / Standalone / Onnxmodels

1. エクスプローラーで、AIML20 リポジトリから `ONNX / custom model` フォルダーを開きます

1. products.onnx を、Kudu ウィンドウの "左半分" にドラッグします。 (重要:"アップロードして解凍するにはここにドラッグしてください" と表示されているボックスにはドラッグしないでください。)

1. Web サーバーを再起動します。 "onnx" Web アプリのリソースに戻り、[再起動] をクリックします。

Shop by Photo を再実行し、`test images / pliers.jpg` をアップロードします。 これでうまくいきます。

## <a name="next-step"></a>次のステップ

[Personalizer](DEMO%20Personalizer.md)


