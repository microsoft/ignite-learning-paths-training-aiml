# <a name="aiml20-speaker-notes"></a>AIML20: Anotações do orador

Se você preferir trabalhar com marcadores em vez de texto com script, veja a seguir os pontos principais de cada slide da apresentação do PPT em: https://microsoft.sharepoint.com/:p:/t/CloudDevAdvocacy/EctuTXQCOdpGqc5lhQgUnMgBr-R6hlWR5MuLE3qCIFgoHA?e=r1szwF

Os scripts de demonstração associados são encontrados em: https://github.com/microsoft/ignite-learning-paths/tree/master/aiml/aiml20. Inicie com `DEMO%20Setup.md`.

## <a name="slide-notes"></a>Anotações do slide

Os slides são identificados apenas por títulos.

### <a name="slide-microsoft-ignite-the-tour"></a>SLIDE: Microsoft Ignite the Tour

Slide de orientação de pré-apresentação

### <a name="slide-using-pre-built-ai-to-solve-business-problems"></a>SLIDE: Como usar a IA pré-criada para resolver problemas de negócios

Apresente-se.

Como adicionar recursos de IA a aplicativos, mesmo que você não tenha recursos de computação ou conhecimento em AI.

Usando serviços de IA pré-criados na nuvem.

### <a name="slide-resources"></a>SLIDE: Recursos

Forneceremos muitos links, recursos e demonstrações.

Links para acesso a todo o conteúdo, incluindo o código fonte completo e uma implantação com um clique para o aplicativo.

Este slide será mostrado novamente no final.

### <a name="slide-adding-humanlike-capabilities-to-apps"></a>SLIDE: Como adicionar habilidades humanas aos aplicativos

Usaremos os serviços de IA pré-criados para adicionar recursos de habilidades humanas aos aplicativos, mas o que isso significa? Bem, veja alguns exemplos.

### <a name="slide-enhance-apps-with-humanlike-capabilities"></a>SLIDE: Melhoria de aplicativos com habilidades humanas

[CLIQUE] Dê ao seu aplicativo o poder de fala (por exemplo, chat).
 
[CLIQUE] Dê ao seu aplicativo a capacidade de ver (entender imagens).

[CLIQUE] Dê ao seu aplicativo intuição sobre o comportamento humano (interfaces de adaptação).

[CLICK] Dê ao seu aplicativo o poder da compreensão (comunique-se em qualquer idioma)

[CLIQUE] Automatize o processo humano de verificação de fluxos de dados em busca de anomalias (e escala)

Esses são apenas alguns exemplos.

### <a name="slide-overview-of-azure-cognitive-services"></a>SLIDE: Introdução e visão geral dos Serviços Cognitivos do Azure

São necessários muitos dados e muita experiência técnica para implementar a IA humana?

Não. Aproveite os conhecimentos do Microsoft Research. Adicione capacidades com chamadas simples à API REST. 

Esses são os Serviços Cognitivos do Azure.

### <a name="slide-azure-cognitive-services"></a>SLIDE: Serviços Cognitivos do Azure

Os Serviços Cognitivos do Azure incluem mais de duas dezenas de APIs.

Serviços dentro dessas categorias de capacidades humanas:

Visão: Reconhecimento do conteúdo de fotografias, desenhos, texto, manuscritos e vídeo

Fala: Ferramentas para entender e reconhecer uma fala e gerar uma voz falada natural e semelhante à humana.

Idioma: Entender o conteúdo de documentos e textos por escrito e traduzi-los entre os idiomas humanos.

Decisão: categoria totalmente nova nos Serviços Cognitivos do Azure, que trata de fazer escolhas semelhantes às humanas com relação a dados, conteúdo e interfaces do usuário do aplicativo.

Pesquisa: responder a perguntas de idioma natural sobre o conteúdo de repositórios grandes e não estruturados. 

### <a name="slide-azure-cognitive-services-with-service-names"></a>SLIDE: Serviços Cognitivos do Azure (com nomes de serviço)

Com a "Pesquisa" já inclusa. 

Usamos alguns dos outros serviços disponíveis para aprimorar um site de varejo: [CLIQUE]

Pesquisa Visual Computacional: usado para analisar o conteúdo de fotografias de produtos.

Visão Personalizada: usado para identificar os produtos específicos comercializados pelo varejista.

Personalizador: adaptará automaticamente o layout do nosso site 

