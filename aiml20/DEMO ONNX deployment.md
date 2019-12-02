# <a name="demo-onnx-deployment"></a>DEMONSTRAÇÃO: Implantação do ONNX

Nesta demonstração, pegaremos o arquivo ONNX que exportamos na demonstração da [Visão Personalizada](DEMO%20Custom%20Vision.md) e o implantaremos no site da Tailwind Traders.

O site usa o modelo em `products.onnx` para o aplicativo Comprar pela Foto. A imagem carregada é processada pelo modelo que gera um dos cinco rótulos: "martelo", "furadeira", "alicate", "chave de fenda" ou "capacete". O site pesquisa a lista de produtos para o rótulo gerado e retorna os resultados.

## <a name="load-the-simple-onnx-model"></a>Carregar o modelo ONNX simples

(DICA: É possível executar esta etapa com antecedência. Esta etapa será necessária caso tenha executado esta demonstração anteriormente na mesma implantação.)

Substituiremos o arquivo products.onnx no aplicativo Web por uma versão que reconheça somente duas categorias de objetos: "martelo" e "furadeira".

1. No portal do Azure, visite seu grupo de recursos aiml20-demo

1. Clique no recurso Serviço de Aplicativo "aiml20"

1. No menu à esquerda, em Ferramentas de Desenvolvimento, clique em Ferramentas avançadas e, em seguida, clique em "Ir" no painel direito para iniciar o Kudu.

1. Na barra de menus principal, clique em Console de Depuração > PowerShell

1. Navegue até: site/wwwroot/Standalone/Onnxmodels

1. Com o Explorer, abra a pasta `ONNX / simple model` de seu repositório AIML20

1. Arraste products.onnx para LEFT HALF da janela do Kudu. (IMPORTANTE: NÃO arraste para a caixa com o texto "arraste aqui para carregar e descompactar".) Esse modelo sabe como identificar somente furadeiras e martelos.

1. Reinicie o servidor Web. Volte para o recurso Serviço de Aplicativo "aiml20" e clique em "Reiniciar" na barra de menus superior. Aguarde dois minutos para o site reiniciar completamente.

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>Definição do problema: Comprar pela Foto não funciona bem

(Observação: Esta seção foi feita no início da apresentação do AIML20.)

1. Visite o site da Tailwind Traders que você implantou anteriormente. 

1. Role a página para baixo até a seção "Comprar pela Foto" do site

1. Clique em "Comprar pela Foto"

1. No repositório AIML20, selecione: testar imagens > drill.jpg

1. Ele a identifica corretamente como uma furadeira. Ótimo!

1. Retorne à home page e clique em "Comprar pela Foto" novamente

1. No repositório AIML20, selecione: testar imagens > pliers.jpg

1. Ah não! Ele a identifica como um martelo. Corrigiremos isso mais tarde, mas primeiro vamos entender por que ele falhou.

## <a name="update-the-onnx-model-in-the-tailwind-traders-website"></a>Atualizar o modelo ONNX no site da Tailwind Traders

Primeiro, exiba o modelo exportado em Netron:

1. Navegue até https://lutzroeder.github.io/netron/, clique em Abrir Modelo

2. Abra ONNX/Modelo Personalizado/products.onnx

3. Percorra a rede neural e observe:

 - ela é grande
 - na parte superior, aparece uma imagem 224x224 como entrada (uma dica: os modelos de pesquisa visual computacional têm uma visão muito ruim)
 - adicionar a parte inferior, ele gera 5 valores, estas são as pontuações de confiança para nossos rótulos de classe

Em seguida, descarte o arquivo ONNX que exportamos para o sistema de arquivos TWT

1. No portal do Azure, visite seu grupo de recursos aiml20-demo

1. Clique no recurso Aplicativo Web "aiml20"

1. Em Ferramentas de Desenvolvimento, clique em Ferramentas avançadas e, em seguida, clique em "Ir" no painel direito para iniciar o Kudu.

1. Na barra de menus principal, clique em Console de Depuração > PowerShell

1. Navegue até: site/wwwroot/Standalone/Onnxmodels

1. Com o Explorer, abra a pasta `ONNX / custom model` de seu repositório AIML20

1. Arraste products.onnx para LEFT HALF da janela do Kudu. (IMPORTANTE: NÃO arraste para a caixa com o texto "arraste aqui para carregar e descompactar".)

1. Reinicie o servidor Web. Retorne ao recurso Aplicativo Web "onnx" e clique em "Reiniciar".

Execute Comprar pela Foto novamente e carregue `test images / pliers.jpg`. Agora ele funciona!

## <a name="next-step"></a>Próxima etapa

[Personalizador](DEMO%20Personalizer.md)


