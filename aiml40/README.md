# <a name="aiml40---taking-models-to-the-next-level-with-azure-machine-learning-best-practices"></a>AIML40: Traslado de modelos al siguiente nivel con los procedimientos recomendados de Azure Machine Learning

## <a name="session-information"></a>Información de la sesión

La inteligencia artificial y el aprendizaje automático se pueden usar de muchas maneras para aumentar la productividad de los procesos empresariales y recopilar información significativa mediante el análisis de imágenes, textos y tendencias dentro de flujos de datos no estructurados. Aunque muchas tareas se pueden resolver mediante modelos existentes, en algunos casos también es necesario entrenar un modelo propio para tareas más específicas o para obtener una mayor precisión. 

En esta sesión, se explorará la ruta completa de la integración de servicios inteligentes de análisis de texto en los procesos empresariales de [Tailwind Traders](http://tailwindtraders.com), empezando por los modelos precompilados disponibles como [servicios cognitivos](https://azure.microsoft.com/services/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml40), hasta el entrenamiento de un modelo neuronal personalizado de terceros para [análisis de sentimiento basado en aspectos](https://www.intel.ai/introducing-aspect-based-sentiment-analysis-in-nlp-architect/) disponible como parte de la [arquitectura NLP de Intel](http://nlp_architect.nervanasys.com/) con [Azure Machine Learning Service](https://azure.microsoft.com/services/machine-learning-service/?wt.mc_id=msignitethetour2019-github-aiml40). Se describirán casos en los que se necesita un modelo personalizado y se mostrarán formas rápidas de crear este tipo de modelo desde cero con [AutoML](https://docs.microsoft.com/azure/machine-learning/service/concept-automated-ml/?wt.mc_id=msignitethetour2019-github-aiml40) y cómo ajustar los hiperparámetros del modelo con [HyperDrive](https://docs.microsoft.com/azure/machine-learning/service/how-to-tune-hyperparameters/?wt.mc_id=msignitethetour2019-github-aiml40)

## <a name="table-of-content"></a>Tabla de contenido
 

| Recursos          | Vínculos                            |
|-------------------|----------------------------------|
| PowerPoint        | - [Presentación](presentations.md) |
| Vídeos            | - [Ensayo del simulacro](https://youtu.be/If9IQm3gWVQ) <br/>- [Grabación de Microsoft Ignite Orlando](https://myignite.techcommunity.microsoft.com/sessions/83002?source=sessions) |
| Demostraciones             | - [Demostración 1: Text Analytics de Cognitive Services](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#demo-1-text-analytics-cognitive-service) <br/>- [Demostración 2: Aprendizaje automático automatizado](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#demo-2-azure-automl) <br/>- [Demostración 3: SDK de Azure Machine Learning e Hyperdrive](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#demo-3-using-azure-ml-workspace-with-python-sdk) |

## <a name="delivery-assets"></a>Recursos de entrega

* [Presentación de PowerPoint](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/presentations.md)
* [Recursos adicionales para el presentador](README-Instructor.md)
* Vídeos de demostración:
    * Demostración 1: [Text Analytics de Cognitive Services](https://youtu.be/QJxjm5BirOA)
    * Demostración 2: [Aprendizaje automático automatizado](https://youtu.be/qrstXN6TLZk)
    * Demostración 3: [SDK de Azure Machine Learning e Hyperdrive](https://youtu.be/sccNTPO3PwU)


## <a name="overview-of-demonstrations"></a>Información general de las demostraciones

En esta presentación se realizan las demostraciones siguientes:

1. Uso de [Text Analytics de Cognitive Services](https://azure.microsoft.com/services/cognitive-services/text-analytics/?wt.mc_id=msignitethetour2019-github-aiml40) para determinar la opinión de una revisión de prendas.
2. Uso de [ML automatizado de Azure](https://docs.microsoft.com/azure/machine-learning/service/concept-automated-ml/?wt.mc_id=msignitethetour2019-github-aiml40) para crear un clasificador de texto casi sin código.
3. Uso de [Azure Machine Learning Service](https://azure.microsoft.com/services/machine-learning-service/?wt.mc_id=msignitethetour2019-github-aiml40) para entrenar un modelo de análisis de sentimiento basado en aspectos.

## <a name="starting-fast"></a>Inicio rápido

Si quiere comenzar de inmediato, puede implementar todos los recursos necesarios mediante la plantilla de Azure. 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml40%2Ftemplate%2Fazuredeploy.json" target="_blank">
 <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

A continuación se proporcionan instrucciones más detalladas para la demostración, a fin de que pueda realizar los pasos manualmente para comprender totalmente los conceptos que se muestran.

## <a name="initial-environment-setup"></a>Configuración inicial del entorno

Para realizar los pasos 2 y 3 de la demostración, es necesario:

1. Crear un área de trabajo de Azure Machine Learning
2. Cargar los datos que se usan para el entrenamiento de AutoML: [clothing_automl.xlsx](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_automl.xlsx)

#### <a name="creating-azure-machine-learning-workspace"></a>Creación de un área de trabajo de Azure Machine Learning

El área de trabajo de Azure Machine Learning se puede:
* Crear de forma manual, desde [Azure Portal](http://portal.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40) ([este es el proceso completo](https://docs.microsoft.com/azure/machine-learning/service/how-to-manage-workspace/?wt.mc_id=msignitethetour2019-github-aiml40))
* Implementar a partir de la plantilla de Azure proporcionada
* Crear a través de la [CLI de Azure](https://docs.microsoft.com/ru-ru/cli/azure/?view=azure-cli-latest&wt.mc_id=msignitethetour2019-github-aiml40)

> *NOTA: (En este ejemplo se usa `absa` como nombre y el centro de recursos *Oeste de EE. UU. 2*, pero no dude en cambiarlo)*

```shell
az extension add -n azure-cli-ml
az group create -n absa -l westus2
az ml workspace create -w absa_space -g absa
```

También debe conocer el identificador de la suscripción, que se puede obtener si ejecuta `az account list`.

#### <a name="uploading-data-to-the-workspace"></a>Carga de datos al área de trabajo

En las demostraciones, se usan varios conjuntos de datos:
* Un conjunto de datos para la demostración de ML automatizado: [clothing_automl.xlsx](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_automl.xlsx).
* El conjunto de datos grande [clothing_absa_train.csv](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_absa_train.csv) para entrenar el modelo de análisis de sentimiento basado en aspectos completo de la Demostración 3.
* Un conjunto de datos de depuración más pequeño para el modelo de análisis de sentimiento basado en aspectos [clothing_absa_train_small.csv](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing_absa_train_small.csv).
* Un conjunto de validación independiente [clothing-absa-validation.json](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml40/dataset/clothing-absa-validation.json) para probar el modelo.

Para seguir la demostración de ML automatizado, cargue el conjunto de datos en el área de trabajo. Puede hacerlo de forma manual a través del [portal de aprendizaje automático de Azure](http://ml.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40), o bien usar el archivo `upload_dataset.py` proporcionado (el archivo csv o xlsx debe estar en el directorio actual y debe sustituir `[subscription_id]` en función de la suscripción):

```shell
python upload_dataset.py -s [subscription_id] -w absa_space -g absa -f clothing_automl.xlsx
```

El código de la presentación cargará el conjunto de datos de ropa de ML automatizado al almacén de datos del servicio AML.

#### <a name="using-the-azure-ml-demo-code"></a>Uso del código de demostración de Azure ML

Puede ejecutar el código de la demostración desde cualquier entorno de Jupyter Notebook. Puede usar cualquiera de las opciones siguientes:
 - Instalar el entorno de Python de forma local, como se describe a continuación en **Instalación del entorno de Python**.
 - Usar Jupyter Notebook en un área de trabajo de Azure Machine Learning. Para ello:
     - Vaya a su [Portal de Azure Machine Learning](https://ml.azure.com/).
     - Seleccione **Notebooks** en el menú de la izquierda.
     - Cargue el archivo `absa.ipynb` y selecciónelo.
     - Se le pedirá que **cree una máquina virtual de Notebook**. Ahora puede usar el cuaderno directamente desde el portal.
 - Usar [Azure Notebooks](https://docs.microsoft.com/azure/notebooks/azure-notebooks-overview/?wt.mc_id=absa-notebook-abornst). En este caso, debe cargar el archivo `absa.ipynb` en un nuevo proyecto de Azure Notebooks. Además, debido a las limitaciones del proceso gratuito en Azure Notebooks (1 GB de espacio en disco), solo podrá ejecutar este cuaderno en una máquina virtual, tal y como se describe [aquí](https://docs.microsoft.com/azure/notebooks/use-data-science-virtual-machine/?wt.mc_id=msignitethetour2019-github-aiml40). 

#### <a name="python-environment-installation"></a>Instalación del entorno de Python

Si decide no usar Azure Notebooks y prefiere el entorno local de Python, debe instalar el SDK de Azure ML de Python y asegurarse de instalar notebook y contrib:

```shell
conda create -n azureml -y Python=3.6
source activate azureml
pip install --upgrade azureml-sdk[notebooks,contrib] 
conda install ipywidgets
jupyter nbextension install --py --user azureml.widgets
jupyter nbextension enable azureml.widgets --user --py
```

Después de esta operación tendrá que reiniciar Jupyter. Consulte [aquí](https://docs.microsoft.com/azure/machine-learning/service/quickstart-create-workspace-with-python/?WT.mc_id=msignitethetour2019-github-aiml40) las instrucciones detalladas.

Si necesita una cuenta de evaluación gratuita para comenzar, puede obtener una [aquí](https://azure.microsoft.com/offers/ms-azr-0044p/?WT.mc_id=msignitethetour2019-github-aiml40).

#### <a name="pre-creating-compute-cluster"></a>Creación previa del clúster de proceso

En las dos últimas demostraciones, necesita un clúster de proceso. Para fines de demostración, se creará un clúster que consta solo de un nodo. Esto se puede hacer de una de estas tres maneras:

1. En el [portal de aprendizaje automático de Azure](http://ml.azure.com/?wt.mc_id=msignitethetour2019-github-aiml40) vaya a la sección **Proceso** y cree manualmente un clúster de proceso de Azure Machine Learning con máquinas virtuales *Standard_DS3_v2* y especifique 1 como número de nodos. Asigne el nombre `absa-cluster` al clúster.
2. Ejecute el script `create_cluster.py` proporcionado, con los parámetros anteriores:
```shell
python create_cluster.py -s [subscription_id] -w absa_space -g absa
```
3. Ejecute las primeras celdas del cuaderno `absa.ipynb`, para crear el clúster de forma automática.

## <a name="demos"></a>Demostraciones

### <a name="demo-1-text-analytics-cognitive-service"></a>Demostración 1: Text Analytics de Cognitive Services

> 💡 Debe haber completado la [configuración del entorno](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#starting-fast) antes de intentar realizar la demostración.

En esta demostración, se muestra cómo Text Analytics puede realizar el análisis de sentimiento de una frase en una interfaz web.

1. Abra la [página Análisis de texto](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)
2. Desplácese hacia abajo hasta la sección **Véala en acción**  y escriba la frase *Me gustaban los pantalones de topos que compré en la tienda de Londres* (también puede dejar la frase predeterminada para demostrar el proceso).
3. Pulse **Analizar** para obtener el siguiente resultado:

![Captura de pantalla de Análisis de texto de Azure](images/analytics.png)

Observe que Análisis de texto no solo proporciona opiniones, sino que también extrae las palabras clave y la ubicación del texto.

### <a name="demo-2-azure-automl"></a>Demostración 2: Azure AutoML

> 💡 Debe haber completado la [configuración del entorno](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#starting-fast) antes de intentar realizar la demostración.

En esta demostración, se muestra cómo se puede usar ML automatizado para crear un modelo de aprendizaje automático sin código.

1. Vaya al área de trabajo de Azure Machine Learning (creada anteriormente) en [http://ml.azure.com](http://ml.azure.com/?WT.mc_id=msignitethetour2019-github-aiml40)
2. Vaya a **Conjuntos de datos**: debería ver el conjunto de datos que ha cargado antes (clothing_automl.xlsx). Tenga en cuenta que también puede cargarlo aquí a través del portal.
3. Seleccione el conjunto de datos.
4. En la pestaña **Información general**, expanda **Uso de ejemplo** y muestre el código que se puede usar para acceder a los datos mediante programación, si es necesario.
5. En la pestaña **Explorar**, examine los datos.
6. Vaya a la pestaña **ML automatizado** y haga clic en **Nuevo experimento.**
7. Seleccione el nombre del experimento y el proceso que se va a usar.
8. Seleccione el conjunto de datos.
9. Elija el tipo de tarea de predicción: **Clasificación**.
10. Seleccione la columna de destino: **Clasificación**.
11. Haga clic en **Iniciar**.

El experimento tardará mucho tiempo en ejecutarse, ya que se investigarán diferentes algoritmos. Si se muestra una demostración, tendría sentido ejecutar esto de antemano y mostrar los resultados.

### <a name="demo-3-using-azure-ml-workspace-with-python-sdk"></a>Demostración 3: Uso del área de trabajo de Azure Machine Learning con el SDK de Python

> 💡 Debe haber completado la [configuración del entorno](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml40#starting-fast) antes de intentar realizar la demostración.

En esta demostración, se ejecutará código personalizado de Python que usa el SDK de Azure ML de Python para entrenar, optimizar y utilizar el modelo personalizado de análisis de sentimiento basado en aspectos (ABSA).

Todas las instrucciones de esta parte de la demostración se encuentran en el propio cuaderno de Jupyter Notebook. Use uno de los métodos descritos anteriormente para ejecutar el cuaderno (en Azure Notebooks o de forma local) y siga esas instrucciones. 

## <a name="tear-down"></a>Desmontaje

Para liberar los recursos en la nube que se usan durante la demostración, debe eliminar el área de trabajo y el grupo de recursos de Azure ML:

```shell
az ml workspace delete --w absa_space -g absa
az group delete -n absa
```

## <a name="presenter-resources"></a>Recursos para el presentador

Si va a presentar este contenido, consulte los [recursos adicionales para el presentador](README-Instructor.md).

## <a name="resources-and-continue-learning"></a>Recursos y aprendizaje continuo

### <a name="getting-started-series"></a>Serie Introducción

* [Azure Cognitive Services Text Analytics API](https://aka.ms/TextCogSvc)
* [Automated Machine Learning](https://aka.ms/AutomatedMLDoc)
* [Ajuste de hiperparámetros](https://aka.ms/AzureMLHyperDrive)
* [Servicios de Azure ML y el SDK de Python](https://aka.ms/AA3dzht) 

### <a name="other-materials"></a>Otros materiales

* [9 sugerencias avanzadas para el aprendizaje automático en producción](http://aka.ms/9TipsProdML)
* [Análisis de sentimiento basado en aspectos de Intel](https://www.intel.ai/introducing-aspect-based-sentiment-analysis-in-nlp-architect/)
* Repositorios de procedimientos recomendados de Azure ML:
    * [Procesamiento de lenguaje natural](https://github.com/microsoft/nlp/)
    * [Computer Vision](https://github.com/microsoft/ComputerVision)
    * [Recomendaciones](https://github.com/microsoft/Recommenders)


## <a name="feedback-loop"></a>Bucle de comentarios

¿Tiene algún comentario o sugerencia? Actualmente, el mejor bucle de comentarios para los cambios de contenido, sugerencias y comentarios es crear una incidencia en este repositorio de GitHub. Para obtener todos los detalles sobre cómo crear una incidencia, consulte la documentación de [contribución](../../contributing.md).
