# <a name="aiml21-developers-guide-to-ai-a-data-story"></a>AIML21: Guia de desenvolvedores para IA: Uma história sobre dados 

## <a name="train-the-trainer-guide"></a>Kit de treinamento do treinador

### <a name="session-abstract"></a>Resumo da sessão

Nesta sessão de teatro, mostraremos o processo de ciência de dados e como aplicá-lo. Desde a exploração de conjuntos de dados até a implantação de serviços, tudo aplicado a uma história de dados interessante. Isso também vai levá-lo a um tour muito breve pela Plataforma de IA do Azure.

# <a name="how-to-use"></a>Como usar

### <a name="welcome-presenter"></a>Seja bem-vindo, Apresentador!

Estamos felizes por vocês estar aqui, animado para ver esse conteúdo incrível. Como apresentador experiente, sabemos que você **SABE** fazer apresentações. Assim, este guia tem como foco **AQUILO** de que você precisa apresentar. Ele fornece a visualização completa da apresentação criada pela equipe de design da apresentação.

Com o vídeo da apresentação, este documento será vinculado a todos os ativos necessários para fazer uma apresentação de sucesso, incluindo slides do PowerPoint, códigos e instruções de demonstração.

* Leia o documento por inteiro.
* Assista à apresentação em vídeo
* Faça perguntas ao Apresentador Principal

# <a name="assets-in-train-the-trainer-kit"></a>Ativos no kit treinamento do treinador

