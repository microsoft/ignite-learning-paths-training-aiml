# <a name="developers-guide-to-ai-a-data-story"></a>Guía de inteligencia artificial para desarrolladores: una historia sobre datos

En esta sesión teatralizada, explicaremos el proceso de ciencia de datos y cómo aplicarlo. Desde la exploración de conjuntos de datos a la implementación de servicios: todo contextualizado dentro de una historia de datos muy interesante. Esto también permitirá recorrer brevemente la plataforma de Azure AI.

# <a name="demo-environment-deployment"></a>Implementación del entorno de demostración

Descargue todo el código y los archivos de datos de este repositorio para comenzar. Hay una carpeta de código y datos que contendrá toda la información que necesita para ejecutar todas las demostraciones.

**Necesitará:**
* Suscripción de Azure; puede conseguir una [evaluación gratuita aquí](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml21) si la necesita.
* [Power BI Desktop (solo Windows)](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=msignitethetour2019-github-aiml21): si usa MacOS o Linux, todavía puede realizar la demostración de la funcionalidad desde cualquier explorador web moderno.

**Instrucciones de configuración:**
* Use el botón **Implementar en Azure** siguiente para crear el área de trabajo de Azure Machine Learning.

[![Implementar en Azure](https://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

* Inicie sesión en Azure Portal y en la instancia de Azure Machine Learning Service.
* Elija actualizar el área de trabajo a la **edición Enterprise (versión preliminar)** [(vea más información sobre los precios actuales aquí)](https://azure.microsoft.com/en-us/pricing/details/machine-learning/): necesitará la edición Enterprise para completar la demostración del experimento (Demostración 2).
* Inicie la **interfaz de usuario de la versión preliminar**.
* Cree una **máquina virtual de Notebook**.
    * Seleccione "Proceso" en el panel de la izquierda.
    * Seleccione "Nueva" en "Máquinas virtuales de Notebook".
    * Proporcione un "Nombre de máquina virtual de Notebook" (todo en minúsculas).
    * Mantenga el tamaño predeterminado proporcionado por la máquina virtual.
    * Una vez creada, seleccione el "vínculo Jupyter".
    * Haga doble clic para acceder a la carpeta de usuario.
    * Seleccione el botón Cargar y cargue los archivos que se enumeran a continuación:
        * [data/data_train.csv](data/data_train.csv)
        * [code/explore.ipynb](code/explore.ipynb)
        * [code/deploy.ipynb](code/deploy.ipynb)
        * [code/config.json](code/config.json)
    * Abra [config.json](code/config.json) y escriba la clave de suscripción, el grupo de recursos, el nombre del área de trabajo de Azure Machine Learning y guarde el archivo.

>Obtenga más información sobre las [máquinas virtuales de Notebook aquí](https://azure.microsoft.com/en-us/blog/three-things-to-know-about-azure-machine-learning-notebook-vm/?WT.mc_id=msignitethetour2019-github-aiml21).

* Creación de una **instancia de proceso**
    * Seleccione "Proceso" en el panel de la izquierda.
    * Seleccione "Nuevo" en la pestaña "Clústeres de entrenamiento".
    * Proporcione un "Nombre de proceso" (todo en minúsculas).
    * Seleccione un tamaño de máquina virtual:
        * Para un proceso estándar, seleccione algo como "Standard_DS2_v2".
        * Para un proceso de GPU, seleccione "Standard_NC6".
    * Seleccione "Prioridad baja" para la prioridad de la máquina virtual.
    * Establezca el número mínimo de nodos en 0 (se reducirá verticalmente de forma completa y reducirá los costos).
    * Establezca el número máximo de nodos entre 3 y 6.
    * Haga clic en "Crear".

>Obtenga más información sobre [Proceso de Azure Machine Learning aquí](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-set-up-training-targets#amlcompute/?WT.mc_id=msignitethetour2019-github-aiml21).

* Carga del **conjunto de datos**
    * Seleccione "Conjuntos de datos" en el panel de la izquierda.
    * Seleccione "Crear conjunto de datos" y después "Desde archivos locales".
    * Seleccione el botón "Examinar" y busque el archivo data_train_experiment.csv.
    * Seleccione "Siguiente".
    * Revise los datos y seleccione "Siguiente" dos veces.
    * Por último, repase la configuración del conjunto de datos y seleccione "Crear".

>Obtenga más información sobre la [creación de conjuntos de datos aquí](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-create-register-datasets/?WT.mc_id=msignitethetour2019-github-aiml21).

# <a name="delivery-of-assets"></a>Entrega de recursos

* [Presentación de PowerPoint](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/presentations.md)
* [Conjuntos de datos utilizados](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/data)
* [Archivos de código que se van a ejecutar](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/code)
* Vídeos de demostración independientes: 
    * Demostración 1: [Explorar](https://youtu.be/-z6nfyq-WrI)
    * Demostración 2: [Experimentar](https://youtu.be/c7p_4CRYT8k)
    * Demostración 3: [Implementar](https://youtu.be/7bkBO7NQd4Q)
    * Demostración 4: [Presentar](https://youtu.be/g7aBaC9s9qQ)

# <a name="demo-1---explore"></a>Demostración 1: Explorar

> 💡 Debe haber completado la [configuración](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-attendee.md#demo-environment-deployment) antes de intentar realizar la demostración.

### <a name="video-demo-with-voice-over-aiml21---demo-1---explorehttpsyoutube-z6nfyq-wri"></a>Demostración en vídeo con narración: [AIML21: Demostración 1: Explorar](https://youtu.be/-z6nfyq-WrI)

* Inicie sesión en [Azure Portal](https://azure.microsoft.com/en-gb/?WT.mc_id=msignitethetour2019-github-aiml21) y abra la instancia de **Azure Machine Learning** que ha creado con la plantilla anterior.
* Para iniciar la experiencia de versión preliminar, haga clic en **"Iniciar versión preliminar ahora"** .
* Abra **"Proceso"** en el panel de la izquierda.
* Seleccione el vínculo **"Jupyter"** en la máquina virtual de Notebook.
* *Si es necesario, inicie sesión con las credenciales de Azure*.
* Abra [**Explore.ipynb**](code/explore.ipynb).
* Presione MAYÚS + ENTRAR para ejecutar todas las celdas de código.

# <a name="demo-2---experiment"></a>Demostración 2: Experimentar

> 💡 Debe haber completado la [configuración](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-attendee.md#demo-environment-deployment) antes de intentar realizar la demostración.

### <a name="video-demo-with-voice-over-aiml21---demo-2---experimenthttpsyoutubec7p_4cryt8k"></a>Demostración en vídeo con narración: [AIML21: Demostración 2: Experimentar](https://youtu.be/c7p_4CRYT8k)

* Vaya a [ml.azure.com](https://ml.azure.com/?WT.mc_id=msignitethetour2019-github-aiml21) Azure Machine Learning Studio. Puede acceder directamente a través de la dirección URL y, después, iniciar sesión y seleccionar el área de trabajo correcta que ha creado para esta presentación. O bien, desde la instancia de Azure Machine Learning Service en Azure Portal, seleccione el botón **"Iniciar versión preliminar ahora"** .
* Seleccione **ML automatizado** en el panel de la izquierda.
* **Revise el vídeo de todos los puntos de conversación de cada demostración**.
* Haga clic en **"New automated ML run"** (Nueva ejecución de ML automatizado).
* Seleccione el conjunto de datos de entrenamiento (data_train_experiment-XXXXXX).
* Proporcione un nombre para el experimento, por ejemplo /aiml21-regression-duration.
* Seleccione **Duración** para la columna de destino.
* Seleccione el "Clúster de entrenamiento" del proceso que ha configurado antes.
* Seleccione **Siguiente**.
* Seleccione **Regresión** para la tarea de predicción.
* Seleccione **"Ver opciones de configuración adicionales"** y establezca la métrica principal en **"normalized_root_mean_squared_error"** .
* Establezca Simultaneidad, Número máximo de iteraciones simultáneas en 3.
* Establezca Criterio de salida, Tiempo de trabajo de entrenamiento (horas) en 1.
* Seleccione **"Guardar"** .
* Seleccione **Finalizar**.

> Esto tardará un tiempo en ejecutarse: aproximadamente 15-20 minutos. 

* Una vez completada, revise la salida de la ejecución de los modelos y busque el mejor modelo.

# <a name="demo-3---deploy"></a>Demostración 3: Implementar

> 💡 Debe haber completado la [configuración](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-attendee.md#demo-environment-deployment) antes de intentar realizar la demostración.

### <a name="video-demo-with-voice-over-aiml21---demo-3---deployhttpsyoutube7bkbo7nqd4q"></a>Demostración en vídeo con narración: [AIML21: Demostración 3: Implementar](https://youtu.be/7bkBO7NQd4Q)

* Desde el final de la Demostración 2
* Comience en la pantalla con el **experimento de ML automatizado** ejecutado.
* Seleccione el botón **"Deploy Best Model"** (Implementar el mejor modelo).
* Cree un nombre de implementación, por ejemplo, aiml21-v1.
* Si lo prefiere, agregue una descripción de implementación.
* Establezca el tipo de proceso en ACI (instancia de Azure Container).
* Mantenga la autenticación habilitada.
* Seleccione el botón **Implementar**.

>Esto tardará un tiempo en ejecutarse: aproximadamente 20-30 minutos.

* Una vez completado, seleccione **Puntos de conexión** en el panel de la izquierda.
* Seleccione el modelo de la instancia de Azure Container y revise los detalles.
* Seleccione la pestaña del explorador con Jupyter abierto.
* Abra [**Deploy.ipynb**](code/deploy.ipynb).
* Confirme que el archivo [config.json](code/config.json) se ha completado con la información correcta de las fases de configuración.
* Edite la segunda celda para incluir el nombre del servicio web que ha implementado.
* Ejecute todas las celdas del cuaderno y revise el resultado.

# <a name="demo-4---present"></a>Demostración 4: Presentar

> 💡 Debe haber completado la [configuración](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-attendee.md#demo-environment-deployment) antes de intentar realizar la demostración.

### <a name="video-demo-with-voice-over-aiml21---demo-4---presenthttpsyoutubeg7abac9s9qq"></a>Demostración en vídeo con narración: [AIML21: Demostración 4: Presentar](https://youtu.be/g7aBaC9s9qQ)

* Abra [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21).
* Inicie sesión con las credenciales del área de trabajo.
* Haga clic en Áreas de trabajo en el panel de la izquierda.
* Haga clic en Crear un área de trabajo.
* Escriba un nombre de área de trabajo.
* Escriba una descripción para el área de trabajo.
* Haga clic en Guardar.
* Abra Power BI Desktop con Present.pbix.
* Interactúe con los datos y los objetos visuales.
* Haga clic en el botón Publicar.
* Seleccione el nombre del área de trabajo que acaba de crear.
* Espere a que se publique el informe.
* Vuelva a [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21). 
* Actualice el explorador si es necesario.
* Vea el informe en el panel izquierdo del explorador web.
* Haga clic en el informe para que se cargue.

# <a name="teardown-instructions"></a>Instrucciones de desmontaje

### <a name="full-teardown"></a>Desmontaje completo

* Acceda a Azure Portal y elimine el grupo de recursos de Azure para quitar todos los recursos de este proyecto

### <a name="to-save-costs"></a>Para ahorrar costos

* Asegúrese de seleccionar **Apagar** en la máquina virtual de Notebook siempre que no esté en uso
* Cuando no esté en uso, **elimine** la instancia de Azure Container en los puntos de conexión

# <a name="resources-and-continued-learning"></a>Recursos y aprendizaje continuo

**Microsoft Learn:**
* [Exploración de las herramientas de ciencia de datos en Azure](https://docs.microsoft.com/en-us/learn/paths/explore-data-science-tools-in-azure/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Introducción a Python](https://docs.microsoft.com/en-us/learn/modules/intro-to-python/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Automatización de la selección de modelos de ML con Azure Machine Learning Service](https://docs.microsoft.com/en-us/learn/modules/automate-model-selection-with-azure-automl/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Creación y uso de informes de análisis con Power BI](https://docs.microsoft.com/en-us/learn/paths/create-use-analytics-reports-power-bi/?WT.mc_id=msignitethetour2019-github-aiml21)

# <a name="feedback-loop"></a>Bucle de comentarios

¿Tiene algún comentario o sugerencia? Actualmente, el mejor bucle de comentarios para los cambios de contenido, sugerencias y comentarios es crear una incidencia en este repositorio de GitHub. Para obtener todos los detalles sobre cómo crear una incidencia, consulte la [documentación de contribución](../CONTRIBUTING.md).
