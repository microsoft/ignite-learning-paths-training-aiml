# <a name="aiml30--start-building-machine-learning-models-faster-than-you-think--train-the-trainer"></a>AIML30: Creación de modelos de Machine Learning más rápido de lo que piensa: kit de entrenamiento del instructor

Tailwind Traders usa modelos de aprendizaje automático personalizados para corregir sus problemas de inventario, sin cambiar su ciclo de vida de desarrollo de software. ¿Cómo? Con el diseñador de Azure Machine Learning.
 
En esta sesión, obtendrá información sobre el proceso de ciencia de datos que usa Tailwind Traders y verá una introducción al diseñador de Azure Machine Learning. Verá cómo buscar, importar y preparar datos, cómo seleccionar un algoritmo de aprendizaje automático, cómo entrenar y probar el modelo, e implementar un modelo completo en una API. Obtenga las sugerencias, los procedimientos recomendados y los recursos que usted y su equipo de desarrollo necesitan para continuar con el recorrido por el aprendizaje automático, compilar el primer modelo y mucho más.


## <a name="demo-environment-deployment"></a>Implementación del entorno de demostración
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>


## <a name="create-additional-resources-needed"></a>Creación de los recursos adicionales necesarios
Una vez que haya creado el área de trabajo del servicio Machine Learning base, tendrá que agregar más recursos de proceso.
### <a name="create-compute-targets"></a>Creación de destinos de proceso
1. Para crear el proceso de Machine Learning:
    * Haga clic en el elemento de navegación "Proceso".
    * Haga clic en "Nuevo".
    * Escriba un nombre para el recurso.
    * Seleccione "Proceso de Machine Learning" en la lista desplegable.
    * Seleccione el tamaño de la máquina.
    * Escriba el número mínimo y máximo de nodos (se recomienda un valor mínimo de 0 y uno máximo de 5).
    * Haga clic en "Crear" ![Crear proceso](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif).
2. Para crear el proceso de Kubernetes:
    * Haga clic en el elemento de navegación "Proceso".
    * Haga clic en "Nuevo".
    * Escriba un nombre para el recurso.
    * Seleccione "Servicio de Kubernetes" en la lista.
    * Haga clic en "Crear" ![Crear Kubernetes](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif).


## <a name="build-model-with-azure-machine-learning-visual-designer"></a>Compilación del modelo con el diseñador visual de Azure Machine Learning

### <a name="1-upload-the-dataset-to-the-datasets-in-aml"></a>1. Carga del conjunto de datos en los conjuntos de datos de AML
* Descargue [aquí](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv) el conjunto de datos al equipo local.
* Haga clic en `Datasets`.
* Haga clic en `Create from local`.
* Rellene el formulario y cargue el conjunto de datos.

### <a name="2-start-building-the--model"></a>2. Inicio de la compilación del modelo

* Haga clic en `Designer` desde el panel de navegación de la izquierda.
* Haga clic en el signo más para crear una canalización.
* Expanda `Datasets` y `My Datasets`.
* Arrastre y suelte el conjunto de datos cargado en el área de trabajo del experimento.
* Arrastre `Select Columns in Dataset` hasta el área de trabajo.
    * Haga clic en `Edit columns` en el menú de parámetros del lado derecho.
    * Haga clic en `By Name`.
    * Haga clic en `Add All`.
    * Haga clic en el icono `Minus` de la columna `Time` para excluirla.
* Arrastre `Split Data` hasta el área de trabajo.
    * Edite los parámetros para dividir los datos 70/30. 
    * Esto no es una regla y se puede cambiar según las necesidades de cada modelo.
* Arrastre `Train Model` hasta el área de trabajo.
    * Seleccione el nombre de la columna de etiqueta `Values` de los parámetros de la derecha.
* Arrastre `Boosted Decision Tree Regression` hasta el área de trabajo.
* Arrastre `Score Model` hasta el área de trabajo.
* Arrastre `Evaluate` hasta el área de trabajo.
* Conecte el módulo `Split Data` a `Train Model` para los datos de entrenamiento y `Score Model` para puntuar los resultados previstos con datos no vistos.
* Conecte `Train Model` al módulo `Boosted Decision Tree Regression` del algoritmo de entrenamiento.
* Conecte `Score Model` al módulo `Evaluate`.
* Haga clic en el botón `Run` de la navegación inferior y seleccione Proceso. 

* Cambie el nombre de la columna creada `Scored Labels` por `Forecast`.
    * Arrastre `Edit Metadata` hasta el área de trabajo.
    * Conecte `Score Model` con el módulo `Edit Metadata`.
    * En la sección `Parameters` del módulo `Edit Metadata`, haga clic en `Edit Columns`.
    * Escriba `Score Labels` en el cuadro de texto (no es necesario cambiar ninguno de los valores predeterminados).
    * Haga clic en `Save`.
    * A continuación, actualice el campo `New Column Name` de `Parameters` a `Forecast`.
* Volver a transformar el valor normalizado en recuentos de elementos completos.
    * Arrastre `Apply Math Operation` hasta el área de trabajo.
    * Conecte `Edit Metadata` a `Apply Math Operation`.
    * Establezca `Basic math function` en `Exp`.
    * Haga clic en `Edit Columns` y escriba `Value` y `Forecast`.
    * Haga clic en `Save`.
    * Establezca `Output mode` en `Inplace`.
