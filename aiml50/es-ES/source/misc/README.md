<a name="bulk-bing-image-downloader"></a>Aplicación de descarga masiva de imágenes de Bing
==========================
La *aplicación de descarga masiva de imágenes de Bing (BBID)* es una aplicación de descarga que:
- descarga imágenes de tamaño completo de los resultados de la búsqueda de imágenes de Bing;
- funciona de forma asincrónica, es decir, descarga las imágenes a gran velocidad;
- es multiplataforma;
- omite la API de Bing;
- tiene la opción de deshabilitar el filtrado de contenido para adultos;
- está escrita en Python 3;
- usa conexión SSL.

### <a name="usage"></a>Uso
```
bbid.py [-h] [-s SEARCH_STRING] [-f SEARCH_FILE] [-o OUTPUT]
               [--adult-filter-on] [--adult-filter-off] [--filters FILTERS]
               [--limit LIMIT]

```
### <a name="example"></a>Ejemplo
`./bbid.py -s "hello world"`

### <a name="advanced-filtering"></a>Filtrado avanzado
Es posible que quiera aplicar algunos de los filtros de Bing, como filtrar por licencia, tamaño de la imagen, etc. BBID no le muestra las variantes agradables y legibles para el usuario, pero le permite usar todos los filtros expuestos por el sitio web de Bing.
Lo único que debe hacer es aplicar los filtros que quiera a través del sitio web de Bing y copiarlos desde la dirección URL. Se encuentran después de `&qft=` y antes de `&`.

Por ejemplo, al buscar `code` y aplicar los filtros `past week` y tamaño de imagen `large`, la dirección URL que verá será `http://www.bing.com/images/search?sp=-1&pq=code&sc=0-0&sk=&cvid=39A810C4AF314AB6A5A923F4FB6E5282&q=code&qft=+filterui:age-lt10080+filterui:imagesize-large&FORM=IRFLTR`.

La cadena de filtros que quiere extraer de esta dirección URL es `+filterui:age-lt10080+filterui:imagesize-large`. Después, puede aplicarlos en BBID con--filters, por ejemplo:
```
./bbid.py -s code --filters +filterui:age-lt10080+filterui:imagesize-large
```
