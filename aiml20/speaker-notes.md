# <a name="aiml20-speaker-notes"></a>AIML20: Notas del orador

Estas son las notas de la presentación en PPT que encontrará en: [presentations.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/presentations.md)

Los scripts de demostración asociados se encuentran en: https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml20. Comience con `DEMO%20Setup.md`.

## <a name="slide-notes"></a>Notas de la diapositiva

Las diapositivas solo se identifican mediante títulos.

### <a name="slide-microsft-ignite-the-tour"></a>DIAPOSITIVA: Un paseo por Microsoft Ignite

Diapositiva de introducción previa a la presentación

### <a name="slide-using-pre-built-ai-to-solve-business-problems"></a>DIAPOSITIVA: Uso de inteligencia artificial pregenerada para superar problemas empresariales

Bienvenida a todos, soy \<nombre y afiliación\>. Hoy voy a hablar sobre cómo puede agregar funcionalidades de inteligencia artificial a sus aplicaciones, sin necesidad de cantidades masivas de potencia de cálculo ni conocimientos de inteligencia artificial.
Lo haremos mediante servicios de inteligencia artificial pregenerada que están disponibles en la nube, que incluso podemos personalizar según nuestras necesidades específicas.

(Reemplace los detalles de contacto en esta diapositiva).

### <a name="slide-resources"></a>DIAPOSITIVA: Recursos

En la charla de hoy incluiré muchos vínculos a información y recursos, pero no se preocupe si no los encuentra durante la presentación, porque todos los detalles están incluidos en el centro de recursos de la sesión que se muestra aquí. También habrá varias demostraciones y podrá probarlas todas, ya que el código fuente completo, incluido un botón de un clic para implementar todo en Azure, se encuentra disponible en este repositorio de Github. Además, mostraré esta diapositiva de nuevo al final de la presentación, por si quiere tener la cámara preparada para entonces.

### <a name="slide-adding-humanlike-capabilities-to-apps"></a>DIAPOSITIVA: Incorporación de funcionalidad similar a la humana a las aplicaciones

Utilizaremos servicios de inteligencia artificial pregenerada para agregar funcionalidad similar a la humana a las aplicaciones, pero ¿qué significa esto? A continuación le mostramos algunos ejemplos.

### <a name="slide-enhance-apps-with-humanlike-capabilities"></a>DIAPOSITIVA: Mejora de las aplicaciones con funcionalidad similar a la humana

[CLIC] Puede darle a la aplicación la capacidad de hablar, por ejemplo, agregando una interfaz de chat.
 
[CLIC] Puede darle a la aplicación la capacidad de ver y entender el contenido de las imágenes.

[CLIC] Puede darle a la aplicación la intuición de entender lo que es más probable que sus usuarios quieran hacer y optimizar automáticamente la interfaz de usuario.

[CLIC] Puede darle a la aplicación la capacidad de comprensión y comunicarse con sus usuarios, sea cual sea el idioma que hablen.

[CLIC] También puede automatizar el proceso humano de análisis de secuencias de datos en busca de anomalías y reaccionar en consecuencia.

Estos son solo algunos ejemplos.

### <a name="slide-overview-of-azure-cognitive-services"></a>DIAPOSITIVA: Introducción de Azure Cognitive Services

Hemos hablado mucho sobre cómo pueden ayudar las técnicas de inteligencia artificial. Pero, ¿no se requieren muchos datos y una gran experiencia técnica para implementarlas?

No. Puede aprovechar la experiencia de Microsoft Research, que ha usado sus extensos repositorios de datos y expertos de inteligencia artificial para crear servicios comerciales de inteligencia artificial en Azure que puede usar a través de llamadas API REST sencillas. 

Esto es Azure Cognitive Services.

### <a name="slide-azure-cognitive-services"></a>DIAPOSITIVA: Azure Cognitive Services

Azure Cognitive Services incluye más de dos docenas de API, pero, en un nivel más amplio, ofrecen funciones en estas categorías de funcionalidad humana:

* Visión: descripción del contenido de fotografías, dibujos, texto y escritura a mano, y vídeo

* Voz: herramientas para comprender y reconocer voz, y generar voz natural y similar a la humana.

* Idioma: comprensión del contenido de documentos escritos y texto, y traducción entre lenguajes humanos.

* Decisión: esta es una categoría completamente nueva de Azure Cognitive Services que trata de la toma de decisiones de funcionalidad similar a la humana sobre los datos, el contenido y las interfaces de usuario de la aplicación.

* Búsqueda: respuesta a preguntas del lenguaje natural sobre el contenido de los repositorios grandes y no estructurados. 

### <a name="slide-azure-cognitive-services-with-service-names"></a>DIAPOSITIVA: Azure Cognitive Services (con nombres de servicio)

La categoría "Búsqueda" se trató en la conversación anterior en esta ruta de aprendizaje, AIML10. En este caso, abordaremos tan solo algunos de los demás servicios disponibles y los usaremos para mejorar el sitio web de un minorista: [CLIC]

Computer Vision: se usará para analizar el contenido de las fotografías del producto.

Custom Vision: se usará para identificar los productos específicos que el distribuidor vende.

Personalizer: que adaptará automáticamente el diseño de nuestro sitio web observando las preferencias del cliente y presentará las mejores categorías de producto en primer lugar, incluso para los usuarios anónimos.

Con todo, los principios de configuración y uso de Cognitive Services son los mismos para todas las API. Por lo tanto, lo que se aprende aquí se aplica a cualquiera de los servicios de inteligencia artificial que quiera usar.

### <a name="slide-computer-vision"></a>DIAPOSITIVA: Computer Vision

En primer lugar, echaremos un vistazo a la inteligencia artificial pregenerada para Computer Vision, y veremos cómo podemos usarla para dotar a una aplicación de la capacidad de ver y luego personalizarla según nuestras necesidades particulares.

### <a name="slide-shop-by-photo"></a>DIAPOSITIVA: Comprar por foto

