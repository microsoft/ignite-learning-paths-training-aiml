# <a name="aiml20-speaker-notes"></a>AIML20: Notas del orador

Si prefiere trabajar a partir de puntos de viñeta en lugar de texto de scripts, estos son los puntos principales de cada diapositiva de la presentación de PPT en: [presentations.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/presentations.md).

Los scripts de demostración asociados se encuentran en: https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml20. Comience con `DEMO%20Setup.md`.

## <a name="slide-notes"></a>Notas de la diapositiva

Las diapositivas solo se identifican mediante títulos.

### <a name="slide-microsoft-ignite-the-tour"></a>DIAPOSITIVA: Un paseo por Microsoft Ignite

Diapositiva de introducción previa a la presentación

### <a name="slide-using-pre-built-ai-to-solve-business-problems"></a>DIAPOSITIVA: Uso de inteligencia artificial pregenerada para superar problemas empresariales

Preséntese.

Procedimiento para agregar capacidades de inteligencia artificial a las aplicaciones, incluso si no se dispone de recursos de proceso o conocimientos de inteligencia artificial.

Uso de servicios de inteligencia artificial pregenerada en la nube.

### <a name="slide-resources"></a>DIAPOSITIVA: Recursos

Proporcionaremos muchos vínculos, recursos y demostraciones.

Vínculos a todo, incluido el código fuente completo y una implementación con un solo clic para la aplicación, en los vínculos que se incluyen aquí.

Esta diapositiva se volverá a mostrar al final.

### <a name="slide-adding-humanlike-capabilities-to-apps"></a>DIAPOSITIVA: Incorporación de funcionalidad similar a la humana a las aplicaciones

Utilizaremos servicios de inteligencia artificial pregenerada para agregar funcionalidad similar a la humana a las aplicaciones, pero ¿qué significa esto? A continuación le mostramos algunos ejemplos.

### <a name="slide-enhance-apps-with-humanlike-capabilities"></a>DIAPOSITIVA: Mejora de las aplicaciones con funcionalidad similar a la humana

[CLIC] Aportar a la aplicación el poder de la voz (por ejemplo, chat).
 
[CLIC] Aportar a la aplicación la posibilidad de ver (comprender las imágenes).

[CLIC] Aportar a la aplicación intuición sobre el comportamiento humano (adaptar las interfaces).

[CLIC] Aportar a la aplicación el poder de la comprensión (comunicarse en cualquier lenguaje).

[CLIC] Automatizar el proceso humano de análisis de secuencias de datos en busca de anomalías (y escalar).

Estos son solo algunos ejemplos.

### <a name="slide-overview-of-azure-cognitive-services"></a>DIAPOSITIVA: Introducción de Azure Cognitive Services

¿No se requieren muchos datos y una gran experiencia técnica, para implementar una inteligencia artificial con una funcionalidad similar a la humana?

No. Se basa en los conocimientos de Microsoft Research. Agregue funcionalidades con llamadas sencillas de la API de REST. 

Esto es Azure Cognitive Services.

### <a name="slide-azure-cognitive-services"></a>DIAPOSITIVA: Azure Cognitive Services

Azure Cognitive Services incluye más de dos docenas de API.

Servicios dentro de estas categorías de funcionalidad humana:

Visión: descripción del contenido de fotografías, dibujos, texto y escritura a mano, y vídeo.

Voz: herramientas para comprender y reconocer voz, y generar voz natural y similar a la humana.

Idioma: comprensión del contenido de documentos escritos y texto, y traducción entre lenguajes humanos.

Decisión: categoría completamente nueva de Azure Cognitive Services sobre la creación de opciones de funcionalidad similar a la humana sobre los datos, el contenido y las interfaces de usuario de la aplicación.

Búsqueda: respuesta a preguntas del lenguaje natural sobre el contenido de los repositorios grandes y no estructurados. 

### <a name="slide-azure-cognitive-services-with-service-names"></a>DIAPOSITIVA: Azure Cognitive Services (con nombres de servicio)

"Búsqueda" ya se ha tratado. 

Usamos algunos de los otros servicios disponibles para mejorar un sitio web minorista: [CLIC]

Computer Vision: se usará para analizar el contenido de las fotografías del producto.

