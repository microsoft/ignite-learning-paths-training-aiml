# <a name="demo-setup"></a>Configuración de la demostración
Siga los pasos siguientes para preparar el entorno para la demostración en directo. Una vez completada la configuración, siga la [guía de demostración](demoguide.md).

## <a name="create-azure-machine-learninge-resources-with-the-deploy-to-azure-button-below"></a>Creación de recursos de Azure Machine Learning con el botón Implementar en Azure
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow"> <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>

> Una vez creado, actualice el recurso de Azure Machine Learning a la edición Enterprise para esta sesión. Debe ver un botón "Actualizar" para completar esta acción. Actualmente esto se encuentra en versión preliminar; pero la estructura de precios se describe [aquí](https://azure.microsoft.com/en-us/pricing/details/machine-learning/).

## <a name="create-additional-resources-needed"></a>Creación de los recursos adicionales necesarios

* Seleccione **"Launch the new Azure Machine Learning studio"** (Iniciar el nuevo Azure Machine Learning Studio).

Una vez que haya creado el servicio Azure Machine Learning base, tendrá que agregar más recursos de proceso.
### <a name="create-compute-targets"></a>Creación de destinos de proceso
1. Para crear el proceso de Machine Learning:
    * Haga clic en el elemento de navegación "Proceso".
    * Seleccione "Clústeres de entrenamiento".
    * Haga clic en "Nuevo".
    * Escriba un nombre para el recurso.
    * Seleccione el tamaño de la máquina (por ejemplo: Standard_DS2_v2)
    * Escriba el número mínimo y máximo de nodos (se recomienda un valor mínimo de 0 y uno máximo de 5).
    * Haga clic en "Crear" ![Crear proceso](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif).
2. Para crear el proceso de Kubernetes:
    * Haga clic en el elemento de navegación "Proceso".
    * Seleccione "Inference Clusters" (Clústeres de inferencia).
    * Haga clic en "Nuevo".
    * Escriba un nombre para el recurso.
    * Seleccione una región.
    * Mantenga el valor predeterminado de "Tamaño de la máquina virtual".
    * Establezca el propósito del clúster en "Dev-test".
    * Haga clic en "Crear" ![Crear Kubernetes](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif).
3. Para crear la máquina virtual de Notebook:
    * Haga clic en el elemento de navegación "Proceso".
    * Seleccione "Máquinas virtuales de Notebook".
    * Haga clic en "Nuevo".
    * Asigne un nombre único al cuaderno.
    * Seleccione el tamaño de VM.
    * Haga clic en "Crear" ![Crear máquina virtual](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif).


## <a name="upload-dataset-to-workspace-blob-storage-and-save-to-local"></a>Carga del conjunto de datos en el almacenamiento de blobs del área de trabajo y guardado en el equipo local
El conjunto de datos necesario se crea semanalmente con fechas actualizadas para permitir que la demostración realice la predicción de semanas futuras. A continuación se indican los pasos para obtener el nuevo conjunto de datos y agregarlo a la cuenta de almacenamiento de Azure Machine Learning y a la aplicación de datos de demostración.

1. Descargue [aquí](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv) el conjunto de datos al equipo local.
2. Abra el Explorador de Azure Storage ([descárguelo aquí](https://azure.microsoft.com/en-us/features/storage-explorer/)).
3. Vaya a `azureml-blobstore-<guid>`.
4. Cree una carpeta con el nombre `datasets`.
5. Cargue el conjunto de datos.
6. Reemplace el archivo ForecastingData.csv local de la aplicación de demostración de C# para predecir fechas futuras. Hay un archivo .csv predeterminado, pero sin los datos actualizados.

## <a name="get-the-c-demo-app"></a>Obtención de la aplicación de demostración de C#
La primera demostración se realiza con VS Code e IgniteAimlDataApp de C#. Sirve para demostrar cómo realizar el procesamiento de datos y resaltar que se puede realizar en cualquier lenguaje.

1. [Descargue aquí VS Code](https://code.visualstudio.com/download).
2. Asegúrese de que tiene el [SDK de .NET Core 2.1.0](https://dotnet.microsoft.com/download/dotnet-core/2.1) instalado en el equipo local.
3. Clone la aplicación con el comando siguiente.
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
4. Vaya a la ruta de acceso del proyecto.
    * `cd ignite-learning-paths-training-aiml/aiml30/C#/IgniteAimlDataApp/IgniteAimlDataApp`
5. Abra el proyecto en VS Code.
    * `code .`
6. Reemplace el conjunto de datos local por el que ha descargado en el paso anterior en la carpeta `IgniteAimlDataApp/Datasets`.
7. Para ejecutar la aplicación:
    * Haga clic con el botón derecho en `Program.cs` y seleccione `Open in Terminal`.
    * Ejecute el comando `dotnet run`.
    * Se le mostrará una pregunta `Would you like to run the default params`; escriba `y`.
    * Esto intentará llegar a la API, pero se producirá un error porque todavía no se ha creado.

## <a name="run-through-the-live-demo"></a>Ejecución de la demostración en directo
Realice una ejecución completa de la demostración en directo para tener un modelo de respaldo completado para abrirlo y mostrar el resultado final.

#### <a name="there-will-not-be-enough-time-to-run-the-model-during-the-live-demo-make-sure-to-build-the-model-_without_-running-it-in-the-live-session-once-you-have-added-all-the-modules-to-the-experiment-workspace-then-navigate-to-the-model-you-created-and-trained-prior-to-the-session"></a>No habrá tiempo suficiente para ejecutar el modelo durante la demostración en directo. Asegúrese de compilar el modelo _sin_ ejecutarlo en la sesión en directo. Una vez que haya agregado todos los módulos al área de trabajo del experimento, navegue hasta el modelo que ha creado y entrenado antes de la sesión.

[Siguiente: Pasos de la demostración en directo](demoguide.md)
