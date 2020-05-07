# <a name="invoicereaderskill"></a>InvoiceReaderSkill
Procedimiento para publicar contenido:
```
func azure functionapp publish <FUNCAPP> --build remote
```

# <a name="some-fun-search-filters"></a>Algunos filtros de búsqueda curiosos
Pedidos con ItemId 49
```
*&$filter=invoice/lineItems/any(lineItems: lineItems/itemId eq 49)
```

invoiceID es 12179
```
*&$filter=invoice/invoiceId eq 12179
```

empresas en Australia
```
*&$filter=invoice/company/country eq 'Australia'
```

empresas del Reino Unido (con un recuento)
```
*&$count=true&$filter=invoice/company/country eq 'United Kingdom'
```

solo recuperar facturas
```
*&$select=invoice&$count=true
```

personas en Alemania
```
*&$count=true&$select=invoice/person&$filter=invoice/person/country eq 'Germany'
```