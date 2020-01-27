## <a name="demo-5---knowledge-store"></a>演示 5 - 知识存储

[![演示 5](images/demo4.png)](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/videos/Demo5.mp4 "演示 5")

## <a name="summary"></a>摘要
在此练习中，我们通过在[上一练习](demo4.md)中创建的技能组浏览推送到知识存储中的数据。 此投影是以前执行的 `Create Skillset` PUT 请求中 `Skillset` 定义的一部分。 提交给服务的部分如下所示：

```json
"knowledgeStore": { 
  "storageConnectionString": "{{storageConnectionString}}", 
    "projections": [{ 
      "tables": [  
        { "tableName": "Invoices", "generatedKeyName": "InvoiceRef", "source": "/document/invoice" , "sourceContext": null, "inputs": []}, 
        { "tableName": "Company", "generatedKeyName": "CompanyRef", "source": "/document/invoice/company", "sourceContext": null, "inputs": []}, 
        { "tableName": "People", "generatedKeyName": "PersonRef", "source": "/document/invoice/person", "sourceContext": null, "inputs": []}, 
        { "tableName": "LineItems", "generatedKeyName": "LinteItemRef", "source": "/document/invoice/lineItems/*" ,"sourceContext": null, "inputs": []} 
      ]  
    }]
}
```
它使用 `storageConnectionString` 作为投影目标。 在这种情况下，它使用 Azure 存储表（属于我们的存储服务）来保存数据。

## <a name="what-to-do"></a>要执行的操作
剩下唯一要做的事情是了解索引器如何使用了该技能组将数据投影到知识存储中。 为此，可以使用 Microsoft [Azure 存储资源管理器](https://docs.microsoft.com/en-us/azure/vs-azure-tools-storage-explorer-blobs?WT.mc_id=msignitethetour2019-github-aiml10)：

![知识存储](images/knowledge_store.png "知识存储")
