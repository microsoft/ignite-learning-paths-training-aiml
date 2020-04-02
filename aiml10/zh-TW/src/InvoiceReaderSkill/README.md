# <a name="invoicereaderskill"></a>InvoiceReaderSkill
如何發佈：
```
func azure functionapp publish <FUNCAPP> --build remote
```

# <a name="some-fun-search-filters"></a>一些有趣的搜尋篩選條件
ItemId 為 49 的訂單
```
*&$filter=invoice/lineItems/any(lineItems: lineItems/itemId eq 49)
```

invoiceId 為 12179
```
*&$filter=invoice/invoiceId eq 12179
```

澳洲的公司
```
*&$filter=invoice/company/country eq 'Australia'
```

英國的公司 (包含計數)
```
*&$count=true&$filter=invoice/company/country eq 'United Kingdom'
```

只擷取發票
```
*&$select=invoice&$count=true
```

位於德國的人員
```
*&$count=true&$select=invoice/person&$filter=invoice/person/country eq 'Germany'
```