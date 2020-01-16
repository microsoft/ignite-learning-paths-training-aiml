# <a name="demo-guide"></a>Guía de la demostración
> 💡 Debe haber completado la [implementación](demosetup.md) antes de intentar realizar la demostración.

# <a name="demo-1-data-prep-demo-with-app"></a>Demostración 1: Demostración de preparación de datos con la aplicación
En la primera demostración, resalte la preparación de datos que se ha descrito en las diapositivas de los modelos de serie temporal. Revise paso a paso cómo hacerlo en la aplicación de demostración de C#. Asegúrese de resaltar que esto se puede realizar en cualquier lenguaje.

Para navegar por el código con los métodos abreviados de teclado `F12` y `CTRL-`, descargue [aquí](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vs-keybindings) la extensión de métodos abreviados de teclado de Visual Studio para VS Code. Esto es muy útil y evita tener que desplazarse para intentar buscar cosas. (Tenga en cuenta que esta extensión no funciona en Mac o Linux)

### <a name="data-prep-demo-video-herehttpsyoutubeu1ppyazunmot751"></a>Vídeo de la demostración de preparación de datos [aquí](https://youtu.be/u1ppYaZuNmo?t=751)

> 💡 Debe haber completado la [implementación](demosetup.md) antes de intentar realizar la demostración.

### <a name="1-open-the-igniteaimldataapp-app-i-personally-like-to-have-this-open-before-i-start-the-talk-so-i-can-just-flip-to-it"></a>1. Abra la aplicación `IgniteAimlDataApp`. Personalmente prefiero tenerla abierta antes de comenzar la presentación, para pasar a ella directamente.
* Abra el archivo `Program.cs`.
* Vaya al método `GetProcessedDataForScore`; para ello, haga clic con el botón derecho y seleccione `Go To Definition`, o bien presione `F12`.
    * Cargue los datos desde el origen de datos. En este ejemplo, se carga un archivo de Excel local en la solución.
* Presione `F12` para el método `AddWeeksToPredict` y analice la lógica.
    * Obtenga la fecha más reciente y agregue cuatro semanas futuras a partir de esa fecha.
    * Como los datos son semanales y quiere saber si ha habido algún día festivo durante la semana, se calculan todas las fechas de esa semana y se rellena una colección denominada `DatesInWeek`.
    * A continuación, cree horas futuras para las cuatro semanas futuras que ha agregado a la colección.
* Presione `F12` para el método `CreateTimeFeatures` desde la lógica de `AddWeeksToPredict` y descríbala.
    * Use la propiedad de hora actual para calcular las características de hora y días festivos necesarias.
* Presione `CTRL-` para volver a `AddWeeksToPredict`.
* Presione `F12` en `CreateFourierFeatures`.
    * Calcule las características de los términos de Fourier de la estacionalidad de las 52 características de datos semanales. 
* Presione `CTRL-` para volver a `GetProcessedDataForScore`.
* Presione `F12` para el método `CreateLagFeatures` y analice la lógica.
    * Agregue los valores de ventas de las 26 semanas anteriores a la fila actual.
* Presione `CTRL-` para volver a `GetProcessedDataForScore`.

* Opciones de copia de seguridad de la demostración de datos
    * Use el vídeo mp4 insertado en la diapositiva oculta. Hable sobre este vídeo sin sonido.
    * Comience en la diapositiva 21 y muestre el código de preparación de datos en pasos de diapositiva estáticos.

# <a name="demo-2-build-model-with-azure-machine-learning-designer"></a>Demostración 2: Compilación del modelo con el diseñador de Azure Machine Learning
💡 Debe haber completado la [implementación](demosetup.md) antes de intentar realizar la demostración.

### <a name="full-model-building-live-demo-video-herehttpsyoutubeu1ppyazunmot1278"></a>Vídeo completo de la demostración en directo de la compilación del modelo [aquí](https://youtu.be/u1ppYaZuNmo?t=1278)

### <a name="1-create-resource-and-upload-dataset"></a>1. Creación del recurso y carga del conjunto de datos