Custom Vision: se usará para identificar los productos específicos que el distribuidor vende.

Personalizer: adaptará automáticamente el diseño de nuestro sitio web 

Sin embargo, los principios de configuración y uso de Cognitive Services son los mismos para todas las API, por lo que todo lo que se aprende aquí se aplica a cualquiera de los servicios de inteligencia artificial que quiera usar.

### <a name="slide-computer-vision"></a>DIAPOSITIVA: Computer Vision

En primer lugar, echaremos un vistazo a la inteligencia artificial pregenerada para Computer Vision.

### <a name="slide-shop-by-photo"></a>DIAPOSITIVA: Comprar por foto

Este es el sitio web de Tailwind Traders, un distribuidor de hardware (y una empresa ficticia). 

### <a name="slide-demo-shop-by-photo"></a>DIAPOSITIVA: Demostración: Comprar por foto

DEMOSTRACIÓN: "Definición del problema: Comprar por foto está dañado"

### <a name="video-shop-by-photo"></a>VIDEO: Comprar por foto

Vamos al sitio web real de Tailwind Traders. [CLIC]

Una de las características habilitadas para la inteligencia artificial se denomina "Comprar por foto". Esta característica permite al cliente cargar una foto de un producto que quizás quiere comprar y la idea es que la aplicación le indicará si el producto está disponible. Vamos a continuar y a probarlo ahora. Cargaremos la imagen de un taladro que nos interese y la aplicación Tailwind Traders la analizará, reconocerá que se trata de un taladro y mostrará el taladro que Tailwind Traders tiene a la venta, así como dónde encontrarlo en la tienda.

Pero probemos con otra imagen. Voy a volver a la página principal, usaré la característica "Comprar por foto" una vez más y esta vez elegiré la imagen de unas tenazas. Por desgracia, cuando la aplicación analiza esa imagen, considera que es un martillo. Obviamente, no funciona bien, por lo que ahora veremos si podemos averiguar qué es lo que ha salido mal y encontrar una manera de corregirlo mediante Computer Vision. 

### <a name="slide-how-computer-vision-works"></a>DIAPOSITIVA: Funcionamiento de Computer Vision

Ahora vamos a entrar un poco en el plano teórico. No habrá un exceso de cálculo.

Resulta útil para comprender lo que puede ir mal y cómo corregirlo.

### <a name="slide-tasks-xkcd-comic"></a>DIAPOSITIVA: Tareas (cómic XKCD)

(Pausa de 10 segundos)

Tiempo atrás, la posibilidad de que un equipo pudiera identificar una foto era simplemente ciencia ficción.

Ahora, 5 años más tarde, no es solo posible, sino que resulta fácil.

### <a name="slide-how-neural-networks-work-brandon-rohrer"></a>DIAPOSITIVA: Cómo funcionan las redes neuronales (Brandon Rohrer)

Adaptación bajo el permiso de Brandon Rohrer.

Consulte este blog para obtener una serie de tutoriales en vídeo con explicaciones detalladas sobre muchos aspectos de la inteligencia artificial y el aprendizaje automático. 

### <a name="slide-computer-vision--convolutional-neural-network"></a>DIAPOSITIVA: Computer Vision / Red neuronal convolucional

La inteligencia artificial se basa en el "aprendizaje profundo", pero "profundo" no tiene este sentido literal.

Se trata de una red neuronal. Las del mundo real tienen muchos más niveles.

Está diseñado para detectar solo cinco objetos. No puede reconocer nada más.

### <a name="slide-trained-convolutional-nn"></a>DIAPOSITIVA: Red neuronal convolucional entrenada

La imagen de entrada aparece por la parte izquierda. 

Cada nodo procesa y recombina las imágenes originales, de forma que se reducen, hasta que al final es un valor único: la confianza de la clasificación.

Aquí la entrada es una bicicleta y el nodo de la derecha con el valor más alto es "bicycle". La imagen se identificó correctamente.

### <a name="slide-filters-1"></a>DIAPOSITIVA: Filtros (1)

De momento, se omite.

### <a name="slide-filters-2"></a>DIAPOSITIVA: Filtros (2)

De momento, se omite.

### <a name="slide-filters-3"></a>DIAPOSITIVA: Filtros (3)

De momento, se omite.

