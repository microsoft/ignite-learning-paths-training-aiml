# <a name="bootstrap-container"></a>Contenedor de arranque

Esta imagen de contenedor ayuda a rellenar los huecos en el proceso de aprovisionamiento.

## <a name="contents"></a>Contenido

Basado en el contenedor de PowerShell Core

Software:

* Curl
* Wget
* CLI de Azure
* Extensión de Azure DevOps para la CLI de Azure
* AzCopy
* Módulo de PowerShell de VSTeam (y módulos auxiliares)

Archivos de contenido:

* ReleaseSeer.json: plantilla de versión de Azure DevOps
* Imágenes: imágenes de aprendizaje y producto del sitio web (extraídas de CDN del evento al compilar el contenedor)

## <a name="bootstrap-process"></a>Proceso de arranque

El contenedor inicia un script de PowerShell que, en este orden, realiza lo siguiente:

* Comprueba o crea un proyecto denominado `AIML50` en la organización de Azure DevOps de destino.
* Comprueba o agrega la extensión `ms-air-aiagility/vss-services-azureml` a la organización.
* Comprueba o crea una fuente de artefactos denominada `SeerPackages`.
* Comprueba o crea un grupo de variables denominado `aiml50-demo`.
* Comprueba o importa la definición de la versión de ReleaseSeer.
* Copia los archivos de imagen en el almacenamiento de Azure creado mediante la plantilla de implementación.
* Inicia el sondeo del sitio de Tailwind Traders para que esté en funcionamiento. (Dicho sondeo se ejecuta cada 10 segundos).
  * Una vez que el sitio esté en funcionamiento, el sondeo desencadenará la operación de scaffolding del proyecto de base de datos, lo cual permitirá continuar con el siguiente paso.
* Se conecta a Azure SQL Database para insertar un registro de una llave inglesa (hasta 5 intentos con una pausa de 120 segundos entre cada uno de ellos).
  * Busca un número de id. existente y, si no lo hay, lo inserta.

Si hay algún problema con el contenedor de arranque, este debería poder volver a ejecutarse sin afectar a los elementos ya configurados.
