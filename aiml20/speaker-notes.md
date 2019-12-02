# <a name="aiml20-speaker-notes"></a>AIML20: Anotações do orador

Estas são as notas para a apresentação do PPT em: https://microsoft.sharepoint.com/:p:/t/CloudDevAdvocacy/EctuTXQCOdpGqc5lhQgUnMgBr-R6hlWR5MuLE3qCIFgoHA?e=r1szwF

Os scripts de demonstração associados são encontrados em: https://github.com/microsoft/ignite-learning-paths/tree/master/aiml/aiml20. Inicie com `DEMO%20Setup.md`.

## <a name="slide-notes"></a>Anotações do slide

Os slides são identificados apenas por títulos.

### <a name="slide-microsft-ignite-the-tour"></a>SLIDE: Tour do Microsoft Ignite

Slide de orientação de pré-apresentação

### <a name="slide-using-pre-built-ai-to-solve-business-problems"></a>SLIDE: Como usar a IA pré-criada para resolver problemas de negócios

Boas-vindas a todos, sou \<nome e afiliação\>. Hoje, falarei sobre como você pode adicionar funcionalidades de inteligência artificial aos seus aplicativos, sem a necessidade de grandes quantidades de poder de computação ou, até mesmo, conhecimento em IA.
Faremos isso usando os serviços pré-criados de IA que estão disponíveis na nuvem e, até mesmo, personalizá-los para nossas necessidades específicas.

(Substitua por seus detalhes de contato neste slide.)

### <a name="slide-resources"></a>SLIDE: Recursos

Na palestra de hoje, incluirei muitos links para informações e recursos, mas não se preocupe se você não conseguir capturá-los durante a apresentação, pois todos os detalhes estão incluídos no Hub de Recursos da Sessão mostrado aqui. Também haverá várias demonstrações, e você poderá experimentá-las por conta própria, porque o código-fonte completo, incluindo um botão de um clique para implantar tudo no Azure, está disponível neste repositório Github. Mostrarei este slide novamente no final da apresentação também; portanto, talvez você queira deixar sua câmera pronta.

### <a name="slide-adding-humanlike-capabilities-to-apps"></a>SLIDE: Como adicionar habilidades humanas aos aplicativos

Usaremos os serviços de IA pré-criados para adicionar recursos de habilidades humanas aos aplicativos, mas o que isso significa? Bem, veja alguns exemplos.

### <a name="slide-enhance-apps-with-humanlike-capabilities"></a>SLIDE: Melhoria de aplicativos com capacidades semelhantes às humanas

[CLIQUE] Você pode dar ao seu aplicativo o poder da fala, digamos, adicionando uma interface de chat.
 
[CLIQUE] Você pode dar ao seu aplicativo a capacidade da visão e do reconhecimento do conteúdo de imagens.

[CLIQUE] Você pode dar ao seu aplicativo a intuição para entender o que, mais provavelmente, os usuários querem fazer e otimizar a interface do usuário automaticamente.

[CLIQUE] Você pode dar ao seu aplicativo o poder da compreensão e DE se comunicar com os usuários, seja qual for o idioma deles.

[CLIQUE] Ou você pode automatizar o processo humano de verificar fluxos de dados em busca de anomalias e tomar uma decisão de acordo.

Esses são apenas alguns exemplos.

### <a name="slide-overview-of-azure-cognitive-services"></a>SLIDE: Introdução e visão geral dos Serviços Cognitivos do Azure

Falamos muito sobre como as técnicas de IA podem ajudar. Mas não serão necessários muitos dados e muito conhecimento técnico para implementar?

Não. Você pode aproveitar a experiência do Microsoft Research, que usou extensivos repositórios de dados dele e especialistas em IA para criar serviços de AI prontos para serem acessados no Azure para você usar por meio de chamadas simples à API REST. 

Esses são os Serviços Cognitivos do Azure.

### <a name="slide-azure-cognitive-services"></a>SLIDE: Serviços Cognitivos do Azure

Os Serviços Cognitivos do Azure incluem mais de duas dezenas de APIs, mas no nível mais amplo, eles oferecem funcionalidades dentro dessas categorias de capacidades humanas:

* Visão: Reconhecimento do conteúdo de fotografias, desenhos, texto, manuscritos e vídeo

* Fala: Ferramentas para entender e reconhecer uma fala e gerar uma voz falada natural e semelhante à humana.

* Idioma: Entenda o conteúdo de documentos e textos por escrito e traduza-os entre os idiomas humanos.

* Decisão: essa é uma categoria totalmente nova nos Serviços Cognitivos do Azure, que trata de fazer escolhas semelhantes às humanas com relação a dados, conteúdo e interfaces do usuário do aplicativo.

* Pesquisa: responder a perguntas de idioma natural sobre o conteúdo de repositórios grandes e não estruturados. 

### <a name="slide-azure-cognitive-services-with-service-names"></a>SLIDE: Serviços Cognitivos do Azure (com nomes de serviço)

A categoria "Pesquisa" foi abordada na palestra anterior deste roteiro de aprendizagem, AIML10. Nesta palestra, falaremos rapidamente sobre apenas alguns dos outros serviços disponíveis e os usaremos para aprimorar o site de um varejista: [CLIQUE]

Pesquisa Visual Computacional, que usaremos para analisar o conteúdo de fotografias de produtos.

Visão Personalizada, que usaremos para identificar os produtos específicos comercializados pelo varejista.

e Personalizador, que adaptará automaticamente o layout do site, observando as preferências do cliente, e apresentará as melhores categorias de produtos primeiro, mesmo para usuários anônimos.

Porém, os princípios de configuração e uso dos Serviços Cognitivos são os mesmos para todas as APIs, portanto, o que você aprender aqui hoje se aplicará a qualquer um dos serviços de IA que você desejará usar.

### <a name="slide-computer-vision"></a>SLIDE: Pesquisa Visual Computacional