Porém, os princípios de configuração e uso dos Serviços Cognitivos são os mesmos para todas as APIs, portanto, o que você vai aprender aqui hoje se aplicará a qualquer um dos serviços de IA que você quiser usar.

### <a name="slide-computer-vision"></a>SLIDE: Pesquisa Visual Computacional

Primeiro, vamos examinar a AI pré-criada para a Pesquisa Visual Computacional.

### <a name="slide-shop-by-photo"></a>SLIDE: Comprar pela foto

Este é o site da Tailwind Traders, um varejista de hardware (e uma empresa fictícia). 

### <a name="slide-demo-shop-by-photo"></a>SLIDE: Demonstração: Comprar pela foto

DEMONSTRAÇÃO: "Definição do problema: comprar pela foto não está funcionando"

### <a name="video-shop-by-photo"></a>VÍDEO: Comprar pela foto

Vamos para o site ativo da Tailwind Traders. [CLIQUE]

Um dos recursos habilitados para IA é chamado "Comprar pela foto". Esse recurso permite que o cliente carregue uma foto de um produto que talvez queira comprar. A ideia é que o aplicativo informe se o produto está disponível. Vamos experimentá-lo agora. Vamos carregar essa imagem de uma broca em que estamos interessados. O aplicativo da Tailwind Traders analisará a imagem, reconhecerá que é uma broca e me mostrará a broca à venda e onde encontrá-la na loja.

Mas vamos tentar fazer isso com outra imagem. Deixe-me retornar à home page, usar o recurso "Comprar pela Foto" novamente e, desta vez, escolher esta imagem de um alicate. A má notícia é que quando o aplicativo analisa essa imagem, ele pensa que é um martelo. Obviamente, isso não deu muito certo e, portanto, vamos ver se podemos descobrir o que deu errado e encontrar uma maneira de corrigir isso usando a Pesquisa Visual Computacional. 

### <a name="slide-how-computer-vision-works"></a>SLIDE: Como funciona a Pesquisa Visual Computacional

Vamos falar um pouco de teoria agora. Sem muita matemática.

É importante entender o que pode dar errado e como corrigir isso.

### <a name="slide-tasks-xkcd-comic"></a>SLIDE: Tarefas (XKCD comic)

(Pausa de 10 segundos)

Há cinco anos, a possibilidade de um computador entender uma foto costumava ser vista como algo saído de um filme de ficção científica.

Agora, isso não só é possível, como é fácil.

### <a name="slide-how-neural-networks-work-brandon-rohrer"></a>SLIDE: Como funcionam as redes neurais (Brandon Rohrer)

Adaptado com permissão de Brandon Rohrer.

Confira o blog dele para ver sua série de tutoriais em vídeo com explicações detalhadas sobre muitos aspectos da IA e do aprendizado de máquina. 

### <a name="slide-computer-vision--convolutional-neural-network"></a>SLIDE: Pesquisa visual computacional/Rede neural convolutiva

A IA é alimentada por "Deep Learning", mas "Deep" não significa "profundo".

Esta é uma rede neural (NN) simples. As do mundo real têm muito mais camadas.

Ela foi projetada para detectar apenas cinco objetos. E não consegue reconhecer muito mais do que isso.

### <a name="slide-trained-convolutional-nn"></a>SLIDE: NN convolutiva treinada

A imagem de entrada aparece à esquerda. 

Cada nó processa e recombina as imagens originais, diminuindo-as até que no final haja um valor único: a confiança na classificação.

Aqui, a entrada é uma bicicleta e o nó à direita com o valor mais alto é "bicicleta". A imagem foi identificada corretamente.

### <a name="slide-filters-1"></a>SLIDE: Filtros (1)

Ignorado devido ao tempo.

### <a name="slide-filters-2"></a>SLIDE: Filtros (2)

Ignorado devido ao tempo.

### <a name="slide-filters-3"></a>SLIDE: Filtros (3)

Ignorado devido ao tempo.

### <a name="slide-training-an-image-classifier"></a>SLIDE: Treinar um classificador de imagens

Mas como treinar uma NN para fazer isso?

[CLIQUE] Escolhendo os filtros certos. Cada filtro é controlado por uma pequena grade de níveis (geralmente 3x3 ou 5x5).