* Cree el recurso en Azure Machine Learning Studio y navegue hasta el área de trabajo nueva.
    * Revise el nivel anterior en el que se describen las diferentes herramientas en las diapositivas.
    * Recursos de vídeo para este paso:
        * [Este](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateAMLNavToWorkspace.mp4) es el vídeo de este paso sin sonido.
        * [Este](https://youtu.be/u1ppYaZuNmo?t=1278) es un vídeo sobre cómo crear el recurso con audio.
* Carga del conjunto de datos en los conjuntos de datos de AML
    * Haga clic en `Datasets`.
    * Haga clic en `Create from datastore` o desde el equipo local (el que prefiera).
        * NOTA: Ya debería haber cargado el conjunto de datos al almacén de datos en los pasos de configuración de la demostración.
    * Rellene los campos obligatorios y seleccione la opción `workspaceblobstorage`.
    * Haga clic en `Create`.
    * Opcional: recorra paso a paso la característica de preparación de datos en la carga de conjuntos de datos para AML

### <a name="2-launch-designer-and-explain-tool-features"></a>2. Inicio del diseñador y explicación de las características de las herramientas

* En Studio, seleccione "Designer" (Diseñador) en el panel de navegación de la izquierda.
* Resuma los distintos módulos en el panel de navegación de la izquierda, incluidos los conjuntos de datos de prueba.

### <a name="3-start-building-the--model"></a>3. Inicio de la compilación del modelo

* Arrastre y suelte el conjunto de datos en el área de trabajo del experimento.
    * Tenga en cuenta que el módulo de carga de archivos es una opción para hacer llegar los datos al área de trabajo.
* Arrastre `Select Columns in Dataset` hasta el área de trabajo.
    * Haga clic en `Edit columns` en el menú de parámetros del lado derecho.
    * Haga clic en `By Name`.
    * Haga clic en `Add All`.
    * Haga clic en el icono `Minus` de la columna `Time` para excluirla.
* Arrastre `Split Data` hasta el área de trabajo.
    * Edite los parámetros para dividir los datos 70/30. 
    * El porcentaje de división no es una regla y se puede cambiar según las necesidades de cada modelo.
* Arrastre `Train Model` hasta el área de trabajo.
    * Seleccione el nombre de la columna de etiqueta `Value` de los parámetros de la derecha.
* Arrastre `Boosted Decision Tree Regression` hasta el área de trabajo.
* Arrastre `Score Model` hasta el área de trabajo.
* Arrastre `Evaluate` hasta el área de trabajo.
* Conecte el módulo `Split Data` a `Train Model` para los datos de entrenamiento y `Score Model` para puntuar los resultados previstos con datos no vistos.
* Conecte `Train Model` al módulo `Boosted Decision Tree Regression` del algoritmo de entrenamiento.
* Conecte `Score Model` al módulo `Evaluate`.
* Normalmente, aquí se ejecutaría el modelo _pero_ en la demostración tarda demasiado en ejecutarse. Explique cómo haría clic en el botón `Run` del panel de navegación inferior y seleccionaría Proceso. Luego, puede pasar a describir con facilidad cómo crear recursos de proceso en AML.

* Cambie el nombre de la columna creada `Scored Labels` a `Forecast`.
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

### <a name="4-discuss-compute-target-creation"></a>4. Descripción de la creación del destino de proceso

* Haga clic en el elemento de navegación `Compute`.
* Haga clic en `Add`.
* Describa los distintos tipos de proceso y para qué se usan. Los procesos que se usan para esta demostración son `Machine Learning Compute` para el entrenamiento y `Kubernetes Service` para implementar la API.

### <a name="5-explain-trained-model"></a>5. Explicación del modelo entrenado
* Vuelva al diseñador visual.
* Haga clic con el botón derecho en el segundo módulo del modelo para visualizar los datos (probablemente `Select Columns in Dataset`).
* Desplácese rápidamente por los datos para mostrar su aspecto.
* Haga clic en una columna y muestre cómo la herramienta crea visualizaciones en el panel de la derecha.
* Visualice el módulo `Score Model` para mostrar cómo predice el modelo a partir de datos no vistos.
* Visualice el módulo `Evaluate Model` y analice las métricas que se usan para la puntuación.
    * Haga clic en `More Help` en el panel derecho de los parámetros.
    * Resalte que cada módulo tiene un vínculo a la documentación de los parámetros en la que se explicará lo que hace el módulo.
    * Desplácese hacia abajo y muestre las explicaciones de las métricas en la documentación del modelo.
    
### <a name="6-create-inference-pipeline-and-deploy-the-model"></a>6. Creación de una canalización de inferencia e implementación el modelo
Normalmente, aquí es donde se crearía `Inference Pipeline` para implementarlo en un servicio web, _pero_ estos pasos se han realizado con antelación. 
* Describa estos pasos, _no los ejecute en directo_:
    * Haga clic en `Create inference pipeline` y luego seleccione `Real-time inference pipeline`.
    * Asegúrese de que `Web Service Output` está conectado al último módulo del paso de procesamiento de datos `Select Columns in Dataset`.
    * Haga clic en `Run`.
    * Haga clic en `Deploy`.
* Después de explicar los pasos para crear `Inference Pipeline`, vaya al servicio web implementado desde el panel de navegación de la izquierda.
* Haga clic en el nombre del servicio web que ha creado antes.
* Haga clic en `Test` y muestre cómo funciona en un elemento de datos puntuado.
* Haga clic en `Consume` y muestre el código de ejemplo proporcionado para integrar el servicio web.


# <a name="demo-3-testing-api-with-c-console-app-dotnet-core"></a>Demostración 3: Prueba de la API con la aplicación de consola de C# (dotnet core)

> 💡 Debe haber completado la [implementación](demosetup.md) antes de intentar realizar la demostración.

### <a name="api-demo-test-video-herehttpsyoutubeu1ppyazunmot2136"></a>Vídeo de prueba de la demostración de la API [aquí](https://youtu.be/u1ppYaZuNmo?t=2136).

* Copie la clave de API desde la pestaña `Consume`.
* Abra el archivo `App.config` y pegue el atributo value.
* Copie `Request-Response Url` desde la pestaña `Consume`.
* Abra `Program.cs` y pegue el valor en `client.BaseAddress = new Uri("");`.
* Haga clic con el botón derecho en `Program.cs` y seleccione `Open in Terminal`.
* Escriba el comando `dotnet run` para ejecutar la aplicación de consola.
* Para usar los valores predeterminados StoreID (ID1) de 2 e ItemID (ID2) de 1, y el número de semanas que se va a predecir, simplemente escriba `y`.
* Esto se ejecutará y devolverá los valores de predicción de las cuatro semanas siguientes.
