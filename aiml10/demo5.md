## <a name="demo-5---knowledge-store"></a>데모 5 - 지식 저장소

[![데모 5](images/demo4.png)](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/videos/Demo5.mp4 "데모 5")

## <a name="summary"></a>요약
이 연습에서는 [이전 연습](demo4.md)에서 만든 기술 세트를 통해 지식 저장소로 푸시된 데이터를 살펴봅니다. 이 프로젝션은 이전에 실행된 `Create Skillset` PUT 요청의 `Skillset` 정의에 포함되어 있습니다. 서비스에 제출된 부분은 다음과 같습니다.

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
프로젝션의 대상으로 `storageConnectionString`을 사용했습니다. 이 경우 데이터를 저장하기 위해 스토리지 서비스의 일부인 Azure Storage 테이블을 사용합니다.

## <a name="what-to-do"></a>수행할 작업
남은 작업은 인덱서가 기술 세트를 사용하여 데이터를 지식 저장소에 프로젝션하는 방법을 알아보는 것입니다. 이 작업은 Microsoft [Azure Storage Explorer](https://docs.microsoft.com/en-us/azure/vs-azure-tools-storage-explorer-blobs?WT.mc_id=msignitethetour2019-github-aiml10)를 사용하여 수행할 수 있습니다.

![지식 저장소](images/knowledge_store.png "지식 저장소")