### <a name="slide-training-an-image-classifier"></a>DIAPOSITIVA: Entrenamiento de un clasificador de imágenes

Pero ¿cómo se entrena una red neuronal para hacerlo?

[CLIC] Eligiendo los filtros correctos. Cada filtro se controla mediante una pequeña cuadrícula de pesos (normalmente 3x3 o 5x5).

[CLIC] Elegimos los pesos mediante el uso de una gran cantidad de imágenes de entrenamiento en las que se conoce la clasificación. Elija los pesos para que se elija la clasificación correcta (o al menos la mayor parte del tiempo)

En las redes de visión reales, puede haber millones de pesos para elegir. ¿Cómo se determinan los pesos?

### <a name="slide-learning-backpropagation"></a>DIAPOSITIVA: Aprendizaje: Propagación hacia atrás

Aquí es donde empiezan los cálculos complicados.

Pero, a menos que sea un ingeniero de inteligencia artificial, no debe preocuparse. Solo puede utilizar redes con pesos optimizados por otros usuarios.

Esto cubre probablemente el 80 % de las aplicaciones, pero si necesita diseñar sus propias redes neuronales y optimizar pesos, existen herramientas para ello, como Tensorflow y PyTorch. Obtenga información sobre ellas en AIML40 y AIML50.

### <a name="slide-pre-trained-convolutional-nn"></a>DIAPOSITIVA: Red neuronal convolucional previamente entrenada

Pero mientras tenga acceso a un red neuronal que pueda detectar las imágenes que necesita, puede simplemente proporcionar la imagen y la red la clasificará por usted.

Algunos modelos no se limitan a clasificar: detectan la ubicación de los objetos o analizan la imagen de otras maneras.

### <a name="slide-demo-cognitive-services-computer-vision"></a>DIAPOSITIVA: Demostración: Computer Vision de Cognitive Services

Computer Vision de Cognitive Services proporciona una red neuronal eficaz que puede clasificar muchos miles de objetos.

Encontrará una interfaz de usuario simple basada en web que puede usar para probarlo en aka.ms/try-computervision

Vamos a probarlo ahora.

### <a name="video-computer-vision-via-web"></a>VIDEO: Computer Vision por web

[CLIC] Esta es la página de Computer Vision de Cognitive Services. Si se desplaza hacia abajo un poco en esa página, encontrará un buen formulario basado en web que nos permite cargar una imagen para su análisis, ya sea desde la web o como un archivo local. Vamos a intentar cargar esta imagen de un hombre con un casco. En tan solo unos segundos, el servicio Computer Vision devolverá el análisis de esa imagen. A la izquierda, se muestran los objetos detectados en la imagen, mientras que a la derecha, tenemos la salida JSON con el análisis detallado. Esto incluye los nombres y las ubicaciones de los objetos detectados en la imagen, una lista de etiquetas o etiquetas asociadas a la imagen, una descripción del lenguaje sin formato de la imagen (en este caso, "a man wearing a helmet" [un hombre con un casco]) y muchas otras informaciones útiles.

### <a name="slide-cognitive-services-computer-vision"></a>DIAPOSITIVA: Computer Vision de Cognitive Services

Mire en Objects (Objetos): se han detectado dos objetos. Headwear (casco) y person (persona).

Mire en Tags (Etiquetas). La confianza más alta: man (hombre). La siguiente es headdress (complemento para la cabeza). Helmet (casco) está solo en sexto lugar.
El modelo no está entrenado específicamente para "hard hat" (casco).

Veremos cómo corregirlo en unos instantes.

Si quiere incorporar visión en una aplicación, puede acceder a la API mediante programación. Vamos a ver de qué modo.

### <a name="video-computer-vision-via-cli"></a>VIDEO: Computer Vision por CLI

Puede interactuar con las API de Cognitive Service usando cualquier lenguaje que se pueda conectar a un punto de conexión HTTP, pero lo que tengo aquí [CLIC] es un script de bash que usa la CLI de Azure para crear recursos y se conecta a la API de Computer Vision API mediante "curl". Puede instalar la CLI de Azure en el shell local, pero aquí utilizo la extensión "Azure Account" (Cuenta de Azure) en Visual Studio Code para iniciar un Cloud Shell, lo que significa que no tengo que instalar nada. Una vez que el shell esté listo, puedo ejecutar comandos directamente desde este script de bash. 