Este es el sitio web de Tailwind Traders, un minorista de hardware. Tailwind Traders tiene muchas de las características de comercio electrónico habituales: la posibilidad de examinar el catálogo de productos, pedidos de productos en línea y búsqueda de productos en tiendas.
Pero también tiene algunas características habilitadas para inteligencia artificial, como veremos.

Como puede suponer, Tailwind Traders es una empresa ficticia, pero eso significa que puedo proporcionarle todo el código fuente para implementar esta aplicación. Puede encontrarlo en el vínculo de la parte inferior de esta diapositiva.

### <a name="slide-demo-shop-by-photo"></a>DIAPOSITIVA: Demostración: Comprar por foto

DEMOSTRACIÓN: "Definición del problema: Comprar por foto está dañado"

Vamos al sitio web real de Tailwind Traders. [CLIC]

Una de las características habilitadas para la inteligencia artificial se denomina "Comprar por foto". Esta característica permite al cliente cargar una foto de un producto que quizás quiere comprar y la idea es que la aplicación le indicará si el producto está disponible. Vamos a continuar y a probarlo ahora. Cargaremos esta imagen de un taladro que nos interese y la aplicación Tailwind Traders analizará la imagen, reconocerá que se trata de un taladro y mostrará el taladro que Tailwind Traders tiene a la venta, así como dónde encontrarlo en la tienda.

Pero vamos a intentarlo con una imagen diferente. Voy a volver a la página principal, usaré la característica "Comprar por foto" una vez más y esta vez elegiré esta imagen de unas tenazas. Por desgracia, cuando la aplicación analiza esa imagen, considera que es un martillo. Obviamente, no funciona bien, por lo que ahora vamos a ver si podemos averiguar qué es lo que ha salido mal y encontrar una manera de corregirlo mediante Computer Vision. 

### <a name="slide-how-computer-vision-works"></a>DIAPOSITIVA: Funcionamiento de Computer Vision

Pero antes de hacerlo, conviene sumergirse en un poco de teoría para entender cómo funciona Computer Vision. No se preocupe: habrá muy poca matemáticas y entender un poco sobre cómo funciona Computer Vision nos ayudará a comprender lo que puede ir mal y cómo corregirlo.

### <a name="slide-tasks-xkcd-comic"></a>DIAPOSITIVA: Tareas (cómic XKCD)

(Pausa de 10 segundos)

No hace mucho tiempo, poder darle una fotografía a un equipo y que este pudiera darnos información útil sobre lo que se encuentra en la imagen era literalmente algo de ciencia ficción. Este XKCD se publicó en septiembre de 2014. Ahora, cinco años después, un equipo puede indicar fácilmente si una foto es de un pájaro, gracias a la llegada de los macrodatos, la computación de GPU y las redes neuronales convolucionales. Vamos a ver de qué modo.

### <a name="slide-how-neural-networks-work-brandon-rohrer"></a>DIAPOSITIVA: Cómo funcionan las redes neuronales (Brandon Rohrer)

Esta explicación es una adaptación realizada con el permiso de Brandon Rohrer, propietario de un excelente blog y de una serie de tutoriales en vídeo en los que se explican con detalle muchos aspectos de inteligencia artificial y aprendizaje automático. Para obtener más información, consulte el blog de Brandon, ya que aquí no podré analizarlo con detalle.

### <a name="slide-computer-vision--convolutional-neural-network"></a>DIAPOSITIVA: Computer Vision / Red neuronal convolucional

Probablemente ha oído que la inteligencia artificial se consigue gracias al aprendizaje profundo.
El adjetivo "profundo" del término "aprendizaje profundo" no significa "intenso", sino simplemente que, durante el análisis de la imagen, esta pasa por una red neuronal formada por muchas capas. Eso es todo.

En la pantalla se trata de una red neuronal muy sencilla. Esta solo tiene cinco capas; los sistemas de visión del mundo real tienen decenas de capas, quizás cientos de ellas. Esta está diseñada para tomar una imagen como entrada y después clasificarla como uno de cuatro objetos: perro, bicicleta, manzana y pelota de tenis. Y eso es todo. No es capaz de reconocer ningún otro objeto fuera de aquellos para los que se ha entrenado.

### <a name="slide-trained-convolutional-nn"></a>DIAPOSITIVA: Red neuronal convolucional entrenada

Cuando se ha entrenado una red neuronal, la imagen de entrada pasa a través de la red capa por capa, y en cada capa transforma la imagen en imágenes diferentes y más pequeñas. Cada capa recombina las imágenes generadas en la capa anterior. Las imágenes se hacen cada vez más pequeñas hasta que al final consisten en un solo píxel con un valor comprendido entre el 0 y el 1. Ese valor representa la confianza que tiene la red neuronal en que la imagen representa el objeto dado: cuanto mayor sea el número, mayor confianza tendrá.

En este caso, hemos insertado una imagen de una bicicleta, y el nodo "bicicleta" del lado derecho es el que tiene el valor más alto. Así, parece que esta red neuronal está bien entrenada para detectar bicicletas (o por lo menos esta). Pero ¿cómo se "entrena" una red neuronal y cómo se transforma la imagen a lo largo del proceso?

En cada nodo de la red, en cada círculo, se aplica un filtro a la imagen.
Vendría a ser como un filtro de Snapshot o de Instagram, pero en vez de hacer algo útil, como mostrar la imagen en tono sepia o poner orejas de conejo a todas las caras, hace algo... distinto... que se ha decidido en el proceso de entrenamiento. Vamos a profundizar para ver en qué consiste.

### <a name="slide-filters-1"></a>DIAPOSITIVA: Filtros (1)

Vamos a tomar una imagen sencilla. Se trata de la imagen de una cruz. Tiene 9 por 9 píxeles, el blanco es "+ 1" y el negro es "-1". Vamos a aplicar un filtro a esta imagen, igual que sucede en cada uno de los nodos de la red neuronal.

### <a name="slide-filters-2"></a>DIAPOSITIVA: Filtros (2)

