## <a name="demo-2---using-form-recognizer"></a>Demonstração 2 – Uso do Reconhecimento de Formulários

[![Demonstração 2](images/demo2.png)](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/videos/Demo2.mp4 "Demonstração 2")

## <a name="summary"></a>Resumo
Neste exercício, vamos aprender a usar o serviço Reconhecimento de Formulários. Supõe-se que uma conta de armazenamento tenha sido criada (como descrito na [primeira demonstração](demo1.md)).


## <a name="what-you-need"></a>Do que você precisa
- [Conjunto de treinamento de fatura](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/train.zip)

- Acesso à versão prévia de acesso limitado. Para obter acesso à versão prévia, preencha e envie o formulário [Solicitação de acesso ao Reconhecimento de Formulários](https://aka.ms/FormRecognizerRequestAccess).

- O [Postman](https://www.getpostman.com/) é usado para enviar solicitações para a API REST do serviço Reconhecimento de Formulários. Confira este [manual rápido](postman.md) para saber mais.

- O Reconhecimento de Formulários do Postman solicita uma [coleção](src/Collections/Form_Recognizer.postman_collection.json).

## <a name="azure-resources"></a>Recursos do Azure
Nesta demonstração, o único recurso com o qual trabalhamos é o serviço Reconhecimento de Formulários.


| Nome                       | Tipo                            | Finalidade                    |
| -------------------------- | ------------------------------- | ------------------------- |
| **ttinvoicereader**       | Serviço Reconhecimento de Formulários         | Eventualmente, esse serviço acabará no serviço Tudo-em-um. No momento, ele está em visualização de acesso limitado. Para obter acesso à versão prévia, preencha e envie o formulário [Solicitação de acesso ao Reconhecimento de Formulários](https://aka.ms/FormRecognizerRequestAccess).  |


## <a name="what-to-do"></a>O que fazer

Existem três etapas principais:
1. Carregar os dados de treinamento na conta de armazenamento
2. Criar o serviço Reconhecimento de Formulários
3. Treinar e usar o serviço Reconhecimento de Formulários

### <a name="upload-training-data"></a>Carregar dados de treinamento


1. Crie o contêiner `train` na conta de armazenamento criada na demonstração anterior.

[![Criar Contêiner](images/create_container.png)](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal?WT.mc_id=msignitethetour2019-github-aiml10 "Criar contêiner")

2. Baixe e descompacte o [conjunto de faturas para treinamento](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/train.zip).

3. Carregue o [conjunto de faturas para treinamento](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/data/train.zip) no contêiner `train`. Isso pode ser feito diretamente usando o [portal](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal?WT.mc_id=msignitethetour2019-github-aiml10#upload-a-block-blob) ou o [Gerenciador de Armazenamento do Azure ](https://docs.microsoft.com/en-us/azure/vs-azure-tools-storage-explorer-blobs?WT.mc_id=msignitethetour2019-github-aiml10) (como demonstrado neste [vídeo](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/videos/Demo2.mp4 "Demonstração 1")).

### <a name="create-form-recognizer-service"></a>Criar o serviço Reconhecimento de Formulários

Para isso, você deve ter acesso à versão prévia do Reconhecimento de Formulários. Para obter acesso à versão prévia, preencha e envie o formulário [Solicitação de acesso ao Reconhecimento de Formulários](https://aka.ms/FormRecognizerRequestAccess). 


[![Reconhecimento de Formulários](images/form_recognizer.png)](https://docs.microsoft.com/en-us/azure/cognitive-services/form-recognizer/overview?WT.mc_id=msignitethetour2019-github-aiml10#request-access "Reconhecimento de Formulários")

### <a name="train-the-form-recognizer-service"></a>Treinar o serviço Reconhecimento de Formulários

Esta seção usa o Postman e pressupõe que você saiba sobre como carregar coleções, manipular variáveis e configurar scripts de pré-solicitação. Para saber como fazer essas tarefas específicas, incluímos algumas [instruções](postman.md).

A tabela a seguir lista as variáveis definidas durante esta seção do exercício:

| Nome                       | Tipo                            | Finalidade                    |
| -------------------------- | ------------------------------- | ------------------------- |
| `Ocp-Apim-Subscription-Key`       | Autorização         | Chave para obter acesso ao serviço Reconhecimento de Formulários  |
| `endpoint`       | Variável         | Especifica o ponto de extremidade do Reconhecimento de Formulários  |
| `modelId`       | Variável         | Modelo atual do Reconhecimento de Formulários (definido na etapa 5)  |

1. Carregue a [coleção do Reconhecimento de Formulários](src/Collections/Form_Recognizer.postman_collection.json) no Postman.

2. Defina o cabeçalho de autorização `Ocp-Apim-Subscription-Key` e a variável `endpoint` para o serviço Reconhecimento de Formulários (eles podem ser encontrados no portal).

3. Abra a Solicitação `TrainModel` e altere o script de pré-solicitação para definir a variável `storageAccount` para a sua conta de armazenamento (no vídeo, a variável é `ttinvoicestorage`) e o `SASValue` para a Assinatura de Acesso Seguro apropriada para o contêiner `train`. Para saber como obter uma Assinatura de Acesso Seguro, confira nossa [breve explicação](sas.md).

```javascript
pm.environment.set('storageAccount', '<YOUR STORAGE ACCOUNT>')
pm.environment.set('container', 'train')
pm.environment.set('SASValue', '<SAS>')
```

4. Pressione Enviar na solicitação. Sua resposta deverá ser semelhante a esta:

![Resposta de treinamento](images/form_training.png "Resposta de treinamento")

5. Defina a variável `modelId` para a coleção para o `modelId` retornado indicado acima.


### <a name="use-the-form-recognizer-service"></a>Usar o serviço Reconhecimento de Formulários

1. Abra a solicitação `AnalyzeForm`. Na seção **Corpo**, clique no botão `Select Files` para escolher uma fatura baixada anteriormente. Depois de enviar a solicitação, você deverá obter algo semelhante a:

![Resposta de inferência](images/form_inference.png "Resposta de inferência")

# <a name="next-demo"></a>Próxima demonstração
Saiba como criar habilidades personalizadas de Leitor de Faturas com o Azure Functions na [Demonstração 3 – Criar uma Habilidade de Leitura Personalizada](demo3.md)