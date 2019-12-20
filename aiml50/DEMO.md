# <a name="aiml50---demonstration-setup-instructions"></a>AIML50: Instrucciones de configuración de la demostración

## <a name="create-demonstration-environment"></a>Crear el entorno de la demostración

[Tutorial en vídeo](https://youtu.be/C9WtOZaUoyA)

### <a name="prerequisites"></a>Requisitos previos

* Una suscripción de Azure
* Una organización de Azure DevOps para la que tenga derechos para agregar extensiones.
  * Un token de acceso personal (PAT) para la organización.
* Una cuenta de GitHub (a la que pueda bifurcar este repositorio)

### <a name="fork-the-repository"></a>Bifurcar el repositorio

En GitHub, [cree una bifurcación](https://help.github.com/en/github/getting-started-with-github/fork-a-repo) de este repositorio en un usuario o una organización que tenga bajo su control.  Necesitará permisos para conectar el repositorio de GitHub a Azure DevOps.

### <a name="deploy-the-template"></a>Implementar la plantilla

Este entorno se puede implementar mediante el vínculo "Implementar en Azure" a continuación (o puede usar Azure PowerShell o la CLI de Azure).  Necesitará una suscripción de Azure y las cuotas disponibles en una región para implementar:

* Instancias de Azure SQL Database
* Bases de datos de Cosmos DB
* Azure App Services
* Servicios de Azure Machine Learning

Se le pedirá que seleccione una suscripción de Azure y un grupo de recursos (puede crear un grupo de recursos en ese momento).

También se le pedirá un identificador de evento (o un motivo para la rotación del entorno) que se usará para ayudar a asignar nombres a los recursos.  Cuanto más corto, mejor.

Tendrá que proporcionar un nombre de usuario y una contraseña de base de datos para la instancia de Azure SQL.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fmicrosoft%2fignite-learning-paths-training-aiml%2fmaster%2faiml50%2ftemplate%2fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

La implementación tarda aproximadamente entre 30 y 40 minutos.

Una vez que la implementación esté en curso (al menos con Azure Machine Learning Service creado y con la instancia de Azure Container bootstrap-container ejecutada hasta completarse), puede terminar de configurar el entorno de Azure DevOps.  La mayor parte del entorno se configurará, pero deben realizarse algunos pasos manuales.

### <a name="set-up-azure-notebooks"></a>Configuración de Azure Notebooks

* Vaya a [Azure Notebooks](https://notebooks.azure.com/) e inicie sesión con la cuenta de Microsoft con la que está realizando la demostración.
* Agregue un proyecto nuevo.  Puede importar directamente desde GitHub (el repositorio principal o la bifurcación) o cargar el directorio de `aiml50/source` directamente.
* En el directorio `aiml50/source` de Azure Notebooks, cree un archivo JSON denominado `azureml-config` con:
  * Su identificador de suscripción
  * El nombre del grupo de recursos que contiene el área de trabajo de ML
  * El nombre del área de trabajo

Ejemplo:

```
{
    "subscription_id": "cd400f31-6f94-40ab-863a-673192a3c0d0",
    "resource_group": "aiml50",
    "workspace_name": "aiml50demo"
}
```


* Además, agregue el parámetro `location` a su región en el archivo `deploymentconfig.json`, si es necesario. La región ACI predeterminada es westus.

Ejemplo:
```
{
   "containerResourceRequirements": {
       "cpu":        2,
       "memoryInGB": 4
    },
    "computeType":       "ACI",
    "enableAppInsights": "True",
    "location":          "westus"
}
```
Referencia: https://docs.microsoft.com/en-us/azure/container-instances/container-instances-region-availability

* Haga clic (se abrirá en una nueva pestaña).
  * `seer_pipeline.ipynb`

#### <a name="seer_pipelineipynb"></a>seer_pipeline.ipynb

* Asegúrese de que el kernel está establecido en Python 3.6.
* Establezca la clave de la cuenta de almacenamiento.
* Edite el paso 4 y establezca el nombre de la cuenta de almacenamiento.
* Comience a ejecutar los pasos individuales.  Tendrá que autenticarse en Azure (siga las indicaciones del cuaderno). No olvide dejar que cada paso individual finalice antes de iniciar el siguiente.

### <a name="setup-the-azure-devops-project"></a>Configurar el proyecto de Azure DevOps

Después, vaya al proyecto AIML50 que se creó en la organización de Azure DevOps que especificó en la plantilla de implementación.

#### <a name="create-the-service-connections"></a>Crear las conexiones de servicio

En la página del proyecto, vaya a `project settings`.

![0-azure_devops_org](./images/0-azure_devops_org.png)
![1-azure_devops_project](./images/1-azure_devops_project.png)

Seleccione `Service Connections` bajo `Pipelines`.

![2-azure_devops_project_settings](./images/2-azure_devops_project_settings.png)

Agregue dos conexiones de servicio:

* Primera conexión `aiml50`
  * Tipo: Azure Resource Manager
  * Nombre de conexión: `aiml50`
    * Nombre de la conexión de servicio. Esto debe coincidir, puesto que ya se ha establecido en la compilación.
  * Nivel de ámbito: `Subscription`
    * Ámbito de autorización para la entidad de servicio. En este caso, establézcalo en `subscription`.
  * Suscripción: `Ignite The Tour`
    * La suscripción en la que se ha implementado el entorno de demostración. Puede ser diferente del ejemplo anterior. Puede elegir las suscripciones de la lista desplegable en función del usuario con el que haya iniciado sesión en Azure DevOps.
  * Grupo de recursos: `aiml50` o en blanco
    * Puede restringir las credenciales al grupo de recursos en el que haya realizado la implementación o al que haya permitido derechos en la suscripción.

![4-azure_devops_service_connection](./images/4-azure_devops_service_connection.png)
![3-azure_devops_service_connection](./images/3-azure_devops_service_connection.png)

* Segunda conexión: `aiml50-workspace`
  * Tipo: Azure Resource Manager
  * Nombre de conexión: `aiml50`
    * Nombre de la conexión de servicio. Esto debe coincidir, puesto que ya se ha establecido en la compilación.
  * Nivel de ámbito: `AzureMLWorkspace`
    * Ámbito de autorización para la entidad de servicio. Esto será necesario para la versión.
  * Suscripción: `Ignite The Tour`
    * La suscripción en la que se ha implementado el entorno de demostración. Puede ser diferente del ejemplo anterior. Puede elegir las suscripciones de la lista desplegable en función del usuario con el que haya iniciado sesión en Azure DevOps.
  * Grupo de recursos: `aiml50`
    * Debe ser el grupo de recursos con el área de trabajo de Azure Machine Learning.
  * Área de trabajo de Machine Learning: `aiml50demo`
    * Su nombre variará en función del evento o el calificador que use para aprovisionar el entorno.

![5-azure_devops_service_connection_add](./images/5-azure_devops_service_connection_add.png)
![6-azure_devops_service_connection_detail](./images/6-azure_devops_service_connection_detail.png)

#### <a name="enable-the-variable-group"></a>Habilitar el grupo de variables

Hay un grupo de variables que se aprovisionó con algunos valores compartidos que usarán la compilación y la versión.  Se debe conceder acceso a la canalización para el grupo de variables.

* Vaya a Biblioteca (en Canalizaciones).
* Seleccione el grupo de variables `aiml50-demo`.
* Alterne `Allow access to all pipelines`
* Guarde el grupo de variables.

![7-azure_devops_library](./images/7-azure_devops_library.png)
![8-azure_devops_library_detail](./images/8-azure_devops_library_detail.png)

#### <a name="create-the-build"></a>Crear la compilación

Ahora, es necesario crear una definición de compilación haciendo que Azure DevOps apunte a nuestra definición de compilación en GitHub.

* Vaya a `Pipelines` (bajo Canalizaciones).
* Seleccione `New Pipeline`

![9-azure_devops_pipeline_new](./images/9-azure_devops_pipeline_new.png)
![10-azure_devops_pipeline_new_source](./images/10-azure_devops_pipeline_new_source.png)


* Conéctese a su bifurcación del proyecto de GitHub [Ignite Learning Paths Training AI/ML](https://github.com/microsoft/ignite-learning-paths-training-aiml)

![11-azure_devops_pipeline_select_repo](./images/11-azure_devops_pipeline_select_repo.png)

![12-azure_devops_pipeline_select_build_definition](./images/12-azure_devops_pipeline_select_build_definition.png)

* Elija usar la definición de compilación del repositorio (`aiml50/azure-pipelines.yml`)

![13-azure_devops_pipeline_select_build_definition_location](./images/13-azure_devops_pipeline_select_build_definition_location.png)

#### <a name="run-the-build"></a>Ejecutar la compilación

Una vez que la compilación se ha conectado al repositorio de origen, es necesario ejecutar una compilación para crear la canalización de Machine Learning y crear un artefacto de compilación para que podamos finalizar la configuración de la canalización de versión.

* Revise la definición de la compilación y ejecute la compilación. La compilación se completará en unos minutos, pero desencadena una canalización de Machine Learning que puede tardar aproximadamente 20-40 minutos.

![14-azure_devops_pipeline_review_build_definition](./images/14-azure_devops_pipeline_review_build_definition.png)
![15-azure_devops_pipeline_build_result](./images/15-azure_devops_pipeline_build_result.png)

#### <a name="update-the-release"></a>Actualizar la versión

Una vez finalizada la canalización de Machine Learning, se puede actualizar la canalización de versión.

* Vaya a `Releases` (bajo Canalizaciones).

![16-azure_devops_release_new](./images/16-azure_devops_release_new.png)

* Seleccione `Release Seer` y elija `Edit`.

![17-azure_devops_release_edit](./images/17-azure_devops_release_edit.png)

  * Seleccione `Add an artifact`
![18-azure_devops_release_artifact](./images/18-azure_devops_release_artifact.png).


  * Establezca un `Source type` de `AzureML`.
  * Establezca el punto de conexión de servicio en `aiml50-workspace`.
  * Establezca los nombres de modelo en `seer`.  No podrá hacerlo hasta que finalice la primera canalización de ML.
  * Haga clic en `Add`.
  * Haga clic en el icono de rayo del nuevo artefacto y habilite `Continuous deployment trigger`.

![19-azure_devops_release_artifact_set](./images/19-azure_devops_release_artifact_set.png)


* Después, abra el entorno de `Deploy to ACI`.

![20-azure_devops_release_edit_2](./images/20-azure_devops_release_edit_2.png)

* Haga clic en `Agent Job`.
  * Establezca `Agent Pool` en `Azure Pipelines`.
  * Establezca `Agent Specification` en `ubuntu-18.04`.

![21-azure_devops_release_task_agent](./images/21-azure_devops_release_task_agent.png)

* Haga clic en `Download deployment and inferencing code`.
  * Establezca `Package name` en `seer_deployment`.

![22-azure_devops_release_task_edit](./images/22-azure_devops_release_task_edit.png)

* Haga clic en `Azure ML Model Deploy`.
  * Compruebe que el área de trabajo de Azure ML está establecida en `$(subscription_workspace)` o `aiml-workspace`.

![23-azure_devops_release_task_verify](./images/23-azure_devops_release_task_verify.png)

* Guarde la canalización y cree una nueva versión.



## <a name="troubleshooting-and-reference"></a>Solución de problemas y referencia

### <a name="checking-the-container-deployment-log"></a>Comprobación del registro de implementación del contenedor

En el grupo de recursos aprovisionado, navegue hasta la instancia de contenedor `bootstrap-container`. Desde allí, puede comprobar los registros del contenedor, que mostrarán los pasos realizados y los errores encontrados.

Después del modelo de implementación a ACI, compruebe que los **3** contenedores se ejecutan. Si ha finalizado, **reinicie** la instancia de ACI.

### <a name="provider-registration"></a>Registro del proveedor

La aplicación de Tailwind Traders usa muchos servicios de Azure. En algunos casos, si aún no se ha usado un servicio en su suscripción, es posible que se necesite un registro del proveedor. Los siguientes comandos garantizarán que su suscripción sea capaz de ejecutar la aplicación de Tailwind Traders.

```
az provider register --namespace Microsoft.OperationalInsights
az provider register --namespace Microsoft.DocumentDB
az provider register --namespace Microsoft.DBforPostgreSQL
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.Sql
az provider register --namespace Microsoft.ContainerRegistry
```

### <a name="source-repositories"></a>Repositorios de origen

https://github.com/microsoft/TailwindTraders

https://github.com/microsoft/TailwindTraders-Backend

https://github.com/microsoft/TailwindTraders-Website
