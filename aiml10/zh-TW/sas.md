# <a name="shared-access-signatures"></a>共用存取簽章

有幾個示範需要使用[共用存取簽章](https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview?WT.mc_id=msignitethetour2019-github-aiml10)來存取 Azure 儲存體帳戶中的 Blob。 這些簽章會用來將暫時存取權授與 Azure 認知搜尋將編製索引的 Blob。 我們將在以下描述執行這項操作的兩種方式。

## <a name="using-the-portal"></a>使用入口網站

1. 巡覽至儲存體 Blob 容器，然後以滑鼠右鍵按一下所需的容器，並選取 `Get Shared Access Signature`

![取得共用存取簽章](images/sas_portal.png "取得共用存取簽章")

2. 針對簽章選取適當的 [開始時間] 和 [到期時間]。 針對這些練習，我們需要選取 `Read` 和 `List` 權限 (請向下捲動以尋找 `List` 核取方塊)

![SAS 設定](images/sas_portal_step1.png "SAS 設定")

3. 複製查詢字串，如下所示： 

![SAS 簽章](images/sas_portal_step2.png "SAS 簽章")

## <a name="using-microsoft-azure-storage-explorer"></a>使用 Microsoft Azure 儲存體總管

1. 下載 [Microsoft Azure 儲存體總管](https://azure.microsoft.com/en-us/features/storage-explorer/?WT.mc_id=msignitethetour2019-github-aiml10)並進行安裝。

2. 巡覽至儲存體 Blob 容器，然後以滑鼠右鍵按一下所需的容器，並選取 `Get Shared Access Signature`

![取得共用存取簽章](images/sas_explorer.png "取得共用存取簽章")

3. 針對簽章選取適當的 [開始時間] 和 [到期時間]。 針對這些練習，我們需要選取 `Read` 和 `List` 權限 (請向下捲動以尋找 `List` 核取方塊)

![SAS 設定](images/sas_explorer_step1.png "SAS 設定")

4. 複製查詢字串，如下所示： 

![SAS 簽章](images/sas_explorer_step2.png "SAS 簽章")