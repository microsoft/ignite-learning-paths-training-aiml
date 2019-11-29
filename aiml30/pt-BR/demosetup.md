# <a name="demo-setup"></a>Configuração de demonstração
Siga as etapas abaixo para preparar seu ambiente para a demonstração ao vivo. Depois de concluir essa configuração, siga o [guia de demonstração](demoguide.md).

## <a name="create-azure-machine-learninge-resources-with-the-deploy-to-azure-button-below"></a>Criar Recursos do Azure Machine Learning com o botão Implantar no Azure abaixo
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>

> Depois de criado, atualize seu recurso do Azure Machine Learning para a edição enterprise desta sessão. Você deve ver um botão "Atualizar" para concluir essa ação. No momento, isso está em versão prévia, no entanto, a estrutura de preços é descrita [aqui](https://azure.microsoft.com/en-us/pricing/details/machine-learning/)

## <a name="create-additional-resources-needed"></a>Criar os recursos adicionais necessários

* Selecione **"Iniciar o novo estúdio do Azure Machine Learning"**

Depois de criar Serviço do Azure Machine Learning básico, precisamos adicionar recursos de computação.
### <a name="create-compute-targets"></a>Criar Destinos de Computação
1. Criar Computação do Machine Learning
    * Clique no nav "Computação"
    * Selecione "Clusters de treinamento"
    * Clique em "Novo"
    * Insira um nome para o recurso
    * Selecione o tamanho da máquina (por exemplo: Standard_DS2_v2)
    * Insira os nós mínimo e máximo (recomendável mín. de 0 e máx. de 5)
    * Clique em "Criar" ![Criar computação](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif)
2. Criar Computação de Kubernetes
    * Clique no nav "Computação"
    * Selecione "Clusters de inferência"
    * Clique em "Novo"
    * Insira um nome para o recurso
    * Selecione uma região
    * Mantenha "Tamanho da máquina virtual" como padrão
    * Finalidade do cluster definida como "Dev-test"
    * Clique em "Criar" ![Criar Kubernetes](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif)
3. Criar máquina virtual do notebook
    * Clique no NAV "Computação"
    * Selecione " VMs do Notebook"
    * Clique em "Novo"
    * Dê um nome exclusivo ao notebook
    * Selecione o tamanho da VM
    * Clique em "Criar" ![Criar VM](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif)


## <a name="upload-dataset-to-workspace-blob-storage-and-save-to-local"></a>Carregar conjunto de dados no Armazenamento de Blobs do workspace e salvar no local
O conjunto de dados necessário é criado semanalmente com datas atualizadas para permitir que sua demonstração faça a previsão das semanas futuras. A seguir estão as etapas para obter o novo conjunto de dados e adicioná-lo à conta de Armazenamento do Azure Machine Learning e ao aplicativo de dado de demonstração.

1. [Baixe o conjunto de dados para o local](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv)
2. Abra o Gerenciador de Armazenamento do Azure – [Baixe aqui](https://azure.microsoft.com/en-us/features/storage-explorer/).
3. Navegar para `azureml-blobstore-<guid>`
4. Crie uma nova pasta chamada `datasets`
5. Carregue o conjunto de dados
6. Substitua o arquivo local ForecastingData.csv no aplicativo de demonstração C# para que ele faça a previsão das datas futuras. Há um csv padrão, mas ele não tem os dados atualizados.

## <a name="get-the-c-demo-app"></a>Obter o aplicativo de demonstração C#
A primeira demonstração é com VS Code e o C# IgniteAimlDataApp. Isso é para demonstrar como fazer o processamento de dados e realçar que ele pode ser feito em qualquer linguagem.

1. [Baixe aqui o VS Code](https://code.visualstudio.com/download)
2. Verifique se o [SDK do .NET Core 2.1.0](https://dotnet.microsoft.com/download/dotnet-core/2.1) está instalado em seu local
2. Clone o aplicativo com o seguinte comando
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
3. Navegue até o caminho do projeto
    * `cd ignite-learning-paths-training-aiml/aiml30/C#/IgniteAimlDataApp/IgniteAimlDataApp`
4. Abra o projeto no VS Code
    * `code .`
5. Substitua o conjunto de dados local com o conjunto de dados baixado na etapa acima na pasta `IgniteAimlDataApp/Datasets`.
6. Para executar o aplicativo
    * Clique com o botão direito do mouse em `Program.cs` e selecione `Open in Terminal`
    * Execute o comando `dotnet run` Nota para usuários de Mac: se receberem um erro informando que o programa não consegue encontrar o arquivo importado, alterem a linha 14 em Program.css     para incluir barras: `string sourceFile = $"{Environment.CurrentDirectory}//Datasets//{fileName}.csv";`
    * Ele fará uma pergunta `Would you like to run the default params`; digite `y`
    * Isso tentará atingir a API, mas falhará, pois ela ainda não foi criada.

## <a name="run-through-the-live-demo"></a>Executar a demonstração ao vivo
Faça uma execução completa da demonstração ao vivo para ter um modelo de backup concluído para abrir e mostrar o resultado final.

#### <a name="there-will-not-be-enough-time-to-run-the-model-during-the-live-demo-make-sure-to-build-the-model-_without_-running-it-in-the-live-session-once-you-have-added-all-the-modules-to-the-experiment-workspace-then-navigate-to-the-model-you-created-and-trained-prior-to-the-session"></a>Não haverá tempo suficiente para executar o modelo durante a demonstração ao vivo. Crie o modelo _sem_ executá-lo na sessão ao vivo. Depois de adicionar todos os módulos ao workspace do experimento, navegue até o modelo criado e treinado antes da sessão.

[Próximo – Etapas da demonstração ao vivo](demoguide.md)