Este primer comando crea un grupo de recursos, que usaré para contener las claves que necesito para autenticar la API.

El siguiente paso consiste en crear las claves. Aquí voy a crear una clave colectiva de Cognitive Services que puedo usar con muchos servicios, como Computer Vision.

A continuación, podemos mostrar la clave directamente en el terminal. [ESPERAR] Puede usar cualquiera de estas claves para interactuar con la API, por lo que guardaré la primera aquí, en una variable de entorno.

Con esa clave, podemos conectarnos a la dirección URL del punto de conexión proporcionada por el servicio Computer Vision, así que vamos a guardar también esa dirección URL en una variable de entorno.

A continuación, puede elegir una imagen para analizar. Aquí se proporciona la dirección URL de una imagen, la misma imagen de un hombre con un casco que examinamos hace un momento.

Ahora se puede pasar la clave y la dirección URL de la imagen en el punto de conexión pasando una entrada JSON mediante curl. Y en unos pocos milisegundos, se recupera el análisis de la imagen como JSON. Puede ver los mismos resultados que vimos en la interfaz web hace un momento.

Por supuesto, podemos hacerlo con cualquier imagen que nos guste. Vamos a intentarlo de nuevo con una imagen diferente, en este caso, la imagen de un taladro. Una vez más, podemos pasarlo a la API mediante curl. [ESPERAR] Curiosamente, la etiqueta superior asociada a esta imagen es "camera" (cámara), lo que lamentablemente no nos ayudará a buscar la herramienta real, nosotros queremos "drill" (taladro).

### <a name="slide-adapting-computer-vision-models-with-your-own-data"></a>DIAPOSITIVA: Adaptación de modelos de Computer Vision con sus propios datos

La API de Computer Vision no funcionará para Comprar por foto. 

Se ha entrenado para detectar demasiados tipos de objetos.

Afortunadamente, podemos solucionar este problema. Vamos a profundizar en la teoría durante un momento.

Hay una manera de adaptar un modelo para miles de objetos, así como de adaptarlo para que detecte solo el objeto que se desea. INCLUSO aunque no formen parte del modelo original. 

Veamos cómo, con una técnica de inteligencia artificial denominada transferencia de aprendizaje. 

### <a name="slide-transfer-learning"></a>DIAPOSITIVA: Transferencia de aprendizaje

La misma red neuronal convolucional que antes, con el último nivel desactivado.

El penúltimo nivel proporciona "features" (características): piense en un vector de números. Cada imagen genera un conjunto diferente de características.

No se sabe qué representan las características, pero son útiles en general para clasificar las imágenes.

Truco: podemos usar esas características para clasificar un nuevo conjunto de objetos.

### <a name="slide-transfer-learning-training-1---with-the-hammer"></a>DIAPOSITIVA: Entrenamiento de transferencia de aprendizaje (1 - con el martillo)

Use el aprendizaje de transferencia para crear un modelo que identifique martillos y cascos.

Pase una imagen de un martillo y recopile características. Y un indicador binario para "hammer" (martillo). Repita el procedimiento para una gran cantidad de martillos.

### <a name="slide-transfer-learning-training-2---with-the-white-hard-hat"></a>DIAPOSITIVA: Entrenamiento de transferencia de aprendizaje (2 - con el casco blanco)

Ahora haga lo mismo con imágenes de cascos.

En cada caso, recopile 8 vectores de datos y un indicador binario para cada imagen.

Póngalo todo junto, tiene una colección de vectores de datos, cada uno con un resultado binario asociado. 

Con esto, puede crear un modelo predictivo sencillo.

### <a name="slide-transfer-learning-trained-model"></a>DIAPOSITIVA: Modelo entrenado de aprendizaje de transferencia

Esto funciona sorprendentemente bien.

No necesita una gran cantidad de imágenes o potencia computacional.

Este es un ejemplo de juguete, pero el principio se aplica también a modelos grandes.

### <a name="slide-microsoft-cognitive-services-custom-vision"></a>DIAPOSITIVA: Custom Vision de Microsoft Cognitive Services

No es necesario que entrene personalmente un modelo de aprendizaje de transferencia.

