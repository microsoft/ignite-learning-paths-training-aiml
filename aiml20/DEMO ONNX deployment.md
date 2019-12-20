# <a name="demo-onnx-deployment"></a>DEMOSTRACIÓN: Implementación de ONNX

> 💡 Debe haber completado la [configuración](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md) antes de intentar realizar la demostración.

En esta demostración, tomamos el archivo ONNX exportado en la demostración de [Custom Vision](DEMO%20Custom%20Vision.md) y lo implementaremos en el sitio web de Tailwind Traders.

En el sitio web se usa el modelo de `products.onnx` para la aplicación Comprar por foto. El modelo procesa la imagen cargada, que genera una de estas cinco etiquetas: "hammer" (martillo), "drill" (taladro), "pliers" (alicates), "screwdriver" (destornillador) o "hard hat" (casco). El sitio web busca la etiqueta generada en la lista de productos y devuelve los resultados de la búsqueda.

## <a name="load-the-simple-onnx-model"></a>Carga del modelo ONNX simple

(SUGERENCIA: Puede realizar este paso con antelación. Este paso es necesario si ha ejecutado esta demostración antes en la misma implementación).

Se reemplazará el archivo products.onnx de la aplicación web por una versión que solo reconoce dos categorías de objetos: "hammer" y "drill".

1. En Azure Portal, visite el grupo de recursos aiml20-demo.

1. Haga clic en el recurso de App Service "aiml20".

1. En el menú de la izquierda, en Herramientas de desarrollo, haga clic en Herramientas avanzadas y después en "Ir" en el panel de la derecha para iniciar Kudu.

1. En la barra de menús principal, haga clic en Consola de depuración > PowerShell.

1. Vaya a: sitio / wwwroot / Standalone / Onnxmodels

1. Con Explorer, abra la carpeta `ONNX / simple model` del repositorio de AIML20

1. Arrastre products.onnx a la mitad izquierda de la ventana de Kudu. (IMPORTANTE: NO arrastre el cuadro que dice "drag here to upload and unzip" (Arrastre aquí para cargar y descomprimir)). Este modelo solo sabe cómo identificar taladros y martillos.

1. Reinicie el servidor web. Vuelva al recurso de App Service "aiml20" y haga clic en "Reiniciar" en la barra de menús superior. Espere dos minutos para que el sitio web se reinicie completamente.

## <a name="defining-the-problem-shop-by-photo-doesnt-work-right"></a>Definición del problema: Comprar por foto no funciona correctamente

(Nota: Esta sección se ha realizado al principio de la presentación AIML20).

1. Visite el sitio web de Tailwind Traders que ha implementado antes. 

1. Desplácese hacia abajo hasta la sección "Comprar por foto" del sitio web.

1. Haga clic en "Comprar por foto".

1. En el repositorio AIML20, seleccione: test images > drill.jpg.

1. Lo identifica correctamente como un taladro. Bien.

1. Vuelva a la página principal y haga clic en "Comprar por foto" de nuevo.

1. En el repositorio AIML20, seleccione: test images > pliers.jpg

1. ¡No! Lo identifica como un martillo. Eso se corregirá más adelante, pero primero se describirá por qué se produjo el error.

## <a name="update-the-onnx-model-in-the-tailwind-traders-website"></a>Actualización del modelo de ONNX en el sitio web de Tailwind Traders

En primer lugar, vea el modelo exportado en Netron:

1. Vaya a https://lutzroeder.github.io/netron/, haga clic en Abrir modelo.

2. Abra ONNX / Custom Model / products.onnx.

3. Desplácese por la red neuronal y observe lo siguiente:

 - es grande
 - en la parte superior, hay una imagen de 224 x 224 como entrada (un secreto: los modelos de Computer Vision tienen una visión bastante deficiente)
 - en la parte inferior se muestran cinco valores, que son las puntuaciones de confianza de las etiquetas de clase

A continuación, quite el archivo ONNX que se ha exportado al sistema de archivos de TWT.

1. En Azure Portal, visite el grupo de recursos aiml20-demo.

1. Haga clic en el recurso de aplicación web "aiml20"

1. En Herramientas de desarrollo, haga clic en Herramientas avanzadas y después en "Ir" en el panel de la derecha para iniciar Kudu.

1. En la barra de menús principal, haga clic en Consola de depuración > PowerShell.

1. Vaya a: sitio / wwwroot / Standalone / Onnxmodels

1. Con Explorer, abra la carpeta `ONNX / custom model` del repositorio de AIML20

1. Arrastre products.onnx a la mitad izquierda de la ventana de Kudu. (IMPORTANTE: NO arrastre el cuadro que dice "drag here to upload and unzip" (Arrastre aquí para cargar y descomprimir)).

1. Reinicie el servidor web. Vuelva al recurso de aplicación web "onnx" y haga clic en "Reiniciar".

Vuelva a ejecutar Comprar por foto y cargue `test images / pliers.jpg`. Ahora funciona.

## <a name="next-step"></a>Siguiente paso

[Personalizer](DEMO%20Personalizer.md)