Para transformar esta imagen, aplicaremos una cuadrícula de pesos de 3x3. Las cuadrículas pequeñas, como esta, se acostumbran a usar en sistemas de visión de equipos: a veces 3x3, a veces 5x5, y con pesos determinados en el proceso de entrenamiento. Esta cuadrícula solo utiliza los pesos -1 y 1, pero acostumbra a haber más números aleatorios dentro de ese intervalo. [CLIC]

Para aplicar los pesos a la imagen, se superpone la cuadrícula de pesos centrándola en un píxel determinado de la imagen. [CLIC] A continuación, se multiplica cada peso por cada valor de píxel y se obtiene el promedio. Ese promedio se convierte en el píxel que se corresponde a la imagen de salida, alineado con el píxel central de la cuadrícula de pesos.

Probablemente haya observado que no se pueden usar los bordes de la imagen de entrada como píxeles centrales. Este es el motivo por el que la imagen de salida es dos filas y dos columnas más pequeña que la de entrada. Este (junto con otros tipos de transformaciones) es el motivo por el que la imagen se vuelve cada vez más pequeña a medida que disminuyen las capas, hasta que llega a tener un tamaño de un píxel.

### <a name="slide-filters-3"></a>DIAPOSITIVA: Filtros (3)

Vamos a desplazar la cuadrícula de pesos dos píxeles hacia abajo y hacia la derecha. Ahora, al multiplicar los pesos por los píxeles de origen y calcular el promedio, obtendremos un píxel de salida diferente (,55). La red neuronal barre los pesos en las filas y columnas de la imagen de origen para crear los píxeles en la imagen de salida.

De hecho, ese proceso de barrido del filtro a través de la imagen tiene un nombre complejo para una operación matemática simple: convolución. Y por esto se denominan redes neuronales convolucionales.

### <a name="slide-training-an-image-classifier"></a>DIAPOSITIVA: Entrenamiento de un clasificador de imágenes

Ahora sabemos que cada nodo (círculo) de la red neuronal es una transformación de sus imágenes de entrada, que se determina mediante una cuadrícula de pesos. El truco para entrenar una red neuronal es elegir esas pesos de forma que al final se obtengan los números adecuados.

[CLIC] Haremos esto con datos de entrenamiento: muchas imágenes de perros, bicicletas, manzanas y pelotas de tenis. Sabemos qué representa cada imagen (porque los seres humanos hemos observado estos referentes y los hemos etiquetado o "anotado"), así que lo único que hacemos es elegir pesos de forma que el nodo correcto obtenga el valor más grande en cada caso o, por lo menos, con la mayor frecuencia posible.

Pero en las redes de visión reales, puede haber millones de pesos para elegir y millones de imágenes etiquetadas para contraponerlas. ¿Cómo se determinan los pesos?

### <a name="slide-learning-backpropagation"></a>DIAPOSITIVA: Aprendizaje: Propagación hacia atrás

Este es el punto en el que la mayoría de libros sobre aprendizaje automático se centran en las matemáticas y comienzan a hablar de aspectos como la "propagación inversa", la "velocidad de aprendizaje" y la "función de costo". Pero, a menos que sea un investigador de inteligencia artificial, puede omitir todo esto por dos motivos.

En primer lugar, hay disponibles muchas herramientas excelentes que harán todas las matemáticas en su lugar, y aprovecharán recursos informáticos eficaces, como los almacenes de macrodatos y los procesadores de GPU. Probablemente haya oído hablar de herramientas como Tensorflow o Pytorch, que sirven para ello. Hablaremos más de ellas en las siguientes charlas de esta ruta de aprendizaje. 

En segundo lugar, incluso después de conocer toda esa información, para usar esas herramientas necesitará una gran cantidad de datos de entrenamiento, recursos informáticos eficaces y un equipo de ingenieros de inteligencia artificial para utilizarlo todo. En cambio, puede usar simplemente los recursos de un proyecto o de una empresa que ya ha usado muchos datos, recursos informáticos y experiencia para entrenar una red neuronal y usarla en una API.

### <a name="slide-pre-trained-convolutional-nn"></a>DIAPOSITIVA: Red neuronal convolucional previamente entrenada

Por lo tanto, solo puede usar el modelo con los pesos predeterminados y, como solo necesita detectar las clasificaciones de objetos para las que se ha entrenado el modelo, lo tiene todo listo para empezar. Basta con proporcionar la imagen y usar las clasificaciones que genera el modelo previamente entrenado. 

Algunos modelos no se limitan a clasificar: también pueden detectar la ubicación de los objetos en las imágenes o analizar la imagen de otras maneras.

### <a name="slide-demo-cognitive-services-computer-vision"></a>DIAPOSITIVA: Demostración: Cognitive Services Computer Vision

Ahora vamos a probar un modelo de inteligencia artificial entrenado previamente: Computer Vision de Cognitive Services. Este servicio analizará la imagen que proporcione y ofrecerá etiquetas (o clasificaciones) para los objetos que detecte. Estas son solo las etiquetas asociadas a las puntuaciones de confianza principales a la derecha de la red neuronal convolucional de antes, pero ahora está usando una red neuronal eficaz de Microsoft, capaz de identificar muchos miles de objetos.

Hay una interfaz de usuario simple basada en web que puede usar para probarlo en aka.ms/try-computervision. Vamos a probarla. En un momento, también le mostraré cómo acceder a la API mediante programación.

### <a name="video-computer-vision-via-web"></a>VÍDEO: Computer Vision por web

[CLIC] Esta es la página de Cognitive Services Computer Vision. Si se desplaza hacia abajo un poco en esa página, encontrará un buen formulario basado en web que nos permite cargar una imagen para su análisis, ya sea desde la web o como un archivo local. Vamos a intentar cargar esta imagen de un hombre con un casco de obra. En tan solo unos segundos, el servicio Computer Vision devolverá el análisis de esa imagen. A la izquierda, se muestran los objetos detectados en la imagen, mientras que a la derecha, tenemos la salida JSON con el análisis detallado. Esto incluye los nombres y las ubicaciones de los objetos detectados en la imagen, una lista de etiquetas o etiquetas asociadas a la imagen, una descripción del lenguaje sin formato de la imagen (en este caso, “un hombre con un casco de obra”) y muchas otras informaciones útiles.

