# <a name="show-faulty-prediction-and-make-a-change"></a>問題のある予測を表示して変更を加える

## <a name="show-the-faulty-prediction"></a>問題のある予測を表示する

* Tailwind Traders Web サイトに移動します
    * https://aiml50{eventname}.azurewebsites.net ({eventname} を、デモ環境の作成に使用したイベント名パラメーターに置き換えます)

* [`start smart shopping by uploading a photo`] をクリックします
* [テスト イメージ フォルダー](../source/test-images)からイメージをアップロードします
* このモデルでは、正しくない予測が提供されます。

## <a name="start-the-change"></a>変更を開始する

* `setup_pipeline.py` を変更してモデルを調整します
  * 行 162 - `epochs` を 20 に変更します
  * 行 163 - `batch` を 10 に変更します
* 変更をコミットし、マスターにプッシュします。  これにより、モデルのビルドとデプロイがトリガーされます。  このプロセスは、約 25 分から 30 分かかります。このトークの終わり近くに終了するはずです。
* トークの終わり近くに、戻ってこの結果を確認します

## <a name="example-demo"></a>サンプル デモ

* [ドライ ラン (2:36 から開始)](https://youtu.be/UgM8_4fAni8?t=158)