Use uno de los modelos de visión previamente entrenados de Microsoft y adáptelo con imágenes de sus propios objetos, con Custom Vision.

Vamos a intentar usarlo ahora para compilar un modelo de visión para Comprar por foto.

### <a name="slide-demo-customized-object-recognition"></a>DIAPOSITIVA: Demostración: Reconocimiento de objetos personalizados

Instrucciones de demostración: https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Custom%20Vision.md

### <a name="video-customvisionai"></a>VÍDEO: customvision.ai

[CLIC] Aquí estoy en la interfaz basada en web de Custom Vision. Nos proporciona una buena interfaz de usuario donde podemos proporcionar nuevas imágenes para el análisis de aprendizaje de transferencia. Y puede ver en este proyecto que ya he cargado varias imágenes. He cargado imágenes de destornilladores, tenazas, taladros y martillos, que voy a usar para entrenar el modelo personalizado. También nos gustaría detectar otro producto que Tailwind Traders vende: cascos. Vamos a hacer clic en "agregar imágenes", buscaremos una carpeta en el disco duro donde he recopilado algunas fotos de cascos, las seleccionaremos todas y las agregaremos al servicio, a la vez que proporcionamos la etiqueta "hard hat" (casco) para usarla en el entrenamiento.

Los archivos tardarán unos minutos en cargarse, pero mientras la acción se lleva a cabo, observe que no hay tantas imágenes en este proyecto: aproximadamente 180, o unas pocas docenas para cada una de las cinco categorías. A veces incluso menos. A pesar de eso, dado que los cinco tipos de objetos son bastante distintos, el modelo debe funcionar bastante bien.

Avancemos y hagamos clic en el botón Entrenar para iniciar el aprendizaje de transferencia. Elegiremos la opción de entrenamiento rápido. Ahora se ejecutan todas esas imágenes a través de un modelo de visión complejo y se usa el aprendizaje de transferencia para crear un modelo predictivo para nuestras cinco categorías. Solo tarda unos segundos y nuestro modelo funciona bastante bien.
El umbral de probabilidad establece un límite por debajo del cual no se predecirá ninguna clasificación. Si solo aceptamos clasificaciones con una confianza del 50 % o más, el 90,9 % de esas predicciones son correctas: esto es lo que llamamos "precisión". Y el modelo clasifica correctamente el 88,2 % de las imágenes en general: esto es lo que llamamos "recuperación". En sus aplicaciones, podrá elegir un umbral de acuerdo con la tolerancia en caso de realizar la llamada equivocada, frente a no hacer ninguna llamada. En el caso de Tailwind Traders, podemos establecer el umbral en el lado inferior, ya que no es un gran problema sugerir el producto equivocado a un cliente. Si se tratara de una aplicación de detección de cáncer, probablemente el enfoque sería diferente.

Ahora vamos a probar nuestro modelo en algunas imágenes nuevas que no ha visto antes. Para ello, hacemos clic en el botón de la opción "Quick Test" (Prueba rápida). Cargaremos un nuevo archivo desde la carpeta "test images" (imágenes de prueba). Vamos a ver qué pasa con nuestro hombre del casco. Puede ver que, de hecho, nuestra predicción de "hard hat" (casco) tiene una probabilidad del 99,9 %, por lo que haremos esa llamada con prácticamente cualquier umbral que elijamos.

Vamos a probar una imagen diferente: el taladro. Nuestro modelo identifica la imagen como un taladro con una probabilidad del 94,5 %. Y, por último, vamos a probar la imagen de las tenazas, que identifica con una confianza del 99,9 %.

Por lo tanto, el modelo funciona bien, aunque se ha entrenado en menos de 200 imágenes.
Esto se debe a que hemos restringido las posibles etiquetas a los productos que vendemos en Tailwind Traders.

Ahora que estamos satisfechos con nuestro modelo, podemos exportarlo e incorporarlo a nuestra aplicación. Si hace clic en el botón para exportar, puede exportar el modelo para iOS o Android, como un contenedor, o en nuestro caso en el formato ONNX universal. Ahora hemos descargado el modelo en el disco duro.

### <a name="slide-portable-deep-learning-models"></a>DIAPOSITIVA: Modelos de aprendizaje profundo portátiles