* Arrastre el módulo `Select Columns in Dataset` hasta el área de trabajo.
* Conecte `Apply Math Operation` a `Select Columns in Dataset`.
* Haga clic en `Edit Columns` y escriba los siguientes nombres de columna `ID1,ID2,Value,Forecast`.
* Estas son las columnas que la aplicación de demostración de datos esperará cuando se realice la publicación para obtener un resultado del modelo completado e implementado.
* Ejecute el entrenamiento.

### <a name="4-create-inference-pipeline-and-deploy-the-model"></a>4. Creación de una canalización de inferencia e implementación el modelo
* Haga clic en `Create inference pipeline` y luego seleccione `Real-time inference pipeline`.
* Asegúrese de que `Web Service Output` está conectado al último módulo del paso de procesamiento de datos `Select Columns in Dataset`.
* Haga clic en `Run`.
* Haga clic en `Deploy`.
* Navegue hasta el servicio web implementado desde el panel de navegación de la izquierda.
* Haga clic en el nombre del servicio web que ha creado antes.
* Haga clic en `Test` para ver cómo funciona en un elemento de datos puntuado.
* Haga clic en `Consume` para ver el código de ejemplo proporcionado para integrar el servicio web.

### <a name="5-test-api-with-c-console-app-dotnet-core"></a>5. Prueba de la API con la aplicación de consola de C# (dotnet core)

1. [Descargue aquí VS Code](https://code.visualstudio.com/download).
2. Clone la aplicación con el comando siguiente.
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
3. Vaya a la ruta de acceso del proyecto.
    * `cd ignite-learning-paths\aiml\aiml30\C#\IgniteAimlDataApp`
4. Abra el proyecto en VS Code.
    * `code .`
5. Reemplace el conjunto de datos local por el que ha descargado en el paso anterior en la carpeta `IgniteAimlDataApp/Datasets`.
6. Para ejecutar la prueba
    * Copie la clave de API desde la pestaña `Consume`.
    * Abra el archivo `App.config` y pegue el atributo value.
    * Copie `Request-Response Url` desde la pestaña `Consume`.
    * Abra `Program.cs` y pegue el valor en `client.BaseAddress = new Uri("");`.
    * Haga clic con el botón derecho en `Program.cs` y seleccione `Open in Terminal`.
    * Escriba el comando `dotnet run` para ejecutar la aplicación de consola.
    * Para usar los valores predeterminados StoreID (ID1) de 2 e ItemID (ID2) de 1, y el número de semanas que se va a predecir, simplemente escriba `y`.
    * Esto se ejecutará y devolverá los valores de predicción de las cuatro semanas siguientes.


### <a name="6-optional-additionally-test-api-with-python-in-notebook-vms-using-jupyter-notebooks"></a>6. Opcional: Pruebas adicionales de la API con Python en máquinas virtuales de Notebook con Jupyter Notebook
1. Vaya a `Compute` y cree una nueva máquina virtual de Notebook ![Crear proceso](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif).
2. Una vez creada en columna `Application URI`, haga clic en la opción `Jupyter Lab`. (Esto no se mostrará hasta que la máquina virtual esté en el estado `running`).
3. Haga clic en el terminal en la página principal de Jupyter Lab.
4. Clone el repositorio desde el terminal en Jupyter Lab.
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
5. También en el terminal, escriba `pip install holidays`.
6. Abra la carpeta `ignite-learning-paths-training-aiml` clonada y vaya al archivo `ignite-ailml30-get-prediction.ipynb` y haga clic para abrirlo.
    * La ruta de acceso completa debe ser similar a la siguiente: `ignite-learning-paths-training-aiml\aiml30\Python\ignite-ailml30-get-prediction.ipynb`
7. Actualice la ruta de acceso al archivo CSV, el punto de conexión y la clave.
8. Pulse `SHIFT + Enter` o haga clic en Reproducir en cada celda del menú superior para ejecutar cada celda.

## <a name="powerpoint-deck-and-video-demo"></a>Demostración en vídeo y presentación de PowerPoint

- [Presentación de PowerPoint](presentations.md)

- [Vídeos de demostración](https://www.youtube.com/watch?v=u1ppYaZuNmo&feature=youtu.be)

## <a name="resources-and-continue-learning"></a>Recursos y aprendizaje continuo

Esta es una lista de entrenamiento y documentación relacionados.

- [¿Qué es el diseñador de Azure Machine Learning?](https://docs.microsoft.com/en-us/azure/machine-learning/service/ui-concept-visual-interface?WT.mc_id=msignitethetour-slides-cxa)
- [Publicación de un experimento de Machine Learning con Microsoft Azure Machine Learning](https://docs.microsoft.com/en-us/learn/paths/publish-experiment-with-ml-studio/)


## <a name="feedback-loop"></a>Bucle de comentarios

¿Tiene algún comentario o sugerencia? Actualmente, el mejor bucle de comentarios para los cambios de contenido, sugerencias y comentarios es crear una incidencia en este repositorio de GitHub. Para obtener todos los detalles sobre cómo crear una incidencia, consulte la documentación de [contribución](../../contributing.md).