Primeiro, vamos examinar a AI pré-criada para a Pesquisa Visual Computacional e como podemos usar para dar a um aplicativo a capacidade de visão e, em seguida, personalizá-lo de acordo com nossas necessidades.

### <a name="slide-shop-by-photo"></a>SLIDE: Comprar pela foto

Este é o site da Tailwind Traders, um varejista de hardware. O site do Tailwind Traders tem muitos dos recursos usuais de comércio eletrônico: a capacidade de navegar pelo catálogo de produtos, solicitar produtos online e encontrar produtos em lojas de varejo.
Mas ele também tem alguns recursos habilitados para IA, como veremos.

Como você já deve ter adivinhado, o Tailwind Traders é uma empresa fictícia, mas isso significa que eu posso fornecer todo o código-fonte para você implantar esse aplicativo por conta própria. Você pode encontrá-lo no link na parte inferior deste slide.

### <a name="slide-demo-shop-by-photo"></a>SLIDE: Demonstração: Comprar pela foto

DEMONSTRAÇÃO: "Definição do problema: Comprar pela foto não está funcionando"

Vamos para o site ativo da Tailwind Traders. [CLIQUE]

Um dos recursos habilitados para IA é chamado "Comprar pela foto". Esse recurso permite que o cliente carregue uma foto de um produto que talvez queira comprar. A ideia é que o aplicativo informe se o produto está disponível. Vamos experimentá-lo agora. Vamos carregar essa imagem de uma broca em que estamos interessados. O aplicativo da Tailwind Traders analisará a imagem, reconhecerá que é uma broca e me mostrará a broca à venda e onde encontrá-la na loja.

Mas vamos tentar fazer isso com outra imagem. Deixe-me retornar à home page, usar o recurso "Comprar pela Foto" novamente e, desta vez, escolher esta imagem de um alicate. A má notícia é que quando o aplicativo analisa essa imagem, ele pensa que é um martelo. Obviamente, isso não deu muito certo e, portanto, vamos ver se podemos descobrir o que deu errado e encontrar uma maneira de corrigir isso usando a Pesquisa Visual Computacional. 

### <a name="slide-how-computer-vision-works"></a>SLIDE: Como funciona a Pesquisa Visual Computacional

Porém, antes de fazermos isso, será útil nos aprofundarmos em um pouco de teoria para entendermos como funciona a Pesquisa Visual Computacional. Mas não se preocupe: haverá poucos cálculos, e um entendimento básico de como funciona a Pesquisa Visual Computacional nos ajudará a entender o que pode dar errado e como corrigir isso.

### <a name="slide-tasks-xkcd-comic"></a>SLIDE: Tarefas (XKCD comic)

(Pausa de 10 segundos)

Não muito tempo atrás, ter a capacidade de dar a um computador uma fotografia e ele ser capaz de nos fornecer informações úteis sobre o que está na imagem era, literalmente, algo da ficção Este XKCD foi publicado em setembro de 2014. Agora, cinco anos depois, um computador pode informar com facilidade se uma foto é de um pássaro, graças ao advento do Big Data, da computação GPU e das redes neurais convolutivas. Vamos ver como isso acontece.

### <a name="slide-how-neural-networks-work-brandon-rohrer"></a>SLIDE: Como funcionam as redes neurais (Brandon Rohrer)

Esta explicação é adaptada com permissão de Brandon Rohrer, que mantém um excelente blog e uma série de tutoriais em vídeo com explicações detalhadas de muitos aspectos da IA e do aprendizado de máquina. Confira o blog de Brandon para obter mais detalhes; só terei tempo para apresentar um resumo aqui.

### <a name="slide-computer-vision--convolutional-neural-network"></a>SLIDE: Pesquisa Visual Computacional/Rede neural convolutiva

Provavelmente, você já ouviu que a IA é ativada por algo chamado "Deep Learning".
O "Deep" de "Deep Learning" não significa "profundo", simplesmente significa que a imagem passa por uma rede neural com muitas camadas quando é analisada. Pronto!

Na tela, há uma rede neural muito simples. Essa tem apenas cinco camadas; os sistemas de visão do mundo real têm muitas dezenas de camadas, talvez centenas. Ela foi projetada para usar uma imagem como entrada e, em seguida, classificá-la exatamente como um destes quatro objetos: cachorro, bicicleta, maçã e bola de tênis. É isso: ela não pode detectar nenhum outro tipo de objeto, exceto aqueles para os quais ela foi treinada a reconhecer.

### <a name="slide-trained-convolutional-nn"></a>SLIDE: NN convolutiva treinada

Quando uma rede neural é treinada, ela passa a imagem de entrada pela rede camada por camada, transformando em cada camada a imagem em imagens diferentes e menores. Cada camada recombina as imagens geradas na camada anterior, e as imagens ficam cada vez menores até que, no final, se resumem a um só pixel com um valor entre 0 e 1. Esse valor representa a confiança que a rede neural tem de que a imagem representa o objeto especificado: quanto mais alto o número, mais confiante ela está.

Nesse caso, inserimos uma imagem de uma bicicleta e o nó "bicicleta" no lado direito é aquele com o valor mais alto. Portanto, parece que essa rede neural foi bem treinada para detectar bicicletas (ou, pelo menos, esta). Mas como "treinar" uma rede neural e como a imagem é transformada ao longo do caminho?

Em cada nó da rede – cada círculo – um filtro é aplicado à imagem.
Essa é basicamente a mesma ideia de um filtro de instantâneo ou um filtro do Instagram, mas em vez de fazer algo útil como aplicar um tom sépia à imagem ou adicionar orelhas de coelho a todos os rostos, ela está fazendo algo... diferente... que foi decidido no processo de treinamento. Vamos nos aprofundar para vermos o que é isso.

### <a name="slide-filters-1"></a>SLIDE: Filtros (1)