Hemos exportado nuestro modelo personalizado en el formato ONNX.

ONNX (Open Neural Network Exchange), es un estándar abierto publicado por Microsoft y Facebook para promocionar el intercambio gratuito y la implementación de modelos de inteligencia artificial, y es compatible con una amplia gama de aplicaciones y proveedores de tecnología.

Usamos el tiempo de ejecución de ONNX para integrar el modelo exportado en el sitio web.

### <a name="slide-onnximagesearchtermpredictorcs"></a>DIAPOSITIVA: ONNXImageSearchTermPredictor.cs

InferenceSession hace referencia al archivo .onnx exportado

El modelo genera una etiqueta de clasificación, que se pasa a la búsqueda.

### <a name="slide-demo-onnx"></a>DIAPOSITIVA: DEMOSTRACIÓN: ONNX

DEMOSTRACIÓN: Implementación de ONNX

### <a name="video-kudu"></a>VIDEO: Kudu

[CLIC] El modelo que acabamos de exportar desde Custom Vision es, en realidad, un archivo ZIP que contiene el archivo ONNX real, model.onnx, que es la representación de texto de la red neuronal recién creada y también un archivo de manifiesto. 

El sitio web de Tailwind Traders existente ya usa un modelo de Computer Vision representado como archivo ONNX denominado products.onnx. El problema es que el modelo no reconoce correctamente muchos de los productos que vendemos en Tailwind Traders. Por lo tanto, cogeremos el archivo model.onnx que acabamos de exportar desde Custom Vision, le cambiaremos el nombre a products.onnx y lo reemplazaremos en nuestra aplicación web, de modo que Comprar por foto pueda reconocer los cinco productos en los que se ha entrenado.

Aquí en Azure Portal puede ver el recurso App Service que ejecuta el sitio web de Tailwind Traders. Lo que puedo hacer ahora en este App Service es ir a la sección Development Tools (Herramientas de desarrollo) y elegir la característica Advanced Tools (Herramientas avanzadas). Esto inicia la interfaz de Kudu. Ahora que ya se ha iniciado, puedo examinar el sistema de archivos del sitio web mediante la consola de depuración. Vamos a examinar site, w-root, Standalone, OnnxModels, donde se encuentra el archivo products.onnx. Ahora podemos reemplazarlo por la nueva versión del archivo products.onnx, creada con Custom Vision.

Ahora, volviendo a App Service, podemos continuar y reiniciar el servidor web, lo que hará que use el nuevo modelo ONNX en la característica Comprar por foto.

### <a name="video-netron"></a>VIDEO: Netron

[CLIC] Mientras estamos esperando a que el sitio web se reinicie, vamos a echar un vistazo al modelo ONNX que acabamos de instalar. Existe una pequeña aplicación web de Lutz Roeder denominada Netron, que nos permite inspeccionar las redes neuronales en archivos ONNX. Vamos a continuar y abrir el archivo products.onnx. Aquí puede ver los niveles reales de la red neuronal representada por el modelo. Vamos a ampliarlo un poco y a echar un vistazo a la entrada en la parte superior. La entrada es una imagen. Se trata de una imagen RGB de tres niveles, de tamaño 224 x 224 píxeles. En realidad debía recortar y reducir verticalmente la imagen proporcionada por el usuario antes de proporcionarla al tiempo de ejecución de ONNX. Un pequeño secreto poco confesable es que los sistemas de visión computacional tienen una visión bastante deficiente (funcionan con resoluciones de imagen muy bajas) pero, aun así, funcionan bastante bien.

Ahora vamos a reducir la visualización y a desplazarnos por la red. Puede ver todos los niveles de la red neuronal creada por la visión personalizada y cómo cada nivel transforma la imagen de entrada, aplicando filtros y recombinando las imágenes de salida, tal como aprendió anteriormente en esta conversación. Pero cuando se llega al nivel de salida al final, puede ver que la salida es una lista de cinco valores: los cinco productos en los que se ha entrenado: martillo, casco, etc., junto con este valor con la etiqueta "loss" (pérdida), que es la confianza que el modelo predice para cada categoría. En la aplicación, debe elegir su propio umbral en relación con lo alta que debe ser la confianza.

