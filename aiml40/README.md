# <a name="aiml40---taking-models-to-the-next-level-with-azure-machine-learning-best-practices"></a>AIML40 – Condução dos modelos para o próximo nível com as práticas recomendadas do Azure Machine Learning

## <a name="session-information"></a>Informações da sessão

A Inteligência Artificial e o Machine Learning podem ser usados de várias maneiras para aumentar a produtividade dos processos de negócios e reunir informações significativas, analisando imagens, textos e tendências em fluxos de dados não estruturados. Embora muitas tarefas possam ser resolvidas usando modelos existentes, em alguns casos também é necessário treinar seu próprio modelo para tarefas mais específicas ou para aumentar a precisão. 

Nesta sessão, vamos explorar o caminho completo da integração dos serviços inteligentes de análise de texto aos processos de negócios da [Tailwind Traders](http://tailwindtraders.com), começando pelos modelos pré-compilados disponíveis como [serviços cognitivos](https://azure.microsoft.com/services/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml40), até o treinamento de um modelo neural personalizado de terceiros para a [Análise de Sentimento com base em aspecto](https://www.intel.ai/introducing-aspect-based-sentiment-analysis-in-nlp-architect/) disponível como parte da [Intel NLP Architect](http://nlp_architect.nervanasys.com/) usando o [Serviço do Azure Machine Learning](https://azure.microsoft.com/services/machine-learning-service/?wt.mc_id=msignitethetour2019-github-aiml40). Falaremos sobre os casos em que um modelo personalizado é necessário e demonstraremos maneiras rápidas de criar um modelo desse tipo do zero, usando o [AutoML](https://docs.microsoft.com/azure/machine-learning/service/concept-automated-ml/?wt.mc_id=msignitethetour2019-github-aiml40), além disso mostraremos como ajustar hiperparâmetros de modelo usando o [HyperDrive](https://docs.microsoft.com/azure/machine-learning/service/how-to-tune-hyperparameters/?wt.mc_id=msignitethetour2019-github-aiml40)

## <a name="delivery-assets"></a>Ativos de entrega

* [Baralho do PowerPoint](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml40/AIML40_Taking_Models_to_the_Next_Level_with_Azure_Machine_Learning_Best_Practices.pptx)
* Vídeos de demonstração:
    * Demonstração 1 – [Análise de Texto de Serviços Cognitivos](https://youtu.be/QJxjm5BirOA)
    * Demonstração 2 – [Aprendizado de máquina automatizado](https://youtu.be/qrstXN6TLZk)
    * Demonstração 3 – [SDK e Hyperdrive do Azure Machine Learning](https://youtu.be/sccNTPO3PwU)
* [Recursos adicionais do apresentador](README-Instructor.md)

## <a name="overview-of-demonstrations"></a>Visão geral das demonstrações

Nesta apresentação, as seguintes demonstrações serão feitas:

1. Como usar a [Análise de Texto dos Serviços Cognitivos](https://azure.microsoft.com/services/cognitive-services/text-analytics/?wt.mc_id=msignitethetour2019-github-aiml40) para descobrir o sentimento de uma avaliação de roupas
2. Como usar o [Azure ML Automatizado](https://docs.microsoft.com/azure/machine-learning/service/concept-automated-ml/?wt.mc_id=msignitethetour2019-github-aiml40) para criar um classificador de texto quase sem código
3. Como usar o [Serviço do Azure Machine Learning](https://azure.microsoft.com/services/machine-learning-service/?wt.mc_id=msignitethetour2019-github-aiml40) para treinar um modelo de Análise de Sentimento Baseado em Aspecto.

## <a name="starting-fast"></a>Iniciar rapidamente

Caso queira começar imediatamente, será possível implantar todos os recursos necessários por meio do Modelo do Azure e abrir o código no Azure Notebooks. 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml40%2Ftemplate%2Fazuredeploy.json" target="_blank">
 <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<!-- TODO: provide correct Azure Notebook path -->
<a href="https://notebooks.azure.com/sosh/projects/ignite-absa"><img src="https://notebooks.azure.com/launch.png" /></a>

Fornecemos abaixo instruções mais detalhadas para a demonstração, com o objetivo de possibilitar a execução das etapas manualmente para você entender totalmente os conceitos mostrados.

## <a name="initial-environment-setup"></a>Configuração inicial do ambiente

Para executar as etapas 2 e 3 da demonstração, precisaremos:

1. Criar um Workspace do Azure Machine Learning
2. Carregar os dados usados para treinamento de AutoML – [clothing_automl.xlsx](dataset\clothing_automl.xlsx)


#### <a name="creating-azure-machine-learning-workspace"></a>Como criar um Workspace do Azure Machine Learning

O Workspace do Azure ML pode ser criado:
* De forma manual com base no [portal do Azure](http://portal.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40) ([aqui está o passo a passo completo](https://docs.microsoft.com/azure/machine-learning/service/how-to-manage-workspace/?wt.mc_id=msignitethetour2019-github-aiml40))
* Implantado com base no Modelo do Azure fornecido
* Criado por meio da [CLI do Azure](https://docs.microsoft.com/ru-ru/cli/azure/?view=azure-cli-latest&wt.mc_id=msignitethetour2019-github-aiml40)

> *OBSERVAÇÃO: estamos usando `absa` como um nome e o datacenter do *Oeste dos EUA 2* neste exemplo, mas fique à vontade para fazer alterações*

```shell
az extension add -n azure-cli-ml
az group create -n absa -l westus2
az ml workspace create -w absa_space -g absa
```

Também convém saber a ID de sua assinatura que pode ser obtida ao executar `az account list`.

#### <a name="uploading-data-to-the-workspace"></a>Como carregar dados para o workspace

Em nossas demonstrações, usaremos alguns conjuntos de dados:
* Um conjunto de dados para a demonstração de um ML Automatizado – [clothing_automl.xlsx](dataset/clothing_automl.xlsx)
* O grande conjunto de dados [clothing_absa_train.csv](dataset/clothing_absa_train.csv) para treinar o modelo completo de análise de sentimento baseado em aspecto para a demonstração 3
* Um conjunto de dados de depuração menor para o modelo de análise de sentimento baseado em aspecto [clothing_absa_train_small.csv](dataset/clothing_absa_train_small.csv)
* Um conjunto separado de validação [clothing-absa-validation.json](dataset/clothing-absa-validation.json) para testar o modelo

Para seguir a demonstração de ML Automatizado, carregue o conjunto de dados em seu workspace. É possível fazer isso manualmente por meio do [portal do Azure ML](http://ml.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40) ou usar o arquivo fornecido `upload_dataset.py` (o arquivo csv/xlsx deve estar no diretório atual e você deve substituir `[subscription_id]` de acordo com a sua assinatura):

```shell
python upload_dataset.py -s [subscription_id] -w absa_space -g absa -f clothing_automl.xlsx
```

O conjunto de dados de vestuário do ML Automatizado deve ser carregado no armazenamento de dados de serviço do AML pelo código de demonstração.

#### <a name="using-the-azure-ml-demo-code"></a>Como usar o Código de Demonstração do Azure ML

É possível executar o código de demonstração de qualquer ambiente do Jupyter Notebook. Você poderá:
 - Instalar o ambiente do Python localmente, conforme descrito abaixo na **Instalação de Ambiente do Python**
 - Usar o [Azure Notebooks](https://docs.microsoft.com/azure/notebooks/azure-notebooks-overview/?wt.mc_id=absa-notebook-abornst). Nesse caso, será necessário carregar o arquivo `absa.ipynb` em um novo projeto do Azure Notebooks ou simplesmente clonar a [biblioteca de notebooks](https://notebooks.azure.com/sosh/projects/ignite-absa).
 <!-- TODO: provide final path to notebook library -->

#### <a name="python-environment-installation"></a>Instalação de ambiente do Python

Caso não queira usar o Azure Notebooks e prefira usar seu ambiente do Python local, será necessário instalar o SDK do Azure ML do Python, além de garantir a instalação do notebook e do contrib:

```shell
conda create -n azureml -y Python=3.6
source activate azureml
pip install --upgrade azureml-sdk[notebooks,contrib] 
conda install ipywidgets
jupyter nbextension install --py --user azureml.widgets
jupyter nbextension enable azureml.widgets --user --py
```

Será necessário reiniciar o Jupyter depois disso. As instruções detalhadas estão [aqui](https://docs.microsoft.com/azure/machine-learning/service/quickstart-create-workspace-with-python/?WT.mc_id=msignitethetour2019-github-aiml40)

Caso precise de uma conta de avaliação gratuita para começar, poderá obter uma [aqui](https://azure.microsoft.com/offers/ms-azr-0044p/?WT.mc_id=msignitethetour2019-github-aiml40)

#### <a name="pre-creating-compute-cluster"></a>Como pré-criar um Cluster de Cálculo

Para as duas últimas demonstrações, será necessário obter um cluster de cálculo. Para fins de demonstração, criaremos um cluster que consiste em somente um nó. Isso pode ser feito de três maneiras:

1. Por meio do [portal do Azure ML](http://ml.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40) vá para a seção **Computação** e crie um cluster de Computação do Azure ML com VMs *Standard_DS3_v2*, especificando o número de nós = 1. Nomeie o cluster `absa-cluster`.
2. Execute o script de `create_cluster.py` fornecido, informando os parâmetros conforme acima:
```shell
python create_cluster.py -s [subscription_id] -w absa_space -g absa
```
3. Execute as primeiras células do notebook `absa.ipynb` que criará o cluster para você.

## <a name="demos"></a>Demonstrações

### <a name="demo-1-text-analytics-cognitive-service"></a>Demonstração 1: Serviço Cognitivo de Análise de Texto

Nesta demonstração, mostraremos como a Análise de Texto pode fazer a análise do sentimento de uma frase em uma interface da Web.

1. Abrir [Página de Análise de Texto](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)
2. Role para baixo até a seção **ver em ação** e insira a frase *Adorei a calça de bolinhas que comprei na loja de Londres* (Também é possível manter a frase padrão para demonstrar o argumento).
3. Pressione **Analisar** para obter o seguinte resultado:

![Captura de tela da Análise de Texto do Azure](images/analytics.png)

Observe que Análise de Texto não fornece somente o sentimento, mas também extrai o local e palavras-chave do texto.

### <a name="demo-2-azure-automl"></a>Demonstração 2: Azure AutoML

Nesta demonstração, mostraremos como o ML Automatizado pode ser usado para criar um modelo de ML sem codificação.

1. Navegue até o Workspace do Azure ML (criado acima) no [http://ml.azure.com](http://ml.azure.com/?WT.mc_id=msignitethetour2019-github-aiml40)
2. Vá para **Conjunto de dados** – será possível ver ali o conjunto de dados previamente carregado (clothing_automl. xlsx). Observe que também é possível carregá-lo aqui por meio do portal.
3. Selecione o conjunto de dados.
4. Na guia **Visão geral**, expanda o **Uso de exemplo** e exiba o código que pode ser usado para acessar os dados de maneira programática, se necessário.
5. Na guia **Explorar**, observe os dados.
6. Vá para a guia **ML Automatizado** e clique em **Novo experimento**
7. Selecione nome do experimento e a computação a ser usada.
8. Selecione o conjunto de dados.
9. Escolha o tipo de tarefa de previsão – **Classificação**.
10. Selecione a coluna de destino – **Classificação**.
11. Clique em **Iniciar**.

O experimento demorará muito tempo para ser executado, pois algoritmos diferentes serão investigados. Ao exibir uma demonstração, faz sentido executá-la com antecedência e mostrar somente os resultados.

### <a name="demo-3-using-azure-ml-workspace-with-python-sdk"></a>Demonstração 3: Como usar o Workspace do Azure ML com o SDK do Python

Nesta demonstração, executaremos um código Python personalizado que usa o SDK do Azure ML do Python para treinar, otimizar e usar o modelo de ABSA (Análise de Sentimento Baseado em Aspecto) personalizado.

Todas as instruções desta parte da demonstração estão localizadas no próprio Jupyter Notebook. Use um dos métodos descritos acima para executar o Notebook (no Azure Notebooks ou localmente) e siga as instruções. 

## <a name="tear-down"></a>Desativar

Para liberar os recursos de nuvem usados durante a demonstração, será necessário excluir o workspace e o grupo de recursos do Azure ML:

```shell
az ml workspace delete --w absa_space -g absa
az group delete -n absa
```

## <a name="presenter-resources"></a>Recursos do apresentador

Se for apresentar esse conteúdo, consulte os [recursos adicionais do apresentador](README-Instructor.md).

## <a name="resources-and-continue-learning"></a>Recursos e Aprendizado Contínuo

### <a name="getting-started-series"></a>Série de Introdução

* [API de Análise de Texto de Serviços Cognitivos do Azure](https://aka.ms/TextCogSvc)
* [Machine Learning Automatizado](https://aka.ms/AutomatedMLDoc)
* [Ajuste de Hiperparâmetro](https://aka.ms/AzureMLHyperDrive)
* [Serviços do Azure ML e o SDK do Python](https://aka.ms/AA3dzht) 

### <a name="other-materials"></a>Outros materiais

* [Nove dicas avançadas para Machine Learning de Produção](aka.ms/9TipsProdML)
* [Página de Análise de Sentimento Baseado em Aspecto da Intel](https://www.intel.ai/introducing-aspect-based-sentiment-analysis-in-nlp-architect/)
* Repositórios de Práticas Recomendadas do Azure ML:
    * [Processamento de Idioma Natural](https://github.com/microsoft/nlp/)
    * [Pesquisa Visual Computacional](https://github.com/microsoft/ComputerVision)
    * [Recomendações](https://github.com/microsoft/Recommenders)


## <a name="feedback-loop"></a>Ciclo de comentários

Tem um comentário, feedback ou sugestão? Atualmente, a melhor forma de criar um ciclo de comentários para alterações/sugestões/feedback de conteúdo é abrindo um novo problema neste repositório GitHub. Para obter todos os detalhes sobre como criar um problema, consulte os documentos sobre [Contribuição](../../contributing.md)