### <a name="slide-cognitive-services-computer-vision"></a>DIAPOSITIVA: Cognitive Services Computer Vision

Aquí podemos ver que en la sección Objetos se han detectado dos objetos en la imagen: un accesorio para la cabeza y una persona.

Pero nos interesa más la sección "etiquetas", que proporciona clasificaciones para la imagen general junto con puntuaciones de confianza. En este caso, la clasificación que tiene una puntuación de confianza mayor, después de "hombre", es "tocado", que no es exactamente lo que necesitamos para la aplicación Comprar por foto. Estábamos buscando "casco de obra".
Desafortunadamente, esta API no está entrenada para detectar cascos de obra, sino solo cascos, y este objeto solo se sitúa en el número 6 en la puntuación de confianza. En seguida aprenderemos a corregir esto.

Pero si lo que quiere es incorporar funcionalidades de visión en una aplicación, en lugar de usar un formulario web, tendrá que acceder a la API de Computer Vision mediante programación.
Vamos a ver de qué modo.

### <a name="video-computer-vision-via-cli"></a>VÍDEO: Computer Vision por CLI

Puede interactuar con las API de Cognitive Service usando cualquier lenguaje que se pueda conectar a un punto de conexión HTTP, pero lo que tengo aquí [CLIC] es un script de bash que usa la CLI de Azure para crear recursos y se conecta a la API de Computer Vision API mediante "curl". Puede instalar el CLI de Azure en el shell local, pero aquí utilizo la extensión "Azure Account" (Cuenta de Azure) en Visual Studio Code para iniciar un Cloud Shell, lo que significa que no tengo que instalar nada. Una vez que el shell esté listo, puedo ejecutar comandos directamente desde este script de Bash. 

Este primer comando crea un grupo de recursos, que usaré para contener las claves que necesito para autenticar la API.

El siguiente paso consiste en crear las claves. Aquí voy a crear una clave general de Cognitive Services que puedo usar con muchos servicios, como Computer Vision.

A continuación, podemos mostrar la clave directamente en el terminal. [ESPERAR] Puede usar cualquiera de estas claves para interactuar con la API, por lo que guardaré la primera aquí, en una variable de entorno.

Con esa clave, podemos conectarnos a la dirección URL del punto de conexión proporcionada por el servicio Computer Vision, así que vamos a guardar también esa dirección URL en una variable de entorno.

A continuación, puede elegir una imagen para analizar. Aquí proporcionamos la dirección URL de una imagen, la misma imagen de un hombre con un casco que examinamos hace un momento.

Ahora podemos pasar la clave y la dirección URL de la imagen en el punto de conexión pasando una entrada JSON mediante curl. Y en unos pocos milisegundos, se recupera el análisis de la imagen como JSON. Puede ver los mismos resultados que vimos en la interfaz web hace un momento.

Por supuesto, podemos hacerlo con cualquier imagen que nos guste. Vamos a intentarlo de nuevo con una imagen diferente, en este caso, la imagen de un taladro. Una vez más, podemos pasarlo a la API mediante curl. [ESPERAR] Curiosamente, la etiqueta superior asociada a esta imagen es "camera" (cámara), lo que lamentablemente no nos ayudará a buscar la herramienta real, nosotros queremos "drill" (taladro).

### <a name="slide-adapting-computer-vision-models-with-your-own-data"></a>DIAPOSITIVA: Adaptación de modelos de Computer Vision con sus propios datos

Ahora puede ver por qué la API de Computer Vision puede no ser la mejor opción para la característica Comprar por foto de Tailwind Traders. En algunos casos, el modelo de visión que usa no está entrenado para identificar los productos específicos que Tailwind Traders vende. En otros casos, se ha entrenado para detectar *demasiados* tipos distintos de objetos y se ha encontrado uno incorrecto. Como acabamos de ver, ante la imagen de un taladro, nos ha devuelto la etiqueta de "cámara", un producto que Tailwind Traders no vende.

Afortunadamente, podemos solucionar este problema. Vamos a profundizar en la teoría durante un momento.

¿Y si le dijera que hay una forma de empezar con un modelo de visión entrenado previamente para identificar muchos miles de imágenes y adaptarlo para identificar solo los objetos que quiera, aunque estos no formasen parte de los datos de entrenamiento del modelo original? Suena raro, lo sé, pero veamos cómo funciona.

### <a name="slide-transfer-learning"></a>DIAPOSITIVA: Transferencia de aprendizaje

Aquí tenemos la red neuronal convolucional entrenada de antes con algo distinto: se ha eliminado la capa final con las clasificaciones de objetos. Lo que nos queda son las imágenes de la penúltima capa. Podemos omitir el hecho de que son imágenes (por ejemplo, imágenes de 3x3) y considerarlas simplemente datos. Ahora, cuando se proporciona una imagen en el lado izquierdo, en lugar de obtener puntuaciones de confianza, obtenemos una colección de matrices, o "características", con 9 puntos de datos cada una. En esta red inventada, se etiquetan como F1, F2... hasta F8.
Cada imagen que se coloca en el lado izquierdo genera una colección distinta de características en el lado derecho.

En realidad, no sabemos exactamente qué *son* esas características, pero sabemos que son útiles, porque lo fueron para clasificar todos los tipos de imágenes para las que se entrenó *originalmente* la red neuronal. Quizás una característica puede representar "verde" y fue útil para clasificar árboles y pelotas de tenis.
Otra podría contar el número de regiones de la imagen en forma de círculo y fue útil para clasificar las bicicletas y las luces de tráfico. La cuestión es que esas características no se definieron de antemano, sino que _aprendieron_ a partir de los datos de entrenamiento y son útiles para clasificar las imágenes _en general_. 

Y aquí está el truco: podemos usar esas características para clasificar objetos para los que la red original todavía no se ha entrenado.

