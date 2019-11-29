# <a name="demo-guide"></a>Guia da demonstração
Verifique se você concluiu as [etapas de configuração da demonstração](demosetup.md)

# <a name="demo-1-data-prep-demo-with-app"></a>Demonstração 1: demonstração de preparação de dados com o aplicativo
Na primeira demonstração, realce a preparação de dados discutida nos slides dos modelos da Série Temporal. Percorra esse passo a passo instrutivo no aplicativo da demonstração de C#. Deixe claro que isso pode ser feito em qualquer idioma.

Para navegar pelo código com os atalhos `F12` e `CTRL-`, baixe a [Extensão de Atalho do Visual Studio para VS Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vs-keybindings). Isso é muito útil porque você não precisa ficar procurando o que precisa.

### <a name="data-prep-demo-video-herehttpsyoutubeu1ppyazunmot751"></a>Vídeo de demonstração da [preparação de dados](https://youtu.be/u1ppYaZuNmo?t=751)

### <a name="1-open-the-igniteaimldataapp-app-i-personally-like-to-have-this-open-before-i-start-the-talk-so-i-can-just-flip-to-it"></a>1. Abra o aplicativo `IgniteAimlDataApp`. Admito que eu prefiro deixá-lo aberto antes de iniciar a palestra, assim posso simplesmente virá-lo.
* Abra o arquivo `Program.cs`
* Vá para o método `GetProcessedDataForScore` clicando com o botão direito do mouse e selecione `Go To Definition` ou `F12`
    * Carregue os dados da fonte. Neste exemplo, estamos carregando para um arquivo local do Excel na solução.
* Método `F12` para `AddWeeksToPredict` e lógica de discussão.
    * Obter a data mais recente e adicionar quatro semanas futuras a partir dessa data
    * Como os dados são semanais e queremos saber se um feriado ocorreu durante a semana, calculamos todas as datas que ocorreram na semana e preenchemos a coleção `DatesInWeek`
    * Em seguida, criamos as futuras horas para as 4 semanas futuras adicionadas à coleção.
* Método `F12` para `CreateTimeFeatures` a partir da lógica `AddWeeksToPredict` e da lógica de discussão.
    * Use a propriedade hora atual para calcular os recursos necessários de horas e feriados.
* `CTRL-` para retornar a `AddWeeksToPredict`
* De `F12` a `CreateFourierFeatures`
    * Calcule os recursos dos termos da série de Fourier a partir da sazonalidade de 52 dos recursos de dados semanais. 
* `CTRL-` para retornar a `GetProcessedDataForScore`
* Método `F12` para `CreateLagFeatures` e lógica de discussão.
    * Adicione os valores de vendas das 26 semanas anteriores à linha atual.
* `CTRL-` para retornar a `GetProcessedDataForScore`

* Opções de backup da demonstração de dados
    * Use o vídeo MP4 incorporado no slide oculto. Fale acompanhando esse vídeo sem som.
    * Comece no slide 21 e mostre o código de preparação de dados em etapas de slides estáticos.

# <a name="demo-2-build-model-with-azure-machine-learning-visual-designer"></a>Demonstração 2: Criar modelo com o Designer Visual do Azure Machine Learning

### <a name="full-model-building-live-demo-video-herehttpsyoutubeu1ppyazunmot1278"></a>Vídeo completo da demonstração da criação de modelo ao vivo [aqui](https://youtu.be/u1ppYaZuNmo?t=1278)

### <a name="1-create-resource-and-upload-dataset"></a>1. Criar recurso e carregar conjunto de conjuntos

