# <a name="invoicereaderskill"></a>InvoiceReaderSkill
게시 방법:
```
func azure functionapp publish <FUNCAPP> --build remote
```

# <a name="some-fun-search-filters"></a>몇 가지 흥미로운 검색 필터
ItemId 49로 주문
```
*&$filter=invoice/lineItems/any(lineItems: lineItems/itemId eq 49)
```

invoiceId는 12179
```
*&$filter=invoice/invoiceId eq 12179
```

호주의 회사
```
*&$filter=invoice/company/country eq 'Australia'
```

영국의 회사(개수 포함)
```
*&$count=true&$filter=invoice/company/country eq 'United Kingdom'
```

청구서만 검색
```
*&$select=invoice&$count=true
```

독일에 있는 사람들
```
*&$count=true&$select=invoice/person&$filter=invoice/person/country eq 'Germany'
```