# <a name="demo-custom-vision"></a>デモ:Custom Vision

このデモでは、customvision.ai でサービスを使用してカスタム ビジョン モデルを作成します。

## <a name="create-a-custom-model-project-with-custom-vision"></a>Custom Vision でカスタム モデル プロジェクトを作成する

ヒント:このセクションを事前に実行して、ライブ デモの時間を節約できます。

1. [Custom Vision](https://customvision.ai) にサインインし、新しいプロジェクトを作成します。
   [こちらで説明されている手順に従います](https://docs.microsoft.com/azure/cognitive-services/custom-vision-service/getting-started-build-a-classifier?WT.mc_id=msignitethetour2019-github-aiml20)。

1. 新しいプロジェクトには、次の設定が必要です。

    - 名前:Tools
    - 説明:Tailwind Traders によって販売される製品
    - リソース: aiml20-cs-resource
    - プロジェクトの種類: 分類
    - 分類の種類:Multiclass
    - ドメイン:小売 (コンパクト)
    - エクスポート機能:基本プラットフォーム

1. 左側の [タグ] ツールで、[+] ボタンを使用して次のタグを追加します。

    - drill
    - hammer
    - pliers
    - screwdriver

1. 次に、"CV Training Images" の対応するフォルダーから各タグに対する画像を追加します。 ここでは、"drill" に対してそれを行う方法を示します

    - 先頭行の [画像の追加] をクリックします
    - CV Training Images / drills を参照します
    - すべてのファイルを選択します: 1 つのファイルをクリックし、Ctrl + A キーを押します
    - [開く] をクリックします
    - 次に表示される [画像のアップロード] ダイアログで、[My Tags]\(マイ タグ\) の "drill" を選択し、[Upload 16 Files]\(16 ファイルのアップロード\) をクリックします。
    - このプロセスを、hammer、pliers、screwdriver の各タグについて繰り返します ("hard hat" は後で行います)

## <a name="add-images-and-train-a-model"></a>画像を追加してモデルをトレーニングする

Ignite Tour では、以上の手順はすべて準備として事前に行われていました。 時間を節約するため、残りの手順のみがライブで行われました。

1. まだサインインしていない場合は、customvision.ai にサインインして、"tools" プロジェクトを開きます。

1. このプロジェクトには、既にドリル、ハンマー、ペンチ、ドライバーの画像が提供されています。 ヘルメットの画像もいくつか追加してみましょう。

- 先頭行の [画像の追加] をクリックします
- CV Training Images / drills を参照します
- すべてのファイルを選択します: 1 つのファイルをクリックし、Ctrl + A キーを押します
- [開く] をクリックします
- 次に表示される [画像のアップロード] ダイアログで、[My Tags]\(マイ タグ\) の "hard hat" を選択し、[Upload 16 Files]\(16 ファイルのアップロード\) をクリックします。

1. 上部のメニュー バーで [パフォーマンス] をクリックし、緑色の [トレーニング] ボタンをクリックします。 [Quick Training]\(クイック トレーニング\) を選択し、[トレーニング] をクリックします。

1. 左側のペインで最新の反復をクリックすると、結果が表示されます。 90.9% の精度 (モデルで正しく予測されたトレーニング画像の数)、88.2% のリコール (予測を生成した場合の正しさ)、98.7% の AP (全体的なメジャー) になるはずです。 これらは、確率のしきい値によって異なります。偽陽性を回避する場合は、この値を低くします。
   このリテール アプリの場合は、高くしても安全です。

1. 新しい画像でモデルをテストします。 [クイック テスト]、[ローカル ファイルを参照します] の順にクリックして、"test images / man in hardhat.jpg" を選択します。 99.9% の確率でヘルメットと識別されていることを確認してください。 "test images / drill.jpg" で同じことを試してください。これも正しく識別されます。

次に、Tailwind Traders アプリに統合するために、モデルを ONNX 形式で保存します。

1. [エクスポート] をクリックし、[ONNX] を選択します。 他のプラットフォーム固有の形式も使用できることに注意してください。

1. バージョン ONNX 1.2 を選択し、[エクスポート] をクリックします。 TWT アプリには products.onnx という名前のファイルが必要なので、リポジトリに既に保存されているものを使用します。

## <a name="next-step"></a>次のステップ

[ONNX のデプロイ](DEMO%20ONNX%20deployment.md)