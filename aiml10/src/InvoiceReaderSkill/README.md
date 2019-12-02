# <a name="invoicereaderskill"></a>InvoiceReaderSkill
Como publicar:
```
func azure functionapp publish <FUNCAPP> --build remote
```

# <a name="some-fun-search-filters"></a>Alguns filtros de pesquisa divertidos
Pedidos com ItemId 49
```
*&$filter=invoice/lineItems/any(lineItems: lineItems/itemId eq 49)
```

a invoiceId é 12179
```
*&$filter=invoice/invoiceId eq 12179
```

empresas na Austrália
```
*&$filter=invoice/company/country eq 'Australia'
```

empresas no Reino Unido (com uma contagem)
```
*&$count=true&$filter=invoice/company/country eq 'United Kingdom'
```

recuperar somente faturas
```
*&$select=invoice&$count=true
```

pessoas na Alemanha
```
*&$count=true&$select=invoice/person&$filter=invoice/person/country eq 'Germany'
```