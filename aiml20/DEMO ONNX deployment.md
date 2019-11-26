# <a name="demo-onnx-deployment"></a>デモ:ONNX のデプロイ

このデモでは、[Custom Vision](DEMO%20Custom%20Vision.md) デモでエクスポートした ONNX ファイルを取得し、Tailwind Traders の Web サイトにそれをデプロイします。

Web サイトでは、Shop by Photo アプリ用に `products.onnx` でモデルを使用します。 アップロードされる画像はモデルによって処理され、次の 5 つのいずれかのラベルが生成されます: "hammer (ハンマー)"、"drill (ドリル)"、"pliers (ペンチ)"、"screwdriver (スクリュードライバー)"、"hard hat (ヘルメット)"。 Web サイトにより、生成されたラベルの製品リストが検索され、検索結果が返されます。

## <a name="load-the-simple-onnx-model"></a>単純な ONNX モデルを読み込む

(ヒント: この手順は、事前に行うことができます。 この手順は、同じデプロイで前にこのデモを実行している場合に必要です。)

Web アプリの products.onnx ファイルを、2 つのオブジェクト カテゴリ ("hammer" と "drill") のみを認識するバージョンに置き換えます。

1. Azure Portal で、aiml20-demo リソース グループにアクセスします。

1. "aiml20" App Service リソースをクリックします。

1. 左側のメニューの [開発ツール] で、[高度なツール] をクリックし、右側のペインで [移動] をクリックして Kudu を起動します。

1. メイン メニュー バーで、[デバッグ コンソール] > [PowerShell] をクリックします。

1. 以下に移動します: site / wwwroot / Standalone / Onnxmodels

1. エクスプローラーで、AIML20 リポジトリから `ONNX / simple model` フォルダーを開きます。

1. products.onnx into を、Kudu ウィンドウの左半分にドラッグします。 (重要: "アップロードして解凍するにはここにドラッグしてください" というボックスにはドラッグしないでください。)このモデルは、ドリルとハンマーを識別する方法のみを認識します。

1. Web サーバーを再起動します。 "aiml20" App Service リソースに戻り、上部のメニュー バーで [再起動] をクリックします。 Web サイトが完全に再起動するまで 2 分待ちます。

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>問題の定義: Shop by Photo が正しく機能しない

(注: このセクションは、AIML20 プレゼンテーションの冒頭で実行されました。)

1. 以前にデプロイした Tailwind Traders Web サイトにアクセスします。 

1. Web サイトの "Shop by Photo (写真でのショッピング)" セクションまで下にスクロールします。

1. [Shop by Photo]\(写真でのショッピング\) をクリックします。

1. AIML20 リポジトリで、[test images]\(テスト画像\) > [drill.jpg] を選択します。

1. これで、ドリルとして正しく認識されます 。

1. ホーム ページに戻り、[Shop by Photo]\(写真でのショッピング\) をもう一度クリックします。

1. AIML20 リポジトリで、[test images]\(テスト画像\) > [pliers.jpg] を選択します。

1. おっと!  ハンマーとして認識されます。 これは後で修正します。まず、失敗した理由について説明します。

## <a name="update-the-onnx-model-in-the-tailwind-traders-website"></a>Tailwind Traders Web サイト内で ONNX モデルを更新する

最初に、Netron 内のエクスポートされたモデルを表示します。

1. https://lutzroeder.github.io/netron/ に移動し、[モデルを開く] をクリックします。

2. ONNX / Custom Model / products.onnx を開きます。

3. ニューラル ネットワークをスクロールします。次の点に注意してください。

 - サイズが大きい
 - 上部に入力として 224x224 画像があります (外聞の悪い事実として、Computer Vision モデルは画質が悪い)
 - 下部には、5 という値が出力されます。これらはクラス ラベルの信頼度スコアです。

次に、TWT ファイルシステムにエクスポートした ONNX ファイルを削除します。

1. Azure Portal で、aiml20-demo リソース グループにアクセスします。

1. "aiml20" Web アプリ リソースをクリックします。

1. [開発ツール] で、[高度なツール] をクリックし、右側のペインで [移動] をクリックして Kudu を起動します。

1. メイン メニュー バーで、[デバッグ コンソール] > [PowerShell] をクリックします。

1. 以下に移動します: site / wwwroot / Standalone / Onnxmodels

1. エクスプローラーで、AIML20 リポジトリから `ONNX / custom model` フォルダーを開きます。

1. products.onnx into を、Kudu ウィンドウの左半分にドラッグします。 (重要: "アップロードして解凍するにはここにドラッグしてください" というボックスにはドラッグしないでください。)

1. Web サーバーを再起動します。 "onnx" Web アプリ リソースに戻り、[再起動] をクリックします。

Shop by Photo を再実行し、`test images / pliers.jpg` をアップロードします。 これで上手く行きます。

## <a name="next-step"></a>次のステップ

[Personalizer](DEMO%20Personalizer.md)


