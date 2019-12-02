# <a name="aiml30--start-building-machine-learning-models-faster-than-you-think--train-the-trainer"></a>AIML30 – Comece a criar modelos de Machine Learning mais rápido do que você imagina – Treinar o instrutor

O Tailwind Traders usa modelos de aprendizado de máquina personalizados para corrigir seus problemas de inventário, sem alterar o ciclo de vida de desenvolvimento de software. Como? Interface visual do Azure Machine Learning.
 
Nesta sessão, você aprenderá o processo de ciência de dados que a Tailwind Traders usa e verá a introdução à interface visual do Azure Machine Learning. Você verá como localizar, importar e preparar dados, selecionar um algoritmo de aprendizado de máquina, treinar, testar e implantar um modelo completo em uma API. Receba dicas, práticas recomendadas e recursos que você e sua equipe de desenvolvimento precisam para continuar sua jornada de aprendizado de máquina, criar seu primeiro modelo e muito mais.


## <a name="demo-environment-deployment"></a>Implantação do ambiente de demonstração
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>


## <a name="create-additional-resources-needed"></a>Criar os recursos adicionais necessários
Depois de criar a base do espaço de trabalho do serviço de Azure Machine Learning, precisamos adicionar recursos adicionais de computação.
### <a name="create-compute-targets"></a>Criar Destinos de Computação
1. Criar Computação do Machine Learning
    * Clique no nav "Computação"
    * Clique em "Novo"
    * Insira um nome para o recurso
    * Selecione na lista suspensa "Computação do Machine Learning"
    * Selecione o tamanho da máquina
    * Insira os nós mínimo e máximo (recomendável mín. de 0 e máx. de 5)
    * Clique em "Criar" ![Criar Computação](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif)
2. Criar Computação de Kubernetes
    * Clique no nav "Computação"
    * Clique em "Novo"
    * Insira um nome para o recurso
    * Selecione na lista suspensa "Serviço do Kubernetes"
    * Clique em "Criar" ![Criar Kubernetes](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif)


## <a name="build-model-with-azure-machine-learning-visual-designer"></a>Criar modelo com o designer visual do Azure Machine Learning

### <a name="1-upload-the-dataset-to-the-datasets-in-aml"></a>1. Carregar o conjunto de dados nos Conjuntos de dados em AML
* Baixe [aqui](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv) o conjunto de dados para o local
* Clique em `Datasets`
* Clique em `Create from local`
* Preencher o formulário e carregar o conjunto de dados

### <a name="2-start-building-the--model"></a>2. Iniciar criação de modelo

* Clique em `Visual Interface` na barra de navegação à esquerda
* Clique em `Launch Visual Interface`
* Clique em `New` no canto inferior esquerdo
* Clique em `Blank Experiment`
* Expandir `Datasets` e `My Datasets`
* Arraste e solte o conjunto de dados carregado no espaço de trabalho do experimento
* Arraste `Select Columns in Dataset` para o espaço de trabalho
    * Clique em `Edit columns` no menu Propriedades no lado direito.
    * Clique em `All Columns`
    * Clique em `Exclude`
    * Clique em `column names`
    * Exclua a coluna `Time`
    * Exclua `DatesInWeek`
    * OBSERVAÇÃO: opcionalmente, exclua essas colunas no recurso de edição de dados durante o carregamento do conjunto de dados no espaço de trabalho nas etapas de preparação dos dados para carregamento.
* Arraste `Split Data` para o espaço de trabalho
    * Edite as propriedades para dividir os dados em 70/30. 
    * Explique que isso não é uma regra e a base pode ser alterada com base nas diferentes necessidades do modelo.
* Arraste `Train Model` para o espaço de trabalho
    * Selecione o nome da coluna de rótulo `Values` nas propriedades à direita
* Arraste `Boosted Decision Tree Regression` para o espaço de trabalho
* Arraste `Score Model` para o espaço de trabalho
* Arraste `Evaluate` para o espaço de trabalho
* Conecte o módulo `Split Data` ao `Train Model` para os dados de treinamento e ao `Score Model` para pontuar os resultados previstos com dados não vistos.
* Conecte `Train Model` ao módulo `Boosted Decision Tree Regression` do algoritmo de treinamento.
* Conecte `Score Model` ao módulo `Evaluate`.
* Clique no botão `Run` na barra de navegação inferior e selecione calcular. 

