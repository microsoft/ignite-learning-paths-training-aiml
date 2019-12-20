# <a name="speaker-notes"></a>Notas del orador

## <a name="slides"></a>Diapositivas

* Diapositiva: n.º 1

* Diapositiva: n.º 2
  * Machine Learning y DevOps son dos palabras de moda hoy en día. Los procesos de Machine Learning son cada vez más accesibles para más organizaciones, pero este aumento en la accesibilidad conlleva la necesidad de administrar los proyectos de Machine Learning de la misma manera que el resto del software.
  * MLOps, operaciones de Machine Learning o DevOps para Machine Learning es la confluencia de DevOps y Machine Learning. Esto es lo que analizaremos hoy.

* Diapositiva: n.º 3
  * Antes de empezar, no dude en realizar una captura de pantalla de esta diapositiva. Si visita los vínculos, encontrará esta presentación y todos los recursos empleados.

* Diapositiva: n.º 4
  * Al programar, escribimos un algoritmo para resolver un problema.
  * Ejecutamos datos (o una entrada) a través de ese algoritmo y obtenemos una respuesta.
  * Lo más importante es que sabemos (o podemos llegar a saber) cómo resolver ese problema.
  * ¿Qué sucede cuando no sabemos qué aspecto tiene ese algoritmo? Por ejemplo, ¿hay un pájaro en la foto? ¿Cuál es la probabilidad de que un solicitante no devuelva un préstamo?

* Diapositiva: n.º 5
  * Este es el tipo de problemas en el que el aprendizaje automático resulta útil.
  * Gracias al aprendizaje automático, podemos darles la vuelta a estos problemas y resolverlos proporcionando una gran cantidad de ejemplos con respuestas correctas y su entrada correspondiente, de modo que el equipo decida cuál es el algoritmo.

* Diapositiva: n.º 6
  * Lo que hacemos es dejar que el equipo compile un "modelo" para describir los datos.

* Diapositiva: n.º 7
  * Lo mejor de todo es que podemos usar ese modelo en lugar del algoritmo que habríamos escrito (si hubiéramos sabido cómo hacerlo).

* Diapositiva: n.º 8
  * Al usar el modelo, podemos obtener predicciones.
  * Hay que tener en cuenta que se trata de predicciones, no de respuestas tal y como las concebimos.
  * La calidad y la precisión de las predicciones depende de las técnicas y los algoritmos que se hayan usado para entrenar el modelo y, en especial, de los datos que se hayan utilizado.
  * Si se usan datos sesgados para entrenar el modelo, se obtendrá un modelo sesgado.

* Diapositiva: n.º 9
  * [Vea la Demostración 1](./demos/1-Show_Faulty_Prediction.md)

* Diapositiva: n.º 10
  * Veamos el trabajo que se lleva a cabo al crear un modelo predictivo.
  * Normalmente, hay operaciones de detección, transformación y preparación de datos... cierta creación de un modelo y entrenamiento con esos datos... y, después, una evaluación de la idoneidad de ese modelo.
  * Se trata de un proceso experimental muy iterativo que podría obligar a comenzar de nuevo muchas veces durante un largo período de tiempo.
  * Cuando llega el momento de implementar un modelo, el proceso suele ser similar al que se sigue en el caso del software: se empaqueta y se deja que el equipo de desarrolladores o de operaciones se encargue de implementarlo.

* Diapositiva: n.º 11
  * El proceso de creación suele llevarse a cabo en el equipo de un científico de datos o en hardware compartido para un entrenamiento intensivo.
  * Además, en muchas ocasiones, la implementación se realiza mediante unidades USB o incluso por correo electrónico.

* Diapositiva: n.º 12
  * Comparemos esto con un proceso correcto de DevOps que incluye las etapas de planificación, desarrollo y pruebas, lanzamiento en entornos de prueba y producción, y supervisión de lo que sucede en producción.
  * Pero, ¿DevOps solo se aplica al desarrollo de software? ¿Qué sucede con los algoritmos que mencionamos al principio?

* Diapositiva: n.º 13
  * Veamos la definición de DevOps según Microsoft (léala).
  * La palabra más importante aquí es "valor". DevOps no se limita a las correcciones de código o de errores, sino que ofrece valor en todo momento.
  * No hay nada más valioso que tener un modelo predictivo y poder mejorarlo.
  * Por tanto, esta definición no excluye los procesos de Machine Learning.
  * Veamos ahora un producto que puede resultar de ayuda.

* Diapositiva: n.º 14

* Diapositiva: n.º 15
  * Azure Machine Learning Service es un conjunto de servicios que ayuda en las tareas de MLOps (o DevOps para Machine Learning).
  * Vaya a ml.azure.com para obtenerlo.
  * Analicemos algunos de los elementos que le ayuda a administrar.

