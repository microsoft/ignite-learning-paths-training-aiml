# <a name="aiml10-making-sense-of-your-unstructured-data-with-ai"></a>AIML10: Datos no estructurados con sentido gracias a la inteligencia artificial

## <a name="session-abstract"></a>Resumen de la sesión

Tailwind Traders posee una enorme cantidad de datos heredados que les gustaría que sus desarrolladores usaran en sus aplicaciones. Estos datos proceden de diversos orígenes (tanto estructurados como no estructurados) y engloban imágenes, formularios, archivos PDF y otros muchos elementos. En esta sesión, veremos cómo el equipo usó Cognitive Search para dar sentido a estos datos en un breve período de tiempo y con un éxito asombroso. Abordaremos infinidad de conceptos de inteligencia artificial, como el patrón de ingesta, enriquecimiento y exploración, los conjuntos de aptitudes, las aptitudes cognitivas, el procesamiento de lenguaje natural, Computer Vision, etc.

## <a name="table-of-content"></a>Tabla de contenido
 

| Recursos          | Vínculos                            |
|-------------------|----------------------------------|
| PowerPoint        | - [Presentación](presentations.md) |
| Vídeos            | - [Ensayo del simulacro](https://www.youtube.com/watch?v=dm0wDTSso0E) <br/>- [Grabación de Microsoft Ignite Orlando](https://myignite.techcommunity.microsoft.com/sessions/82986?source=sessions) |
| Demostraciones             | - [Demostración 1: Azure Cognitive Search](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo1.md) <br/>- [Demostración 2: Servicio Form Recognizer](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo2.md) <br/>- [Demostración 3: Creación de una habilidad de lectura de facturas personalizada](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo3.md)<br/>- [Demostración 4: Unión de todos los elementos](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo4.md) <br/>- [Demostración 5: Almacén de conocimiento](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml10/demo5.md) | 


# <a name="overview"></a>Información general
En esta solución, desarrollamos un proceso en el que tomamos un conjunto de facturas en PDF no estructuradas y generamos un resultado tabular estructurado mediante Azure Cognitive Search con una habilidad de Form Recognizer personalizada. 

Al crear esta solución, se crean algunos recursos de Azure ([la evaluación gratuita está disponible aquí](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml10), si la necesita). En las tablas siguientes se enumeran todos los recursos, su finalidad y las instrucciones especiales necesarias para implementar la solución completamente (se usan los mismos nombres que en la charla; estos se deberán cambiar para su solución particular):

![Recursos de Azure](images/resources.png "Recursos de Azure")

## <a name="azure-resources"></a>Recursos de Azure

| Nombre                       | Tipo                            | Propósito                    |
| -------------------------- | ------------------------------- | ------------------------- |
| **ttcognitivesearch**     | Grupo de recursos                  | Agrupa los servicios   |
| **ttinvoicestorage**      | Cuenta de almacenamiento                 | Se usa para almacenar las facturas     |
| **ttinvoicesearch**       | Servicio Search                  | Servicio destacado           |
| **ttinvoiceintelligence** | Cognitive Services (Todo en uno) | Se usa en el servicio Search |
| **ttinvoicereader**       | Servicio Form Recognizer         | Este servicio puede ser que termine en el servicio Todo en uno. Por el momento, ahora está en versión preliminar de acceso limitado. Para acceder a la versión preliminar, rellene y envíe el formulario [Solicitud de acceso de Form Recognizer](https://aka.ms/FormRecognizerRequestAccess).  |
| **readerskillstorage**   | Cuenta de almacenamiento              | Almacenamiento usado para la función de Azure |
| **readerskill**          | Function App                 | Aplicación Aptitud cognitiva |
| **readerskill**          | Detalles de la aplicación                   | Agrega información a la aplicación de funciones. |
| **EastUS2LinuxDynamicPlan** | Plan de App Service                   | Plan basado en el consumo para ejecutar la aplicación de funciones |

# <a name="presentation"></a>Presentación

* [Descarga de PowerPoint](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml10/aiml10.pptx)
* [Vídeo de la sesión de Microsoft Ignite Orlando](https://myignite.techcommunity.microsoft.com/sessions/82986?source=sessions)


# <a name="demonstrations"></a>Demostraciones
Esta charla ha consistido en las siguientes cinco demostraciones. 

- **Demostración 1**: [Azure Cognitive Search](demo1.md)
- **Demostración 2**: [Servicio Form Recognizer](demo2.md): esta demostración requiere acceso a la versión preliminar de Form Recognizer. Para acceder a la versión preliminar, rellene y envíe el formulario [Solicitud de acceso de Form Recognizer](https://aka.ms/FormRecognizerRequestAccess).
- **Demostración 3**: [Creación de una habilidad de lectura de facturas personalizada](demo3.md)
- **Demostración 4**: [Unión de todos los elementos](demo4.md)
- **Demostración 5**: [Almacén de conocimiento](demo5.md)


# <a name="teardown-instructions"></a>Instrucciones de desmontaje

### <a name="full-teardown"></a>Desmontaje completo

* Acceda a Azure Portal y elimine el **grupo de recursos de Azure** que creó para quitar todos los recursos de este proyecto.


# <a name="resources-and-continued-learning"></a>Recursos y aprendizaje continuo

**Microsoft Learn:**
* [Introducción a Azure Search](https://docs.microsoft.com/en-us/learn/modules/intro-to-azure-search/?WT.mc_id=msignitethetour2019-github-aiml10)
* [Estrategia y soluciones de inteligencia artificial (IA) de Microsoft Azure](https://docs.microsoft.com/en-us/learn/modules/azure-artificial-intelligence/?WT.mc_id=msignitethetour2019-github-aiml10)

**Documentación de Azure**
* [¿Qué es la "búsqueda cognitiva" en Azure Search?](https://docs.microsoft.com/en-us/azure/search/cognitive-search-concept-intro/?WT.mc_id=msignitethetour2019-github-aiml10)
* [¿Qué es el almacén de conocimiento en Azure Search?](https://docs.microsoft.com/en-us/azure/search/knowledge-store-concept-intro)


# <a name="feedback-loop"></a>Bucle de comentarios

¿Tiene algún comentario o sugerencia? Actualmente, el mejor bucle de comentarios para los cambios de contenido, sugerencias y comentarios es crear una incidencia en este repositorio de GitHub. Para obtener todos los detalles sobre cómo crear una incidencia, consulte los [documentos de contribución](../CONTRIBUTING.md).

## <a name="become-a-trained-presenter"></a>Convertirse en un presentador entrenado

Para convertirse en un presentador entrenado, póngase en contacto con [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com). En el correo electrónico, incluya lo siguiente:

- Nombre completo
- Código de esta presentación: aiml10
- Vínculo a un vídeo de usted presentando (10 minutos de duración aproximada; por ejemplo, vídeo de YouTube no publicado). 
  > No es necesario que sea este contenido; lo importante es mostrar sus aptitudes como presentador.

Un asesor se pondrá en contacto con usted para informarle sobre el proceso.

## <a name="trained-presenters"></a>Presentadores entrenados

Gracias a todas estas fantásticas personas ([clave de emoji](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/sethjuarez">
        <img src="https://avatars2.githubusercontent.com/u/115409?s=460&v=4" width="100px;" alt="Seth Juarez"/><br />
        <sub><b>Seth Juarez</b></sub></a><br />
            <a href="Add link to powerpoint here" title="Debate">📢</a>Documentación
            <a href="Add link to pull request here" title="">📖</a> 
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->