### <a name="slide-transfer-learning-training-1---with-the-hammer"></a>DIAPOSITIVA: Entrenamiento de transferencia de aprendizaje (1 - con el martillo)

Supongamos que queremos un nuevo modelo para identificar martillos y cascos de obra. Podemos pasar una imagen de un martillo a la izquierda y recopilar las características a la derecha. En este caso, obtenemos 8 vectores de datos (uno para cada característica) y un indicador binario del tipo de objeto. Podemos repetir este proceso para diferentes imágenes de un martillo y recopilar los vectores de datos y el indicador binario cada vez.

### <a name="slide-transfer-learning-training-2---with-the-white-hard-hat"></a>DIAPOSITIVA: Entrenamiento de transferencia de aprendizaje (2 - con el casco blanco)

Ahora hagamos lo mismo con imágenes de cascos. Una vez más, recopilaremos en cada caso 8 vectores de datos y un indicador binario para cada imagen.

Si lo unimos todo, ¿qué tenemos? Una colección de vectores de datos, cada uno con un resultado binario asociado. Si conoce algo sobre la ciencia de datos, podrá adivinar lo que ocurre a continuación: podríamos crear un modelo de predicción sencillo, como una regresión logística o una red neuronal de una capa, para predecir las nuevas clasificaciones de objetos a partir de las características.

### <a name="slide-transfer-learning-trained-model"></a>DIAPOSITIVA: Modelo entrenado de aprendizaje de transferencia

A menudo, esto funciona sorprendentemente bien. Ni siquiera necesita muchos datos: a menudo con unas decenas de imágenes es suficiente, siempre que las categorías que quiera predecir se diferencien lo suficiente las unas de las otras. Y no necesita una gran capacidad informática para predecir unos cien resultados binarios de una cantidad relativamente pequeña de datos.

Por supuesto, este es un ejemplo inventado. Es probable que tenga que identificar más de dos objetos y seguro que la red neuronal subyacente generará muchas más que 8 características en el penúltimo nivel. Pero el principio sigue siendo el mismo: puede hacer esto con una capacidad de computación y unos datos nuevos modestos, y acostumbra a funcionar muy bien.

### <a name="slide-microsoft-cognitive-services-custom-vision"></a>DIAPOSITIVA: Microsoft Cognitive Services Custom Vision

Obviamente, no es necesario que entrene personalmente un modelo de aprendizaje de transferencia. Puede usar los modelos de visión avanzada de Computer Vision de Cognitive Services como base y proporcionar sus propias imágenes y clasificaciones al servicio denominado Custom Vision.

Igual que con Computer Vision, puede entrenar modelos de aprendizaje de transferencia mediante programación con la API, pero Custom Vision también proporciona una cómoda interfaz de usuario web para los modelos de entrenamiento. Ahora lo utilizaremos para entrenar un modelo para la característica Compra por foto de Tailwind Traders.

### <a name="slide-demo-customized-object-recognition"></a>DIAPOSITIVA: Demostración: Reconocimiento de objetos personalizados

Instrucciones de demostración: https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Custom%20Vision.md

### <a name="video-customvisionai"></a>VÍDEO: customvision.ai

[CLIC] Aquí estoy en la interfaz basada en web de Custom Vision. Nos proporciona una buena interfaz de usuario donde podemos proporcionar nuevas imágenes para el análisis de aprendizaje de transferencia. Y puede ver en este proyecto que ya he cargado varias imágenes. He cargado imágenes de destornilladores, tenazas, taladros y martillos, que voy a usar para entrenar el modelo personalizado. También nos gustaría detectar otro producto que Tailwind Traders vende: cascos. Vamos a hacer clic en "add images" (agregar imágenes), buscaremos una carpeta en el disco duro donde he recopilado algunas fotos de cascos, las seleccionaremos todas y las agregaremos al servicio, a la vez que proporcionamos la etiqueta "hard hat" (casco) para usarla en el entrenamiento.

Los archivos tardarán unos minutos en cargarse, pero mientras la acción se lleva a cabo, observe que no hay tantas imágenes en este proyecto: aproximadamente 180, o unas pocas docenas para cada una de las cinco categorías. A veces incluso menos. A pesar de eso, dado que los cinco tipos de objeto son bastante distintos, el modelo debe funcionar bastante bien.

Vamos a avanzar y hacer clic en el botón Train (Entrenar) para iniciar el aprendizaje de transferencia. Elegiremos la opción de entrenamiento rápido. Ahora se ejecutan todas esas imágenes a través de un modelo de visión complejo y se usa el aprendizaje de transferencia para crear un modelo predictivo para nuestras cinco categorías. Solo tarda unos segundos y nuestro modelo funciona bastante bien.
El umbral de probabilidad establece un límite por debajo del cual no se predecirá ninguna clasificación. Si solo aceptamos clasificaciones con una confianza del 50 % o más, el 90,9 % de esas predicciones son correctas: esto es lo que llamamos "precisión". Y el modelo clasifica correctamente el 88,2 % de las imágenes en general: esto es lo que llamamos "recuperación". En sus aplicaciones, podrá elegir un umbral de acuerdo con la tolerancia en caso de realizar la llamada equivocada, frente a no hacer ninguna llamada. En el caso de Tailwind Traders, podemos establecer el umbral en el lado inferior, ya que no es un gran problema sugerir el producto equivocado a un cliente. Si se tratara de una aplicación de detección de cáncer, probablemente realizaríamos una llamada diferente.

Ahora vamos a probar nuestro modelo en algunas imágenes nuevas que no ha encontrado antes. Para ello, hacemos clic en el botón de la opción de prueba rápida. Cargaremos un nuevo archivo desde la carpeta "test drive" (imágenes de prueba). Vamos a probar que pasa con nuestro hombre con un casco. Y puede ver que de hecho nuestra predicción de "hard hat" (casco) tiene una probabilidad del 99,9 %, por lo que haremos esa llamada con prácticamente cualquier umbral que elijamos.

