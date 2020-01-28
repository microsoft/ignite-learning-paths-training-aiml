# <a name="show-faulty-prediction-and-make-a-change"></a>顯示錯誤的預測並予以變更

> 💡 您必須先完成[設定](../DEMO.md)，才能嘗試執行示範。

## <a name="show-the-faulty-prediction"></a>顯示錯誤的預測

* 巡覽至 Tailwind Traders 網站
    * https://aiml50{eventname}.azurewebsites.net (以您用來建立示範環境的活動名稱參數取代 {活動名稱})

* 按一下 `start smart shopping by uploading a photo`
* 從 [test images 資料夾](../source/test-images)上傳影像
* 此模型提供的預測不正確。

## <a name="start-the-change"></a>開始變更

* 變更 `setup_pipeline.py` 以調整模型
  * 162 行 - 將 `epochs` 變更為 20
  * 163 行 - 將 `batch` 變更為 10
* 認可變更並推送至主機。  這會觸發建置和部署模型。  此程序約需 25 或 30 分鐘，報告結束時應該會完成。
* 我們會在報告結束時，回頭檢查這項結果

## <a name="example-demo"></a>範例示範

* [嘗試從 2:36 開始執行](https://youtu.be/UgM8_4fAni8?t=158)