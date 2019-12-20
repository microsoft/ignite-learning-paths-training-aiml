# <a name="using-pre-built-ai-to-understand-images"></a>Uso de inteligencia artificial pregenerada para comprender las imágenes

> 💡 Debe haber completado la [configuración](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md) antes de intentar realizar la demostración.

En esta demostración, se usará Azure Computer Vision para detectar el tipo de objeto que representa una imagen. 

En primer lugar, se usará el formulario web en línea de Computer Vision para cargar una imagen y observar los resultados.

Después, se usará Computer Vision API para recopilar la misma información mediante programación, mediante curl.

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>Definición del problema: Comprar por foto no funciona correctamente

El problema que motiva esta presentación es que la herramienta Comprar por foto del sitio web de Tailwind Traders no identifica correctamente los productos. En este momento es útil ejecutar esta sección en [Implementación de ONNX](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right) para establecer el escenario.

## <a name="using-computer-vision-via-the-web-interface"></a>Uso de Computer Vision a través de la interfaz web

A continuación se probará el uso de Computer Vision en una imagen de un producto de ferretería. Si se puede identificar un producto que Tailwind Traders vende por nombre, se puede buscar por ese nombre en el catálogo de la aplicación "Comprar por foto".

1. Visite la página web de Computer Vision en [https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=msignitethetour2019-github-aiml20)

2. Desplácese hacia abajo hasta la sección "Analizar una imagen". Su aspecto es similar a este:

!["Computer Vision: Analizar una imagen"](img/Computer%20Vision%20Analyze%20an%20Image.png)

3. Haga clic en el botón "Examinar" y seleccione "man in hardhat.jpg" en la carpeta "test images" de "CV Training Images".

4. Después de un momento, el análisis de la imagen aparecerá en el panel de la derecha. Su aspecto es similar a este:

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

(Tenga en cuenta que el análisis anterior puede cambiar en el futuro: el modelo de Computer Vision se actualiza periódicamente).

Observe que, en el primer resultado de "Objetos", se detectan dos objetos "headwear" y "person", y se proporcionan sus ubicaciones en la imagen. El objeto que se quiere detectar está clasificado como "headwear", pero para la aplicación se necesita una clasificación más específica: "hard hat". Pero "hard hat" no es uno de los tipos de objeto que Computer Vision detecta actualmente. (Más adelante se abordará este problema con Custom Vision). Observe también que se proporciona una puntuación de confianza para cada clasificación de objeto.

El segundo resultado de "Etiquetas" proporciona una lista de etiquetas asociadas a toda la imagen. La etiqueta con la mayor confianza (enumerada en primer lugar) es "man", que no ayuda mucho. La segunda etiqueta, "headdress", no es exactamente lo que se busca.

Las demás respuestas también son interesantes, pero en la demostración no nos centraremos en ellas. Fíjese en lo que se incluye:

* Un título para la foto ("a man wearing a helmet" (un hombre con un casco)) en el campo Descripción.

* Características de la imagen (si está en blanco y negro, si es un dibujo de línea).

* Detalles de las caras detectadas en la imagen (en este caso, se identifica como un varón de 37 años).

* Una puntuación para el contenido de la imagen: ¿es "Contenido para adultos" o "Subido de tono"?

* Análisis de color de la imagen: los colores dominantes de primer plano, énfasis y de fondo.

Para nuestros propósitos en realidad solo nos interesa el campo "Etiquetas", por lo que en la sección siguiente se verá cómo extraer esto mediante programación.

## <a name="using-computer-vision-via-the-api"></a>Uso de Computer Vision a través de la API

Puede [controlar Computer Vision mediante programación con su API REST](https://docs.microsoft.com/en-us/azure/cognitive-services/computer-vision/vision-api-how-to-topics/howtocallvisionapi?WT.mc_id=msignitethetour2019-github-aiml20).
Puede hacerlo desde prácticamente cualquier lenguaje o aplicación que tenga acceso a la web, pero se usará [curl](https://curl.haxx.se/), una aplicación de línea de comandos común para interactuar con las direcciones URL y recopilar sus resultados. La aplicación curl viene preinstalada en la mayoría de las distribuciones de Linux y en las versiones recientes de Windows 10 (1706 y posteriores). 

Ejecute los comandos en el archivo [`vision_demo.sh`](vision_demo.sh). Puede usar una CLI de Azure local o Azure Cloud Shell, pero tendrá que usar bash como shell.

Los comandos de este script permitirán:

1. Iniciar sesión en la suscripción de Azure (este paso no es necesario si se usa Cloud Shell).
2. Crear un grupo de recursos de Azure.
3. Crear una clave de Cognitive Services. (Nota: Se trata de una clave general que también se usará más adelante para Custom Vision).
4. Buscar la clave.
5. Usar CURL para analizar dos imágenes.

## <a name="manually-generating-keys-for-use-with-computer-vision"></a>Generación manual de claves para usarlas con Computer Vision

En el script [vision_demo.sh](vision_demo.sh), ejecute la sección "Create a Key" (Crear una clave) para crear una clave de Cognitive Sevices mediante programación con la interfaz de la línea de comandos de Azure.
(Si lo prefiere, puede [crear claves de forma interactiva con Azure Portal](https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account?tabs=multiservice%2Clinux&WT.mc_id=msignitethetour2019-github-aiml20)).

## <a name="next-step"></a>Siguiente paso

[Custom Vision](DEMO%20Custom%20Vision.md)