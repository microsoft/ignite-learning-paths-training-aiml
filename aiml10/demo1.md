# <a name="demo-1---azure-cognitive-search"></a>示範 1 - Azure 認知搜尋

[![示範 1](images/demo1.png)](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/videos/Demo1.mp4 "示範 1")

## <a name="summary"></a>摘要
在本練習中，我們會示範 Azure 認知搜尋的基本功能，以及內建的智慧型技能集。 有數種方式可以建立此示範所需的資源：
1. 請遵循上述影片操作 (我們會概述每個步驟)，或
2. 使用 [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=msignitethetour2019-github-aiml10)


## <a name="what-you-need"></a>必要條件
- [發票測試集](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/test.zip)

## <a name="azure-resources"></a>Azure 資源
這些是我們在第一個示範中建立的資源。 雖然此表概述影片中所顯示的資源名稱，但請針對每個資源使用您自己的名稱。


| 名稱                       | 類型                            | 目的                    |
| -------------------------- | ------------------------------- | ------------------------- |
| **ttcognitivesearch**     | 資源群組                  | 將服務分組在一起   |
| **ttinvoicestorage**      | 儲存體帳戶                 | 用於儲存發票     |
| **ttinvoicesearch**       | 搜尋服務                  | 精選服務           |
| **ttinvoiceintelligence** | 認知服務 (全方位) | 用於搜尋服務 |


## <a name="what-to-do"></a>應採取的動作

有三個主要步驟：
1. 建立資源群組
2. 建立並使用儲存體帳戶
3. 建立並使用搜尋服務資源



### <a name="create-a-resource-group"></a>建立資源群組
我們的所有資源都將在此群組中。

```
az group create --location {LOCATION} --name {YOUR_RG_NAME}
```

### <a name="create-and-use-storage-account"></a>建立並使用儲存體帳戶
儲存體帳戶主要用於儲存發票。

1. 建立儲存體帳戶

```
az storage account create --name {YOUR_STORAGE_NAME} --location {LOCATION} --resource-group {YOUR_RG_NAME} --sku Standard_LRS
```

2. 建立稱為 `test` 的容器

[![建立容器](images/create_container.png)](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal?WT.mc_id=msignitethetour2019-github-aiml10 "建立容器")

3. 下載[發票測試集](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/test.zip)，並將其解壓縮。

4. 將解壓縮的[發票測試集](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/test.zip)上傳至 `test` 容器。 這可以直接使用[入口網站](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal?WT.mc_id=msignitethetour2019-github-aiml10#upload-a-block-blob)，或使用 [Azure 儲存體總管](https://docs.microsoft.com/en-us/azure/vs-azure-tools-storage-explorer-blobs?WT.mc_id=msignitethetour2019-github-aiml10)應用程式來完成 (如[影片](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/videos/Demo1.mp4 "示範 1")中所示)。

### <a name="create-and-use-a-search-service-resource"></a>建立並使用搜尋服務資源
建立搜尋服務：

[![Azure 搜尋服務](images/azure_search.png)](https://docs.microsoft.com/en-us/azure/search/search-create-service-portal?WT.mc_id=msignitethetour2019-github-aiml10 "Azure 搜尋服務")


使用搜尋服務：

1. 在新建立的服務中，按一下 `Import Data`

[![匯入資料](images/import_data.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#create-the-enrichment-pipeline "匯入資料")

2. 使用我們在儲存體帳戶中所建立 `test` 容器的現有連線。

[![匯入資料](images/connect_data.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#step-1-create-a-data-source "匯入資料")

3. 建立新的認知服務資源

[![建立認知服務](images/attach_cognitive_svcs.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#step-2-add-cognitive-skills "建立認知服務")

4. 返回精靈，然後按 [重新整理]。 您應該會看到新建立的服務。 

5. 現在可以新增任何您喜歡的擴充！

[![新增擴充](images/add_enrichments.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#step-2-add-cognitive-skills "新增擴充")

6. 按一下 `Customize Target Index` 之後，檢查建議的索引，然後按一下 `Create and Indexer`。

[![第一個索引](images/first_index.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#step-3-configure-the-index "第一個索引")

7. 為新的容器命名，然後按一下 `Submit`

[![第一個索引子](images/first_indexer.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#step-4-configure-the-indexer "第一個索引子")

8. 進行編製索引之後，請安心地嘗試一些查詢：

[![第一個搜尋](images/first_search.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#query-in-search-explorer "第一個搜尋")

# <a name="next-demo"></a>下個示範
繼續進行[示範 2 - 使用表單辨識器](demo2.md)，了解如何使用表單辨識器認知服務