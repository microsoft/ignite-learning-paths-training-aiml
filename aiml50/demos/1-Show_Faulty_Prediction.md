# <a name="show-faulty-prediction-and-make-a-change"></a>Representación de la predicción con errores y realización de un cambio

> 💡 Debe haber completado la [configuración](../DEMO.md) antes de intentar realizar la demostración.

## <a name="show-the-faulty-prediction"></a>Mostrar la predicción defectuosa

* Exploración del sitio web de Tailwind Traders
    * https://aiml50{eventname}.azurewebsites.net (reemplace {eventname} por el parámetro de nombre de evento que ha usado para crear el entorno de demostración)

* Haga clic en `start smart shopping by uploading a photo`.
* Cargue una imagen de la [carpeta Test images](../source/test-images)
* El modelo proporciona una predicción incorrecta.

## <a name="start-the-change"></a>Iniciar el intercambio

* Ajustar el modelo cambiando `setup_pipeline.py`
  * Líneas 162: cambiar `epochs` por 20
  * Líneas 163: cambiar `batch` por 10
* Confirme el cambio y la inserción en la rama maestra.  Esto desencadenará una compilación e implementación del modelo.  Este proceso tardará unos 25 o 30 minutos, coincidiendo aproximadamente con el final de la charla.
* Regresaremos a comprobar los resultados hacia el final de la charla.

## <a name="example-demo"></a>Demostración de ejemplo

* [El simulacro empieza en 2:36](https://youtu.be/UgM8_4fAni8?t=158)