Vamos a probar una imagen diferente: el taladro. Nuestro modelo identifica la imagen como un taladro con una probabilidad del 94,5 %. Y, por último, vamos a probar la imagen de las tenazas, que identifica con una confianza del 99,9 %.

Por lo tanto, el modelo funciona bien, aunque se ha entrenado en menos de 200 imágenes.
Esto se debe a que hemos restringido las posibles etiquetas a los productos que vendemos en Tailwind Traders.

Ahora que estamos satisfechos con nuestro modelo, podemos exportarlo e incorporarlo a nuestra aplicación. Si hace clic en el botón para exportar, puede exportar el modelo para iOS o Android, como un contenedor, o en nuestro caso en el formato ONNX universal. Ahora hemos descargado el modelo en el disco duro.

### <a name="slide-portable-deep-learning-models"></a>DIAPOSITIVA: Modelos de aprendizaje profundo portátiles

Hemos exportado nuestro modelo personalizado en el formato ONNX.

ONNX (Open Neural Network Exchange), es un estándar abierto lanzado por Microsoft y Facebook para promocionar el intercambio gratuito y la implementación de modelos de inteligencia artificial, y es compatible con una amplia gama de aplicaciones y proveedores de tecnología.

Ahora que hemos entrenado nuestro modelo de Custom Vision, vamos a integrarlo a la aplicación Tailwind Traders. Para ello, usaremos ONNX Runtime, un motor de inferencias de código abierto que proporciona funciones para generar predicciones a partir de modelos en formato ONNX.

### <a name="slide-onnximagesearchtermpredictorcs"></a>DIAPOSITIVA: OnnxImageSearchTermPredictor.cs

Ahora que hemos creado nuestro modelo personalizado, podemos llamarlo desde la aplicación usando su API. Aquí crearemos una nueva "sesión de inferencia" desde el archivo ONNX que hemos generado y después generaremos una etiqueta de clasificación a modo de cadena a partir de la imagen cargada.
A continuación, lo pasaremos por la característica de búsqueda existente del sitio web Tailwind Traders y veremos los resultados.

```csharp 
var session = new InferenceSession(filePath);

...

var output = session.Run(new[] { input });
var prediction = output
    .First(i => i.Name == "classLabel")
    .AsEnumerable<string>()
    .First();
```

### <a name="slide-demo-onnx"></a>DIAPOSITIVA: DEMOSTRACIÓN: ONNX

DEMOSTRACIÓN: Implementación de ONNX

### <a name="video-kudu"></a>VÍDEO: Kudu

[CLIC] El modelo que acabamos de exportar desde Custom Vision es, en realidad, un archivo ZIP que contiene el archivo ONNX real, model.onnx, que es la representación de texto de la red neuronal recién creada y también un archivo de manifiesto. 

El sitio web de Tailwind Traders existente ya usa un modelo de Computer Vision representado como archivo ONNX denominado products.onnx. El problema es que el modelo no reconoce correctamente muchos de los productos que vendemos en Tailwind Traders. Por lo tanto, tomaremos el archivo model.onnx que acabamos de exportar desde Custom Vision, le cambiaremos el nombre a products.onnx y lo reemplazaremos en nuestra aplicación web, de modo que Comprar por foto pueda reconocer los cinco productos en los que se ha entrenado.

Aquí en Azure Portal puede ver el recurso App Service que ejecuta el sitio web de Tailwind Traders. Lo que puedo hacer ahora en este App Service es ir a la sección Development Tools (Herramientas de desarrollo) y elegir la característica Advanced Tools (Herramientas avanzadas). Esto inicia la interfaz de Kudu. Ahora que ya se ha iniciado, puedo examinar el sistema de archivos del sitio web mediante la consola de depuración. Vamos a examinar site, w-root, Standalone, OnnxModels, donde se encuentra el archivo products.onnx. Ahora podemos reemplazarlo por la nueva versión del archivo products.onnx, creada con Custom Vision.

Ahora, volviendo a App Service, podemos continuar y reiniciar el servidor web, lo que hará que use el nuevo modelo ONNX en la característica Comprar por foto.

### <a name="video-netron"></a>VÍDEO: Netron

[CLIC] Mientras estamos esperando a que el sitio web se reinicie, eche un vistazo al modelo ONNX que acabamos de instalar. Existe una pequeña aplicación web de Lutz Roeder denominada Netron, que nos permite inspeccionar las redes neuronales en archivos ONNX. Vamos a continuar y abrir el archivo products.onnx. Aquí puede ver los niveles reales de la red neuronal representada por el modelo. Vamos a ampliarlo un poco y a echar un vistazo a la entrada en la parte superior. La entrada es una imagen. Se trata de una imagen RGB de tres niveles, de tamaño 224 x 224 píxeles. En realidad debía recortar y reducir verticalmente la imagen proporcionada por el usuario antes de proporcionarla al tiempo de ejecución de ONNX. Un pequeño secreto poco elegante es que los sistemas de visión de equipos tienen una visión bastante deficiente, funcionan con resoluciones de imagen muy bajas, pero aun así funcionan bien.

Ahora vamos a reducir la visualización y a desplazarnos por la red. Puede ver todos los niveles de la red neuronal creada por la visión personalizada y como cada nivel transforma la imagen de entrada, aplicando filtros y recombinando las imágenes de salida, tal como aprendió anteriormente en esta conversación. Con todo, cuando se llega al nivel de salida al final, puede ver que la salida es una lista de cinco valores: los cinco productos en los que se ha entrenado: martillo, casco, etc., junto con este valor con la etiqueta "loss" (pérdida), que es la confianza que el modelo predice para cada categoría. En la aplicación, debe elegir su propio umbral en relación con lo alta que debe ser la confianza.

De todos modos, ahora que se ha reiniciado el sitio web de Tailwind Traders, volvamos a la página principal y veamos cómo funciona nuestro nuevo modelo de visión. Vamos a seguir y a cargar una foto, y volveremos a intentar una vez más una de nuestras imágenes de prueba, concretamente, nuestra imagen de unas tenazas que no ha funcionado bien antes. Podemos ver que, de hecho, en lugar de pensar que era un martillo, el sitio web ha buscado "pliers" (tenazas) y me ha mostrado todos los productos de la oferta.

