# <a name="using-postman"></a>Uso de Postman
Se necesitan tres conceptos para llevar a cabo los ejercicios de todas las demostraciones:

1. Importación de una colección
2. Configuración de las variables de una colección
3. Uso de scripts previos a la solicitud para establecer variables

## <a name="what-you-need"></a>Qué se necesita
En las demostraciones se usan tres colecciones:
1. [Llamadas a la API de Form Recognizer](src/Collections/Form_Recognizer.postman_collection.json)
2. [Llamadas a la API de aptitud de lector](src/Collections/Reader_Skill.postman_collection.json)
3. [Llamadas de la API de búsqueda de facturas](src/Collections/Invoice_Search.postman_collection.json)

## <a name="importing-a-collection"></a>Importación de una colección

1. Descargue la colección adecuada (consulte más arriba).
2. Abra Postman.
3. Haga clic en Importar.

![Importación de una colección](images/import_collection.png "Importación de una colección")

4. Seleccione la colección adecuada.

![Importación de una colección](images/import_collection_file.png "Importación de una colección")

## <a name="modifying-collection-variables"></a>Modificación de las variables de una colección

Las variables de una colección permiten a Postman reemplazar los tokens como `{variable}` por los valores establecidos por el usuario. Esto permite que las solicitudes sean más portables con cambios en las variables. Por ejemplo, la variable `endpoint` en algunos de los ejercicios representa el punto de conexión del servicio de Form Recognizer determinado. 

1. Una vez cargada una colección, haga clic en los puntos suspensivos para editar las variables de la misma.

![Edición de las variables](images/edit_variables.png "Edición de las variables")

2. Para editar las variables de autorización, use la pestaña de autorización.

![Edición de una autorización](images/edit_authorization.png "Edición de una autorización")

3. Las demás variables usadas en estos ejercicios se encuentran en la pestaña de variables.

![Edición de las variables](images/variables_tab.png "Edición de las variables")

## <a name="using-pre-request-scripts"></a>Uso de scripts previos a la solicitud

Algunos de los ejercicios requieren que se realicen cambios en los scripts previos a la solicitud. Se puede acceder a ellos en la sección de scripts previos a la solicitud de cada una de ellas, como se muestra a continuación.

![Scripts previos a la solicitud](images/pre_request.png "Scripts previos a la solicitud")

