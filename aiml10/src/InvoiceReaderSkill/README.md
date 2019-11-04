# InvoiceReaderSkill
How to publish:
```
func azure functionapp publish <FUNCAPP> --build remote
```

# Some fun search filters
Orders with ItemId 49
```
*&$filter=invoice/lineItems/any(lineItems: lineItems/itemId eq 49)
```

invoiceId is 12179
```
*&$filter=invoice/invoiceId eq 12179
```

companies in Australia
```
*&$filter=invoice/company/country eq 'Australia'
```

companies in the UK (with a count)
```
*&$count=true&$filter=invoice/company/country eq 'United Kingdom'
```

only retrieve invoices
```
*&$select=invoice&$count=true
```

people in Germany
```
*&$count=true&$select=invoice/person&$filter=invoice/person/country eq 'Germany'
```