* Diapositiva: n.º 16
  * Simplemente haga una enumeración y describa cada punto.

* Diapositiva: n.º 17
  * Por el momento, vamos a centrarnos en las canalizaciones. Las canalizaciones son flujos de trabajo para entrenar los modelos. Queremos crear una para disponer de una manera repetible de compilar el modelo predictivo.

* Diapositiva: n.º 18
  * Es posible que haya oído hablar de Azure Pipelines, pero es importante tener en cuenta que se trata de productos distintos.
  * Hablaremos sobre las diferencias a continuación, pero a grandes rasgos, las canalizaciones de Machine Learning son adecuadas para los flujos de trabajo de entrenamiento, mientras que Azure Pipelines es ideal para la orquestación. Ambos se centran en aspectos diferentes.

* Diapositiva: n.º 19
  * ¿Cuál es la diferencia? ¿Por qué usar los dos?

* Diapositiva: n.º 20
  * Las canalizaciones de Machine Learning están diseñadas para flujos de trabajo específicos de Machine Learning.
  * Ejecuciones desatendidas: el entrenamiento de Machine Learning puede tener una ejecución muy prolongada y las canalizaciones de Machine Learning controlan este aspecto muy bien.
  * Reusabilidad: los pasos individuales de un flujo de trabajo pueden consumir muchos recursos y es posible que no sea necesario ejecutarlos cada vez. Si no es necesario volver a ejecutar el paso de preparación de datos, puede volver a usar la última salida.
  * Seguimiento: todo lo que se almacena está centrado en Machine Learning, no en la compilación de software general.

* Diapositiva: n.º 21
  * Por el contrario, Azure Pipelines se ha diseñado efectivamente para CI/CD.
  * Validaciones: son un excelente lugar para generar calidad, comprobaciones y saldos.
  * Integración: con otras aplicaciones, artefactos y dependencias.
  * Desencadenadores: le interesa desencadenar una orquestación por varios motivos.

* Diapositiva: n.º 22
  * Mientras se crea una canalización, en realidad se usa la mayoría de estos servicios.

* Diapositiva: n.º 23
  * Uso de conjuntos de datos o almacenes de datos para el entrenamiento de los datos, ejecución de un experimento para entrenar mediante procesos administrados y, después, terminar con un modelo.
  * Ese modelo se implementará, como se verá más adelante.

* Diapositiva: n.º 24
  * [Vea la Demostración 2](./demos/2-Build_a_Pipeline_With_Notebooks.md)

* Diapositiva: n.º 25
  * Esto es lo que se ha creado: la canalización de AML.
  * Preparación de datos

* Diapositiva: n.º 26
  * Paso de entrenamiento

* Diapositiva: n.º 27
  * Registro del modelo

* Diapositiva: n.º 28
  * También se ha usado un conjunto de datos (o un origen de datos) y un proceso.

* Diapositiva: n.º 29
  * Centrémonos ahora en cómo se trabaja en equipo.

* Diapositiva: n.º 30
  * Algunos de los procedimientos recomendados de DevOps que se usan en el desarrollo de software también se pueden aplicar a los proyectos de Machine Learning. Veámoslos a continuación.

* Diapositiva: n.º 31
  * Los archivos de Jupyter Notebook no solo contienen la entrada, sino también la salida. Esto puede resultar confuso y dificultar la combinación de los archivos. Solo nos interesan las celdas de entrada, es decir, el código que se ejecuta.
  * También queremos definir todos los elementos de la canalización (como ya hacemos).
  * Además, nos interesa incluir la infraestructura (como el proceso) y las dependencias (dependencias de Python, bibliotecas, etc.).
  * Y posiblemente algunos datos, no el conjunto completo (porque puede haber muchos PB en proyectos de Machine Learning), pero sí los suficientes para intentar llevar a cabo algunas pruebas de concepto.

* Diapositiva: n.º 32
  * Un origen de datos compartido conocido significa que todos los científicos de datos realizan el entrenamiento con los mismos datos de entrenamiento... y que esos datos también se usan para generar modelos.

* Diapositiva: n.º 33
  * Centrémonos ahora en la integración continua. Queremos:
  * Saber cuándo cambia el código del repositorio de origen.
  * Actualizar y, después, ejecutar la canalización de AML si se ha cambiado la forma de realizar el entrenamiento.
  * Comprobar la calidad del código mediante pruebas, detección de errores, etc.
  * Agregar procesos de solicitud de incorporación de cambios para asegurarnos de que el código se sigue compilando antes de combinarlo con la versión maestra (y de comenzar un trabajo de entrenamiento potencialmente caro).
  * Si quiere obtener más información sobre Azure DevOps, vaya aquí.

* Diapositiva: n.º 34
  * Lo importante es que todo es código y software. La calidad del código es importante aunque no esté acostumbrado a escribirlo.

