# <a name="speaker-notes"></a>Notas do palestrante

## <a name="slides"></a>Slides

* Slide 1

* Slide 2
  * O Machine Learning e o DevOps são dois termos em voga atualmente. O Machine Learning está se tornando mais acessível para mais organizações. Porém, junto com essa maior acessibilidade, vem a necessidade de gerenciar nossos projetos de ML da mesma forma que fazemos com o restante do nosso software.
  * MLOps, Operações de Machine Learning ou DevOps para Machine Learning é a confluência do DevOps e do Machine Learning, e é isso que vamos examinar hoje.

* Slide 3
  * Antes de começarmos, fique à vontade para fazer uma captura de tela deste slide. Para encontrar este conjunto de slides e todos os recursos usados nesta apresentação, acesse estes links.

* Slide 4
  * Durante a programação, resolvemos um problema escrevendo um algoritmo
  * Fazemos com que dados (ou uma entrada) sejam submetidos a esse algoritmo e obtemos uma resposta
  * O mais importante é que sabemos (ou podemos descobrir) como resolver esse problema
  * O que acontece quando não sabemos qual é a aparência desse algoritmo? Por exemplo, será que há um pássaro na foto? Qual é a probabilidade de um candidato não cumprir o pagamento de um empréstimo?

* Slide 5
  * Estes são os problemas que o aprendizado de máquina é bom em resolver
  * Com o aprendizado de máquina, resolvemos esses problemas invertendo a perspectiva e fornecendo muitos exemplos de respostas corretas e entradas correspondentes, deixando que o computador decida qual é o algoritmo

* Slide 6
  * O que estamos fazendo é deixar o computador criar um "modelo" para descrever esses dados

* Slide 7
  * A parte ótima disso é que podemos usar esse modelo no lugar do algoritmo que teríamos escrito, se soubéssemos como fazer isso.

* Slide 8
  * Usando o modelo, podemos obter previsões
  * Observação: tratam-se de previsões, não de respostas dentro do conceito que teríamos
  * A qualidade e a precisão dessas previsões dependem das técnicas e dos algoritmos que usamos para treinar o modelo e dos dados que usamos para treinar o modelo, os quais têm um papel importante
  * Se você estiver usando dados com desvio para treinar o modelo, obterá um modelo com desvio

* Slide 9
  * [Veja a demonstração nº 1](./demos/1-Show_Faulty_Prediction.md)

* Slide 10
  * Vamos falar sobre o trabalho que é realizado ao criar um modelo preditivo
  * Normalmente, há descoberta de dados, transformação e preparação… um pouco de criação de modelo e treinamento usando esses dados… em seguida, uma avaliação da adequação do modelo
  * Esse é um processo experimental altamente iterativo que pode significar vários retornos à prancheta, por um longo período.
  * Quando é hora de realmente implantar um modelo, isso geralmente ocorre de maneira semelhante a como usamos o software – empacote-o e permita que os desenvolvedores ou a equipe de operações o implantem de alguma maneira

* Slide 11
  * O processo de criação geralmente ocorre no computador de um cientista de dados ou em hardware compartilhado para treinamento intensivo
  * E, muitas vezes, a implantação acontece por meio do compartilhamento de unidades USB ou até mesmo por email.

* Slide 12
  * Vamos comparar isso com um bom processo de DevOps em que planejamos, desenvolvemos e testamos e, por fim, lançamos para testar os ambientes de produção, depois monitoramos o que acontece na produção…
  * Mas o DevOps é apenas para o desenvolvimento de software? E quanto aos algoritmos sobre os quais falamos no início?

* Slide 13
  * Vejamos a definição do DevOps pela Microsoft (leia).
  * A palavra mais importante aqui é "valor". O DevOps não é focado em correções de código ou de bug, mas sim em fornecer valor continuamente.
  * Se você tiver um modelo preditivo e puder melhorar esse modelo, isso será algo absolutamente valioso.
  * Portanto, essa definição não exclui o ML.
  * Vejamos um produto que pode ajudar.

* Slide 14

* Slide 15
  * O serviço do Azure Machine Learning é um conjunto de serviços para auxiliar em seus esforços de MLOps (ou DevOps para ML).
  * Você pode acessá-lo em ml.azure.com
  * Vamos analisar mais a fundo algumas das atividades que ele ajuda você a gerenciar

