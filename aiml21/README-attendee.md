# <a name="developers-guide-to-ai-a-data-story"></a>Guia de desenvolvedores para IA: Uma história sobre dados

Nesta sessão de teatro, mostraremos o processo de ciência de dados e como aplicá-lo. Desde a exploração de conjuntos de dados até a implantação de serviços, tudo aplicado a uma história de dados interessante. Isso também vai levá-lo a um tour muito breve pela Plataforma de IA do Azure.

# <a name="demo-environment-deployment"></a>Implantação do ambiente de demonstração

Para começar, baixe os arquivos de dados e o código neste repositório. Haverá uma pasta de código e dados que conterá todas as informações necessárias para executar todas as demonstrações

**Você precisará de:**
* Uma assinatura do Azure – obtenha uma [ versão de avaliação gratuita aqui](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml21), se precisar
* O [Power BI Desktop (somente Windows)](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=msignitethetour2019-github-aiml21) – se você estiver usando o MacOS/Linux, ainda poderá usar a demonstração da funcionalidade por meio de qualquer navegador da Web moderno

**Instruções de configuração:**
* Use o botão **Implantar no Azure** abaixo para criar seu espaço de trabalho do Azure Machine Learning

[![Implantar no Azure](https://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

* Entre no Portal do Azure e no Serviço do Azure Machine Learning
* Escolha Atualizar o espaço de trabalho para a **edição Enterprise (versão prévia)** [para ver mais informações sobre preços atuais aqui](https://azure.microsoft.com/en-us/pricing/details/machine-learning/) – você precisará da edição empresarial para concluir a demonstração da experiência (demo 2)
* Inicialize a **Interface do usuário (versão prévia)**
* Crie uma **VM do Notebook**
    * Selecione “Computação” no painel esquerdo
    * Selecione “Novo” em “VMs do Notebook”
    * Forneça um “Nome da VM do Notebook” (todas letras em minúsculas)
    * Mantenha o tamanho padrão da VM fornecida
    * Feito isso, selecione “Jupyter Link”
    * Clique na pasta do usuário duas vezes
    * Selecione o botão de upload e carregue os arquivos listados abaixo:
        * [data/data_train.csv](data/data_train.csv)
        * [code/explore.ipynb](code/explore.ipynb)
        * [code/deploy.ipynb](code/deploy.ipynb)
        * [code/config.json](code/config.json)
    * Abra [config.json](code/config.json) e insira a chave de inscrição, o grupo de recursos, o nome do Workspace do Azure ML e salve o arquivo

>Saiba mais sobre as [VMs do Notebook aqui](https://azure.microsoft.com/en-us/blog/three-things-to-know-about-azure-machine-learning-notebook-vm/?WT.mc_id=msignitethetour2019-github-aiml21)

* Crie uma **Instância de Computação**
    * Selecione “Computação” no painel esquerdo
    * Selecione “Novo” na guia “Clusters de Treinamento”
    * Forneça um “Nome do Computador” (todas as letras minúsculas)
    * Escolha um tamanho de VM
        * Para escolher computação padrão, selecione algo como “Standard_DS2_v2”
        * Para escolher computação de GPU, selecione “Standard_NC6”
    * Selecione “Baixa Prioridade” para definir a prioridade da máquina virtual
    * Número mínimo de nós definido como 0 (ele será reduzido de maneira vertical e completa e diminuirá custos)
    * Definir máximo de 3 a 6 nós
    * Clique em “Criar”

>Saiba mais sobre a [Computação do Azure Machine Learning aqui](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-set-up-training-targets#amlcompute/?WT.mc_id=msignitethetour2019-github-aiml21)

* Carregue o **Conjunto de dados**
    * Selecione “Conjuntos de dados” no painel esquerdo
    * Selecione “Criar conjunto de dados” e “de arquivos locais”
    * Selecione o botão “Procurar” e localize o arquivo data_train_experiment. csv
    * Selecione “Próximo”
    * Revise os dados e selecione “Avançar” duas vezes
    * Por fim, examine as configurações do conjunto de dados e selecione “Criar”

>Saiba mais sobre [como criar conjuntos de dados aqui](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-create-register-datasets/?WT.mc_id=msignitethetour2019-github-aiml21)

# <a name="delivery-of-assets"></a>Entrega de ativos

* [Apresentação do PowerPoint](https://globaleventcdn.blob.core.windows.net/assets/aiml/AIML21_DevelopersGuidetoAI_ADataStory.pptx)
* [Conjuntos de dados usados](aiml21/data)
* [Arquivos de código a serem executados](aiml21/code)
* Vídeos de demonstração separados: 
    * Demonstração 1 – [Explorar](https://youtu.be/1Xtmrsfkzfs)
    * Demonstração 2 – [Experimento](https://youtu.be/sUKuRBRvo7U)
    * Demonstração 3 – [Implantar](https://youtu.be/IgSaMKsyexg)
    * Demonstração 4 – [Apresentar](https://youtu.be/g7aBaC9s9qQ)

# <a name="demo-1---explore"></a>Demonstração 1 – Explorar

### <a name="video-demo-with-voice-over-aiml21---demo-1---explorehttpsyoutube1xtmrsfkzfs"></a>Demonstração em vídeo com o Voice Over: [AIML21 – Demonstração 1 – Explorar](https://youtu.be/1Xtmrsfkzfs)

* Entre em seu [Portal do Azure](https://azure.microsoft.com/en-gb/?WT.mc_id=msignitethetour2019-github-aiml21) e abra o **Azure Machine Learning** criado com o modelo acima
* Inicie a experiência de visualização, clicando em **“Iniciar a versão prévia agora”**
* Abra **“Computação”** no painel esquerdo
* Selecione o Link do **“Jupyter”** na VM do notebook
* *Faça logon com suas credenciais do Azure, conforme necessário*
* Abra [**Explore.ipynb**](code/explore.ipynb)
* Pressione as teclas SHIFT + ENTER para executar todas as células de código

# <a name="demo-2---experiment"></a>Demonstração 2 – Experimento

### <a name="video-demo-with-voice-over-aiml21---demo-2---experimenthttpsyoutubesukurbrvo7u"></a>Demonstração em vídeo com o Voice Over: [AIML21 – Demonstração 2 – Experimento](https://youtu.be/sUKuRBRvo7U)

* Acesse o estúdio do Azure Machine Learning [ml.azure.com](https://ml.azure.com/?WT.mc_id=msignitethetour2019-github-aiml21). Você pode acessá-lo diretamente com a URL, e entrar e selecionar o espaço de trabalho correto criado para esta palestra. Ou selecionar o botão **“Iniciar a versão prévia agora”** no portal do serviço do Azure Machine Learning
* Selecione **ML Automatizado** no painel esquerdo
* **Assista ao vídeo para ver todos os pontos de discussão de cada demonstração**
* Selecione **“Nova execução de ML automatizado”**
* Selecione o conjunto de dados de treinamento (data_train_experiment-XXXXXX)
* Forneça um nome de teste, exemplo/ aiml21-regressão-duração
* Selecione a **Duração** na coluna Destino
* Selecione o “Cluster de Treinamento” de computação configurado acima
* Selecione **Avançar**
* Selecione **Regressão** para a Tarefa de Previsão
* Selecione **“Exibir definições de configuração adicionais”** e defina a métrica primária como **“normalized_root_mean_squared_error”**
* Defina a Concorrência com um Máximo de iterações simultâneas para 3
* Defina o critério de Saída com Tempo de trabalho de treinamento (horas) como 1
* Selecione **“Salvar”**
* Selecione **Concluir**

> A execução levará um tempo para ser concluída: aproximadamente 15 a 20 minutos 

* Depois de concluído, revise a saída dos modelos executados e encontre o melhor modelo

# <a name="demo-3---deploy"></a>Demonstração 3 – Implantar

### <a name="video-demo-with-voice-over-aiml21---demo-3---deployhttpsyoutubeigsamksyexg"></a>Demonstração em vídeo com o Voice Over: [AIML21 – Demonstração 3 – Implantar](https://youtu.be/IgSaMKsyexg)

* Do final da demonstração 2
* Comece na tela com a execução **Experiência automatizada de ML**
* Selecione o botão **“Implantar o melhor modelo”**
* Crie um nome de implantação, exemplo/ aiml21-v1
* Adicione uma descrição da implantação, se desejar
* Tipo de computação definido como ACI (instância de contêiner do Azure)
* Mantenha a autenticação habilitada
* Escolha o botão **Implantar**

>A execução levará um tempo para ser concluída: aproximadamente 20 a 30 minutos

* Após a conclusão, selecione os **Pontos de extremidade** no painel esquerdo
* Selecione o modelo da instância de contêiner do Azure e examine os detalhes
* Selecione a guia do navegador em que está o Jupyter
* Abra [**Deploy.ipynb**](code/deploy.ipynb)
* Confirme se o arquivo [config.json](code/config.json) foi concluído com as informações corretas dos estágios de instalação
* Edite a segunda célula para incluir o nome do serviço da Web implantado
* Execute todas as células no notebook e examine a saída

# <a name="demo-4---present"></a>Demonstração 4 – Apresentar

### <a name="video-demo-with-voice-over-aiml21---demo-4---presenthttpsyoutubeg7abac9s9qq"></a>Demonstração em vídeo com o Voice Over: [AIML21 – Demonstração 4 – Apresentar](https://youtu.be/g7aBaC9s9qQ)

* Abra [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)
* Faça logon com suas credenciais do espaço de trabalho
* Clique nos espaços de trabalho no painel esquerdo
* Clique em Criar espaço de trabalho
* Nomeie o espaço de trabalho
* Insira uma descrição para o espaço de trabalho
* Clique em Salvar
* Abra o Power BI Desktop com o Present.pbix
* Interagir com dados e visuais
* Clique no botão Publicar
* Selecione o nome do espaço de trabalho que você acabou de criar
* Aguarde até que o relatório seja publicado
* Retorne para a tela [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) 
* Atualize o navegador, se necessário
* Consulte o relatório no painel esquerdo do navegador da Web
* Clique no relatório para ele ser carregado

# <a name="teardown-instructions"></a>Instruções de desinstalação

### <a name="full-teardown"></a>Desinstalação completa

* Entre no portal do Azure e exclua o grupo de recursos do Azure para remover todos os recursos do projeto desejado

### <a name="to-save-costs"></a>Para economizar custos

* Certifique-se de **desligar** sua VM do notebook sempre que ela não estiver em uso
* Quando não estiver em uso, **exclua** a Instância de Contêiner do Azure nos pontos de extremidade

# <a name="resources-and-continued-learning"></a>Recursos e aprendizado contínuo

**Microsoft Learn:**
* [Explore as ferramentas de ciência de dados no Azure](https://docs.microsoft.com/en-us/learn/paths/explore-data-science-tools-in-azure/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Introdução ao Python](https://docs.microsoft.com/en-us/learn/modules/intro-to-python/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Automatize a seleção do modelo de ML com o serviço do Azure Machine Learning](https://docs.microsoft.com/en-us/learn/modules/automate-model-selection-with-azure-automl/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Criar e usar relatórios de análise com o Power BI](https://docs.microsoft.com/en-us/learn/paths/create-use-analytics-reports-power-bi/?WT.mc_id=msignitethetour2019-github-aiml21)

# <a name="feedback-loop"></a>Ciclo de Comentários

Tem um comentário, feedback ou sugestão? Atualmente, a melhor forma de criar um ciclo de comentários para alterações/sugestões/feedback de conteúdo é abrindo um novo problema neste repositório GitHub. Para obter todos os detalhes sobre como criar um problema, confira a [Documentação de contribuição](https://github.com/microsoft/ignite-learning-paths/blob/master/contributing.md)