Vamos considerar uma imagem simples. Esta é uma imagem de uma cruz. Tem 9 pixels por 9 pixels, e o branco é "+1" e o preto é "-1". Aplicaremos um filtro a essa imagem, da mesma forma como acontece em cada um dos nós da rede neural.

### <a name="slide-filters-2"></a>SLIDE: Filtros (2)

Para transformar essa imagem, aplicaremos uma grade 3x3 de pesos. As grades pequenas como essa normalmente são usadas em sistemas de pesquisa visual computacional: às vezes, 3x3, às vezes, 5x5, e com pesos determinados no processo de treinamento. Essa grade usa apenas os pesos -1 e 1, mas normalmente eles serão mais parecidos com números aleatórios nesse intervalo. [CLIQUE]

Para aplicar os pesos à imagem, sobrepomos a grade de pesos, centralizada em um pixel específico da imagem. [CLIQUE] Em seguida, multiplicamos cada peso por cada valor de pixel e obtém-se a média. Essa média se torna o pixel correspondente na imagem de saída, alinhado ao pixel central da grade de pesos.

Você provavelmente percebeu que não podemos usar as bordas da imagem de entrada como pixels centrais, que é o motivo pelo qual a imagem de saída é menor do que a de entrada por duas linhas e duas colunas. É por isso (juntamente com outros tipos de transformações) que a imagem fica menor e menor à medida que descemos pelas camadas, até que tenha o tamanho de apenas um pixel.

### <a name="slide-filters-3"></a>SLIDE: Filtros (3)

Vamos deslocar a grade de pesos dois pixels para baixo e para a direita. Agora, ao multiplicarmos os pesos pelos pixels de origem e obter a média, tem-se um pixel de saída diferente (0,55). A rede neural varre os pesos nas linhas e colunas da imagem de origem para criar os pixels na imagem de saída.

A propósito, esse processo de varredura do filtro na imagem tem um nome complexo para uma operação matemática simples: convolução. É por isso que elas são chamadas de Redes Neurais Convolutivas.

### <a name="slide-training-an-image-classifier"></a>SLIDE: Treinar um classificador de imagens

Então, agora sabemos que: cada nó (círculo) na rede neural é uma transformação de suas imagens de entrada, o que é determinado por uma grade de pesos. O truque para treinar uma rede neural é escolher esses pesos de forma que os números corretos sejam apresentados no final.

[CLIQUE] Isso será feito com os dados de treinamento: muitas imagens de cachorros, bicicletas, maças e bolas de tênis. Sabemos o que cada imagem representa (porque uma pessoa as examinou e as rotulou ou as "anotou"); portanto, tudo o que fazemos aqui é selecionar pesos de modo que o nó correto obtenha o maior valor em cada caso ou pelo menos, o mais frequente possível.

Mas, em redes de visão real, pode haver milhões de pesos para escolher e milhões de imagens rotuladas a serem computadas em comparação a eles. Como determinaremos os pesos?

### <a name="slide-learning-backpropagation"></a>SLIDE: Aprendizado: Propagação de retorno

Esse é o ponto em que a maioria dos livros sobre aprendizado de máquina se aprofundam na matemática e começam a falar sobre coisas como "propagação de retorno", "taxa de aprendizagem" e "função de custo". Mas, a menos que você seja um pesquisador de inteligência artificial, pode ignorar tudo isso, por dois motivos.

Primeiro, há muitas ferramentas excelentes disponíveis que farão todo esse cálculo para você, ao mesmo tempo que aproveitam recursos avançados de computação, como armazenamentos de Big Data e processadores de GPU. Você provavelmente já ouviu falar de ferramentas como Tensorflow ou Pytorch que fazem isso, e você ouvirá mais informações sobre elas posteriormente neste roteiro de aprendizagem. 

Em segundo lugar, mesmo assim, para fazer uso dessas ferramentas, você precisará de muitos dados de treinamento, dos poderosos recursos de computação e de uma equipe de engenheiros de IA que para usar tudo isso. Em vez disso, você pode simplesmente usar os recursos de um projeto ou de uma empresa que já tenha usado muitos dados, além de computação e experiência para treinar uma rede neural e usá-la por meio de uma API.

### <a name="slide-pre-trained-convolutional-nn"></a>SLIDE: NN convolutiva pré-treinada

Portanto, você pode simplesmente usar o modelo com os pesos predeterminados e, uma vez que seja preciso apenas detectar as classificações de objeto para as quais o modelo é treinado, você está pronto para começar. Basta fornecer sua imagem e usar as classificações geradas pelo modelo pré-treinado. 

Alguns modelos fazem mais do que apenas classificar: eles também podem detectar a localização de objetos dentro de imagens ou analisar a imagem de outras maneiras.

### <a name="slide-demo-cognitive-services-computer-vision"></a>SLIDE: Demonstração: Pesquisa Visual Computacional dos Serviços Cognitivos

Agora, vamos testar um modelo de IA pré-treinado: Pesquisa Visual Computacional dos Serviços Cognitivos. Esse serviço analisará uma imagem fornecida por você e fornecerá marcas (ou classificações) para os objetos que ele detectar. Esses são apenas os rótulos associados às pontuações de confiança principais à direita da rede neural convolutiva de antes, mas agora você está usando uma rede neural poderosa da Microsoft, capaz de identificar muitos milhares de objetos.

Há uma interface do usuário simples baseada na Web que você pode testar em aka.ms/try-computervision, então vamos testá-la agora. Em alguns instantes, também mostrarei como acessar a API programaticamente.

### <a name="video-computer-vision-via-web"></a>VÍDEO: Pesquisa Visual Computacional via Web