[CLIQUE] Escolhemos os níveis usando muitas imagens de treinamento em que a classificação é conhecida. Escolha os níveis para que a classificação correta seja escolhida (ou pelo menos na maioria das vezes)

Em redes de visão real, pode haver milhões de níveis à escolha. Como determinaremos os níveis?

### <a name="slide-learning-backpropagation"></a>SLIDE: Aprendizado: Propagação reversa

É aqui que entra a matemática pesada.

Mas, a menos que você seja um engenheiro de IA, não precisa se preocupar. Você pode simplesmente usar redes com níveis otimizados por outras pessoas.

Isso se aplica, provavelmente, a 80% dos aplicativos. Mas se precisar projetar sua própria NN e otimizar níveis, há ferramentas próprias para isso, como o Tensorflow e o PyTorch. Saiba mais sobre elas no AIML40 e no AIML50.

### <a name="slide-pre-trained-convolutional-nn"></a>SLIDE: NN convolutiva pré-treinada

Mas desde que você tenha acesso a uma NN que consiga detectar as imagens necessárias, basta fornecer sua imagem e a rede fará a classificação por você.

Alguns modelos fazem mais do que apenas classificar: eles detectam a localização de objetos ou analisam a imagem de outras maneiras.

### <a name="slide-demo-cognitive-services-computer-vision"></a>SLIDE: Demonstração: Pesquisa Visual Computacional dos Serviços Cognitivos

Os Serviços Cognitivos da Pesquisa Visual Computacional fornecem uma NN poderosa que pode classificar muitos milhares de objetos.

Interface do usuário simples baseada na Web que você pode testar em aka.ms/try-computervision

Vamos testar agora.

### <a name="video-computer-vision-via-web"></a>VÍDEO: Pesquisa Visual Computacional via Web

[CLIQUE] Esta é a página da Pesquisa Visual Computacional dos Serviços Cognitivos. Se você rolar essa página um pouco para baixo, encontrará um bom formulário baseado na Web que permitirá carregar uma imagem para análise, seja da Web ou de um arquivo local. Então, vamos tentar carregar essa imagem de um homem usando um capacete. Em apenas alguns segundos, será obtida a análise dessa imagem pelo serviço de Pesquisa Visual Computacional. À esquerda, são mostrados os objetos detectados na imagem; e, à direita, vemos a saída JSON com a análise detalhada. Isso inclui os nomes e locais dos objetos detectados na imagem, uma lista de marcas ou rótulos associados à ela, uma descrição de linguagem sem formatação dela (nesse caso, "um homem usando um capacete") e muitas outras informações úteis.

### <a name="slide-cognitive-services-computer-vision"></a>SLIDE: Pesquisa Visual Computacional dos Serviços Cognitivos

Examinar objetos: dois objetos detectados. O adereço da cabeça e a pessoa.

Veja as marcas. Maior confiança: homem. Em seguida vem o adereço da cabeça. O capacete aparece na sexta colocação.
Modelo não treinado especificamente para "capacete".

Aprenderemos como corrigir isso daqui a pouco.

Se você deseja incorporar a pesquisa em um aplicativo, pode acessar a API programaticamente. Vamos ver como isso acontece.

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

A API da Pesquisa Visual Computacional não funcionará com a compra pela foto. 

Treinado para detectar muitos tipos de objetos.

Felizmente, podemos corrigir esse problema. Vamos voltar para a teoria por um momento.

Existe uma maneira de ajustar um modelo para milhares de objetos e adaptá-lo para detectar apenas o objeto que você deseja. MESMO que eles não façam parte do modelo original. 

Vamos ver como, usando uma técnica de IA chamada de Aprendizado por transferência. 

### <a name="slide-transfer-learning"></a>SLIDE: Aprendizado por transferência

A mesma CNN de antes, com a última camada removida.

A penúltima camada fornece "recursos" – pense como um vetor de números. Cada imagem gera um conjunto diferente de recursos.

Não sei o que os recursos representam, mas eles geralmente são úteis para classificar imagens.

Truque: podemos usar esses recursos para classificar um novo conjunto de objetos.

### <a name="slide-transfer-learning-training-1---with-the-hammer"></a>SLIDE: Treinamento de aprendizado por transferência (1 – com o martelo)

Use o aprendizado por transferência para criar um modelo para identificar martelos e capacetes.

Passe uma foto de um martelo, colete recursos. E um indicador binário para "martelo". Repita o procedimento para muitos martelos.