* Este guia
* [Apresentação do PowerPoint](https://globaleventcdn.blob.core.windows.net/assets/aiml/AIML21_DevelopersGuidetoAI_ADataStory.pptx)
* [Gravação completa da apresentação](https://youtu.be/K8upKkvtEI0)
* [Conjuntos de dados usados](aiml21/data)
* [Arquivos de código a serem executados](aiml21/code)
* Vídeos de demonstração separados: 
    * Demonstração 1 – [Explorar](https://youtu.be/1Xtmrsfkzfs)
    * Demonstração 2 – [Experimento](https://youtu.be/sUKuRBRvo7U)
    * Demonstração 3 – [Implantar](https://youtu.be/IgSaMKsyexg)
    * Demonstração 4 – [Apresentar](https://youtu.be/g7aBaC9s9qQ)
* Instruções de demonstração

# <a name="demo-instructions"></a>Instruções de demonstração:

Para começar, baixe os arquivos de dados e o código neste repositório. Haverá uma pasta de código e dados que conterá todas as informações necessárias para executar todas as demonstrações

**Você precisará de:**
* Uma assinatura do Azure – obtenha uma [ versão de avaliação gratuita aqui](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml21), se precisar
* O [Power BI Desktop (somente Windows)](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=msignitethetour2019-github-aiml21) – se você estiver usando o MacOS/Linux, ainda poderá usar a demonstração da funcionalidade por meio de qualquer navegador da Web moderno

**Instruções de configuração:**
* Use o botão **Implantar no Azure** abaixo para criar seu espaço de trabalho do Azure Machine Learning a ser usado durante a sessão

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

* Crie um **Espaço de trabalho do Power BI**
    * Abra [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)
    * Faça logon com suas credenciais do espaço de trabalho
    * Clique nos espaços de trabalho no painel esquerdo
    * Clique em Criar espaço de trabalho
    * Nomeie o espaço de trabalho
    * Insira uma descrição para o espaço de trabalho
    * Clique em Salvar
* Publicar o **Relatório do Power BI**
    * Abra o Power BI Desktop com o Present.pbix
    * Clique em Publicar
    * Selecione o nome do espaço de trabalho que você acabou de criar
    * Aguarde até que o relatório seja publicado
* Visualizar **Relatório do Power BI**
    * Retorne para a tela [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) 
    * Atualize o navegador, se necessário
    * Consulte o relatório no painel esquerdo do navegador da Web
    * Clique no relatório para ele ser carregado

## <a name="demo-1---explore"></a>Demonstração 1 – Explorar

### <a name="video-demo-with-voice-over-aiml21---demo-1---explorehttpsyoutube1xtmrsfkzfs"></a>Demonstração em vídeo com o Voice Over: [AIML21 – Demonstração 1 – Explorar](https://youtu.be/1Xtmrsfkzfs)

* Entre em seu [Portal do Azure](https://azure.microsoft.com/en-gb/?WT.mc_id=msignitethetour2019-github-aiml21) e abra o **Azure Machine Learning** criado com o modelo acima
* Inicie a experiência de visualização, clicando em **“Iniciar a versão prévia agora”**
* Abra **“Computação”** no painel esquerdo
* Selecione o Link do **“Jupyter”** na VM do notebook
* *Faça logon com suas credenciais do Azure, conforme necessário*
* Abra [**Explore.ipynb**](code/explore.ipynb) *(recomendamos que todas essas guias estejam abertas e prontas para uso)*
* Verifique se todas as células de saída do notebook estão desmarcadas: **Selecionar célula -> Todas as saídas -> Limpar**
* **Assista ao vídeo para ver todos os pontos de discussão de cada demonstração**
* Execute e explique brevemente as 6 primeiras células
* Observe que outras células e visualizações estão disponíveis e os participantes devem baixar o código em **[aka.ms/AIML21repo](http://aka.ms/aiml21repo)**

## <a name="demo-2---experiment"></a>Demonstração 2 – Experimento

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

> Durante a execução, explique que levará algum tempo para executar a experiência e você analisará um exemplo de execução anterior. 

> Verifique se você tem uma regressão de ML automatizado totalmente executada, conforme explicado antes da apresentação

* Selecione a experiência anteriormente executada na página de ML automatizado à esquerda ou pressione o botão voltar da experiência que você acabou de enviar acima
* A experiência executada anteriormente terá um longo "ID da execução", selecione este link
* **Assista ao vídeo para ver todos os pontos de discussão de cada demonstração**

## <a name="demo-3---deploy"></a>Demonstração 3 – Implantar

### <a name="video-demo-with-voice-over-aiml21---demo-3---deployhttpsyoutubeigsamksyexg"></a>Demonstração em vídeo com o Voice Over: [AIML21 – Demonstração 3 – Implantar](https://youtu.be/IgSaMKsyexg)

> Você usará a experiência executada e analisada anteriormente para implantar

* Comece na tela com a execução **Experiência automatizada de ML**
* Selecione o botão **“Implantar o melhor modelo”**
* Crie um nome de implantação, exemplo/ aiml21-v1
* Adicione uma descrição da implantação, se desejar
* Tipo de computação definido como ACI (instância de contêiner do Azure)
* Mantenha a autenticação habilitada
* Escolha o botão **Implantar**
* Comente sobre o tempo que a implantação pode levar; você pode examiná-la na guia "Pontos de extremidade" à esquerda

>Verifique se você tem uma experiência de regressão de ML automatizado totalmente executada que já foi implantada em uma ACI antes da apresentação

* Selecione os **Pontos de extremidade** no painel esquerdo
* Selecione seu modelo de Instância de Contêiner do Azure já criado
* **Assista ao vídeo para ver todos os pontos de discussão de cada demonstração**
* Selecione a guia do navegador em que está o Jupyter
* Abra [Deploy.ipynb](code/deploy.ipynb)
* Verifique se todas as células de saída do notebook estão desmarcadas: **Selecionar célula -> Todas as saídas -> Limpar**
* Confirme se o arquivo config.json foi concluído com as informações corretas
* Edite a segunda célula para incluir o nome do serviço da Web implantado
* Execute todas as células no notebook e explique o código: **Reveja o vídeo com todos os pontos de discussão de cada demonstração**

## <a name="demo-4---present"></a>Demonstração 4 – Apresentar

### <a name="video-demo-with-voice-over-aiml21---demo-4---presenthttpsyoutubeg7abac9s9qq"></a>Demonstração em vídeo com o Voice Over: [AIML21 – Demonstração 4 – Apresentar](https://youtu.be/g7aBaC9s9qQ)

>Antes de começar a apresentação, abra o Power BI Desktop com [Present.pbix](code/Present.pbix) e [https://powerbi.microsoft.com/](https://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) com o espaço de trabalho e o relatório aberto na configuração acima

* Abra o Present.pbix 
* **Assista ao vídeo para ver todos os pontos de discussão de cada demonstração**
* Mostre no botão Publicar
* Abra [https://powerbi.microsoft.com/](https://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)
* **Assista ao vídeo para ver todos os pontos de discussão de cada demonstração**

# <a name="teardown-instructions"></a>Instruções de desinstalação

### <a name="full-teardown"></a>Desinstalação completa

* Entre no portal do Azure e exclua o grupo de recursos do Azure para remover todos os recursos do projeto desejado

### <a name="to-save-costs"></a>Para economizar custos

* Certifique-se de desligar sua VM do notebook sempre que ela não estiver em uso
* Quando não estiver em uso, exclua a Instância de Contêiner do Azure nos pontos de extremidade

# <a name="resources-and-continued-learning"></a>Recursos e aprendizado contínuo

**Microsoft Learn:**
* [Explore as ferramentas de ciência de dados no Azure](https://docs.microsoft.com/en-us/learn/paths/explore-data-science-tools-in-azure/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Introdução ao Python](https://docs.microsoft.com/en-us/learn/modules/intro-to-python/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Automatize a seleção do modelo de ML com o serviço do Azure Machine Learning](https://docs.microsoft.com/en-us/learn/modules/automate-model-selection-with-azure-automl/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Criar e usar relatórios de análise com o Power BI](https://docs.microsoft.com/en-us/learn/paths/create-use-analytics-reports-power-bi/?WT.mc_id=msignitethetour2019-github-aiml21)


# <a name="feedback-loop"></a>Ciclo de Comentários

Todos os palestrantes terão a oportunidade de participar das **sessões de perguntas e respostas para treinadores** todos os meses (duas sessões abrangendo todos os fusos horários) e, depois das apresentações no palco, gostaríamos que você se juntasse a nós nas **Sessões de feedback** organizadas para compartilhar sua experiência com o conteúdo e suas ideias e comentários. 

Tem um comentário, feedback ou sugestão? Atualmente, a melhor forma de criar um ciclo de comentários para alterações/sugestões/feedback de conteúdo é abrindo um novo problema neste repositório GitHub. Para obter todos os detalhes sobre como criar um problema, confira a [Documentação de contribuição](https://github.com/microsoft/ignite-learning-paths/blob/master/contributing.md)

## <a name="become-a-trained-presenter"></a>Torne-se um apresentador treinado

Para se tornar um apresentador treinado, entre em contato com [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com). Em seu email, inclua:

- Nome completo
- O código desta apresentação: aiml21
- Link para um vídeo da sua apresentação (aproximadamente 10 minutos) (por exemplo: vídeo do YouTube não listado). 
  > O conteúdo pode ser diferente deste treinamento. O importante é mostrar suas habilidades com o apresentador

Um orientador entrará em contato com as informações sobre o processo.

## <a name="trained-presenters"></a>Apresentadores treinados

Agradecemos a essas pessoas maravilhosas ([emoji de chave](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/amynic">
        <img src="https://avatars3.githubusercontent.com/u/13828867?s=400&u=f6aca8528d65d6c191114d3a7328b46137eda162&v=4" width="100px;" alt="Amy Boyd"/><br />
        <sub><b>Amy Boyd</b></sub></a><br />
            <a href="https://globaleventcdn.blob.core.windows.net/assets/aiml/AIML21_DevelopersGuidetoAI_ADataStory.pptx" title="Documentação da">📢</a>palestra
            <a href="https://github.com/microsoft/ignite-learning-paths-training/pulls?q=is%3Apr+author%3Aamynic+is%3Aclosed" title="">📖</a> 
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->
