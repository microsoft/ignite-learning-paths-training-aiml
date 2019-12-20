# <a name="personalizer-demo"></a>Demostración de Personalizer

> 💡 Debe haber completado la [configuración](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md) antes de intentar realizar la demostración.

En esta demostración, veremos cómo el diseño de un sitio web se adapta a las acciones de los visitantes mediante el aprendizaje de refuerzo y [Personalizer de Cognitive Services](https://docs.microsoft.com/en-us/azure/cognitive-services/personalizer/?WT.mc_id=msignitethetour2019-github-aiml20).

Personalizer reconfigurará dinámicamente la interfaz para optimizar la probabilidad de que un visitante anónimo haga clic en la categoría destacada de la sección Recomendados.

1. Implementación de la aplicación web de Tailwind Traders con `DEMO Setup.md` (si aún no se ha hecho)

2. Vaya a la página principal de Tailwind Traders.

3. Observe la sección "Recomendados" y el orden de las categorías destacadas.

4. Actualice la página (puede que tenga que hacerlo un par de veces). Observe que el diseño cambia.

El servicio Personalizer hace un seguimiento de los visitantes anónimos y registra la hora del día, el día de la semana y el sistema operativo del explorador que se usa al hacer clic en las categorías. La "recompensa" está en si se ha hecho clic o no en la sección grande y destacada. 

Con el tiempo, Personalizer determinará la categoría que es mejor destacar para los usuarios anónimos según la hora del día, el día de la semana y el sistema operativo. También "explorará" el 20 % del tiempo para exponer categorías que, de lo contrario, no se presentarían.
