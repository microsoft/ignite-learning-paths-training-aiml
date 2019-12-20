# <a name="aiml21-developers-guide-to-ai-a-data-story"></a>AIML21: Guía de inteligencia artificial para desarrolladores: una historia sobre datos 

## <a name="train-the-trainer-guide"></a>Guía de entrenamiento del instructor

### <a name="session-abstract"></a>Resumen de la sesión

En esta sesión teatralizada, se mostrará el proceso de ciencia de datos y cómo aplicarlo. Desde la exploración de conjuntos de datos a la implementación de servicios: todo contextualizado dentro de una historia de datos muy interesante. Esto también permitirá recorrer brevemente la plataforma de Azure AI.

# <a name="how-to-use"></a>Modo de uso

### <a name="welcome-presenter"></a>¡Le damos la bienvenida!

Nos complace que esté aquí y espere con ganas la llegada de este increíble contenido. Como presentador experimentado, estamos convencidos de que sabe **cómo** hacerlo, de modo que esta guía se centra en **aquello que** necesita presentar. Le proporcionará un repaso completo de la presentación creada por el equipo de diseño de presentaciones.

Junto con el vídeo de la presentación, este documento proporcionará vínculos a todos los recursos que necesita para presentar correctamente las diapositivas de PowerPoint y las instrucciones y el código de demostración.

* Lea el documento en su totalidad.
* Vea la presentación en vídeo.
* Formule preguntas de presentador principal.

# <a name="assets-in-train-the-trainer-kit"></a>Recursos del kit de entrenamiento del instructor

