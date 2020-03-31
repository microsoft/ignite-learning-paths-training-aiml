# <a name="demo-1---azure-cognitive-search"></a>演示 1 - Azure 认知搜索

[![演示 1](images/demo1.png)](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/videos/Demo1.mp4 "演示 1")

## <a name="summary"></a>摘要
在本练习中，我们演示 Azure 认知搜索和内置的智能技能组的基本功能。 可通过多种方法来创建此演示所需的资源：
1. 按上面的视频操作（每一步都已概述），或者
2. 使用 [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=msignitethetour2019-github-aiml10)


## <a name="what-you-need"></a>需要什么
- [发票测试集](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/test.zip)

## <a name="azure-resources"></a>Azure 资源
下表列出了我们在第一个演示中创建的资源。 此表概要介绍了视频中显示的资源的名称，但对于每项资源，请使用你自己的名称。


| 名称                       | 类型                            | 用途                    |
| -------------------------- | ------------------------------- | ------------------------- |
| **ttcognitivesearch**     | 资源组                  | 将多种服务组合到一起   |
| **ttinvoicestorage**      | 存储帐户                 | 用于存储发票     |
| **ttinvoicesearch**       | 搜索服务                  | 特色服务           |
| **ttinvoiceintelligence** | 认知服务（全合一） | 在搜索服务中使用 |


## <a name="what-to-do"></a>要执行的操作

有三个主要步骤：
1. 创建资源组
2. 创建并使用存储帐户
3. 创建并使用搜索服务资源



### <a name="create-a-resource-group"></a>创建资源组
我们的所有资源将在此组中运行。

```
az group create --location {LOCATION} --name {YOUR_RG_NAME}
```

### <a name="create-and-use-storage-account"></a>创建并使用存储帐户
此存储帐户主要用于存储发票。

1. 创建存储帐户

```
az storage account create --name {YOUR_STORAGE_NAME} --location {LOCATION} --resource-group {YOUR_RG_NAME} --sku Standard_LRS
```

2. 创建名为 `test` 的容器

[![创建容器](images/create_container.png)](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal?WT.mc_id=msignitethetour2019-github-aiml10 "创建容器")

3. 下载并解压缩[发票测试集](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/test.zip)。

4. 将解压缩的[发票测试集](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/test.zip)上传到 `test` 容器。 可以直接通过[门户](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal?WT.mc_id=msignitethetour2019-github-aiml10#upload-a-block-blob)这样做，也可以通过 [Azure 存储资源管理器](https://docs.microsoft.com/en-us/azure/vs-azure-tools-storage-explorer-blobs?WT.mc_id=msignitethetour2019-github-aiml10)应用程序这样做（详见[视频](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/videos/Demo1.mp4 "演示 1")）。

### <a name="create-and-use-a-search-service-resource"></a>创建并使用搜索服务资源
创建搜索服务：

[![Azure 搜索](images/azure_search.png)](https://docs.microsoft.com/en-us/azure/search/search-create-service-portal?WT.mc_id=msignitethetour2019-github-aiml10 "Azure 搜索")


使用搜索服务：

1. 在新建的服务中，单击`Import Data`

[![导入数据](images/import_data.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#create-the-enrichment-pipeline "导入数据")

2. 使用现有的到 `test` 容器（我们已在存储帐户中创建）的连接。

[![导入数据](images/connect_data.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#step-1-create-a-data-source "导入数据")

3. 新建认知服务资源

[![创建认知服务](images/attach_cognitive_svcs.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#step-2-add-cognitive-skills "创建认知服务")

4. 返回到向导并按“刷新”。 应该会看到新建的服务。 

5. 现在可以添加你喜欢的任何扩充！

[![添加扩充](images/add_enrichments.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#step-2-add-cognitive-skills "添加扩充")

6. 单击`Customize Target Index`后，查看提供的索引，然后单击`Create and Indexer`。

[![第一个索引](images/first_index.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#step-3-configure-the-index "第一个索引")

7. 为新索引器命名，然后单击`Submit`

[![第一个索引器](images/first_indexer.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#step-4-configure-the-indexer "第一个索引器")

8. 索引到位以后，即可尝试一些查询：

[![首次搜索](images/first_search.png)](https://docs.microsoft.com/en-us/azure/search/cognitive-search-quickstart-blob?WT.mc_id=msignitethetour2019-github-aiml10#query-in-search-explorer "首次搜索")

# <a name="next-demo"></a>下一演示
转到[演示 2 - 使用表单识别器](demo2.md)，了解如何使用表单识别器认知服务
