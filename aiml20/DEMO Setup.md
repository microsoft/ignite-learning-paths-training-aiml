# <a name="setup-for-aiml20-demos"></a>Configuración de las demostraciones de AIML20

Estas tareas se realizaron con anterioridad para la presentación de AIML20. Siga estos mismos pasos para preparar los scripts de demostración restantes.

## <a name="clone-the-repository-to-your-local-machine"></a>Clone el repositorio en el equipo local.

Necesitará el contenido de https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml20 en el equipo local. La forma más fácil de hacerlo consiste en visitar el [repositorio de la guía del desarrollador para rutas de aprendizaje de IA](https://github.com/microsoft/ignite-learning-paths-training-aiml) y hacer clic en el botón "Clonar o descargar". Se hará referencia a los archivos relativos a la carpeta `aiml20`.

## <a name="sign-up-for-an-azure-subscription"></a>Registro para obtener una suscripción a Azure

Si todavía no tiene una suscripción a Azure, puede [registrarse aquí](https://azure.microsoft.com/free/?WT.mc_id=msignitethetour2019-github-aiml20) y obtener además de forma gratuita 200 USD en créditos de Azure para usarlos. 

## <a name="find-your-azure-subscription-id"></a>Búsqueda del identificador de suscripción de Azure:

En [Azure Portal](https://portal.azure.com), inicie sesión y haga clic en "Suscripciones" en la barra de menús de la izquierda. Haga clic en el nombre de la suscripción que va a usar y copie el valor "ID. de la suscripción" que se muestra allí. Lo necesitará más adelante cuando cree los recursos.

Como alternativa, ejecute `az account show` en la CLI de Azure y copie el valor `id` que se muestra.

## <a name="start-fresh"></a>Inicio desde cero

 Si ha ejecutado las demostraciones antes, elimine estos grupos de recursos si existen:
 
 - `aiml20-demo`

 Puede usar Azure Portal o ejecutar este comando en la CLI de Azure:

 ```sh
 az group delete --name aiml20-demo
 ```

## <a name="deploy-the-tailwind-traders-website"></a>Implementación del sitio web de Tailwind Traders

Haga clic en el botón siguiente. Esto implementará [TailwindTraders-Website](https://github.com/Microsoft/TailwindTraders-Website) desde GitHub, mediante una plantilla de ARM para habilitar la integración de Personalizer y la característica Comprar por foto basada en ONNX. ([Más información sobre esta implementación](https://github.com/microsoft/TailwindTraders-Website/blob/master/Source/Tailwind.Traders.Web/Standalone/README.md)).

[![Implementar en Azure](https://azuredeploy.net/deploybutton.svg)](https://portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoft%2FTailwindTraders-Website%2Fmaster%2Fazuredeploy.json)

En el formulario que aparece, seleccione las opciones siguientes:

* Suscripción: seleccione la suscripción en la que se van a implementar los recursos.

* Grupo de recursos: los recursos se crearán en el grupo de recursos que especifique.
  Se recomienda elegir "Nuevo" y escribir el nombre `aiml20-demo`. Cuando haya terminado, puede eliminar este grupo de recursos para cerrar el sitio y eliminar todos los recursos asociados.

* Ubicación: la región de Azure en la que se implementarán los recursos. En esa región debe poder implementar SQL Database y App Services. 

  Nota: Como actualmente Personalizer solo está disponible en WestUS2 y WestEurope, se implementará allí, con independencia de lo que elija.

* Nombre del sitio: se usará en la dirección URL del sitio y será visible públicamente, y debe ser único globalmente. Para evitar conflictos, elija `aiml20-xy` y reemplace `xy` por sus iniciales, pero en estos scripts se hará referencia a este nombre solo como `aiml20`. (Si elige un nombre que está en uso, obtendrá errores de "conflicto" durante la implementación).

* Ubicación del sitio: escriba la versión abreviada de la "Ubicación" anterior, por ejemplo, `westus2`.
  (Puede obtener una lista de nombres cortos en la CLI de Azure con: `az account
  list-locations -o table`).

* Modo de implementación: elija `standalone`.

* Inicio de sesión de SQL: escriba `twt`.

* Contraseña de SQL: genere y use una contraseña segura (debe incluir signos de puntuación y mayúsculas y minúsculas, pero no use `;`). No la necesitará para las demostraciones, por lo que no es necesario anotarla.

* Habilitar Personalizer: elija `true`.

* Dirección URL del repositorio: acepte el valor predeterminado, `https://github.com/microsoft/TailwindTraders-Website`.

* Rama: acepte el valor predeterminado, `master`.

(Como copia de seguridad, también puede usar la dirección URL del repositorio `https://github.com/revodavid/TailwindTraders-Website` con la rama `aiml20`.
Esto se ha bifurcado el 25-10-2019 y se sabe que funciona).

Active "Acepto los términos y condiciones" y haga clic en "Comprar".

Espere al menos 15 minutos para que se implemente el sitio. 

La dirección URL del sitio web implementado tendrá el formato NOMBRE_DEL_SITIO.azurewebsites.net (con el nombre de sitio que ha proporcionado antes), o bien puede encontrarla de esta forma:

* Haga clic en "Ir al recurso" en "Pasos siguientes".

* Haga clic en el recurso "App Service".

* Fíjese en el valor "URL" que se muestra en el panel de la derecha.

La dirección URL del sitio web se mostrará después del paso "Configurando control de código fuente", o bien puede inspeccionar el recurso "App Service".

### <a name="install-the-simple-onnx-model"></a>Instalación del modelo de ONNX "Simple"

Siga las instrucciones de [DEMO ONNX deployment.md](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model) bajo el título "Carga del modelo de ONNX simple". Esto degradará la herramienta "Comprar por foto" de la aplicación para que solo se reconozcan los martillos y los taladros.

## <a name="configure-visual-studio-code"></a>Configuración de Visual Studio Code

Instale la extensión [Azure Account](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account).
(En Windows, también tendrá que [instalar node.js](https://nodejs.org/)). En VS Code, inicie sesión en Azure con el comando "Azure: Iniciar sesión "(presione Control-Mayús-P para abrir la paleta de comandos). Para ejecutar comandos de la CLI de Azure desde un script en VS Code, use "Terminal: Ejecutar el texto seleccionado en el terminal de Azure" para copiar comandos).

También puede [instalar la CLI de Azure](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=https://docs.microsoft.com/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=msignitethetour2019-github-aiml20) en el equipo local con Windows, MacOS o Linux. Si no lo tiene instalado, también puede iniciar [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20) y ejecutar estos comandos desde una ventana del explorador. 

## <a name="prepare-visual-studio-for-demo"></a>Preparación de Visual Studio para la demostración

- Abra `vision_demo.sh`.
- Inicie una instancia de Cloud Shell con "Azure: Abrir Bash en Cloud Shell". (Si lo prefiere, puede usar la CLI de Azure de forma local).   

## <a name="open-browser-pages-ready-to-demo"></a>Apertura de páginas del explorador listas para la demostración

* La aplicación Tailwind Trader implementada 
* https://portal.azure.com/?feature.customportal=false#home (vaya a recursos: tenga en cuenta que este vínculo muestra el portal público, no la versión en versión preliminar para aquellos con acceso)  
* https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/
* https://customvision.ai
* https://lutzroeder.github.io/netron/

## <a name="find-the-image-files-on-your-local-machine"></a>Búsqueda de archivos de imágenes en el equipo local

Una vez que haya clonado el repositorio, puede encontrar las imágenes de entrenamiento en la carpeta `aiml20/CV Training Images`. Usará estas imágenes para entrenar el modelo de Custom Vision. La carpeta contiene las siguientes subcarpetas:

* drills
* hammers
* hard hats
* pliers
* screwdrivers

Estas imágenes se usarán para probar el servicio de Computer Vision y crear un modelo con el servicio Custom Vision.

Estas imágenes se han obtenido de Wikimedia Commons y se han usado bajo sus correspondientes licencias de Creative Commons. Vea el archivo [ATTRIBUTIONS.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/CV%20training%20images/ATTRIBUTIONS.md) para obtener más información.

Puede encontrar imágenes de prueba adicionales en la carpeta `test images`. Estas imágenes no se usarán en el entrenamiento, pero sí para probar que los modelos funcionan.

## <a name="next-step"></a>Siguiente paso

[Computer Vision](DEMO%20Computer%20Vision.md)