* Crie o Recurso Workspace do Azure Machine Learning e navegue até o novo Workspace.
    * Examine o alto nível em que as diferentes ferramentas são discutidas nos slides.
    * Recursos de vídeo para esta etapa:
        * [Aqui](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateAMLNavToWorkspace.mp4) está o vídeo desta etapa sem som.
        * [Aqui](https://youtu.be/u1ppYaZuNmo?t=1278) está o vídeo de como criar o recurso com áudio.
* Carregar o conjunto de dados nos Conjuntos de Dados do AML
    * Clique em `Datasets`
    * Clique em `Create from datastore`
        * OBSERVAÇÃO: você já deve ter carregado um conjunto no armazenamento de dados nas etapas da configuração da demonstração.
    * Preencha os campos obrigatórios e selecione a opção `workspaceblobstorage`
    * Clique em `Create`
    * Opcional: acompanhe as etapas do recurso de preparação de dados no carregamento de conjuntos de dados para o AML

### <a name="2-launch-designer-and-explain-tool-features"></a>2. Iniciar o Designer e explicar os recursos da ferramenta

* No estúdio, selecione "Designer" na barra de navegação esquerda
* Resuma os diferentes módulos na barra de navegação à esquerda, incluindo os conjuntos de dados de teste.

### <a name="3-start-building-the--model"></a>3. Iniciar a criação do modelo

* Arraste e solte o conjunto de dados no workspace do experimento
    * Observe o módulo de carregamento de arquivo como uma opção para obter dados no workspace
* Arraste `Select Columns in Dataset` para o workspace
    * Clique em `Edit columns` no menu Propriedades no lado direito.
    * Clique em `All Columns`
    * Clique em `Exclude`
    * Clique em `column names`
    * Exclua a coluna `Time`
    * Exclua `DatesInWeek`
    * OBSERVAÇÃO: opcionalmente, exclua essas colunas no recurso de edição de dados durante o carregamento do conjunto de dados no workspace nas etapas de preparação dos dados para carregamento.
* Arraste `Split Data` para o workspace
    * Edite as propriedades para dividir os dados em 70/30. 
    * Explique que isso não é uma regra e a base pode ser alterada com base nas diferentes necessidades do modelo.
* Arraste `Train Model` para o workspace
    * Selecione o nome da coluna de rótulo `Value` nas propriedades à direita
* Arraste `Boosted Decision Tree Regression` para o workspace
* Arraste `Score Model` para o workspace
* Arraste `Evaluate` para o workspace
* Conecte o módulo `Split Data` ao `Train Model` para os dados de treinamento e ao `Score Model` para pontuar os resultados previstos com dados não vistos.
* Conecte `Train Model` ao módulo `Boosted Decision Tree Regression` do algoritmo de treinamento.
* Conecte `Score Model` ao módulo `Evaluate`.
* Normalmente é aqui que você executaria o modelo, _no entanto_, sua execução na demonstração leva muito tempo. Discuta como você clicaria no botão `Run` na barra de navegação inferior e selecione Calcular. Em seguida, falaremos sobre como criar recursos de computação no AML.

* Essas próximas etapas farão parte do modelo concluído, mas não será necessário criá-las na versão de demonstração ao vivo que não será apresentada.
    * Arraste o módulo `Execute Python Script` para o workspace e conecte o módulo `Score Model` a ele. 
    * Copie e cole este código em:
    
    
    ```python 
    import pandas as pd
    import numpy as np

    def azureml_main(dataframe1 = None, dataframe2 = None):
      print(f'Input pandas.DataFrame #1: {dataframe1}')
      df = dataframe1
      df['Value'] = np.exp(df['Value'])
      df['Forecast'] = np.exp(df['Scored Labels'])
      return df
    ```
      
    * Arraste `Select Columns in Dataset`
        * Selecione as colunas `ID1`, `ID2`, `Value` e `Forecast`
        * Essas são as colunas que o aplicativo de demonstração de dados esperará ao publicarmos para obter um resultado do modelo concluído e implantado.
### <a name="4-discuss-compute-target-creation"></a>4. Discutir a criação de destino de computação
* Volte para o AML
* Clique no item de navegação `Compute`
* Clique em `Add`
* Discuta os diferentes tipos de computação e para que são usados. As computações usadas nesta demonstração são de `Machine Learning Compute` para treinamento e de `Kubernetes Service` para implantar a API.

### <a name="5-explain-trained-model"></a>5. Explicar o modelo de treinamento
* Volte para o Designer Visual
* Clique com o botão direito do mouse no segundo módulo do modelo para visualizar os dados (provavelmente `Select Columns in Dataset`)
* Percorra rapidamente os dados para verificar sua aparência.
* Clique em uma coluna e mostre como a ferramenta cria visualizações no painel direito.
* Visualize o módulo `Score Model` para mostrar como o modelo é previsto nos dados não vistos
* Visualize o módulo `Evaluate Model` e discuta as métricas usadas na pontuação.
    * Clique em `More Help` no painel direito das propriedades.
    * Realce que cada módulo tem um link para os documentos nas propriedades que explica o que o módulo está fazendo.
    * Role para baixo e mostre as explicações de métricas na documentação do modelo.
### <a name="6-create-predictive-experiment-and-deploy-the-model"></a>6. Criar o experimento de previsão e implantar o modelo
Normalmente seria nesse local que você criaria o `Predictive Experiment` para implantá-lo em um serviço Web, _no entanto_, executamos essas etapas com antecedência. 
* Discuta estas etapas e _não as execute ao vivo_:
    * Clique em `Create` experimento de previsão. Considere o modelo `Predictive Experiment` como o modelo de produção que será implantado no serviço Web. O `Training Experiment` como o modelo de desenvolvimento.
    * Adicione os módulos `Execute Python Script` e `Select Columns in Dataset` ao experimento de previsão criado.
    * Execute o experimento
    * Clique em `Deploy Web Service`
* Depois de discutir as etapas para criar o `Predictive Experiment`, navegue até o serviço Web implantado na barra de navegação à esquerda.
* Clique no nome do serviço Web criado anteriormente.
* Clique em `Test` e veja como ele é executado em um item de dados com pontuação.
* Clique em `Consume` e mostre o código de exemplo fornecido para a integração do serviço Web.


# <a name="demo-3-testing-api-with-c-console-app-dotnet-core"></a>Demonstração 3: testando a API com o aplicativo de console C# (núcleo dotnet)
### <a name="api-demo-test-video-herehttpsyoutubeu1ppyazunmot2136"></a>Vídeo de teste de demonstração de API [aqui](https://youtu.be/u1ppYaZuNmo?t=2136)

* Copie a chave de API da guia `Consume`
* Abra o `App.config` e cole-o no atributo Value
* Copie o `Request-Response Url` da guia `Consume`
* Abra o `Program.cs` e cole o valor em `client.BaseAddress = new Uri("");`
* Clique com o botão direito do mouse em `Program.cs` e selecione `Open in Terminal`
* Digite o comando `dotnet run` para executar o aplicativo de console
* Para usar os valores padrão de StoreID (ID1) de 2, do ItemID (ID2) de 1 e do número de semanas a prever. Apenas digite `y`
* Isso será executado e deverá retornar os valores previstos para as próximas 4 semanas.