* Diapositiva: n.º 35
  * [Vea la Demostración 3](./demos/3-Show_The_Build.md)

* Diapositiva: n.º 36
  * Todavía no se ha implementado nada, pero tenemos un modelo recién entrenado. ¿Cómo lo implementamos?
  * AML Service tiene la capacidad de tomar un modelo e implementarlo en ACI o AKS. Por eso, vamos a usarlo a continuación, pero no directamente desde esta interfaz de usuario.

* Diapositiva: n.º 37
  * Se podría agregar otro paso a la canalización de AML, pero no nos interesa hacerlo, ya que queremos tener un mayor control sobre la implementación.

* Diapositiva: n.º 38
  * La entrega continua se puede aplicar a los procesos de Machine Learning.
  * Se usará Azure Pipelines para la entrega continua.
  * Cuando se registre un nuevo modelo, comenzaremos la implementación.
  * Con Azure Pipelines, se puede realizar la implementación en sitios de prueba y de ensayo antes de activar el nuevo modelo.
  * Las pruebas se pueden ejecutar en entornos de preproducción.
  * Lo más importante es que, para controlar el lanzamiento, se recurrirá a las mismas técnicas que se usan para el resto del software.

* Diapositiva: n.º 39
  * [Vea la Demostración 4](./demos/4-Show_The_Release.md)

* Diapositiva: n.º 40
  * No se limite a poner nuevos modelos en producción. No lo haría en el resto del software, ¿por qué iba a hacerlo en los procesos de Machine Learning?

* Diapositiva: n.º 41
  * Esto es lo que se ha creado:
  * Una canalización para el entrenamiento, que es una canalización de AML, específica para entrenar el modelo
  * Al obtener un modelo nuevo, se inicia una canalización de implementación en Azure DevOps.
  * Realice la implementación en ACI, ejecute algunas pruebas y, si todo es correcto, podría implementarlo en AKS.

* Diapositiva: n.º 42
  * Como sucede con el resto del software, no interesa poner el modelo en producción y dejarlo ahí, y dar por supuesto que va a funcionar siempre.
  * Por tanto, se necesita una estrategia de reentrenamiento.
  * Puede ser de forma periódica, o bien cuando los datos sean lo suficientemente diferentes en producción como para no obtener los resultados deseados.
  * Azure ML Service tiene una solución justo para esto.

* Diapositiva: n.º 43
  * Al realizar el entrenamiento, se puede llevar a cabo desde un conjunto de datos de entrenamiento conocido.
  * Cuando en última instancia se implemente un modelo en producción, las entradas se pueden almacenar en otro conjunto de datos: el de inferencia.

* Diapositiva: n.º 44
  * Periódicamente, AML Service permitirá comparar estos dos conjuntos de datos en busca de un "desfase de datos". Si lo que se ve en producción tiene demasiado desfase con respecto a lo que se ha usado para entrenar el modelo, es posible iniciar un nuevo proceso de entrenamiento para generar otro modelo.
  * Esto se puede realizar de forma automática.

* Diapositiva: n.º 45
  * Evidentemente, si se cambia el código, también interesa cambiar la canalización de entrenamiento, que es lo que se ha visto hoy.

* Diapositiva: n.º 46
  * Es importante recordar que esto no es más que un ejemplo. En este caso, el modelo se implementa en contenedores, pero los modelos se podrían insertar en el software.
  * O es posible que ni siquiera se use AML, sino otros servicios cognitivos. Todos ellos están dotados de API excelentes con las que Azure Pipelines se puede comunicar.
  * En última instancia, Azure Pipelines lo puede orquestar todo. Por tanto, sea cual sea el conjunto de herramientas que se use, se puede utilizar para administrar el entrenamiento.

* Diapositiva: n.º 47
  * En resumen

* Diapositiva: n.º 48

* Diapositiva: n.º 49
  * Puede encontrar más recursos y código fuente en estos vínculos

* Diapositiva: n.º 50
  * Consulte también nuestra certificación para convertirse en Microsoft Certified Azure Data Scientist Associate o en Microsoft Certified Azure AI Engineer Associate.

* Diapositiva: n.º 51
  * Por primera vez, Microsoft ofrece exámenes de certificación GRATIS a todos los asistentes a los eventos. Aproveche esta ventaja para todas las certificaciones sobre aspectos básicos o basadas en roles.
  * La oferta consiste en un examen gratuito y es válida hasta seis meses tras el evento.
  * Disfrute de la oferta en la zona destinada a las pruebas in situ en la sala de exposición, o bien después del evento con la misma dirección de correo electrónico que haya indicado para registrarse en el evento. (Los funcionarios no pueden participar).
  * En caso de que se haya suscrito para recibir correos electrónicos promocionales de Microsoft, recibirá un correo con más detalles después del evento.

* Diapositiva: n.º 52