* Esta guía
* [Presentación de PowerPoint](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/presentations.md)
* [Grabación completa de la presentación](https://youtu.be/K8upKkvtEI0)
* [Conjuntos de datos utilizados](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/data)
* [Archivos de código que se van a ejecutar](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/code)
* Vídeos de demostración independientes: 
    * Demostración 1: [Explorar](https://youtu.be/-z6nfyq-WrI)
    * Demostración 2: [Experimentar](https://youtu.be/c7p_4CRYT8k)
    * Demostración 3: [Implementar](https://youtu.be/7bkBO7NQd4Q)
    * Demostración 4: [Presentar](https://youtu.be/g7aBaC9s9qQ)
* Instrucciones de la demostración

# <a name="demo-instructions"></a>Instrucciones de la demostración:

Descargue todo el código y los archivos de datos de este repositorio para comenzar. Hay una carpeta de código y datos que contendrá toda la información que necesita para ejecutar todas las demostraciones.

**Necesitará:**
* Suscripción de Azure; puede conseguir una [evaluación gratuita aquí](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml21) si la necesita.
* [Power BI Desktop (solo Windows)](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=msignitethetour2019-github-aiml21): si usa MacOS o Linux, todavía puede realizar la demostración de la funcionalidad desde cualquier explorador web moderno.

**Instrucciones de configuración:**
* Use el botón **Implementar en Azure** siguiente para crear el área de trabajo de Azure Machine Learning que se va a usar a lo largo de la sesión.

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

* Creación de un **área de trabajo de Power BI**
    * Abra [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21).
    * Inicie sesión con las credenciales del área de trabajo.
    * Haga clic en Áreas de trabajo en el panel de la izquierda.
    * Haga clic en Crear un área de trabajo.
    * Escriba un nombre de área de trabajo.
    * Escriba una descripción para el área de trabajo.
    * Haga clic en Guardar.
* Publicación del **informe de Power BI**
    * Abra Power BI Desktop con Present.pbix.
    * Haga clic en Publicar.
    * Seleccione el nombre del área de trabajo que acaba de crear.
    * Espere a que se publique el informe.
* Visualización del **informe de Power BI**
    * Vuelva a [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21). 
    * Actualice el explorador si es necesario.
    * Vea el informe en el panel izquierdo del explorador web.
    * Haga clic en el informe para que se cargue.

## <a name="demo-1---explore"></a>Demostración 1: Explorar

> 💡 Debe haber completado la [configuración](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-presenter.md#demo-instructions) antes de intentar realizar la demostración.

### <a name="video-demo-with-voice-over-aiml21---demo-1---explorehttpsyoutube-z6nfyq-wri"></a>Demostración en vídeo con narración: [AIML21: Demostración 1: Explorar](https://youtu.be/-z6nfyq-WrI)

* Inicie sesión en [Azure Portal](https://azure.microsoft.com/en-gb/?WT.mc_id=msignitethetour2019-github-aiml21) y abra la instancia de **Azure Machine Learning** que ha creado con la plantilla anterior.
* Para iniciar la experiencia de versión preliminar, haga clic en **"Iniciar versión preliminar ahora"** .
* Abra **"Proceso"** en el panel de la izquierda.
* Seleccione el vínculo **"Jupyter"** en la máquina virtual de Notebook.
* *Si es necesario, inicie sesión con las credenciales de Azure*.
* Abra [**Explore.ipynb**](code/explore.ipynb) *(se recomienda tener ya abiertas y listas estas pestañas)*
* Asegúrese de que todas las celdas de salida del cuaderno estén desactivadas: **Seleccionar celda -> Todos los resultados -> Borrar**.
* **Revise el vídeo de todos los puntos de conversación de cada demostración**.
* Recorra y explique brevemente las seis primeras celdas.
* Tenga en cuenta que hay más celdas y visualizaciones disponibles, y los asistentes deben descargar el código desde **[aka.ms/AIML21repo](http://aka.ms/aiml21repo)** .

## <a name="demo-2---experiment"></a>Demostración 2: Experimentar

> 💡 Debe haber completado la [configuración](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-presenter.md#demo-instructions) antes de intentar realizar la demostración.

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

> Una vez en ejecución, explique que se tardará algún tiempo en ejecutar el experimento y que revisará un ejemplo que se ha ejecutado antes. 

> Antes de empezar, asegúrese de que tiene una regresión de ML automatizado totalmente ejecutada, como se ha explicado antes.

* Seleccione el experimento ejecutado previamente en la página de ML automatizado de la izquierda, o bien seleccione el botón Atrás en el experimento que acaba de enviar.
* El experimento ejecutado previamente tendrá un "ID. de ejecución" largo; seleccione este vínculo.
* **Revise el vídeo de todos los puntos de conversación de cada demostración**.

## <a name="demo-3---deploy"></a>Demostración 3: Implementar

> 💡 Debe haber completado la [configuración](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-presenter.md#demo-instructions) antes de intentar realizar la demostración.

### <a name="video-demo-with-voice-over-aiml21---demo-3---deployhttpsyoutube7bkbo7nqd4q"></a>Demostración en vídeo con narración: [AIML21: Demostración 3: Implementar](https://youtu.be/7bkBO7NQd4Q)

> Usará el experimento que ha ejecutado y revisado antes para implementarlo.

* Comience en la pantalla con el **experimento de ML automatizado** ejecutado.
* Seleccione el botón **"Deploy Best Model"** (Implementar el mejor modelo).
* Cree un nombre de implementación, por ejemplo, aiml21-v1.
* Si lo prefiere, agregue una descripción de implementación.
* Establezca el tipo de proceso en ACI (instancia de Azure Container).
* Mantenga la autenticación habilitada.
* Seleccione el botón **Implementar**.
* Comente el tiempo que puede tardar la implementación; puede revisarla en la pestaña "Puntos de conexión" de la izquierda.

>Antes de empezar, asegúrese de que tiene un experimento de regresión de ML automatizado totalmente ejecutado y que ya se ha implementado en una ACI.

* Seleccione **Puntos de conexión** en el panel de la izquierda.
* Seleccione el modelo de instancia de Azure Container que ya ha creado.
* **Revise el vídeo de todos los puntos de conversación de cada demostración**.
* Seleccione la pestaña del explorador con Jupyter.
* Abra [Deploy.ipynb](code/deploy.ipynb).
* Asegúrese de que todas las celdas de salida del cuaderno estén desactivadas: **Seleccionar celda -> Todos los resultados -> Borrar**.
* Confirme que el archivo config.json se ha completado con la información correcta.
* Edite la segunda celda para incluir el nombre del servicio web que ha implementado.
* Ejecute todas las celdas del cuaderno y explique el código; **revise el vídeo de todos los puntos de conversación de cada demostración**.

## <a name="demo-4---present"></a>Demostración 4: Presentar

> 💡 Debe haber completado la [configuración](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/README-presenter.md#demo-instructions) antes de intentar realizar la demostración.

### <a name="video-demo-with-voice-over-aiml21---demo-4---presenthttpsyoutubeg7abac9s9qq"></a>Demostración en vídeo con narración: [AIML21: Demostración 4: Presentar](https://youtu.be/g7aBaC9s9qQ)

>Antes de comenzar la presentación, abra Power BI Desktop con [Present.pbix](code/Present.pbix) y [https://powerbi.microsoft.com/](https://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21), con el área de trabajo y el informe abiertos de la configuración anterior.

* Abra Present.pbix. 
* **Revise el vídeo de todos los puntos de conversación de cada demostración**.
* Muestre el botón Publicar.
* Abra [https://powerbi.microsoft.com/](https://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21).
* **Revise el vídeo de todos los puntos de conversación de cada demostración**.

# <a name="teardown-instructions"></a>Instrucciones de desmontaje

### <a name="full-teardown"></a>Desmontaje completo

* Acceda a Azure Portal y elimine el grupo de recursos de Azure para quitar todos los recursos de este proyecto

### <a name="to-save-costs"></a>Para ahorrar costos

* Asegúrese de seleccionar Apagar en la máquina virtual de Notebook siempre que no esté en uso
* Cuando no esté en uso, elimine la instancia de Azure Container en los puntos de conexión

# <a name="resources-and-continued-learning"></a>Recursos y aprendizaje continuo

**Microsoft Learn:**
* [Exploración de las herramientas de ciencia de datos en Azure](https://docs.microsoft.com/en-us/learn/paths/explore-data-science-tools-in-azure/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Introducción a Python](https://docs.microsoft.com/en-us/learn/modules/intro-to-python/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Automatización de la selección de modelos de ML con Azure Machine Learning Service](https://docs.microsoft.com/en-us/learn/modules/automate-model-selection-with-azure-automl/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Creación y uso de informes de análisis con Power BI](https://docs.microsoft.com/en-us/learn/paths/create-use-analytics-reports-power-bi/?WT.mc_id=msignitethetour2019-github-aiml21)


# <a name="feedback-loop"></a>Bucle de comentarios

Todos los oradores tendrán la oportunidad de asistir cada mes a **sesiones de preguntas y respuestas de entrenamiento para instructores** (dos sesiones que cubren todas las zonas horarias). Además, después de entregar el contenido en directo, nos gustaría que participase en las **sesiones de comentarios** organizadas para compartir su experiencia con el contenido y todo lo que quiera para proporcionar comentarios o ideas al respecto. 

¿Tiene algún comentario o sugerencia? Actualmente, el mejor bucle de comentarios para los cambios de contenido, sugerencias y comentarios es crear una incidencia en este repositorio de GitHub. Para obtener todos los detalles sobre cómo crear una incidencia, consulte los [documentos de contribución](../CONTRIBUTING.md).

## <a name="become-a-trained-presenter"></a>Convertirse en un presentador entrenado

Para convertirse en un presentador entrenado, póngase en contacto con [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com). En el correo electrónico, incluya lo siguiente:

- Nombre completo
- El código de esta presentación: aiml21
- Vínculo a un vídeo de usted presentando (10 minutos de duración aproximada; por ejemplo, vídeo de YouTube no publicado). 
  > No es necesario que sea este contenido; lo importante es mostrar sus aptitudes como presentador.

Un asesor se pondrá en contacto con usted para informarle sobre el proceso.

## <a name="trained-presenters"></a>Presentadores entrenados

Gracias a todas estas fantásticas personas ([clave de emoji](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/amynic">
        <img src="https://avatars3.githubusercontent.com/u/13828867?s=400&u=f6aca8528d65d6c191114d3a7328b46137eda162&v=4" width="100px;" alt="Amy Boyd"/><br />
        <sub><b>Amy Boyd</b></sub></a><br />
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/commits?author=amynic" title="Presentación">📢</a>Documentación
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/commits?author=amynic" title="">📖</a> 
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->
