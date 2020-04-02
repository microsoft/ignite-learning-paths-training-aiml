# <a name="bootstrap-container"></a>啟動容器

此容器映像可協助填滿佈建流程中的間隙。

## <a name="contents"></a>內容

以 PowerShell Core 容器為基礎

軟體：

* Curl
* Wget
* Azure CLI
* Az CLI 的 Azure DevOps 延伸模組
* AzCopy
* VSTeam PowerShell 模組 (即其支援模組)

內容檔案：

* ReleaseSeer.json - Azure DevOps 發行範本
* 影像 - 網站的訓練影像和產品影像 (在容器建置時從活動 CDN 提取)

## <a name="bootstrap-process"></a>啟動流程

容器會啟動 PowerShell 指令碼。該指令碼會按照以下順序執行操作：

* 在目標 Azure DevOps 組織中驗證或建立名為 `AIML50` 的專案。
* 驗證或將 `ms-air-aiagility/vss-services-azureml` 延伸模組新增至組織
* 驗證或建立稱為 `SeerPackages` 的成品摘要
* 驗證或建立稱為 `aiml50-demo` 的變數群組
* 驗證或匯入 ReleaseSeer 版本定義
* 將影像檔案複製到部署範本所建立的 Azure 儲存體
* 開始輪詢 Tailwind Traders 網站，使其上線及執行。 (每 10 秒輪詢一次。)
  * 一旦網站開始執行，此輪詢會觸發資料庫專案的 Scaffolding，允許繼續進行下一個步驟。
* 連線到 Azure SQL Database，以插入扳手的記錄 (嘗試最多 5 次，每一次嘗試間隔 120 次睡眠)
  * 檢查現有的識別碼，並在缺少時插入。

如果啟動容器無法執行，啟動容器應該能重新執行，而不會影響已設定的部分。
