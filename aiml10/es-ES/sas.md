# <a name="shared-access-signatures"></a>Firmas de acceso compartido

Un par de demostraciones requieren el uso de [firmas de acceso compartido](https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview?WT.mc_id=msignitethetour2019-github-aiml10) para acceder a los blobs de una cuenta de Azure Storage. Se usan para conceder acceso temporal a los blobs que indexará Azure Search. Aquí se describen las formas de hacerlo.

## <a name="using-the-portal"></a>Mediante el portal

1. Vaya a los contenedores de blobs de almacenamiento, haga clic con el botón derecho en el contenedor deseado y seleccione `Get Shared Access Signature`.

![Obtención de una firma de acceso compartido](images/sas_portal.png "Obtención de una firma de acceso compartido")

2. Seleccione la hora de inicio y la de expiración adecuadas para la firma. En estos ejercicios, se deben seleccionar los permisos `Read` y `List` (desplácese hacia abajo para encontrar la casilla `List`).

![Configuración de SAS](images/sas_portal_step1.png "Configuración de SAS")

3. Copie la cadena de consulta como se muestra a continuación: 

![Firma de SAS](images/sas_portal_step2.png "Firma de SAS")

## <a name="using-microsoft-azure-storage-explorer"></a>Uso del Explorador de Microsoft Azure Storage

1. Descargue el [Explorador de Microsoft Azure Storage](https://azure.microsoft.com/en-us/features/storage-explorer/?WT.mc_id=msignitethetour2019-github-aiml10) e instálelo.

2. Vaya a los contenedores de blobs de almacenamiento, haga clic con el botón derecho en el contenedor deseado y seleccione `Get Shared Access Signature`.

![Obtención de una firma de acceso compartido](images/sas_explorer.png "Obtención de una firma de acceso compartido")

3. Seleccione la hora de inicio y la de expiración adecuadas para la firma. En estos ejercicios, se deben seleccionar los permisos `Read` y `List` (desplácese hacia abajo para encontrar la casilla `List`).

![Configuración de SAS](images/sas_explorer_step1.png "Configuración de SAS")

4. Copie la cadena de consulta como se muestra a continuación: 

![Firma de SAS](images/sas_explorer_step2.png "Firma de SAS")