De todos modos, ahora que se ha reiniciado el sitio web de Tailwind Traders, volvamos a la página principal y veamos cómo funciona nuestro nuevo modelo de visión. Vamos a seguir y a cargar una foto, y volveremos a probar una vez más una de nuestras imágenes de prueba, concretamente, nuestra imagen de unas tenazas que no ha funcionado bien antes. Podemos ver que, de hecho, en lugar de pensar que era un martillo, el sitio web ha buscado "pliers" (tenazas) y me ha mostrado todos los productos en oferta.

### <a name="slide-optimizing-app-ui-with-cognitive-services-personalizer"></a>DIAPOSITIVA: Optimizar la interfaz de usuario de la aplicación con Personalizer de Cognitive Services

Es el momento de un ejemplo más rápido: Personalizer.

El servicio "Personalizer" nos permite personalizar la interfaz de las aplicaciones en tiempo real aprendiendo del comportamiento de los usuarios.

### <a name="slide-recommended-screenshot"></a>DIAPOSITIVA: Recommended (Recomendado, captura de pantalla)

En la sección "Recommended" (Recomendado) se muestra una imagen "hero" (modelo) grande de gran tamaño, junto con unas pocas imágenes más pequeñas.

Personalizer seleccionará el orden en que aparecen las secciones

Usa una técnica de inteligencia artificial denominada "aprendizaje de refuerzo".

### <a name="slide-personalizer-in-action"></a>DIAPOSITIVA: Personalizer en acción

Personalizer ha estado en desarrollo en Microsoft durante muchos años. 

Se ha usado en XBox y en Bing y MSN News.

Ahora también puede usar Personalizer en sus propias aplicaciones.

### <a name="slide-reinforcement-learning"></a>DIAPOSITIVA: Aprendizaje de refuerzo

Personalizer implementa una técnica de inteligencia artificial denominada aprendizaje de refuerzo. Aquí le mostramos cómo funciona.

[CLIC] Supongamos que queremos mostrar una acción "hero" (modelo) al usuario. [CLIC] Es posible que el usuario no esté seguro de lo que debe hacer a continuación, [CLIC], pero podríamos mostrar una de varias sugerencias. En el caso de una aplicación de juegos, [CLIC] podría ser: "play a game" (jugar una partida), "watch a movie" (ver una película) o "join a clan" (unirse a un grupo). [CLIC] En base al historial del usuario y otros datos contextuales (por ejemplo, su ubicación, la hora del día y el día de la semana), el servicio Personalizer [CLIC] clasifica las acciones posibles y [CLIC] busca la mejor sugerencia para promocionar [CLIC]. 

Esperamos que el usuario esté satisfecho [CLIC], pero ¿cómo podemos asegurarnos? Depende de lo que haga el usuario a continuación y de si eso era algo que queríamos que hiciera.
Según nuestra lógica de negocios [CLIC], asignaremos una "puntuación de recompensa" entre 0 y 1 a lo que suceda a continuación. Por ejemplo, dedicar más tiempo a jugar una partida o a la lectura de un artículo, o gastar más dinero en la tienda, puede dar lugar a mayores puntuaciones de recompensa. [CLIC] Personalizer vuelve a suministrar la información al sistema de clasificación para la próxima vez que se necesite destacar una actividad.

### <a name="slide-discovering-patterns-and-causality"></a>DIAPOSITIVA: Detectar patrones y causalidad

No es simplemente un sistema de recomendación.

El modo de exploración muestra otras opciones bajo la tasa que se especifique.

Como las pruebas A/B en tiempo real.

### <a name="slide-personalizer-for-tailwind-traders"></a>DIAPOSITIVA: Personalizer para Tailwind Traders

Contexto: hora del día, día de la semana, sistema operativo del explorador  

Puntuación de recompensa: 1 si se hizo clic en la categoría destacada y cero en caso contrario.

Tasa de exploración: 20 %

### <a name="slide-demo-personalizer"></a>DIAPOSITIVA: DEMOSTRACIÓN: Personalizer

