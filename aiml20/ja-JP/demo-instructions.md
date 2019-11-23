# <a name="demo-instructions-for-presenters"></a>プレゼンター用デモ手順

デモ スクリプトは、このリポジトリ内のすべてのユーザーが利用できるようになっています。

プレゼンテーション用の同じスクリプトに従う必要がありますが、以下に示す追加の注意事項があります。

デモの録画も [PPT スライド](presentations.md)でビデオとして利用できます (その他の一部のリンクされたビデオも以下に示します)。 インターネットなどの技術的な問題がない場合は、ライブ デモではなく、埋め込みビデオを使用できます。 (この場合、オーディオとビデオへの音声を自身でミュートすることをお勧めします。)[講演者用メモ](speaker-notes.md)は、埋め込みビデオのイベントとタイミングが合わせられています。

## <a name="demo-setup"></a>デモ セットアップ

プレゼンテーションの前に、以下のスクリプトに記載されているすべての手順を実行してください。

[デモ スクリプト](DEMO%20Setup.md)

## <a name="demo-computer-vision"></a>デモ Computer Vision

[デモ スクリプト](DEMO%20Computer%20Vision.md)

### <a name="slide-demo--shop-by-photo"></a>スライド:デモ / 写真でのショッピング

このデモの実際の手順は、[ここ](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)に記載されています。

その他のデモ ビデオ: https://www.dropbox.com/s/ylxjuifg9x0h4n3/ITT-aiml20-demo1.mp4?dl=0 

### <a name="slide-demo--cognitive-services-computer-vision"></a>スライド:デモ / Cognitive Services Computer Vision

[デモ スクリプト](DEMO%20Computer%20Vision.md#using-computer-vision-via-the-web-interface)

## <a name="demo-custom-vision"></a>デモ Custom Vision

[デモ スクリプト](DEMO%20Custom%20Vision.md)

デモの最初の部分を事前に実行します。

### <a name="slide-demo--customized-object-recognition"></a>スライド:デモ / カスタマイズされたオブジェクト認識

「[画像の追加とモデルのトレーニング](DEMO%20Custom%20Vision.md#add-images-and-train-a-model)」でライブ デモを開始します。

## <a name="demo-onnx-deployment"></a>デモ ONNX のデプロイ

[デモ スクリプト](DEMO%20ONNX%20deployment.md)

セクション「[単純な ONNX モデルを読み込む](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model)」を事前に実行します。

「[問題の定義](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)」というセクションはプレゼンテーションの冒頭で実行したため、これはスキップします。

### <a name="slide-demo--onnx"></a>スライド:デモ / ONNX

「Tailwind Traders Web サイト内で ONNX モデルを更新するの ONNX モデルを更新する」でライブ デモを開始します。

Netron で表示するために、Custom Vision から直接エクスポートしたファイルを表示するか、事前準備されたファイルをリポジトリ (`ONNX/custom model/products.onnx`) から使用することができます。

ファイルをデプロイするとき、`products.onnx` という名前を付ける**必要があります**。これにより、エクスポートされたファイルの名前を変更するのではなく、デスクトップから事前準備されたファイルをその名前で最も簡単に取得できます。

### <a name="slide-demo--personalizer"></a>スライド:デモ / Personalizer

[デモ スクリプト](DEMO%20Personalizer.md)