### <a name="slide-optimizing-app-ui-with-cognitive-services-personalizer"></a>DIAPOSITIVA: Optimizar la interfaz de usuario de la aplicación con Cognitive Services Personalizer

Tenemos tiempo para un ejemplo más de inteligencia artificial pregenerada, esta vez de la "Categoría de decisión" de Cognitive Services. El servicio "Personalizer" nos permite personalizar la interfaz de las aplicaciones en tiempo real, buscando un equilibrio entre lo que es más probable que el usuario quiera hacer y lo que *nosotros queremos* que haga.

### <a name="slide-recommended-screenshot"></a>DIAPOSITIVA: Recommended (captura de pantalla)

Podemos ver cómo funciona esta solución en la sección "Recomendaciones" del sitio web de Tailwind Traders, donde se muestra una selección de los departamentos de la tienda: uno consiste en una imagen grande acompañada por unas cuantas imágenes más pequeñas.

El servicio Personalizer elegirá por nosotros cómo se muestran esas secciones siguiendo una técnica de inteligencia artificial denominada "aprendizaje de refuerzo".

### <a name="slide-personalizer-in-action"></a>DIAPOSITIVA: Personalizer en acción

Microsoft lleva muchos años desarrollando Personalizer. Se usa en dispositivos Xbox para determinar qué actividades se incluyen en la página principal, como la reproducción de un juego instalado, la compra de un juego nuevo de la tienda o la visualización de otros jugadores en el mezclador. Desde el lanzamiento de Personalizer, el equipo de Xbox ha experimentado un aumento significativo en las métricas clave de involucración.

Personalizer también se usa para optimizar la ubicación de los anuncios en la búsqueda de Bing y los artículos destacados en MSN News, de nuevo con excelentes resultados en la mejora de la interacción de los usuarios.

Ahora también puede usar Personalizer en sus propias aplicaciones.

### <a name="slide-reinforcement-learning"></a>DIAPOSITIVA: Aprendizaje de refuerzo

Personalizer implementa una técnica de inteligencia artificial denominada "aprendizaje de refuerzo". Aquí le mostramos cómo funciona:

[CLIC] Supongamos que queremos mostrar una acción "hero" (modelo) al usuario. [CLIC] Es posible que el usuario no esté seguro de lo que debe hacer a continuación, [CLIC], pero podríamos mostrar una de varias sugerencias. En el caso de una aplicación de juegos, [CLIC] podría ser: "play a game" (jugar una partida), "watch a movie" (ver una película) o "join a clan" (unirse a un grupo). [CLIC] En función del historial del usuario y de otros datos contextuales (por ejemplo, su ubicación, la hora del día y el día de la semana), el servicio Personalizer [CLIC] clasifica las acciones posibles y [CLIC] busca la mejor sugerencia para promocionar [CLIC]. 

Esperamos que el usuario esté satisfecho [CLIC], pero ¿cómo podemos asegurarnos? Depende de lo que haga el usuario a continuación y de si eso era algo que queríamos que hiciera.
Según nuestra lógica de negocios [CLIC], asignaremos una "puntuación de recompensa" entre 0 y 1 a lo que suceda a continuación. Por ejemplo, dedicar más tiempo a jugar una partida o a la lectura de un artículo, o gastar más dinero en la tienda, puede dar lugar a mayores puntuaciones de recompensa. [CLIC] Personalizer vuelve a suministrar la información al sistema de clasificación para la próxima vez que se necesite destacar una actividad.

### <a name="slide-discovering-patterns-and-causality"></a>DIAPOSITIVA: Detectar patrones y causalidad

Pero no se trata solamente de un sistema de recomendaciones, que tiene el peligro de mostrar al usuario las cosas que ya sabe que le gustan. Porque, ¿qué ocurre con las cosas que podrían gustarle pero que no conoce? Personalizer acostumbra a estar en el modo de explotación, en el que recomienda la mejor actividad según el historial y el contexto, pero en ocasiones también entra en el modo de exploración y presenta al usuario cosas nuevas que de otra forma no vería. Vendría a ser como un sistema de pruebas A/B automatizadas, pero con más de dos ramas, todas probadas en tiempo real.

Puede controlar durante cuánto tiempo está activado el modo de exploración para ayudar al usuario a detectar nuevas características o nuevo contenido.

### <a name="slide-personalizer-for-tailwind-traders"></a>DIAPOSITIVA: Personalizer para Tailwind Traders

Para los usuarios anónimos que usen nuestra aplicación Tailwind Traders, usaremos la hora, el día de la semana y el sistema operativo del explorador como "contexto" para influir en las clasificaciones. En cuanto a la puntuación de recompensa, nos fijaremos en si se ha hecho clic o no en la sección Hero. En este sentido, proporcionamos una puntuación de recompensa de 1 si se hace clic en la categoría destacada y cero en los demás casos.

Con el tiempo, Personalizer determinará la mejor categoría para los usuarios anónimos según la hora del día, el día de la semana y el sistema operativo. También "explorará" el 20 % del tiempo para exponer categorías que, de lo contrario, no se presentarían.

### <a name="slide-demo-personalizer"></a>DIAPOSITIVA: DEMOSTRACIÓN: Personalizer

[CLIC] Ahora, vamos a ver a Personalizer en acción. Vamos a volver a la página principal de Tailwind Traders. Lo que no mencioné antes es que, en esta sección Recommended, el orden de los departamentos del producto viene determinado por Personalizer.
En este caso, se presenta el departamento eléctrico como imagen modelo. También podemos ver el comportamiento de "Explore" (Explorar) si actualizamos el sitio web varias veces.
Aparentemente, Personalizer considera que el Centro de jardinería obtiene la mejor involucración de usuarios anónimos en esta hora del día con el explorador y el sistema operativo que estoy usando aquí, pero puede ser que pruebe categorías distintas. Aquí, se ha mostrado fontanería y Personalizer también lo usará para medir la involucración.