[CLIQUE] Esta é a página da Pesquisa Visual Computacional dos Serviços Cognitivos. Se você rolar essa página um pouco para baixo, encontrará um bom formulário baseado na Web que permitirá carregar uma imagem para análise, seja da Web ou de um arquivo local. Então, vamos tentar carregar essa imagem de um homem usando um capacete. Em apenas alguns segundos, será obtida a análise dessa imagem pelo serviço de Pesquisa Visual Computacional. À esquerda, são mostrados os objetos detectados na imagem; e, à direita, vemos a saída JSON com a análise detalhada. Isso inclui os nomes e locais dos objetos detectados na imagem, uma lista de marcas ou rótulos associados à ela, uma descrição de linguagem sem formatação dela (nesse caso, "um homem usando um capacete") e muitas outras informações úteis.

### <a name="slide-cognitive-services-computer-vision"></a>SLIDE: Pesquisa Visual Computacional dos Serviços Cognitivos

Aqui, na seção Objetos da saída, vemos que dois objetos foram detectados na imagem: alguns acessórios para a cabeça e uma pessoa.

O maior interesse é na seção "marcas", que fornece classificações para a imagem geral, juntamente com pontuações de confiança. Nesse caso, a classificação com a maior confiança, após "homem", é "cocar", que não é exatamente do que precisamos para o aplicativo Comprar pela foto: estávamos procurando por "capacete".
Infelizmente, essa API não é treinada para detectar capacetes, apenas elmos, e essa é apenas a sexta classificação mais confiável aqui. Aprenderemos como corrigir isso daqui a pouco.

Mas se você quiser incorporar recursos de visão em um aplicativo, em vez de usar um formulário da Web, o melhor é acessar o API da Pesquisa Visual Computacional programaticamente.
Vamos ver como isso acontece.

### <a name="video-computer-vision-via-cli"></a>VÍDEO: Pesquisa Visual Computacional via CLI

Você pode fazer interface com as APIs de serviço cognitivo usando qualquer linguagem que possa se conectar a um ponto de extremidade HTTP, mas o que tenho aqui [CLIQUE] é um script bash que usa a CLI do Azure para criar recursos e se conecta à API da Pesquisa Visual Computacional usando "Ondulação". Você pode instalar a CLI do Azure no seu shell local, mas, aqui, estou usando a extensão da “conta do Azure” no Visual Studio Code para inicializar um Cloud Shell, o que significa que eu não preciso instalar nada. Quando o shell estiver pronto, eu poderei executar comandos diretamente desse script bash. 

Esse primeiro comando cria um grupo de recursos, que usarei para manter as chaves de que preciso para autenticar a API.

A próxima etapa é criar as chaves. Aqui, estou criando uma chave dos Serviços Cognitivos do Omnibus que posso usar com muitos serviços, incluindo Pesquisa Visual Computacional.

Em seguida, podemos exibir a chave diretamente no terminal. [AGUARDE] Você pode usar qualquer uma dessas chaves para fazer a interface com a API, então vou salvar a primeira aqui em uma variável de ambiente.

Com essa chave, podemos nos conectar à URL do ponto de extremidade fornecida pelo serviço de Pesquisa Visual Computacional, portanto, vamos salvar essa URL em uma variável de ambiente também.

Em seguida, você pode escolher uma imagem para analisar. Aqui, fornecemos a URL de uma imagem, a mesma imagem de um homem usando um capacete que vimos há pouco.

Agora, podemos passar a chave e a imagem da URL para o ponto de extremidade passando uma entrada JSON usando ondulação. E, em apenas alguns milissegundos, obtemos a análise da imagem como JSON. Você pode ver as mesmas saídas que acabamos de ver na interface da Web.

Claro que podemos fazer isso com qualquer imagem que quisermos. Vamos tentar fazer isso novamente com uma imagem diferente, nesse caso, a imagem de uma broca. Mais uma vez, podemos passar isso para a API usando a ondulação. [AGUARDE] Curiosamente, a marca superior associada a essa imagem é "câmera", o que, infelizmente, não nos ajudaria a pesquisar a ferramenta real: queremos "broca".

### <a name="slide-adapting-computer-vision-models-with-your-own-data"></a>SLIDE: Adaptar modelos de Pesquisa Visual Computacional com seus próprios dados

Agora, você pode ver por que a API da Pesquisa Visual Computacional pode não ser a melhor opção para o recurso Comprar pela foto da Tailwind Traders. Em alguns casos, o modelo de visão usado não foi treinado para identificar os produtos específicos que a Tailwind Traders vende. Em outros casos, ele foi treinado para detectar *muitos* tipos diferentes de objetos, e o tipo incorreto está sendo encontrado. Como você acabou de ver, considerando uma imagem de uma broca, ele nos retornou a marca "câmera", um produto que a Tailwind Traders não vende.

Felizmente, podemos corrigir esse problema. Vamos voltar para a teoria por um momento.

E se eu dissesse que existe uma forma de iniciar com um modelo de visão que foi pré-treinado para identificar milhares de imagens e adaptá-lo para identificar apenas os objetos nos quais você está interessado, mesmo que esses objetos não sejam parte dos dados de treinamento do modelo original. Eu sei que isso parece estranho, mas vamos ver como pode funcionar.

### <a name="slide-transfer-learning"></a>SLIDE: Aprendizado por transferência

Aqui temos a rede neural convolutiva treinada anteriormente, mas há algo diferente: a camada final com as classificações de objeto foi eliminada. O que restou são as imagens da segunda camada. Podemos ignorar o fato de que se tratam de imagens — digamos, imagens 3x3 — e apenas considerá-las como dados. Agora, quando inserimos uma imagem no lado esquerdo, em vez de obter pontuações de confiança, obtemos uma coleção de matrizes ou "recursos", cada uma com 9 pontos de dados. Nessa rede hipotética, elas são rotuladas como F1, F2... até F8.
Cada imagem que você coloca no lado esquerdo gera uma coleção diferente de recursos no lado direito.