### <a name="slide-transfer-learning-training-2---with-the-white-hard-hat"></a>SLIDE: Treinamento de aprendizado de transferência (2 – com o capacete branco)

Agora faça o mesmo com as imagens de capacetes.

Em cada caso, colete oito vetores de dados e um indicador binário para cada imagem.

Juntando tudo, você tem uma coleção de vetores de dados, cada um com um resultado binário associado. 

Com isso, você pode criar um modelo preditivo simples.

### <a name="slide-transfer-learning-trained-model"></a>SLIDE: Modelo treinado de aprendizado por transferência

Isso funciona surpreendentemente bem.

Você não precisa de muitas imagens ou conhecimento profundo de computação.

Este é um exemplo simples, mas o princípio também se aplica a modelos grandes.

### <a name="slide-microsoft-cognitive-services-custom-vision"></a>SLIDE: Visão Personalizada de Serviços Cognitivos da Microsoft

Você não precisa treinar um modelo de aprendizado por transferência por conta própria.

Use um dos modelos de visão pré-treinados da Microsoft e adapte-o com imagens de seus próprios objetos, com a Visão Personalizada.

Vamos tentar usá-lo agora para criar um modelo de visão para o recurso Comprar pela Foto.

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

Usamos o ONNX Runtime para integrar o modelo exportado ao site.

### <a name="slide-onnximagesearchtermpredictorcs"></a>SLIDE: ONNXImageSearchTermPredictor.cs

InferenceSession refere-se ao arquivo .onnx exportado

O modelo gera um rótulo de classificação, que é passado para a pesquisa.

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

Hora de mais um exemplo rápido: Personalizador.

O serviço "Personalizador" permite personalizar a interface dos aplicativos em tempo real, pois aprende com o comportamento do usuário.

### <a name="slide-recommended-screenshot"></a>SLIDE: Recomendado (captura de tela)

A seção recomendada mostra uma imagem grande "em destaque", juntamente com algumas imagens menores.

O Personalizador selecionará as seções de pedidos exibidas

Ele usa uma técnica de IA chamada "aprendizado de reforço".

### <a name="slide-personalizer-in-action"></a>SLIDE: Personalizador em ação

A Microsoft vem desenvolvendo o Personalizador há muitos anos. 

Para usá-lo no XBox e no Bing e MSN News.

Agora você também pode usar o Personalizador em seus próprios aplicativos.

### <a name="slide-reinforcement-learning"></a>SLIDE: Aprendizado de reforço

O Personalizador implementa uma técnica de IA chamada Aprendizado de reforço. Veja como ele funciona.

[CLIQUE] Suponha que queiramos exibir uma ação "em destaque" para o usuário. [CLIQUE] O usuário pode não ter certeza do que fazer em seguida, [CLIQUE] mas poderíamos exibir uma das várias sugestões. No caso de um aplicativo de jogo, [CLIQUE] a sugestão pode ser: "jogar um jogo", "assistir a um filme" ou "ingressar em um clã". [CLIQUE] Com base no histórico do usuário e outras informações contextuais — por exemplo, sua localização, a hora do dia e o dia da semana — o serviço do Personalizador [CLIQUE] classificará as ações possíveis e [CLIQUE] sugerirá a melhor para promoção [CLIQUE]. 

Esperamos que o usuário fique feliz [CLIQUE], mas como podemos ter certeza? Isso depende daquilo que o usuário fará a seguir e se isso era algo que queríamos que ele fizesse.
De acordo com nossa lógica de negócios [CLIQUE], atribuiremos uma "pontuação de recompensa" entre 0 e 1 ao que acontece a seguir. Por exemplo, passar mais tempo em um jogo ou lendo um artigo ou gastando mais dinheiro na loja, poderá resultar em pontuações de recompensa mais altas. [CLIQUE] Os feeds do Personalizador retornam informações para o sistema de classificação para a próxima vez que precisarmos apresentar uma atividade.

### <a name="slide-discovering-patterns-and-causality"></a>SLIDE: Como descobrir padrões e causalidade

Não se trata somente de um sistema de recomendação.

O modo de exploração apresenta outras opções na taxa especificada.

Como testes A/B em tempo real.

### <a name="slide-personalizer-for-tailwind-traders"></a>SLIDE: Personalizador para a Tailwind Traders

