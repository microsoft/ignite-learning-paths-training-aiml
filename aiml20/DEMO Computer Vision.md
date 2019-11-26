# <a name="using-pre-built-ai-to-understand-images"></a>事前構築済み AI を使用して画像を理解する

このデモでは、Azure Computer Vision を使用して、画像によって表されるオブジェクトの種類を検出します。 

最初に、Computer Vision オンライン Web フォームを使用して画像をアップロードし、結果を確認します。

次に、Computer Vision API を使用して、curl を使ってプログラムにより同じ情報を収集します。

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>問題の定義: Shop by Photo が正しく機能しない

この講演の動機となる問題は、Tailwind Traders Web サイトの Shop by Photo ツールが製品を正しく識別しないことです。 この時点で「[ONNX のデプロイ](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)」のこのセクションを実行して、シーンを設定しておくと便利です。

## <a name="using-computer-vision-via-the-web-interface"></a>Web インターフェイス経由での Computer Vision の使用

ハードウェア製品の画像上で Computer Vision を使用してみましょう。 Tailwind Traders が販売する製品を名前で特定できる場合は、"Shop by Photo" アプリのカタログでその名前を検索できます。

1. Computer Vision の Web ページ ([https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=msignitethetour2019-github-aiml20)) にアクセスします。

2. "画像を分析する" セクションまで下にスクロールします。 次のように表示されています。

!["Computer Vision:画像を分析する"](img/Computer%20Vision%20Analyze%20an%20Image.png)

3. [参照] ボタンをクリックし、[CV Training Images]\(CV トレーニング画像\) の [test images]\(テスト画像\) フォルダーから [man in hardhat.jpg]\(ヘルメットをかぶった人.jpg\) を選択します。

4. しばらくすると、画像の分析が右側のペインに表示されます。 次のように表示されます。

```
FEATURE NAME:   VALUE

Objects [ { "rectangle": { "x": 138, "y": 27, "w": 746, "h": 471 }, "object": "headwear", "confidence": 0.616 }, { "rectangle": { "x": 52, "y": 33, "w": 910, "h": 951 }, "object": "person", "confidence": 0.802 } ]

Tags    [ { "name": "man", "confidence": 0.999212 }, { "name": "headdress", "confidence": 0.99731946 }, { "name": "person", "confidence": 0.995057464 }, { "name": "clothing", "confidence": 0.991814733 }, { "name": "wearing", "confidence": 0.9827137 }, { "name": "hat", "confidence": 0.9691986 }, { "name": "helmet", "confidence": 0.9227209 }, { "name": "headgear", "confidence": 0.840476155 }, { "name": "personal protective equipment", "confidence": 0.8358513 }, { "name": "looking", "confidence": 0.832229853 }, { "name": "hard hat", "confidence": 0.8004248 }, { "name": "human face", "confidence": 0.785058737 }, { "name": "green", "confidence": 0.774940848 }, { "name": "fashion accessory", "confidence": 0.706475437 } ]

Description { "tags": [ "man", "headdress", "person", "clothing", "wearing", "hat", "helmet", "looking", "green", "jacket", "shirt", "standing", "head", "suit", "glasses", "yellow", "white", "large", "phone", "holding" ], "captions": [ { "text": "a man wearing a helmet", "confidence": 0.8976638 } ] }

Image format    "Jpeg"

Image dimensions    1000 x 1000

Clip art type   0

Line drawing type   0

Black and white false

Adult content   false

Adult score 0.0126242451

Racy    false

Racy score  0.0156497136

Categories  [ { "name": "people_", "score": 0.69140625 } ]

Faces   [ { "age": 37, "gender": "Male", "faceRectangle": { "top": 419, "left": 363, "width": 398, "height": 398 } } ]

Dominant color background   "White"

Dominant color foreground   "White"

Accent Color    #90A526
```

(上記の分析は将来変更される可能性があります。Computer Vision モデルは定期的に更新されます。)

最初の "オブジェクト" の結果で、2 つのオブジェクト "headwear" と "person" が検出され、画像内の場所が指定されていることに注意してください。 検出したいオブジェクトは "headwear (かぶりもの)" に分類されますが、このアプリケーションでは、より具体的な分類 "hard hat (ヘルメット)" が必要です。 ただし、"hard hat" は Computer Vision で現在検出されるオブジェクトの種類には含まれません。 (この問題は後で Custom Vision で対処します。)また、各オブジェクトの分類に信頼度スコアが指定されていることにも注意してください。

2 番目の "Tags (タグ)" の結果では、画像全体に関連付けられているラベルの一覧が示されます。 信頼度の最も高いタグ (一覧の先頭) は "man" であり、これはそれほど役に立ちません。 2 番目のタグ "headdress" も正確に探しているものとは違います。

その他の応答も興味深いものですが、このデモではそれらに焦点は当てません。 ただし、何が含まれているか見てみましょう。

* [説明] フィールド内の写真のキャプション ("ヘルメットをかぶった男の人")。

* 画像の特徴 (黒人か白人か? 線画か?)

* 画像で検出されたすべての顔の詳細 (この場合、37 歳の男性として識別)

* 画像のコンテンツのスコア: "成人向け" または "わいせつ" であるか。

* 画像の色の分析: 前景のドミナント カラー、アクセント カラー、背景色。

ここでは、"Tags" フィールドにのみ注目します。次のセクションで、プログラムを使用してこれを抽出する方法について説明します。

## <a name="using-computer-vision-via-the-api"></a>API 経由での Computer Vision の使用

[その REST API を使ってプログラムにより Computer Vision を制御](https://docs.microsoft.com/en-us/azure/cognitive-services/computer-vision/vision-api-how-to-topics/howtocallvisionapi?WT.mc_id=msignitethetour2019-github-aiml20)できます。
これは、Web にアクセスできるほとんどの言語またはアプリケーションから行うことができますが、ここでは [curl](https://curl.haxx.se/) を使用します。これは、URL とやり取りし、その出力を収集するための一般的なコマンドライン アプリケーションです。 curl アプリケーションは、ほとんどの Linux ディストリビューションや最新バージョンの Windows 10 (1706 以降) にあらかじめインストールされています。 

ファイル [`vision_demo.sh`](vision_demo.sh) でコマンドを実行します。 ローカル Azure CLI または Azure Cloud Shell を使用できますが、シェルとして bash を使用する必要があります。

このスクリプトのコマンドは次のようになります。

1. Azure サブスクリプションにログインします (この手順は Cloud Shell を使用する場合は必要ありません)
2. Azure リソース グループを作成します。
3. Cognitive Services キーを作成します。 (注: これは、後で Custom Vision にも使用するオムニバス キーです。)
4. キーを見つけます。
5. CURL を使用して 2 つの画像を分析します。

## <a name="manually-generating-keys-for-use-with-computer-vision"></a>Computer Vision で使用するキーを手動で生成する

スクリプト [vision_demo.sh](vision_demo.sh) で、"キーの作成" セクションを実行して、Azure コマンドライン インターフェイスを使用してプログラムによって Cognitive Sevices キーを作成します。
(必要に応じて、[Azure Portal と対話してキーを作成](https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account?tabs=multiservice%2Clinux&WT.mc_id=msignitethetour2019-github-aiml20)できます。)

## <a name="next-step"></a>次のステップ

[Custom Vision](DEMO%20Custom%20Vision.md)