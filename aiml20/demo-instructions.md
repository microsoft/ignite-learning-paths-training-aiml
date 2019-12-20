# <a name="demo-instructions-for-presenters"></a>Instrucciones de demostración para presentadores

Los scripts de demostración se ponen a disposición de todos los usuarios de este repositorio.

Debe seguir los mismos scripts para las presentaciones, pero con las notas adicionales que se indican a continuación.

Las grabaciones de las demostraciones también están disponibles como vídeos en las [diapositivas PPT](presentations.md) (y también algunos vídeos adicionales que se vinculan a continuación). Puede usar los vídeos insertados en lugar de una demostración en directo en caso de que no disponga de Internet o por otros problemas técnicos. (En este caso, se recomienda que silencie el audio y hable usted durante el vídeo). En los vídeos insertados, el tiempo de las [notas del orador](speaker-notes.md) se ajusta a los eventos.

## <a name="demo-setup"></a>DEMOSTRACIÓN Configuración

Antes de la presentación, ejecute todas las instrucciones del script siguiente.

[Script de demostración](DEMO%20Setup.md)

## <a name="demo-computer-vision"></a>DEMOSTRACIÓN Computer Vision

[Script de demostración](DEMO%20Computer%20Vision.md)

### <a name="slide-demo--shop-by-photo"></a>DIAPOSITIVA: DEMOSTRACIÓN / Comprar por foto

Tenga en cuenta que las instrucciones reales de esta demostración se encuentran [aquí](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right).

Vídeo de demostración adicional: https://www.dropbox.com/s/ylxjuifg9x0h4n3/ITT-aiml20-demo1.mp4?dl=0 

### <a name="slide-demo--cognitive-services-computer-vision"></a>DIAPOSITIVA: DEMOSTRACIÓN / Computer Vision de Cognitive Services

[Script de demostración](DEMO%20Computer%20Vision.md#using-computer-vision-via-the-web-interface)

## <a name="demo-custom-vision"></a>DEMOSTRACIÓN Custom Vision

[Script de demostración](DEMO%20Custom%20Vision.md)

Realice la primera parte de la demostración con anterioridad.

### <a name="slide-demo--customized-object-recognition"></a>DIAPOSITIVA: DEMOSTRACIÓN / Reconocimiento de objetos personalizados

Inicie la demostración en directo en [Agregar imágenes y entrenar un modelo](DEMO%20Custom%20Vision.md#add-images-and-train-a-model).

## <a name="demo-onnx-deployment"></a>DEMOSTRACIÓN Implementación de ONNX

[Script de demostración](DEMO%20ONNX%20deployment.md)

Ejecute la sección [Carga del modelo de ONNX Simple](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model) con anterioridad.

Al principio de la presentación realizó la sección [Definición del problema](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right), por lo que debe omitirla.

### <a name="slide-demo--onnx"></a>DIAPOSITIVA: DEMOSTRACIÓN / ONNX

Inicie la demostración en directo en "Actualización del modelo ONNX en el sitio web de Tailwind Traders".

Para visualizarlo en Netron, puede ver el archivo que exportó desde Custom Vision directamente, o bien puede usar el preparado anteriormente del repositorio en `ONNX/custom model/products.onnx`

Tenga en cuenta que, al implementar el archivo, **debe** llamarse a `products.onnx`, por lo que es más fácil tomar el archivo preparado anteriormente con ese nombre en el escritorio, en lugar de cambiar el nombre del archivo exportado.

### <a name="slide-demo--personalizer"></a>DIAPOSITIVA: DEMOSTRACIÓN / Personalizer

[Script de demostración](DEMO%20Personalizer.md)
