# <a name="demo-instructions-for-presenters"></a>Instruções de demonstração para apresentadores

Os scripts de demonstração são disponibilizados para todos neste repositório.

Você deve seguir os mesmos scripts nas apresentações, mas com as anotações adicionais fornecidas abaixo.

As gravações de demonstrações também estão disponíveis como vídeos nos [Slides PPT](presentations.md) (e também em alguns links dos vídeos adicionais abaixo). Você pode usar os vídeos inseridos em vez de uma demonstração ao vivo no caso de falta de Internet ou outros problemas técnicos. (nesse caso, é recomendável ativar mudo no áudio e falar com o vídeo). As [anotações para orador](speaker-notes.md) são cronometradas para os eventos nos vídeos inseridos.

## <a name="demo-setup"></a>Configuração de DEMONSTRAÇÃO

Antes de sua apresentação, execute todas as instruções no script abaixo.

[Script de demonstração](DEMO%20Setup.md)

## <a name="demo-computer-vision"></a>Pesquisa Visual Computacional de DEMONSTRAÇÃO

[Script de demonstração](DEMO%20Computer%20Vision.md)

### <a name="slide-demo--shop-by-photo"></a>SLIDE: DEMONSTRAÇÃO/compra pela foto

Observe que as instruções reais para esta demonstração estão [aqui](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right).

Vídeo de demonstração adicional: https://www.dropbox.com/s/ylxjuifg9x0h4n3/ITT-aiml20-demo1.mp4?dl=0 

### <a name="slide-demo--cognitive-services-computer-vision"></a>SLIDE: DEMONSTRAÇÃO/Pesquisa Visual Computacional dos Serviços Cognitivos

[Script de demonstração](DEMO%20Computer%20Vision.md#using-computer-vision-via-the-web-interface)

## <a name="demo-custom-vision"></a>Visão Personalizada de DEMONSTRAÇÃO

[Script de demonstração](DEMO%20Custom%20Vision.md)

Faça a primeira parte da demonstração com antecedência.

### <a name="slide-demo--customized-object-recognition"></a>SLIDE: DEMONSTRAÇÃO/Reconhecimento de objeto personalizado

Inicie a demonstração ao vivo em "[Adicionar imagens e treinar um modelo](DEMO%20Custom%20Vision.md#add-images-and-train-a-model)".

## <a name="demo-onnx-deployment"></a>Implantação de ONNX de DEMONSTRAÇÃO

[Script de demonstração](DEMO%20ONNX%20deployment.md)

Execute a seção "[Carregar o modelo simples de ONNX](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model)" antes do tempo.

Você fez a seção "[Definir o problema](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)" no início da apresentação, então poderá ignorá-la.

### <a name="slide-demo--onnx"></a>SLIDE: DEMONSTRAÇÃO/ONNX

Inicie a demonstração ao vivo em "Atualizar o modelo ONNX no site do Tailwind Traders".

Para exibir no Netron, você pode exibir diretamente o arquivo exportado da Visão Personalizada ou pode usar um arquivo pré-preparado do repositório em `ONNX/custom model/products.onnx`

Observe que, ao implantar o arquivo, ele **deverá** se chamar `products.onnx`, portanto, é mais fácil usar o arquivo pré-preparado com esse nome da sua área de trabalho, em vez de renomear o arquivo exportado.

### <a name="slide-demo--personalizer"></a>SLIDE: DEMONSTRAÇÃO/Personalizador

[Script de demonstração](DEMO%20Personalizer.md)
