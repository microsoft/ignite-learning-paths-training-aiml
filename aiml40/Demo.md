# <a name="aiml40---demo-instructions"></a>AIML40: Instrucciones de la demostración

Las instrucciones para las demostraciones de AIML40, incluida la preparación necesaria, se describen en detalle en [Materiales públicos de AIML40](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/). No duplicaremos los pasos que se describen, sino que resaltaremos algunos trucos importantes que hacen que la demostración sea mejor (y se ajuste al plazo de 45 minutos). Lea primero el material público para familiarizarse con el escenario de demostración.

## <a name="demo-preparation"></a>Preparación de la demostración

Como se describe en el [archivo Léame público de AIML40](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md), existen los siguientes pasos de preparación:

1. Crear el área de trabajo de Azure ML (mediante los comandos de CLI o la plantilla de Azure)
2. Cargar el conjunto de datos de la demostración de ML automatizado en el área de trabajo
3. Crear un clúster de proceso para acelerar la demostración
4. Configurar el entorno de Jupyter Notebook y abrir el archivo `asba.ipynb` en él, preparándose para la ejecución.

Por lo tanto, antes de la demostración, debe tener un explorador con las tres páginas siguientes abiertas:
 - [Página de Text Analytics](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)
 - [Área de trabajo de Azure ML](http://ml.azure.com)
 - Jupyter Notebook con `asba.ipynb`

Además de esos pasos, para garantizar una demostración rápida, debe hacer lo siguiente:

> 💡 Debe haber completado la [configuración del entorno](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/Demo.md#demo-preparation) antes de intentar realizar la demostración.

1. **Para la demostración 1:** Abra el explorador en la [página de Text Analytics](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40) y en el cuadro de texto que aparece a continuación escriba el texto siguiente y presione **Analizar**: 
> I loved the polka dot pants that I bought in the london store (Me gustaban los pantalones de topos que compré en la tienda de Londres)

[Vínculo de vídeo a la demostración 1: Text Analytics de Cognitive Services](https://youtu.be/QJxjm5BirOA)

2. **Para la demostración 2:**
   - Abra la página con el [área de trabajo de Azure ML](http://ml.azure.com). Si es necesario, seleccione el área de trabajo correcta.
   - Asegúrese de que se ha cargado el conjunto de datos.
   - Vaya a la pestaña **ML automatizado** del área de trabajo de Azure Machine Learning y realice el experimento de ML automatizado, tal y como se describe en el [archivo Léame público de AIML40](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md). Tardará mucho tiempo en ejecutarse, por lo que debe hacerlo con anticipación.
   - Asegúrese de actualizar la página poco antes de la presentación, para no tener que volver a iniciar sesión al realizar la demostración

[Vínculo de vídeo a la demostración 2: Aprendizaje automático (ML) automatizado](https://youtu.be/qrstXN6TLZk)

3. **Para la demostración 3:**
   - Abra `asba.ipynb` en el entorno de Jupyter
   - Asegúrese de que ha pegado el identificador de suscripción correcto en el código (y también el nombre del clúster o el nombre del grupo de recursos, en caso de que haya cambiado los valores predeterminados).
   - Ejecute todas las celdas del cuaderno asegurándose de que todos los pasos se ejecutan correctamente. Algunos de los pasos tardarán mucho tiempo en ejecutarse, por lo que debe prepararse con anticipación. (El experimento tarda aproximadamente 3,5 horas en ejecutarse; este es el motivo por el que es importante tener el clúster de proceso como prioridad baja, para ahorrar dinero).
   - Asegúrese de terminar de trabajar con el cuaderno justo antes de la demostración, de modo que no tenga que volver a escribir las credenciales.

[Vínculo de vídeo a la demostración 3: SDK de Azure Machine Learning e Hyperdrive](https://youtu.be/sccNTPO3PwU)


## <a name="demo-time"></a>¡Es la hora de la demostración!

Durante la demostración, se recomienda mostrar lo siguiente:

1. **Demostración 1.1**: Solo tiene que abrir el explorador con la [página de Text Analytics](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40) y hacer clic en **Analizar**. La página debe estar precargada.
2. **Demostración 1.2**: 
  - En la misma página, haga clic en **Example-English-Positive** (Ejemplo- Inglés- Positivo) para cambiar a la frase predeterminada *I had a wonderful trip to Seattle last week and even visited the Space Needle two times* (Hice un viaje estupendo a Seattle la semana pasada e incluso visité la torre Space Needle dos veces) y, después, haga clic en **Analizar**.
  - Observe la puntuación positiva correcta.
  - Elimine la palabra **wonderful**.
  - Haga clic en **Analizar** y observe la caída significativa de la puntuación.
3. **Demostración 2:** Área de trabajo de Azure ML y ML automático
  - Abra el explorador con la página del [área de trabajo de Azure ML](http://ml.azure.com); la página debe estar precargada.
  - Vaya a **Conjuntos de datos**.
  - Abra el conjunto de datos.
  - Expanda **Ejemplo de uso** en la pestaña **Información general** para mostrar el código.
  - Cambie a **Explorar** para mostrar los datos.
  - Cambie a **ML automático**.
  - Escriba el nombre del experimento, seleccione el proceso, seleccione el conjunto de datos (clothing_automl. xlsx).
  - Elija la tarea **Clasificación** y **Clasificación** como columna de destino.
  - Expanda **Configuración avanzada** y muestre las opciones disponibles, incluida la selección de algoritmos.
  - Haga clic en *Iniciar* (pero asegúrese de que tiene un experimento ejecutado previamente preparado, ya que el proceso tardará mucho tiempo).
  - Vuelva a hacer clic en la pestaña **ML automatizado** y muestre el experimento anterior que ha realizado antes, durante la fase de preparación.
  - Explique el gráfico que muestra las distintas ejecuciones del modelo y cuál es la mejor ejecución.
  - Haga clic en el mejor modelo para explorar **ROC**, **Precision-Recall** (Recuperación de precisión) y los otros gráficos de métricas con más detalle.
  - Realice una demostración del botón **Implementar modelo** para mostrar lo sencillo que es implementar un modelo.
4. **Demostración 3:** Uso del servicio Azure ML con el SDK de Python
  - Durante esta demostración, debe seguir y explicar las celdas del cuaderno `absa.ipynb`.
  - Para mantener completamente la seguridad, puede mostrar el código sin ejecutarlo: mantendrá la seguridad, pero no creará una impresión del código que se ejecuta en el modo de demostración real.
  - Para realizar una demostración más real, consulte el cuaderno [absa-instructions.ipynb](absa-instuctions.ipynb), en el que se explica cuáles son las celdas que *no* se deben ejecutar durante la demostración y cuáles son las que se pueden ejecutar de forma segura.
  - En general, lo que queremos evitar son tareas de ejecución prolongada.

## <a name="tear-down"></a>Conclusión

Dado que la demostración consume muchos recursos, no se olvide de llevar a cabo lo siguiente:
* Elimine el clúster de proceso (especialmente porque el escalado automático está desactivado en nuestra demostración, para ahorrar tiempo de preparación del clúster).
* Si está realizando la ejecución con un proceso de Azure Machine Learning, asegúrese de que los nodos mínimos se editan en 0 durante el tiempo de inactividad y en 1 durante el tiempo de demostración, ya que de este modo ahorrará costes.
* También puede eliminar el área de trabajo de Azure ML y el grupo de recursos; las instrucciones se proporcionan en el [archivo Léame público](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md).

