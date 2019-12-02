## <a name="demo-5"></a>Demonstração 5

[![Demonstração 5](images/demo4.png)](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/videos/Demo5.mp4 "Demonstração 5")

## <a name="summary"></a>Resumo
Neste exercício, exploraremos os dados enviados por push para o repositório de conhecimento pelo conjunto de habilidades criado no [exercício anterior](demo4.md). Essa projeção era parte da definição de `Skillset` na solicitação PUT de `Create Skillset` executada anteriormente. A parte enviada para o serviço é a seguinte:

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
Ele usou `storageConnectionString` como o destino das projeções. Nesse caso, ele usa as tabelas do Armazenamento do Azure que fazem parte do nosso serviço de armazenamento a fim de salvar os dados.

## <a name="what-to-do"></a>O que fazer
Só o que resta a fazer é explorar como o indexador usou o conjunto de habilidades para projetar os dados em nosso repositório de conhecimento. Isso é possível com o [Gerenciador de Armazenamento do Microsoft Azure](https://docs.microsoft.com/en-us/azure/vs-azure-tools-storage-explorer-blobs?WT.mc_id=msignitethetour2019-github-aiml10):

![Repositório de conhecimento](images/knowledge_store.png "Repositório de Conhecimento")