* Slide 16
  * Apenas listar e descrever de acordo com os pontos individuais

* Slide 17
  * No momento, vamos nos concentrar nos Pipelines. Pipelines são fluxos de trabalho para treinar nossos modelos, e queremos criar um desses fluxos para que possamos ter uma maneira reproduzível de criar nosso modelo de previsão.

* Slide 18
  * Você pode ter ouvido falar do Azure Pipelines, mas é importante observar que se tratam de produtos diferentes.
  * Falaremos sobre as diferenças em breve, mas, de modo geral, os Pipelines de ML são ideais para treinamento de fluxos de trabalho e o Azure Pipelines é bom para orquestração. Eles têm focos diferentes.

* Slide 19
  * Qual é a diferença? Por que usar os dois?

* Slide 20
  * Os Pipelines do ML são projetados para fluxos de trabalho específicos de ML.
  * Execuções autônomas – o treinamento de ML pode ser muito demorado, e os Pipelines do ML podem lidar com isso muito bem
  * Capacidade de reutilização – as etapas individuais em um fluxo de trabalho podem consumir muitos recursos e talvez não precisem ser executadas todas as vezes. Se a etapa de preparação de dados não precisar ser executada novamente, você poderá simplesmente reutilizar a saída obtida na última vez.
  * Acompanhamento… – tudo o que está armazenado é focado em ML, e não na criação de software em geral

* Slide 21
  * Por outro lado, o Azure Pipelines é, na realidade, projetado para CI/CD
  * Portões… – são um ótimo lugar para aumentar a qualidade, fazer verificações e ajustes
  * Integração – com outros aplicativos, artefatos e dependências
  * Gatilhos – você pode querer disparar a orquestração por vários motivos

* Slide 22
  * Quando criamos um pipeline, usamos a maioria destes serviços

* Slide 23
  * Usar Conjuntos de dados ou Armazenamentos de dados para treinar dados, realizar um Experimento para treinar usando a Computação gerenciada e terminar com um Modelo.
  * Implantaremos esse modelo, mas vamos voltar para isso.

* Slide 24
  * [Veja a demonstração nº 2](./demos/2-Build_a_Pipeline_With_Notebooks.md)

* Slide 25
  * Aqui está o que criamos, o pipeline do AML
  * Preparação de dados

* Slide 26
  * Etapa de treinamento

* Slide 27
  * Registro do modelo

* Slide 28
  * Também usamos um Conjunto de dados (ou fonte de dados) e a computação

* Slide 29
  * Mas vamos falar sobre como trabalhar em equipe por enquanto.

* Slide 30
  * Algumas de melhores práticas do DevOps que usamos para o desenvolvimento de software também podem se aplicar a projetos de ML, vamos descrevê-las.

* Slide 31
  * Os arquivos do Jupyter Notebook contêm não apenas a entrada, mas também a saída. Isso pode ser confuso e dificultar a mesclagem dos arquivos. Portanto, só queremos as células de entrada, o código que é executado.
  * Também queremos definir tudo em nosso pipeline (o que estamos fazendo)
  * Assim como a infraestrutura — como a computação — e quaisquer dependências, dependências de Python, bibliotecas etc.
  * E, talvez, alguns dados — não todo o lote (porque pode haver muitos PB em projetos de ML), mas o suficiente para experimentar provas de conceito

* Slide 32
  * Uma fonte de dados compartilhada significa que todos os cientistas de dados estão treinando em relação aos mesmos dados de treinamento… e que os dados de treinamento também estão sendo usados para produzir modelos

* Slide 33
  * Vamos falar sobre a integração contínua. Queremos:
  * Saber quando o código muda em nosso repositório de dados
  * Atualizar e executar nosso Pipeline do AML se alterarmos a forma como treinamos
  * Também queremos verificar a qualidade do código — é um código, por isso, queremos testar, fazer lint etc.
  * Também podemos adicionar processos de PR para garantir que o código ainda esteja de acordo, antes de mesclar no mestre (e iniciar um trabalho de treinamento potencialmente caro!)
  * Se você quiser saber mais sobre o Azure DevOps, acesse aqui.

* Slide 34
  * O ponto importante é: tudo se trata de código e software. A qualidade do código é importante, ainda que ele não seja o que você está acostumado a escrever!

