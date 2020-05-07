# <a name="demo-instructions-for-presenters"></a>発表者向けのデモの手順

デモ用原稿は、このリポジトリ内のすべてのユーザーが利用できるようになっています。

同じプレゼンテーション用の原稿に従う必要がありますが、以下に示す追加の注意事項があります。

デモの録画も [PPT スライド](presentations.md)でビデオとして利用できます (その他の一部のリンクされたビデオも以下に示します)。 インターネットなどの技術的な問題がない場合は、ライブ デモではなく、埋め込みビデオを使用できます。 (この場合、オーディオとビデオへの音声をご自身でミュートにすることをお勧めします。)[話者向けのメモ](speaker-notes.md)は、埋め込みビデオのイベントとタイミングが合わせられています。

## <a name="demo-setup"></a>デモ セットアップ

プレゼンテーションの前に、次の原稿に記載されているすべての手順を実行してください。

[デモ用原稿](DEMO%20Setup.md)

## <a name="demo-computer-vision"></a>デモ Computer Vision

[デモ用原稿](DEMO%20Computer%20Vision.md)

### <a name="slide-demo--shop-by-photo"></a>スライド:デモ / 写真でのショッピング

このデモの実際の手順は、[こちら](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)に記載されています。

### <a name="slide-demo--cognitive-services-computer-vision"></a>スライド:デモ / Cognitive Services Computer Vision

[デモ用原稿](DEMO%20Computer%20Vision.md#using-computer-vision-via-the-web-interface)

## <a name="demo-custom-vision"></a>デモ Custom Vision

[デモ用原稿](DEMO%20Custom%20Vision.md)

デモの最初の部分を事前に実行します。

### <a name="slide-demo--customized-object-recognition"></a>スライド:デモ / カスタマイズされたオブジェクト認識

「[画像の追加とモデルのトレーニング](DEMO%20Custom%20Vision.md#add-images-and-train-a-model)」でライブ デモを開始します。

## <a name="demo-onnx-deployment"></a>デモ ONNX のデプロイ

[デモ用原稿](DEMO%20ONNX%20deployment.md)

セクション「[シンプルな ONNX モデルを読み込む](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model)」を事前に実行します。

「[問題の定義](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)」セクションはプレゼンテーションの冒頭で行ったため、これはスキップします。

### <a name="slide-demo--onnx"></a>スライド:デモ / ONNX

「Tailwind Traders Web サイト内で ONNX モデルを更新する」でライブ デモを開始します。

Netron で表示するために、Custom Vision から直接エクスポートしたファイルを表示するか、事前準備されたファイルをリポジトリ (`ONNX/custom model/products.onnx`) から使用することができます

ファイルをデプロイするとき、`products.onnx` という名前を付ける**必要があります**。これにより、エクスポートされたファイルの名前を変更するのではなく、デスクトップから事前準備されたファイルをその名前で最も簡単に取得できます。

### <a name="slide-demo--personalizer"></a>スライド:デモ / Personalizer

[デモ用原稿](DEMO%20Personalizer.md)