* Arraste o módulo `Execute Python Script` para o espaço de trabalho e conecte o módulo `Score Model` a ele. 
* Copie e cole este código em:
    * `import pandas as pd` </br>
       `import numpy as np` </br>
        `def azureml_main(dataframe1 = None, dataframe2 = None):` </br>
            `print(f'Input pandas.DataFrame #1: {dataframe1}')`</br>
            `df = dataframe1`</br>
            `df['Value'] = np.exp(df['Value'])`</br>
            `df['Forecast'] = np.exp(df['Scored Labels'])`</br>
            `return df`
* Arraste `Select Columns in Dataset`
* Selecione as colunas `ID1`, `ID2`, `Value` e `Forecast`
* Essas são as colunas que o aplicativo de demonstração de dados esperará ao publicarmos para obter um resultado do modelo concluído e implantado.
* Execute o treinamento

### <a name="4-create-predictive-experiment-and-deploy-the-model"></a>4. Criar o experimento de previsão e implantar o modelo

* Clique em experimento de previsão de `Create`. Considere o modelo `Predictive Experiment` como o modelo de produção que será implantado no serviço Web. O `Training Experiment` como o modelo de desenvolvimento.
* Adicione os módulos `Execute Python Script` e `Select Columns in Dataset` ao experimento de previsão criado.
* Execute o experimento
* Clique em `Deploy Web Service`
* Navegue até o serviço Web implantado na barra de navegação à esquerda.
* Clique no nome do serviço Web criado.
* Clique em `Test` e veja como ele é executado em um item de dados com pontuação.
* Clique em `Consume` e mostre o código de exemplo fornecido para a integração do serviço Web.

### <a name="5-testing-api-with-c-console-app-dotnet-core"></a>5. Teste da API com o aplicativo de console C# (núcleo dotnet)

1. [Baixe aqui o VS Code](https://code.visualstudio.com/download)
2. Clone o aplicativo com o seguinte comando
    * `git clone https://github.com/microsoft/ignite-learning-paths.git`
3. Navegue até o caminho do projeto
    * `cd ignite-learning-paths\aiml\aiml30\C#\IgniteAimlDataApp`
4. Abra o projeto no VS Code
    * `code .`
5. Substitua o conjunto de dados local pelo conjunto de dados baixado na etapa acima na pasta `IgniteAimlDataApp/Datasets`.
6. Para executar o teste
    * Copie a chave de API da guia `Consume`
    * Abra o `App.config` e cole-o no atributo value
    * Copie o `Request-Response Url` da guia `Consume`
    * Abra o `Program.cs` e cole o valor em `client.BaseAddress = new Uri("");`
    * Clique com o botão direito do mouse em `Program.cs` e selecione `Open in Terminal`
    * Digite o comando `dotnet run` para executar o aplicativo de console
    * Para usar os valores padrão de StoreID (ID1), que é 2, e de ItemID (ID2), que é 1, e o número de semanas a prever. Apenas digite `y`
    * Isso será executado e deverá retornar os valores previstos para as próximas 4 semanas.

## <a name="delivery-assets"></a>Ativos de entrega

O ativo a seguir pode ser usado para entrega nesta conversa:

- [Área do PowerPoint](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/AIML30_How%20to%20Build%20Machine%20Learning%20Models.pptx)
- [Vídeos de demonstração](https://www.youtube.com/watch?v=u1ppYaZuNmo&feature=youtu.be)

## <a name="resources-and-continue-learning"></a>Recursos e continuar aprendendo

Aqui está uma lista de documentações e treinamentos relacionados.

- [O que é a interface visual do Azure Machine Learning?](https://docs.microsoft.com/en-us/azure/machine-learning/service/ui-concept-visual-interface?WT.mc_id=msignitethetour-slides-cxa)
- [Publicar um experimento de aprendizado de máquina com o Microsoft Azure Machine Learning](https://docs.microsoft.com/en-us/learn/paths/publish-experiment-with-ml-studio/)


## <a name="feedback-loop"></a>Loop de comentários

Tem um comentário, feedback ou sugestão? Atualmente, a melhor forma de criar um ciclo de comentários para alterações/sugestões/feedback de conteúdo é abrindo um novo problema neste repositório GitHub. Para obter todos os detalhes sobre como criar um problema, consulte os documentos sobre [Contribuição](../../contributing.md)
