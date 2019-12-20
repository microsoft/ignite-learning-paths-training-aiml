## <a name="demo-5---knowledge-store"></a>Demostración 5: almacén de conocimiento

[![Demostración 5](images/demo4.png)](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/videos/Demo5.mp4 "Demostración 5")

## <a name="summary"></a>Resumen
En este ejercicio exploraremos los datos insertados en el almacén de conocimiento por el conjunto de aptitudes creado en el [ejercicio anterior](demo4.md). Esta proyección formaba parte de la definición de `Skillset` en la solicitud de PUT de `Create Skillset` ejecutada anteriormente. La parte de lo que se envió al servicio es la siguiente:

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
Esta usaba `storageConnectionString` como destino de las proyecciones. En este caso, usa las tablas de Azure Storage que forman parte de nuestro servicio de almacenamiento para guardar los datos.

## <a name="what-to-do"></a>Lo que debe hacer
Lo único que queda por hacer es explorar de qué forma el indexador usó las habilidades para proyectar los datos en el almacén de información. Esto se puede hacer usando el [Explorador de Microsoft Azure Storage](https://docs.microsoft.com/en-us/azure/vs-azure-tools-storage-explorer-blobs?WT.mc_id=msignitethetour2019-github-aiml10):

![Almacén de conocimiento](images/knowledge_store.png "Almacén de conocimiento")
