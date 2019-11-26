# <a name="invoicereaderskill"></a>InvoiceReaderSkill
如何发布：
```
func azure functionapp publish <FUNCAPP> --build remote
```

# <a name="some-fun-search-filters"></a>某些有趣的搜索筛选器
ItemId 为 49 的订单
```
*&$filter=invoice/lineItems/any(lineItems: lineItems/itemId eq 49)
```

invoiceId 为 12179
```
*&$filter=invoice/invoiceId eq 12179
```

澳大利亚公司
```
*&$filter=invoice/company/country eq 'Australia'
```

英国公司（以及计数）
```
*&$count=true&$filter=invoice/company/country eq 'United Kingdom'
```

仅检索发票
```
*&$select=invoice&$count=true
```

在德国的人
```
*&$count=true&$select=invoice/person&$filter=invoice/person/country eq 'Germany'
```