### <a name="slide-pre-built-ai-in-production"></a>DIAPOSITIVA: Inteligencia artificial pregenerada en producción

Hemos visto varias formas en las que se puede usar inteligencia artificial pregenerada para mejorar sus aplicaciones con funcionalidad similar a la humana. Vamos a resumir con algunas cosas que debe tener presentes si quiere implementar estas aplicaciones en una aplicación de producción, posiblemente con capacidades en tiempo real para millones de usuarios.

### <a name="slide-cost-considerations"></a>DIAPOSITIVA: Consideraciones sobre el costo

Es probable que lo primero que le venga a la cabeza sea cuánto cuesta todo esto.

[CLIC] Si solo quiere probar cosas como haría un desarrollador, es decir, pequeñas cantidades de datos, unos cuantos intentos por aquí y por allí, es probable que le salga gratis. 

[CLIC] Para volúmenes de producción, se le cobrará por volumen y tarifa, en función del servicio que esté utilizando.

[CLIC] En este vínculo encontrará más información sobre los precios y las tarifas exactas para su servicio y región.

Si está empezando con Azure y quiere probar estos servicios, puede registrarse usando el vínculo de la derecha para obtener 200 $.

(La finalidad de esta diapositiva es ofrecer una introducción general del "modelo" de precios para los servicios cognitivos. Los asistentes deberá consultar los precios exactos del servicio que quieran usar en el vínculo proporcionado).

### <a name="slide-data-considerations"></a>DIAPOSITIVA: Consideraciones de datos

También debe pensar en dónde se van a usar los datos y cómo se usarán.

Tus datos, como imágenes o texto, se cargaran en Azure para realizar la inferencia, pero en ningún caso serán almacenados por Cognitive Services. En este vínculo encontrará toda la información sobre privacidad y cumplimiento normativo. Pero si trabaja en un sector regulado, como el sector médico, en el que no se puede trabajar sin firewall, tiene otra opción: los contenedores.

### <a name="slide-deployment-with-containers"></a>DIAPOSITIVA: Implementación con contenedores

Algunos Cognitive Services se pueden utilizar como contenedor independiente. Solo tiene que descargar la imagen de contenedor, implementarla detrás del firewall y usar los puntos de conexión locales que proporciona, igual que lo hace en Azure. La diferencia es que los datos no salen nunca de su red. El único motivo por el que el contenedor se conecta a Azure es para la facturación: el uso se cobra exactamente igual que en Azure.

### <a name="slide-ethical-considerations"></a>DIAPOSITIVA: Consideraciones éticas

He guardado la diapositiva más importante de hoy para el final. Ahora ha visto lo fácil que es integrar las eficaces capacidades de inteligencia artificial en sus aplicaciones. Con todo, las grandes capacidades implican una gran responsabilidad, y es muy importante entender el impacto que tendrá la aplicación en los usuarios y tener en cuenta sus implicaciones éticas.

Si está trabajando con tecnologías de inteligencia artificial, debe regirse por un marco de trabajo ético que:

* Se centre en *permitir* que las personas obtengan más información sobre lo que ya hacen, y no que la inteligencia artificial reemplace a los seres humanos.

* Sea *inclusivo* para todos los tipos de usuario, de modo que todo el mundo pueda beneficiarse igualmente de la aplicación.

* Sea justo y transparente y, en concreto, no margine a los grupos con poca representación. Recuerde lo que hemos aprendido antes: La inteligencia artificial es tan buena como los sean los datos con los que se ha entrenado. Además, debe asegurarse de que la aplicación funciona para todos sus usuarios potenciales, independientemente de quiénes sean o de cuál sea su aspecto.

Si no tiene establecido un marco de trabajo ético, un buen punto de partida son los propios principios de Microsoft para la inteligencia artificial. Puede obtener más información en este vínculo.

### <a name="slide-wrapping-up"></a>DIAPOSITIVA: Resumen

Resulta sencillo agregar funcionalidad similar a la humana con inteligencia artificial pregenerada. Los modelos pregenerados no pueden hacerlo todo, pero pueden solucionar una parte importante de cada caso concreto, de forma rápida. Más adelante en la ruta de aprendizaje veremos los modelos personalizados para el 20 % restante.

La inteligencia artificial es eficaz, pero no es magia. Se rige por datos y, fundamentalmente, en matemáticas bastante sencillas. Siempre tenga en cuenta los datos y úselos para ayudarle a entender lo que está ocurriendo. En concreto, recuerde que incluso en la mejor inteligencia artificial puede haber errores, especialmente en grupos que no están bien representados en los datos de entrenamiento.

Le recomiendo que lo pruebe. Aunque no se necesita una gran experiencia para empezar, hay que pensar en las implicaciones éticas de la inteligencia artificial y en cómo afecta a las personas, así que asegúrese de haber desarrollado un marco ético para usar la inteligencia artificial y adhiérase a él.

### <a name="slide-docs-alert"></a>DIAPOSITIVA: Alerta de Docs

Para obtener todos los detalles de Azure Cognitive Services, incluidas las guías de introducción y las referencias, consulte Microsoft Docs.

### <a name="slide-ms-learn-alert"></a>DIAPOSITIVA: Alerta de MS Learn

Y si quiere obtener información sobre cómo usar Cognitive Services, encontrará cursos gratuitos en Microsoft Learn que le guiarán por su utilización, paso a paso.

### <a name="slide-resources"></a>DIAPOSITIVA: Recursos

Para buscar vínculos a documentos y aprendizaje, y a todos los recursos que he mencionado en este artículo, consulte el vínculo de recursos de la sesión que encontrará en esta diapositiva. También puede reproducir todas las demostraciones que hemos visto hoy usando el código y los scripts disponibles en este repositorio de github. Y si quiere obtener una certificación de Microsoft en inteligencia artificial o ciencia de datos, los asistentes a la sesión de hoy pueden acceder a una oferta especial para obtener un certificado gratuito. Consulte este vínculo para obtener información.

¡Gracias!
