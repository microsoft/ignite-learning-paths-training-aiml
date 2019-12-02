# <a name="using-pre-built-ai-to-understand-images"></a>Como usar a IA pré-criada para entender imagens

Nesta demonstração, usaremos a Pesquisa Visual Computacional do Azure para detectar o tipo de objeto que uma imagem representa. 

Primeiro, usaremos o formulário Web online da Pesquisa Visual Computacional para carregar uma imagem e observar os resultados.

Em seguida, usaremos a API da Pesquisa Visual Computacional para coletar as mesmas informações de maneira programática, usando uma ondulação.

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>Definição do problema: Comprar pela Foto não funciona bem

O problema que motiva essa conversa é que a ferramenta Comprar pela Foto no site da Tailwind Traders não está identificando os produtos corretamente. É útil executar agora esta seção na [Implantação do ONNX](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right) para definir a cena.

## <a name="using-computer-vision-via-the-web-interface"></a>Como usar a Pesquisa Visual Computacional por meio da interface da Web

Vamos tentar usar a pesquisa visual computacional em uma imagem de um produto de hardware. Se pudermos identificar um produto que a Tailwind Traders vende por nome, poderemos pesquisar esse nome no catálogo para o aplicativo "Comprar pela Foto".

1. Visite a página da Web da Pesquisa Visual Computacional em [https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=msignitethetour2019-github-aiml20)

2. Role para baixo até a seção "Analisar uma Imagem". Ela tem esta aparência:

!["Pesquisa Visual Computacional: analisar uma imagem"](img/Computer%20Vision%20Analyze%20an%20Image.png)

3. Clique no botão "Procurar" e escolha "homem com capacete.jpg" na pasta "imagens de teste" em "Imagens de Treinamento de CV".

4. Após alguns instantes, a análise da imagem será exibida no painel direito. Ela tem esta aparência:

```
FEATURE NAME:   VALUE

Objects [ { "rectangle": { "x": 138, "y": 27, "w": 746, "h": 471 }, "object": "headwear", "confidence": 0.616 }, { "rectangle": { "x": 52, "y": 33, "w": 910, "h": 951 }, "object": "person", "confidence": 0.802 } ]

Tags    [ { "name": "man", "confidence": 0.999212 }, { "name": "headdress", "confidence": 0.99731946 }, { "name": "person", "confidence": 0.995057464 }, { "name": "clothing", "confidence": 0.991814733 }, { "name": "wearing", "confidence": 0.9827137 }, { "name": "hat", "confidence": 0.9691986 }, { "name": "helmet", "confidence": 0.9227209 }, { "name": "headgear", "confidence": 0.840476155 }, { "name": "personal protective equipment", "confidence": 0.8358513 }, { "name": "looking", "confidence": 0.832229853 }, { "name": "hard hat", "confidence": 0.8004248 }, { "name": "human face", "confidence": 0.785058737 }, { "name": "green", "confidence": 0.774940848 }, { "name": "fashion accessory", "confidence": 0.706475437 } ]

Description { "tags": [ "man", "headdress", "person", "clothing", "wearing", "hat", "helmet", "looking", "green", "jacket", "shirt", "standing", "head", "suit", "glasses", "yellow", "white", "large", "phone", "holding" ], "captions": [ { "text": "a man wearing a helmet", "confidence": 0.8976638 } ] }

Image format    "Jpeg"

Image dimensions    1000 x 1000

Clip art type   0

Line drawing type   0

Black and white false

Adult content   false

Adult score 0.0126242451

Racy    false

Racy score  0.0156497136

Categories  [ { "name": "people_", "score": 0.69140625 } ]

Faces   [ { "age": 37, "gender": "Male", "faceRectangle": { "top": 419, "left": 363, "width": 398, "height": 398 } } ]

Dominant color background   "White"

Dominant color foreground   "White"

Accent Color    #90A526
```

(Observe que a análise acima pode mudar no futuro: o modelo de Pesquisa Visual Computacional é atualizado regularmente.)

Observe que no primeiro resultado de "Objetos", dois objetos "touca" e "pessoa" são detectados e os locais na imagem são fornecidos. O objeto que queremos detectar é classificado como "touca", mas, para nosso aplicativo, precisamos de uma classificação mais específica: "capacete". No entanto, "capacete" não é um dos tipos de objetos que a Pesquisa Visual Computacional atualmente detecta. (Abordaremos esse problema da Visão Personalizada mais tarde.) Observe também que uma pontuação de confiança é fornecida para cada classificação de objeto.

O segundo resultado de "Marcas" fornece uma lista de rótulos associados à imagem inteira. A marca com a maior confiança (listada primeiro) é "homem", o que não nos ajuda muito. A segunda marca, "enfeite de chapéu", não é exatamente o que estamos procurando.

As outras respostas também são interessantes, mas não nos concentraremos nelas em nossa demonstração. No entanto, veja o que está incluído:

* Uma legenda para a foto ("um homem que usa um capacete") no campo Descrição.

* Recursos de imagem (Ela é preto e branco? Um desenho de linha?)

* Detalhes de todos os rostos detectados na imagem (nesse caso, identificado como um homem de 37 anos)

* Uma pontuação para o conteúdo da imagem: para "Adultos" ou "Erótico"?

* Análise de cores para a imagem: as cores dominantes de primeiro plano, de destaque e de segundo plano.

Estamos interessados somente no campo "Marcas" para nossos objetivos, então descobriremos como extrair isso de maneira programática na próxima seção.

## <a name="using-computer-vision-via-the-api"></a>Como usar a Pesquisa Visual Computacional por meio da API

É possível [controlar a Pesquisa Visual Computacional de maneira programática usando a API REST](https://docs.microsoft.com/en-us/azure/cognitive-services/computer-vision/vision-api-how-to-topics/howtocallvisionapi?WT.mc_id=msignitethetour2019-github-aiml20).
É possível fazer isso de praticamente qualquer linguagem ou aplicativo que tenha acesso à Web, mas usaremos a [ondulação](https://curl.haxx.se/), um aplicativo de linha de comando comum para a interface com URLs e coleta de saídas. O aplicativo de ondulação vem pré-instalado na maioria das distribuições do Linux e nas versões recentes do Windows 10 (1706 e posteriores). 

Execute os comandos no arquivo [`vision_demo.sh`](vision_demo.sh). É possível usar uma CLI do Azure ou o Azure Cloud Shell local, mas você deverá usar o bash assim como o shell.

Os comandos neste script vão:

1. Fazer logon em sua assinatura do Azure (esta etapa é desnecessária caso esteja usando o Cloud Shell)
2. Criar um Grupo de Recursos do Azure
3. Criar uma chave de Serviço Cognitivo. (Observação: essa é uma chave omnibus que também usaremos mais tarde para a Visão Personalizada.)
4. Localizar a chave
5. Use a ONDULAÇÃO para analisar duas imagens

## <a name="manually-generating-keys-for-use-with-computer-vision"></a>Como gerar chaves manualmente para uso com a Pesquisa Visual Computacional

No script [vision_demo.sh](vision_demo.sh), execute a seção "Criar uma Chave" para criar uma chave de Serviços Cognitivos de maneira programática usando a Interface de Linha de Comando do Azure.
(Se preferir, será possível [criar chaves de maneira interativa com o portal do Azure](https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account?tabs=multiservice%2Clinux&WT.mc_id=msignitethetour2019-github-aiml20).)

## <a name="next-step"></a>Próxima etapa

[Visão Personalizada](DEMO%20Custom%20Vision.md)