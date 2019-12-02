# <a name="aiml40---demo-instructions"></a>AIML40 — Instruções de demonstração

As instruções para as demonstrações do AIML40, incluindo a preparação necessária, são descritas em detalhes em [Materiais públicos do AIML40](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/). Não duplicaremos as etapas descritas aqui, mas destacaremos alguns truques importantes que melhoram a demonstração (e se encaixam em 45 minutos). Primeiro, leia o material público para se familiarizar com o cenário de demonstração.

## <a name="demo-preparation"></a>Preparação da demonstração

Como descrito em [Leiame público do AIML40](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md), estas são as etapas de preparação:

1. Crie o Workspace do Azure Machine Learning (usando os comandos de CLI ou o modelo do Azure)
2. Carregue o conjunto de dados em uma demonstração do AML automatizado para o workspace
3. Crie um cluster de cálculo para acelerar a demonstração
4. Configure o ambiente do Jupyter Notebook e abra o arquivo `asba.ipynb` nele, preparando para execução.

Portanto, antes da demonstração, você teria um navegador com as três páginas a seguir abertas:
 - [Página de análise de texto](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)
 - [Workspace do Azure Machine Learning](http://ml.azure.com)
 - Jupyter Notebook com `asba.ipynb`

Além dessas etapas, para garantir uma demonstração rápida, você precisa fazer o seguinte:

1. **Para a demonstração 1:** Abra o navegador na [Página de análise de texto](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40), na caixa de texto abaixo, insira o texto a seguir e pressione **Analisar**: 
> Adorei as calças de bolinhas que comprei na london store

[Link do vídeo da demonstração 1: análise de texto de serviços cognitivos](https://youtu.be/QJxjm5BirOA)

2. **Para a demonstração 2:**
   - Abra a página do seu [Workspace do Azure Machine Learning](http://ml.azure.com). Se necessário, selecione o workspace correto.
   - Garanta que o conjunto de dados esteja carregado
   - Acesse a guia **ML automatizado** no workspace do Azure Machine Learning e execute o teste do ML automatizado, como descrito no [Leiame público do AIML40](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md). A execução levará muito tempo, então faça isso com antecedência.
   - Atualize a página pouco antes da apresentação, para que você não precise fazer logon novamente ao fazer a demonstração

[Link para o vídeo da demonstração 2: machine learning automatizado](https://youtu.be/qrstXN6TLZk)

3. **Para a demonstração 3:**
   - Abrir `asba.ipynb` no Ambiente Jupyter
   - Verifique se a ID de assinatura correta está colada no código (e também os nomes do cluster/grupo de recursos, caso você tenha alterado os padrões.
   - Execute todas as células no notebook, verificando se todas as etapas foram executadas corretamente. A execução de algumas das etapas levará muito tempo, portanto, prepare-se com antecedência. O experimento leva cerca de 3,5 horas para ser executado, por isso é importante ter seu cluster de computação como baixa prioridade para economizar dinheiro.
   - Conclua o trabalho com o bloco de anotações antes da demonstração, para que você não precise inserir as credenciais novamente.

[Link do vídeo da demonstração 3: Hyperdrive e SDK do Azure Machine Learning](https://youtu.be/sccNTPO3PwU)


## <a name="demo-time"></a>Hora da demonstração!

Durante a demonstração, recomendamos mostrar o seguinte:

1. **Demonstração 1.1**: Basta abrir o navegador na [Página de análise de texto](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40) e clicar em **Analisar**. A página deve ser pré-carregada.
2. **Demonstração 1.2**: 
  - Na mesma página, clique em **Exemplo-inglês-positivo** para alternar para a frase padrão *Fiz uma viagem maravilhosa a Seattle na semana passada e até visitei a Space Needle duas vezes* e, em seguida, clique em **Analisar**
  - Observe uma boa pontuação positiva
  - Remova a palavra **maravilhosa**
  - Clique em **Analisar** e observe a queda significativa da pontuação
3. **Demonstração 2:** Workspace do Azure Machine Learning e ML automatizado
  - Abra o navegador com o [Workspace do ML do Azure](http://ml.azure.com); a página deve ser pré-carregada
  - Navegue até **Conjuntos de dados**
  - Abra o conjunto de dados
  - Expanda **Exemplo de uso** na guia **Visão geral** para mostrar o código
  - Alterne para **Explorar** a fim de mostrar os dados
  - Alterne para **ML automatizado**
  - Coloque o nome do experimento, selecione computar, selecione um conjunto de dados (clothing_automl.xlsx)
  - Escolha a tarefa **Classificação** e a coluna de destino **Classificação**
  - Expanda as **Configurações avançadas** e demonstre as opções disponíveis, incluindo a seleção de algoritmos
  - Clique em *Iniciar*, mas tenha um experimento pronto para execução porque levará muito tempo!
  - Clique novamente na guia **ML automatizado** e ative o experimento anterior executado durante a fase de preparação
  - Explique o gráfico que mostra diferentes execuções de modelos e qual é a melhor execução
  - Clique no melhor modelo para explorar mais detalhadamente o **ROC**, o **Recall de precisão** e outros gráficos de métricas
  - Demonstre o botão **Implantar modelo** para mostrar como é simples implantar um modelo
4. **Demonstração 3:** Usar o serviço do Azure ML com o SDK do Python
  - Durante esta demonstração, você deve seguir e explicar as células do Notebook `absa.ipynb`
  - Para garantir totalmente a segurança, você pode  mostrar o código sem executá-lo, o que seria seguro, mas não criaria a impressão do código em execução no modo de demonstração ao vivo
  - Para fazer mais uma demonstração ao vivo, confira o notebook [absa-instuctions.ipynb](absa-instuctions.ipynb), que explica quais células *não* devem ser executadas durante a demonstração e quais podem ser executadas com segurança
  - Em geral, o que queremos evitar é tarefas de execução longa

## <a name="tear-down"></a>Desfazer

Como a demonstração tem um uso intensivo de recursos, lembre-se de:
* Excluir o cluster de computação (especialmente porque o dimensionamento automático está desativado em nossa demonstração para economizar no tempo de preparação do cluster)
* Se você estiver executando a computação do Azure Machine Learning, verifique se os nós mínimos estão editados como 0 durante o tempo de inatividade e como 1 durante o tempo de demonstração, o que economizará custos
* Também é possível excluir o Workspace do Azure Machine Learning e o grupo de Recursos; as instruções são fornecidas no [Leiame público](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md)

