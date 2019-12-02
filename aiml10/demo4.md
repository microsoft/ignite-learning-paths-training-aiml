## <a name="demo-4---tying-it-all-together"></a>Etapa 4 – Reunir tudo

[![Demonstração 4](images/demo4.png)](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/videos/Demo4.mp4 "Demonstração 4")

## <a name="summary"></a>Resumo
Neste exercício, reunimos todos os recursos para criar um índice, o conjunto de qualificações, a fonte de dados e o indexador dentro do Azure Cognitive Search para extrair dados de faturas da nosso coleção de arquivos PDF. Supõe-se que todos os recursos e serviços dos exercícios anteriores foram criados e configurados corretamente.


## <a name="what-you-need"></a>Do que você precisa
- [Conjunto de Dados da Fatura](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/invoices_1000.zip) (trata-se de um conjunto menor de 1.000 faturas para executar o serviço e testar a funcionalidade)


- O [Postman](https://www.getpostman.com/) é usado para enviar solicitações para a API REST do serviço Reconhecimento de Formulários. Confira este [manual rápido](postman.md) para saber mais.

- A [coleção de Solicitações de Pesquisa de Faturas](src/Collections/Invoice_Search.postman_collection.json) do Postman.

## <a name="what-to-do"></a>O que fazer

Existem três etapas principais:
1. Carregar as faturas na conta de armazenamento
2. Preparar o Índice, o Conjunto de habilidades, a Fonte de Dados e o Indexador do Azure Search
3. Monitorar e usar o Índice

### <a name="upload-invoice-data"></a>Carregar os Dados da Fatura


1. Crie o contêiner `invoices` na conta de armazenamento criada na primeira demonstração.

[![Criar Contêiner](images/create_container.png)](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal?WT.mc_id=msignitethetour2019-github-aiml10 "Criar contêiner")

2. Baixe e descompacte o [conjunto de dados de faturas](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/invoices_1000.zip).

3. Carregue o [conjunto de dados de faturas](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/invoices_1000.zip) descompactado no contêiner `invoices`. Isso pode ser feito diretamente usando o [portal](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal?WT.mc_id=msignitethetour2019-github-aiml10#upload-a-block-blob) ou o [Gerenciador de Armazenamento do Azure ](https://docs.microsoft.com/en-us/azure/vs-azure-tools-storage-explorer-blobs?WT.mc_id=msignitethetour2019-github-aiml10).

### <a name="prepare-azure-search"></a>Preparar o Azure Search

Esta seção usa o Postman e pressupõe que você saiba como carregar coleções, manipular variáveis e configurar scripts de pré-solicitação. Para saber como fazer essas tarefas específicas, incluímos algumas [instruções](postman.md).

| Nome                       | Tipo                            | Finalidade                    |
| -------------------------- | ------------------------------- | ------------------------- |
| `api-key`       | Autorização         | Chave para acesso ao Azure Search  |
| `search_service`       | Variável         | URL do serviço de pesquisa (sem protocolo ou barras)  |
| `index_name`       | Variável         | Nome do índice desejado  |
| `storageConnectionString`       | Variável         | Cadeia de conexão para a conta de armazenamento que contém faturas  |
| `cog_svcs_key`       | Variável         | Chave para os Serviços Cognitivos Tudo-em-um usados na [Demonstração 1](demo1.md)  |

1. Carregue a [coleção de Solicitações de Pesquisa de Faturas](src/Collections/Invoice_Search.postman_collection.json) do Postman.

2. Defina todas as variáveis como descrito na tabela acima. Cada um desses valores (com exceção do `index_name`) pode ser encontrado no respectivo serviço no portal. Você pode escolher qualquer `index_name` que desejar.

3. Abra e execute a solicitação `Create Index` (usando o botão Enviar). Isso cria o índice em que os dados da nota fiscal são armazenados. Depois que a solicitação for concluída com êxito, você deve ver as alterações refletidas no serviço Azure Search no portal:

![Índice](images/index.png "Índice")

4. Abra e execute a solicitação `Create Skillset` (usando o botão Enviar). Isso cria nosso conjunto de habilidades personalizado que o indexador usará para extrair os dados das faturas. Esse determinado conjunto de habilidades tem uma única habilidade (nossa `InvoiceReaderSkill` personalizada). Como acima, se a solicitação for concluída com êxito, você deve ver o novo conjunto de habilidades refletido no Portal.

5. Abra e execute a solicitação `Create Datasource` (usando o botão Enviar). Isso cria uma referência à nossa conta de armazenamento na qual estão as notas fiscais. Como acima, se a solicitação for concluída com êxito, você deve ver o novo conjunto de habilidades refletido no Portal.

6. Abra e execute a solicitação `Create Indexer` (usando o botão Enviar). Isso cria o indexador que efetua pull das notas fiscais do `Datasource`, usa o `Skillset` em cada fatura e armazena os dados no `Index` real. Como acima, se a solicitação for concluída com êxito, você deve ver o novo conjunto de habilidades refletido no Portal.


### <a name="monitor-and-use-index"></a>Monitorar e Usar o Índice
O indexador leva algum tempo para passar por todos os documentos de faturas. Isso pode ser monitorado no próprio Serviço de Pesquisa. Você também pode monitorar as chamadas para o `InvoiceReaderSkill` examinando o fluxo de métricas ao vivo no serviço App Insights correspondente que está anexado à função do Azure. Quando houver alguns documentos no índice, você poderá executar consultas para verificar se ele está funcionando:

![Consultas do Azure Search](images/queries.png "Consultas do Azure Search")

**Algumas consultas divertidas a executar**:

Pedidos com ItemId 49
```
*&$filter=invoice/lineItems/any(lineItems: lineItems/itemId eq 49)
```

a invoiceId é 12179
```
*&$filter=invoice/invoiceId eq 12179
```

empresas na Austrália
```
*&$filter=invoice/company/country eq 'Australia'
```

empresas no Reino Unido (com uma contagem)
```
*&$count=true&$filter=invoice/company/country eq 'United Kingdom'
```

recuperar somente faturas
```
*&$select=invoice&$count=true
```

pessoas na Alemanha
```
*&$count=true&$select=invoice/person&$filter=invoice/person/country eq 'Germany'
```

# <a name="next-demo"></a>Próxima demonstração
Saiba como explorar o repositório de conhecimento em [Demonstração 5 – Repositório de Conhecimento](demo5.md)