Não sabemos realmente o que *são* esses recursos, mas o que sabemos é que eles são úteis, pois eram úteis para classificar todos os tipos de imagem para os quais a rede neural estava *originalmente* treinada. Quem sabe: um recurso pode representar "verde" e foi útil para classificar árvores e bolas de tênis.
Outro pode contar o número de regiões em formato de círculo na imagem e foi útil na classificação de bicicletas e semáforos. O ponto é: esses recursos não foram definidos com antecedência; eles foram _aprendidos_ dos dados de treinamento e são úteis para classificar imagens _em geral_. 

E eis o truque: podemos usar esses recursos para classificar objetos para os quais a rede original não tinha sido treinada ainda.

### <a name="slide-transfer-learning-training-1---with-the-hammer"></a>SLIDE: Treinamento de aprendizado de transferência (1 – com o martelo)

Vamos supor que queremos um novo modelo para identificar martelos e capacetes. Podemos passar imagens de um martelo na esquerda e coletar os recursos na direita. Nesse caso, obtemos oito vetores de dados (um para cada recurso) e um indicador binário do tipo de objeto. Podemos repetir isso em várias imagens diferentes de um martelo e coletar os vetores de dados e o indicador binário todas as vezes.

### <a name="slide-transfer-learning-training-2---with-the-white-hard-hat"></a>SLIDE: Treinamento de aprendizado de transferência (2 – com o capacete branco)

Agora vamos fazer o mesmo com imagens de capacetes. Novamente, em cada caso, coletamos oito vetores de dados e um indicador binário para cada imagem.

Se juntarmos tudo isso, temos o quê? Uma coleção de vetores de dados, cada um com um resultado binário associado. Caso tenha executado alguma ciência de dados, você pode adivinhar o que acontece em seguida: poderíamos criar um modelo de previsão simples, como uma regressão logística ou uma rede neural de uma camada para prever as novas classificações de objeto dos recursos.

### <a name="slide-transfer-learning-trained-model"></a>SLIDE: Modelo treinado de aprendizado por transferência

Isso geralmente funciona surpreendentemente bem. Você nem precisa de muitos dados – algumas dezenas de imagens geralmente darão conta do trabalho, desde que as categorias que você deseja prever sejam bastante distintas. E você não precisa de muita capacidade computacional para prever centenas de resultados binários de uma quantidade relativamente pequena de dados.

É claro que esse é um exemplo hipotético: você provavelmente desejará identificar mais de dois objetos, e a rede neural subjacente certamente gerará muitos mais do que oito recursos em sua segunda à última camada. Mas o princípio permanece: você pode fazer isso com dados novos e modestos e capacidade de computação, o que, geralmente, funciona muito bem.

### <a name="slide-microsoft-cognitive-services-custom-vision"></a>SLIDE: Visão Personalizada de Serviços Cognitivos da Microsoft

Claro que você não precisa treinar um modelo de aprendizado de transferência por conta própria. Você pode usar os modelos de visão avançada de Pesquisa Visual Computacional dos Serviços Cognitivos como base e fornecer suas próprias imagens e classificações para o serviço chamado Visão Personalizada.

Assim como com a Pesquisa Visual Computacional, você pode treinar os modelos de aprendizado de transferência de modo programático usando a API, mas a Visão Personalizada também fornece uma interface do usuário da Web conveniente para modelos de treinamento. Agora vamos usar isso para treinar um modelo para o recurso Comprar pela foto do Tailwind Traders.

### <a name="slide-demo-customized-object-recognition"></a>SLIDE: Demonstração: Reconhecimento de objeto personalizado

Instruções de demonstração: https://github.com/microsoft/ignite-learning-paths/blob/master/aiml/aiml20/DEMO%20Custom%20Vision.md

### <a name="video-customvisionai"></a>VÍDEO: customvision.ai

[CLIQUE] Agora eu estou aqui na interface baseada na Web da Visão Personalizada. Ela nos fornece uma boa interface do usuário, na qual podemos fornecer novas imagens para a análise de aprendizado de transferência. E você pode ver que, nesse projeto, eu já carreguei várias imagens. Eu carreguei imagens de chave de fenda, alicates, brocas e martelo, que vou usar para treinar meu modelo personalizado. Também gostaríamos de detectar um outro produto vendido pela Tailwind Traders: capacetes. Então, vamos clicar em "adicionar imagens", navegar até uma pasta no meu disco rígido na qual coletei algumas fotos de capacetes, selecionar todas elas e adicioná-las ao serviço enquanto fornecemos o rótulo "capacete" para uso no treinamento.

Demorará um pouco para carregar esses arquivos, mas enquanto isso é feito, observe que não há tantas imagens neste projeto: cerca de 180 ou algumas dezenas para cada uma das cinco categorias. Às vezes, até menos. Apesar disso, como meus cinco tipos de objeto são bem distintos, o modelo deve funcionar muito bem.

Vamos agora clicar no botão Treinar para iniciar o aprendizado de transferência. Escolheremos Treinamento Rápido. Agora estamos executando todas essas imagens por meio de um modelo de visão complexo e usando o aprendizado de transferência para criar um modelo preditivo para nossas cinco categorias. Demora apenas alguns segundos, e nosso modelo faz isso muito bem!
O limite de probabilidade define um limite abaixo do qual não preveremos nenhuma classificação. Se aceitarmos apenas as classificações com 50% de confiança ou mais, 90,9% dessas previsões estarão corretas: isso é "Precisão". E o modelo classifica corretamente 88,2% de nossas imagens em geral: isso é "Recall". Em seus aplicativos, você escolherá um limite de acordo com sua tolerância para fazer a escolha errada em vez de não fazer escolha nenhuma. Para a Tailwind Traders, podemos definir o limite no lado mais baixo, porque não é um problema tão grande sugerir o produto errado a um cliente. Se esse aplicativo fosse um detector de câncer, provavelmente a escolha seria diferente.