* Slide 35
  * [Veja a demonstração nº 3](./demos/3-Show_The_Build_And_Release.md)

* Slide 36
  * Mas ainda não implantamos nada — temos um modelo recém-treinado, como implantá-lo?
  * O Serviço do AML consegue pegar um modelo e implantá-lo no ACI ou no AKS — vamos usá-lo, mas não diretamente na interface do usuário aqui.

* Slide 37
  * Poderíamos adicionar outra etapa ao pipeline do AML, mas não queremos fazer isso — queremos ter um pouco mais de controle sobre a implantação.

* Slide 38
  * A Entrega Contínua pode ser aplicada ao ML.
  * Vamos usar o Azure Pipelines para nossa Entrega Contínua.
  * Quando um novo modelo for registrado, iniciaremos nossa implantação
  * Com o Azure Pipelines, podemos fazer a implantação em locais de teste e de preparo antes de ativar nosso novo modelo
  * Podemos executar testes em ambientes de pré-produção
  * É importante destacar que o que estamos fazendo é controlar a distribuição usando as mesmas técnicas que usamos para os demais softwares.

* Slide 39
  * Não basta colocar seus novos modelos em produção — você não faria isso com seus outros softwares, por que fazer com seu ML?

* Slide 40
  * Veja o que criamos:
  * Um pipeline para treinamento, que é um pipeline do AML, específico para treinar nosso modelo
  * Quando obtemos um novo modelo, iniciamos um pipeline de implantação no Azure DevOps
  * Implante no ACI, faça alguns testes e, se tudo estiver certo, implante no AKS

* Slide 41
  * Assim como fazemos com nossos outros softwares, não queremos simplesmente colocar nosso modelo em produção e abandoná-lo, pressupondo que ele sempre funcionará.
  * Por isso, precisamos de uma estratégia de retreinamento.
  * Seja periodicamente ou quando os dados forem muito diferentes na produção e não estivermos obtendo os resultados desejados.
  * O Serviço do Azure Machine Learning tem a solução para isso

* Slide 42
  * Podemos realizar os treinamentos usando um conjunto de dados de treinamento conhecido
  * Quando implantamos um modelo para produção, podemos armazenar as entradas em outro conjunto de dados — o conjunto de dados da nossa interface

* Slide 43
  * Periodicamente, o Serviço do Azure Machine Learning nos permite comparar esses dois conjuntos de dados em relação ao "descompasso de dados". Se o que você estiver vendo na produção for muito diferente daquilo para o que treinamos nosso modelo, poderemos iniciar um novo processo de treinamento para produzir um novo modelo.
  * Isso pode ser feito automaticamente

* Slide 44
  * Obviamente, caso alteremos nosso código, também convém alterar o pipeline de treinamento, como vimos hoje.

* Slide 45
  * É importante lembrar que este é apenas um exemplo, estamos implantando o modelo para contêineres, mas talvez queiramos inserir os modelos no nosso software
  * Ou, talvez, não estejamos usando o AML, talvez estejamos usando serviços cognitivos diferentes e todos eles tenham excelentes APIs com as quais o Azure Pipelines consegue se comunicar.
  * Por fim, o Azure Pipelines pode organizar qualquer coisa, portanto, seja qual for o conjunto de ferramentas que você esteja usando, você pode usá-lo para gerenciar seu treinamento.

* Slide 46
  * Em resumo

* Slide 47

* Slide 48

* Slide 49

* Slide 50
  * Veja mais recursos e códigos-fonte nestes links

* Slide 51
  * Confira também nossa certificação para se tornar um Cientista de Dados Associado com Certificação do Microsoft Azure e/ou um Engenheiro de IA Associado com Certificação do Microsoft Azure

* Slide 52
  * Pela primeira vez, a Microsoft está oferecendo exames de certificação GRATUITOS para todos os participantes do evento. Aproveite isso para todas as certificações de Conceitos básicos ou Baseadas em funções.
  * A oferta destina-se a um exame gratuito e é válida por até 6 meses após o evento.
  * Use-a em nosso teste no local no salão de exposição do evento ou após o evento usando o mesmo endereço de email da inscrição no evento. (Oficiais do governo não são qualificados para participar.)
  * Aqueles que optaram por receber emails promocionais da Microsoft receberão um email com detalhes após a apresentação.

* Slide 53