[CLIC] Ahora, vamos a ver a Personalizer en acción. Vamos a volver a la página principal de Tailwind Traders. Lo que no mencioné antes es que, en esta sección Recommended (Recomendado), el orden de los departamentos del producto viene determinado por Personalizer.
En este caso, se presenta el departamento eléctrico como imagen modelo. También podemos ver el comportamiento de "Explore" (Explorar) si actualizamos el sitio web varias veces.
Aparentemente, Personalizer considera actualmente que el centro de jardinería obtiene la mejor interacción de los usuarios anónimos en este momento del día con el explorador y el sistema operativo que estoy usando aquí, pero que finalmente probará las distintas categorías. Aquí destaca la fontanería, y Personalizer lo utilizará para medir también la interacción.

### <a name="slide-pre-built-ai-in-production"></a>DIAPOSITIVA: Inteligencia artificial pregenerada en producción

Tenga en cuenta algunas consideraciones a la hora de poner la inteligencia artificial en producción.

### <a name="slide-cost-considerations"></a>DIAPOSITIVA: Consideraciones sobre el costo

Primera consideración: costo. 

¿Acaba de llegar a Azure? Use este vínculo para registrarse y obtener 200 $ en créditos gratuitos.

[CLIC] Las cargas de trabajo a nivel de desarrollo suelen ser gratis 

[CLIC] En los volúmenes de producción es donde se aplicarán cargos

[CLIC] Detalles específicos por servicio y región en este vínculo

### <a name="slide-data-considerations"></a>DIAPOSITIVA: Consideraciones de datos

Piense en dónde se van a usar los datos y cómo se usarán.

Los datos se cargan para inferencia, pero se eliminan inmediatamente después de su uso. Detalles en este vínculo.

Si el ancho de banda es un problema, o los datos están regulados, considere la posibilidad de usar contenedores.

### <a name="slide-deployment-with-containers"></a>DIAPOSITIVA: Implementación con contenedores

Algunos servicios están disponibles en contenedores descargables.

Instale el contenedor detrás del firewall y Microsoft no recibirá ningún dato.

La conexión a Internet solo se usa para la facturación. Se cobra la tarifa habitual.

### <a name="slide-ethical-considerations"></a>DIAPOSITIVA: Consideraciones éticas

La dispositiva más importante.

Comprenda las implicaciones éticas de las aplicaciones de inteligencia artificial que afectan a las personas.

Debe disponer de marco de trabajo ético:

que *habilite* a las personas para obtener más resultados a partir de lo que ya hacen (no reemplace a las personas);

que sea *inclusivo* para todos los tipos de usuario: asegúrese de que todos los usuarios puedan beneficiarse igualmente de la aplicación; y

que sea justo y transparente.

Recuerde que la calidad de la inteligencia artificial depende directamente de los datos sobre los cuales se ha entrenado. Asegúrese de que la aplicación funciona para todos los usuarios potenciales.

Si no tiene establecido un marco de trabajo ético, un buen punto de partida son los propios principios de Microsoft para la inteligencia artificial; puede leer más sobre ello en este vínculo.

### <a name="slide-wrapping-up"></a>DIAPOSITIVA: Resumen

Los modelos pregenerados no pueden hacerlo todo, pero pueden solucionar una parte importante de cada caso concreto, de forma rápida. 

La inteligencia artificial se rige por los datos. Siempre tenga en cuenta los datos y qué es lo que puede salir mal.

Pruébelo. No necesita tener mucha experiencia, pero piense en las implicaciones éticas.

### <a name="slide-docs-alert"></a>DIAPOSITIVA: Alerta de Docs

Para obtener todos los detalles de Azure Cognitive Services, incluidas las guías de introducción y las referencias, consulte Microsoft Docs.

### <a name="slide-ms-learn-alert"></a>DIAPOSITIVA: Alerta de MS Learn

Si quiere obtener información sobre cómo usar Cognitive Services, encontrará cursos gratuitos en Microsoft Learn que le guiarán por su utilización, paso a paso.

### <a name="slide-resources"></a>DIAPOSITIVA: Recursos

Todos los vínculos y el código están en el repositorio de Github.

Si quiere obtener una certificación de Microsoft en inteligencia artificial o ciencia de datos, los asistentes a la sesión de hoy pueden acceder a una oferta especial para obtener un certificado gratuito. Consulte este vínculo para obtener información.

Estaré aquí para responder a las posibles preguntas. (Y en...)

¡Gracias!