Agora vamos testar nosso modelo em algumas imagens novas que ele não viu antes. Para isso, clicamos no botão "Teste rápido". Vamos carregar um novo arquivo da nossa pasta "imagens de teste". Vamos testar a imagem do homem com capacete. E você pode ver que nossa previsão é, de fato, de um "capacete", com probabilidade de 99,9%. Portanto, essa escolha seria feita com praticamente qualquer limite escolhido.

Vamos tentar uma imagem diferente: a broca. Nosso modelo identifica a imagem como uma broca com probabilidade de 94,5%. E, por fim, vamos tentar a imagem do alicate, que ele identifica com a confiança de 99,9%.

Portanto, nosso modelo funciona bem, mesmo que tenha sido treinado com menos de 200 imagens.
Isso porque restringimos os possíveis rótulos apenas aos produtos que vendemos na Tailwind Traders.

Agora que estamos satisfeitos com nosso modelo, podemos exportá-lo e incorporá-lo ao nosso aplicativo. Se você clicar no botão Exportar, poderá exportar o modelo para iOS ou Android como um contêiner, ou em nosso caso, no formato ONNX universal. Então, agora baixamos o modelo para o disco rígido.

### <a name="slide-portable-deep-learning-models"></a>SLIDE: Modelos de aprendizado profundo portáteis

Exportamos nosso modelo personalizado no formato ONNX.

A ONNX, ou Open Neural Network Exchange, é um padrão aberto lançado pela Microsoft e pelo Facebook para promover a troca e a implantação livre de modelos de IA e com suporte de uma ampla variedade de aplicativos e fornecedores de tecnologia.

Agora que treinamos nosso modelo de visão personalizada, vamos integrá-lo ao aplicativo da Tailwind Traders. Para isso, usaremos o Runtime do ONNX, um mecanismo de inferência de software livre que fornece funções para gerar previsões de modelos no formato ONNX.

### <a name="slide-onnximagesearchtermpredictorcs"></a>SLIDE: OnnxImageSearchTermPredictor.cs

Agora que criamos nosso modelo personalizado, podemos chamá-lo no aplicativo usando sua API. Aqui, criamos uma nova "Sessão de Inferência" do arquivo ONNX que geramos e, em seguida, geramos um rótulo de classificação da imagem carregada como uma cadeia de caracteres.
Em seguida, basta passá-lo para o recurso de pesquisa existente do site da Tailwind Traders e exibir os resultados.

```csharp 
var session = new InferenceSession(filePath);

...

var output = session.Run(new[] { input });
var prediction = output
    .First(i => i.Name == "classLabel")
    .AsEnumerable<string>()
    .First();
```

### <a name="slide-demo-onnx"></a>SLIDE: DEMONSTRAÇÃO: ONNX

DEMONSTRAÇÃO: Implantação de ONNX

### <a name="video-kudu"></a>VÍDEO: Kudu

[CLIQUE] O modelo que acabamos de exportar da Visão Personalizada é, na verdade, um arquivo ZIP com o arquivo ONNX atual, model.onnx, que é a representação de texto da rede neural que acabamos de criar e também um arquivo de manifesto. 

O site existente da Tailwind Traders já usa um modelo de pesquisa visual computacional representado como um arquivo ONNX chamado products.onnx. O problema é que o modelo não reconhece corretamente muitos dos produtos vendidos na Tailwind Traders. Então pegaremos o arquivo model.onnx que acabamos de exportar da Visão Personalizada, renomeá-lo para products.onnx e substituí-lo em nosso aplicativo Web para que o recurso Comprar pela foto possa reconhecer todos os cinco produtos para os quais o treinamos.

Aqui, no portal do Azure, você pode ver o recurso do Serviço de Aplicativo que executa o site da Tailwind Traders. O que eu posso fazer agora nesse Serviço de Aplicativo é ir até a seção Ferramentas de desenvolvimento e escolher o recurso Ferramentas avançadas. Isso inicia a interface Kudu. Agora que ela foi iniciada, posso navegar pelo sistema de arquivos do site usando o console de depuração. Vamos navegar até o site, w-root, Standalone, OnnxModels, onde o arquivo products.onnx está localizado. Agora, podemos substituí-lo pela nova versão do arquivo products.onnx que criamos com a Visão Personalizada.

Agora, retornando ao Serviço de Aplicativo, podemos continuar e reiniciar o servidor Web, o que fará com que ele use o novo modelo ONNX no recurso Compra pela foto.

### <a name="video-netron"></a>VÍDEO: Netron

[CLIQUE] Enquanto estamos aguardando a reinicialização do site, vamos dar uma olhada no modelo de ONNX que acabamos de instalar. Há um ótimo pequeno aplicativo Web da Lutz Roeder chamado Netron, que nos permite inspecionar as redes neurais em arquivos ONNX. Então, vamos seguir em frente e abrir o arquivo products.onnx. Aqui, você pode ver as camadas reais da rede neural representada pelo modelo. Vamos ampliar um pouco e dar uma olhada na entrada na parte superior. A entrada é uma imagem. Trata-se de uma imagem RGB de 3 camadas, com 224x224 pixels de tamanho. Na verdade, eu tive de cortar e reduzir verticalmente a imagem fornecida pelo usuário antes de fornecê-la ao runtime do ONNX. Um segredinho aqui é que os sistemas de pesquisa visual do computador têm uma visão ruim — eles trabalham com um nível muito baixo de resoluções de imagem — mas, apesar disso, ainda funcionam bem.

Agora, vamos reduzir e percorrer a rede. Você pode ver todas as camadas na rede neural criada pela visão personalizada, com cada camada transformando a imagem de entrada, aplicando filtros e recombinando as imagens de saída, assim como você aprendeu anteriormente nesta apresentação. Mas quando você chega à camada de saída no final, pode ver que a saída é uma lista de cinco valores — produtos que usamos para treinamento: martelo, capacete e assim por diante — juntamente com esse valor rotulado como "perda", que é a confiança que o modelo prevê para cada categoria. Em seu aplicativo, você escolherá seu próprio limite de quão alta a confiança precisa ser.

