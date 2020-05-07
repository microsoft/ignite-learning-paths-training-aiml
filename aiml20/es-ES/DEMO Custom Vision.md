# <a name="demo-custom-vision"></a>DEMOSTRACIÓN: Custom Vision

> 💡 Debe haber completado la [configuración](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md) antes de intentar realizar la demostración.

En esta demostración, se crea un modelo de visión personalizado mediante el servicio en customvision.ai.

## <a name="create-a-custom-model-project-with-custom-vision"></a>Creación de un proyecto de modelo personalizado con Custom Vision

SUGERENCIA: Puede realizar esta sección con anterioridad para ahorrar tiempo en una demostración en directo.

1. Inicie sesión en [Custom Vision](https://customvision.ai) y cree un proyecto.
   [Siga las instrucciones que se indican aquí](https://docs.microsoft.com/azure/cognitive-services/custom-vision-service/getting-started-build-a-classifier?WT.mc_id=msignitethetour2019-github-aiml20).

1. El nuevo proyecto debe tener la configuración siguiente:

    - Nombre: Herramientas
    - Descripción: Productos vendidos por Tailwind Traders
    - Recurso: aiml20-cs-resource
    - Tipo de proyecto: clasificación
    - Tipos de clasificación: Multiclase
    - Dominios: Venta al por menor (compacto)
    - Funcionalidades de exportación: Plataformas básicas

1. En la herramienta "Tags" (Etiquetas) del lado izquierdo, use el botón "+" para agregar las etiquetas siguientes:

    - drill
    - hammer
    - pliers
    - screwdriver

1. Ahora se agregarán imágenes para cada etiqueta desde la carpeta correspondiente en "CV Training Images". Aquí se muestra cómo hacerlo para "drill".

    - Haga clic en "Agregar imágenes" en la fila superior.
    - Vaya a CV Training Images / drills.
    - Seleccione todos los archivos: haga clic en un archivo y, después, presione Control-A.
    - Haga clic en Abrir.
    - En el cuadro de diálogo "Carga de imágenes" que aparece a continuación, seleccione "drill" en "Mis etiquetas " y, después, haga clic en "Cargar 16 archivos".
    - Repita este proceso para las etiquetas hammer, pliers y screwdriver (más adelante lo hará con "hard hat").

## <a name="add-images-and-train-a-model"></a>Adición de imágenes y entrenamiento de un modelo

En el paseo por Ignite, todos los pasos anteriores se realizaron antes de la preparación. Solo se realizaron en directo los pasos restantes, para ahorrar tiempo.

1. Si todavía no lo ha hecho, inicie sesión en customvision.ai y abra el proyecto "tools" (herramientas).

1. Para este proyecto ya se han proporcionado imágenes de taladros, martillos, alicates y destornilladores. A continuación se agregarán también algunas imágenes de cascos.

- Haga clic en "Agregar imágenes" en la fila superior.
- Vaya a Imágenes de entrenamiento de CV/hardhats.
- Seleccione todos los archivos: haga clic en un archivo y, después, presione Control-A.
- Haga clic en Abrir.
- En el cuadro de diálogo "Carga de imágenes" que aparece a continuación, seleccione "hard hat" en "Mis etiquetas " y, después, haga clic en "Cargar 16 archivos".

1. Haga clic en "Rendimiento" en la barra de menús superior y después en el botón "Entrenar" de color verde. Elija "Entrenamiento rápido" y, después, haga clic en "Entrenar".

1. Haga clic en la iteración más reciente en el panel de la izquierda para ver los resultados. Debería tener un 90,9 % de precisión (¿cuántas de las imágenes de entrenamiento predice correctamente el modelo?), un 88,2 % de coincidencia (cuando se genera una predicción, ¿es correcta?) y un 98,7 % de PM (medida general). Tenga en cuenta que estos valores dependen del umbral de probabilidad: puede bajarlo si quiere evitar falsos positivos.
   Para la aplicación comercial, es seguro que sea alto.

1. Pruebe el modelo con una imagen nueva. Haga clic en "Prueba rápida" y "Examinar archivos locales" y, después, elija "test images / man in hardhat.jpg". Compruebe que la identifica como un casco con una probabilidad del 99,9 %. Pruebe lo mismo con "test images / drill.jpg", que también se identifica correctamente.

Ahora se guardará el modelo en el formato ONNX para integrarlo en la aplicación Tailwind Traders.

1. Haga clic en Exportar y elija "ONNX". Observe también los demás formatos específicos de la plataforma.

1. Seleccione la versión ONNX 1.2 y, después, haga clic en Exportar. La aplicación TWT espera un archivo denominado products.onnx, por lo que se usará el que ya está guardado en el repositorio.

## <a name="next-step"></a>Siguiente paso

[Implementación de ONNX](DEMO%20ONNX%20deployment.md)
