## <a name="demo-4---tying-it-all-together"></a>Demostración 4: Unión de todos los elementos

[![Demostración 4](images/demo4.png)](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/videos/Demo4.mp4 "Demostración 4")

## <a name="summary"></a>Resumen
En este ejercicio se asocian todos los recursos para crear un índice, un conjunto de aptitudes, un origen de datos y un indizador dentro de Azure Cognitive Search para extraer los datos de factura de nuestra colección de archivos PDF. Se supone que todos los recursos y servicios de los ejercicios anteriores se han creado y configurado correctamente.


## <a name="what-you-need"></a>Qué se necesita
- [Conjunto de datos de facturas](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/invoices_1000.zip) (se trata de un conjunto más pequeño de 1000 facturas para ejecutar el servicio y probar la funcionalidad).


- [Postman](https://www.getpostman.com/) se utiliza para enviar solicitudes a la API de REST del servicio Form Recognizer. Consulte este [manual básico breve](postman.md) para obtener más información.

- [Colección de solicitudes de búsqueda de facturas](src/Collections/Invoice_Search.postman_collection.json) de Postman.

## <a name="what-to-do"></a>Qué debe hacer

Los pasos principales son tres:
1. Carga de las facturas en la cuenta de almacenamiento
2. Preparación del índice de Azure Search, el conjunto de aptitudes, el origen de datos y el indizador
3. Supervisión y uso de índices

### <a name="upload-invoice-data"></a>Carga de datos de factura


1. Cree un contenedor denominado `invoices` en la cuenta de almacenamiento que creó en la primera demostración.

[![Creación de un contenedor](images/create_container.png)](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal?WT.mc_id=msignitethetour2019-github-aiml10 "Creación de un contenedor")

2. Descargue y descomprima el [conjunto de datos de facturas](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/invoices_1000.zip).

3. Cargue el [conjunto de datos de facturas](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/invoices_1000.zip) descomprimido en el contenedor `invoices`. Puede realizarlo directamente mediante el [portal](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal?WT.mc_id=msignitethetour2019-github-aiml10#upload-a-block-blob) o mediante el [Explorador de Azure Storage](https://docs.microsoft.com/en-us/azure/vs-azure-tools-storage-explorer-blobs?WT.mc_id=msignitethetour2019-github-aiml10).

### <a name="prepare-azure-search"></a>Preparación de Azure Search

En esta sección se usa Postman y se supone que conoce los conceptos relativos a la carga de colecciones, el control de variables y el establecimiento de scripts previos a la solicitud. Para obtener información sobre cómo realizar estas tareas específicas, hemos incluido algunas [instrucciones](postman.md).

| Nombre                       | Tipo                            | Propósito                    |
| -------------------------- | ------------------------------- | ------------------------- |
| `api-key`       | Autorización         | Clave para el acceso a Azure Search  |
| `search_service`       | Variable         | Dirección URL del servicio de búsqueda (sin el protocolo o las barras diagonales)  |
| `index_name`       | Variable         | Nombre del índice deseado  |
| `storageConnectionString`       | Variable         | Cadena de conexión a la cuenta de almacenamiento que contiene las facturas  |
| `cog_svcs_key`       | Variable         | Clave para la instancia todo en uno de Cognitive Services usada en la [demostración 1](demo1.md)  |

1. Cargue en Postman la [colección de solicitudes de búsqueda de facturas](src/Collections/Invoice_Search.postman_collection.json).

2. Establezca todas las variables como se describe en la tabla anterior. Cada uno de estos valores (con la excepción de `index_name`) se puede encontrar en el correspondiente servicio en el portal. Puede elegir cualquier `index_name`.

3. Abra y ejecute la solicitud `Create Index` mediante el botón Enviar. De esta forma se crea el índice donde se almacenan los datos de la factura. Cuando se haya completado correctamente la solicitud, debería ver los cambios reflejados en el servicio de Azure Search en el portal:

![Índice](images/index.png "Índice")

4. Abra y ejecute la solicitud `Create Skillset` mediante el botón Enviar. De esta forma se crea el conjunto de aptitudes personalizado que el indizador usará para extraer los datos de la factura. Este conjunto de aptitudes determinado solo tiene una única aptitud (nuestro elemento `InvoiceReaderSkill` personalizado). Como se indicó anteriormente, si la solicitud se completa correctamente, debería ver el nuevo conjunto de aptitudes reflejado en el portal.

5. Abra y ejecute la solicitud `Create Datasource` mediante el botón Enviar. De esta forma se crea una referencia a la cuenta de almacenamiento donde se encuentran las facturas. Como se indicó anteriormente, si la solicitud se completa correctamente, debería ver el nuevo conjunto de aptitudes reflejado en el portal.

6. Abra y ejecute la solicitud `Create Indexer` mediante el botón Enviar. De esta forma se crea el indizador que extrae las facturas de `Datasource`, usa `Skillset` en cada factura y almacena los datos en el elemento `Index` real. Como se indicó anteriormente, si la solicitud se completa correctamente, debería ver el nuevo conjunto de aptitudes reflejado en el portal.


### <a name="monitor-and-use-index"></a>Supervisión y uso de índices
El indizador tardará algún tiempo en pasar por todos los documentos de la factura. Esto se puede supervisar en el mismo servicio Search. También puede supervisar las llamadas a `InvoiceReaderSkill` examinando la secuencia de métricas en directo en el servicio de Application Insights correspondiente asociado a la función de Azure. Una vez que haya algunos documentos en el índice, puede ejecutar consultas para comprobar que funciona:

![Consultas de Azure Search](images/queries.png "Consultas de Azure Search")

**Algunas consultas curiosas que puede ejecutar**:

Pedidos con ItemId 49
```
*&$filter=invoice/lineItems/any(lineItems: lineItems/itemId eq 49)
```

invoiceID es 12179
```
*&$filter=invoice/invoiceId eq 12179
```

empresas en Australia
```
*&$filter=invoice/company/country eq 'Australia'
```

empresas del Reino Unido (con un recuento)
```
*&$count=true&$filter=invoice/company/country eq 'United Kingdom'
```

solo recuperar facturas
```
*&$select=invoice&$count=true
```

personas en Alemania
```
*&$count=true&$select=invoice/person&$filter=invoice/person/country eq 'Germany'
```

# <a name="next-demo"></a>Siguiente demostración
Prosiga con la [Demostración 5: Almacén de conocimiento](demo5.md) para aprender a explorar el almacén de conocimiento.