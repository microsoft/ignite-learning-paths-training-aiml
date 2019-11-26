# <a name="invoicereaderskill"></a>InvoiceReaderSkill
発行方法:
```
func azure functionapp publish <FUNCAPP> --build remote
```

# <a name="some-fun-search-filters"></a>楽しい検索フィルター
ItemId 49 の注文
```
*&$filter=invoice/lineItems/any(lineItems: lineItems/itemId eq 49)
```

invoiceId が 12179
```
*&$filter=invoice/invoiceId eq 12179
```

オーストラリアの企業
```
*&$filter=invoice/company/country eq 'Australia'
```

英国の企業 (カウントあり)
```
*&$count=true&$filter=invoice/company/country eq 'United Kingdom'
```

請求書のみを取得する
```
*&$select=invoice&$count=true
```

ドイツの人
```
*&$count=true&$select=invoice/person&$filter=invoice/person/country eq 'Germany'
```