De qualquer forma, agora que o site da Tailwind Traders foi reiniciado, vamos voltar para a home page e ver como funciona nosso novo modelo de visão. Agora vamos carregar uma foto e testar novamente uma de nossas imagens de teste, especificamente a nossa imagem de alicates que não funcionava bem antes. Podemos ver que, em vez de imaginar que era um martelo, o site pesquisou por "alicates" e me mostrou todos os produtos em oferta.

### <a name="slide-optimizing-app-ui-with-cognitive-services-personalizer"></a>SLIDE: Otimização da interface do usuário do aplicativo com o Personalizador dos Serviços Cognitivos

Temos tempo para apenas mais um exemplo rápido de IA predefinida, desta vez na "Categoria de Decisão" dos Serviços Cognitivos. O serviço do "Personalizador" permite personalizar a interface dos aplicativos em tempo real, equilibrando o que o usuário provavelmente deseja fazer, juntamente com as coisas *que gostaríamos* que o usuário fizesse.

### <a name="slide-recommended-screenshot"></a>SLIDE: Recomendado (captura de tela)

Podemos ver como isso pode funcionar na seção "Recomendado" do site da Tailwind Traders. Ele mostra uma seleção dos departamentos disponíveis na loja: uma é uma imagem "em destaque" grande, juntamente com algumas imagens menores.

O serviço do Personalizador escolherá como essas seções serão exibidas de acordo com uma técnica de IA chamada "aprendizado de reforço".

### <a name="slide-personalizer-in-action"></a>SLIDE: Personalizador em ação

O Personalizador está em desenvolvimento na Microsoft há muitos anos. Ele é usado em dispositivos Xbox para determinar quais atividades são apresentadas na home page, como jogar um jogo instalado, comprar um novo jogo na loja ou assistir outras pessoas jogando no Mixer. Desde a introdução do Personalizador, a equipe do Xbox viu um aumento significativo nas principais métricas de participação.

O Personalizador também é usado para otimizar o posicionamento dos anúncios na pesquisa do Bing e artigos apresentados no MSN Notícias demonstrando, novamente, ótimos resultados no aprimoramento do envolvimento dos usuários.

Agora você também pode usar o Personalizador em seus próprios aplicativos.

### <a name="slide-reinforcement-learning"></a>SLIDE: Aprendizado de reforço

O Personalizador implementa uma técnica de IA chamada Aprendizado de reforço. Veja como ele funciona.

[CLIQUE] Suponha que queiramos exibir uma ação "em destaque" para o usuário. [CLIQUE] O usuário pode não ter certeza do que fazer em seguida, [CLIQUE] mas poderíamos exibir uma das várias sugestões. No caso de um aplicativo de jogo, [CLIQUE] a sugestão pode ser: "jogar um jogo", "assistir a um filme" ou "ingressar em um clã". [CLIQUE] Com base no histórico do usuário e outras informações contextuais — por exemplo, sua localização, a hora do dia e o dia da semana — o serviço do Personalizador [CLIQUE] classificará as ações possíveis e [CLIQUE] sugerirá a melhor para promoção [CLIQUE]. 

Esperamos que o usuário fique feliz [CLIQUE], mas como podemos ter certeza? Isso depende daquilo que o usuário fará a seguir e se isso era algo que queríamos que ele fizesse.
De acordo com nossa lógica de negócios [CLIQUE], atribuiremos uma "pontuação de recompensa" entre 0 e 1 ao que acontece a seguir. Por exemplo, passar mais tempo em um jogo ou lendo um artigo ou gastando mais dinheiro na loja, poderá resultar em pontuações de recompensa mais altas. [CLIQUE] Os feeds do Personalizador retornam informações para o sistema de classificação para a próxima vez que precisarmos apresentar uma atividade.

### <a name="slide-discovering-patterns-and-causality"></a>SLIDE: Como descobrir padrões e causalidade

Mas esse não é apenas um sistema de recomendação que tem o risco de apresentar ao usuário o que ele já sabe que gosta. E as coisas que ele gostaria, mas não conhece? O Personalizador geralmente está no modo Aproveitar em que a melhor atividade é recomendada com base no histórico e no contexto, mas, às vezes, também entra no modo Explorar e apresenta ao usuário coisas novas que ele, de outra forma, podem não ver. É como um sistema de teste A/B automatizado, mas com mais de duas ramificações, todas testadas em tempo real.

Você controla qual porcentagem do tempo o modo Explorar estará ativado para ajudar o usuário a descobrir novos conteúdos ou recursos.

### <a name="slide-personalizer-for-tailwind-traders"></a>SLIDE: Personalizador para a Tailwind Traders

Em nosso aplicativo da Tailwind Traders, para usuários anônimos, usaremos a hora do dia, o dia da semana e o sistema operacional do navegador como "contexto" para influenciar as classificações. Para a pontuação de recompensa, usaremos se a seção em destaque foi clicada ou não. Nesse código fornecemos uma pontuação de recompensa de 1 se a categoria em destaque foi clicada e, caso contrário, zero.

Com o tempo, o Personalizador determinará a melhor categoria a ser destacada para usuários anônimos com base na hora do dia, dia da semana e sistema operacional. Ele também "explorará" 20% do tempo para exibir categorias que, de outra forma, não seriam apresentadas.

### <a name="slide-demo-personalizer"></a>SLIDE: DEMONSTRAÇÃO: Personalizador