Contexto: hora do dia, dia da semana e SO do navegador  

Pontuação de recompensa: Um (1) se a categoria em destaque foi clicada e zero, caso contrário.

Explorar dados: 20%

### <a name="slide-demo-personalizer"></a>SLIDE: DEMONSTRAÇÃO: Personalizador

[CLIQUE] Agora, vamos ver o Personalizador em ação. Vamos voltar à home page da Tailwind Traders. O que eu não mencionei antes é que, nesta seção Recomendada, a encomenda dos departamentos de produtos é determinada pelo Personalizador.
Nesse caso, ele está apresentando o departamento Elétrico como a imagem em destaque. Também podemos ver o comportamento do modo "Explorar" se atualizarmos o site algumas vezes.
Aparentemente, o Personalizador atualmente pensa que o Centro de Jardinagem tem a melhor participação de usuários anônimos a essa hora do dia usando o navegador e o sistema operacional que estou usando aqui, mas, eventualmente, ele experimentará outras categorias — aqui, o encanamento foi exibido e o Personalizador também usará isso para medir o envolvimento também.

### <a name="slide-pre-built-ai-in-production"></a>SLIDE: IA predefinida na produção

Conclua algumas considerações sobre como colocar a IA em produção.

### <a name="slide-cost-considerations"></a>SLIDE: Considerações sobre custo

Primeira consideração: custo. 

Você é novo no Azure? Use este link para se inscrever e receber US$ 200 em créditos gratuitos.

[CLIQUE] Cargas de trabalho em escala de desenvolvimento geralmente gratuitas 

[CLIQUE] Os volumes de produção são onde as cobranças serão feitas

[CLIQUE] Detalhes específicos por serviço e região neste link

### <a name="slide-data-considerations"></a>SLIDE: Considerações de dados

Pense em para onde seus dados estão indo e como serão usados.

Os dados são carregados para inferência, mas excluídos imediatamente após o uso. Detalhes neste link.

Se você tiver problemas com a largura de banda ou regulamentação de dados, considere usar os contêineres.

### <a name="slide-deployment-with-containers"></a>SLIDE: Implantação com contêineres

Alguns serviços disponíveis em contêineres para download.

Instale o contêiner atrás do firewall para que nenhum dos seus dados seja direcionado à Microsoft.

A conexão com a internet é usada apenas para cobrança. Cobrado pelas taxas usuais.

### <a name="slide-ethical-considerations"></a>SLIDE: Considerações éticas

Slide mais importante.

Entenda as implicações éticas seus aplicativos de IA que podem afetar às pessoas.

Tenha uma estrutura ética:

*permita* que pessoas alcancem mais com o que já fazem (não substitua pessoas)

Seja *inclusivo* com todos os tipos de usuário: certifique-se de que todos podem se beneficiar igualmente de seu aplicativo e

seja justo e transparente.

Lembre-se de que a eficácia da IA depende dos dados sobre os quais ela foi treinada. Certifique-se de que seu aplicativo funcione para todos os seus usuários em potencial.

Se você não tiver uma estrutura ética configurada, um ótimo lugar para começar seria pelos próprios princípios da Microsoft para inteligência artificial. Leia mais nesse link.

### <a name="slide-wrapping-up"></a>SLIDE: Conclusão

Os modelos predefinidos não podem fazer tudo, mas podem ajudá-lo muito, além de serem rápidos. 

A IA é orientada por dados. Pense sempre no que pode dar errado e mantenha o foco nos dados.

Experimente! Você não precisa ser um expert na área, mas pense nas implicações éticas.

### <a name="slide-docs-alert"></a>SLIDE: Alerta do Docs

Confira o Microsoft Docs para ver todos os detalhes sobre os Serviços Cognitivos do Azure, incluindo guias e referências de introdução.

### <a name="slide-ms-learn-alert"></a>SLIDE: Alerta do MS Learn

E se você quiser aprender a usar os Serviços Cognitivos, existem cursos gratuitos no Microsoft Learn para orientá-lo passo a passo.

### <a name="slide-resources"></a>SLIDE: Recursos

Todos os links e códigos no repositório do Github.

E, se você quiser obter uma Certificação da Microsoft em IA ou ciência de dados, há uma oferta especial de um certificado gratuito para os participantes de hoje: confira este link para saber mais detalhes.

Estarei aqui para responder às perguntas. (E em...)

Obrigado.