[CLIQUE] Agora, vamos ver o Personalizador em ação. Vamos voltar à home page da Tailwind Traders. O que eu não mencionei antes é que, nesta seção Recomendada, a encomenda dos departamentos de produtos é determinada pelo Personalizador.
Nesse caso, ele está apresentando o departamento Elétrico como a imagem em destaque. Também podemos ver o comportamento do modo "Explorar" se atualizarmos o site algumas vezes.
Aparentemente, o Personalizador atualmente pensa que o Centro de Jardinagem tem a melhor participação de usuários anônimos a essa hora do dia usando o navegador e o sistema operacional que estou usando aqui, mas, eventualmente, ele experimentará outras categorias — aqui, o encanamento foi exibido e o Personalizador também usará isso para medir o envolvimento também.

### <a name="slide-pre-built-ai-in-production"></a>SLIDE: IA predefinida na produção

Vimos algumas maneiras de usar a IA predefinida para aprimorar seus aplicativos com capacidades semelhantes às humanas. Vamos encerrar com alguns pontos que você deve considerar se planeja implantar esses aplicativos em um aplicativo de produção, possivelmente com recursos em tempo real para milhões de usuários.

### <a name="slide-cost-considerations"></a>SLIDE: Considerações sobre custo

Provavelmente, a primeira coisa que você quer pensar é: quanto tudo isso vai custar?

[CLIQUE] Se você estiver apenas experimentando coisas como um "desenvolvedor faria", que são pequenas quantidades de dados, algumas tentativas aqui e ali, isso geralmente é GRATUITO. 

[CLIQUE] Para volumes de produção, você será cobrado por volume e taxa, de acordo com o serviço que estiver usando.

[CLIQUE] Veja mais detalhes sobre preços nesse link. Verifique se há preços exatos para seu serviço e região

Se você for novo no Azure e quiser brincar com esses serviços, inscreva-se por meio desse link e receba US$ 200.

(Este slide destina-se a fornecer uma visão geral do "modelo" de preços nos serviços cognitivos. Os participantes devem verificar o link específico para ver o preço exato do serviço que desejam usar.)

### <a name="slide-data-considerations"></a>SLIDE: Considerações de dados

Talvez você também queira saber para onde seus dados estão indo e como serão usados.

Seus dados, como imagens ou texto, serão carregados no Azure para inferência, mas nunca serão armazenados pelos Serviços Cognitivos. Este link fornece todos os detalhes sobre conformidade regulatória e privacidade. Mas se você trabalha em um setor regulamentado, como a medicina, onde os dados não podem sair do firewall, há outra opção: contêineres.

### <a name="slide-deployment-with-containers"></a>SLIDE: Implantação com contêineres

Alguns dos Serviços Cognitivos estão disponíveis para uso como um contêiner independente. Você pode simplesmente baixar a imagem do contêiner, implantá-la atrás do firewall e, posteriormente, usar os pontos de extremidade locais que ela fornece, exatamente como você faz no Azure. A diferença é que os dados nunca deixam sua própria rede. O contêiner só se conecta ao Azure para fins de cobrança, o uso é cobrado exatamente da mesma maneira que no próprio Azure.

### <a name="slide-ethical-considerations"></a>SLIDE: Considerações éticas

Guardei o slide mais importante de hoje para o final. Você viu como é fácil integrar recursos avançados de IA em seus aplicativos. Mas, com grande poder vêm uma grande responsabilidade, e é extremamente importante entender o impacto que seu aplicativo terá nas pessoas e considerar as implicações éticas.

Se você trabalha com tecnologias de IA, deveria estar trabalhando em uma estrutura ética que:

* Concentra-se em *permitir* que as pessoas obtenham mais no que elas já fazem em vez de substituir humanos por IA

* *Inclua* todos os tipos de usuários para que todos possam se beneficiar igualmente do aplicativo e

* Seja justa e transparente e, especialmente, não marginalize grupos sub-representados. Lembre-se do que aprendemos anteriormente: A IA é tão boa quanto os dados a partir dos quais ela foi treinada e você precisa ter certeza que seu aplicativo funciona para todos os usuários em potencial, independentemente de quem eles sejam ou da aparência.

Se você não tiver uma estrutura ética configurada, um ótimo lugar para começar seria pelos próprios princípios da Microsoft para inteligência artificial. Leia mais nesse link.

### <a name="slide-wrapping-up"></a>SLIDE: Conclusão

É fácil adicionar capacidades semelhantes às humanas à IA predefinida. Os modelos predefinidos não podem fazer tudo, mas podem ajudá-lo muito, além de serem rápidos. Posteriormente, aprenderemos sobre modelos personalizados para os 20% restantes neste caminho de aprendizagem.

A IA é poderosa, mas não é mágica. Ela é controlada por dados e, essencialmente, sua matemática é bastante simples. Tenha sempre os dados em mente e use-os para ajudá-lo a entender o que está acontecendo. Em particular, lembre-se que mesmo a melhor IA pode cometer erros, especialmente em grupos que não estão bem representados nos dados de treinamento.

Por fim, experimente! Você não precisa de muita experiência para começar. No entanto, todos precisam pensar nas implicações éticas da IA e como ela afeta as pessoas, portanto, certifique-se de ter desenvolvido uma estrutura ética para usar a IA e siga-a.

### <a name="slide-docs-alert"></a>SLIDE: Alerta do Docs

Confira o Microsoft Docs para ver todos os detalhes sobre os Serviços Cognitivos do Azure, incluindo guias e referências de introdução.

### <a name="slide-ms-learn-alert"></a>SLIDE: Alerta do MS Learn

E se você quiser aprender a usar os Serviços Cognitivos, existem cursos gratuitos no Microsoft Learn para orientá-lo passo a passo.

### <a name="slide-resources"></a>SLIDE: Recursos

Para encontrar links para o Docs e o Learn e para todos os recursos que mencionei nesta palestra, confira o link Recursos da Sessão neste slide. Você também pode executar todas as demonstrações de hoje por meio do código e dos scripts disponíveis neste repositório do github. E, se você quiser obter uma Certificação Microsoft em IA ou Ciência de Dados, há uma oferta especial de um certificado gratuito para os participantes de hoje: confira este link para conhecer detalhes.

Obrigado.
