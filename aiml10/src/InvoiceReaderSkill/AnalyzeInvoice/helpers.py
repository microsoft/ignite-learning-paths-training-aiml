import json
from dateutil import parser

personMap = {
    "Name": "name",
    "Address": "address",
    "City": "city",
    "State": "stateProvince",
    "Postal Code": "postalCode",
    "Country": "country",
    "Email": "email"
}

companyMap = {
    "Company": "name",
    "Company Address": "address",
    "Company City": "city",
    "Company State": "stateProvince",
    "Company Postal Code": "postalCode",
    "Company Country": "country",
}

invoiceMap = {
    "Invoice No.": "invoiceId",
    "Order Date": "orderDate",
    "Subtotal": "subTotal",
    "Total Discount": "totalDiscount",
    "Tax Rate": "taxRate",
    "Total Tax": "totalTax",
    "Total": "total",
}

lineItemMap = {
    "Itm": "itemId",
    "Qty": "quantity",
    "Description": "description",
    "Price": "price",
    "Discount": "discountTotal",
    "(Pct)": "discount",
    "Tax": "tax",
    "LineTotal": "lineTotal",
}

intMap = ["invoiceId", "itemId", "quantity"]
decimalMap = ["subTotal", "totalDiscount", "taxRate", "totalTax", "total", "price", "discountTotal", "discount", "tax", "lineTotal"]
dateMap = ["orderDate"]

def convert(data):
    # get original data in a more normalized form 
    keyPairs = { items["key"][0]["text"]: items["value"][0]["text"] if len(items["value"]) > 0 else "" 
                 for items in data["pages"][0]["keyValuePairs"] }

    tableItems = { col["header"][0]["text"]: [entry[0]["text"] for entry in col["entries"]]
                  for col in data["pages"][0]["tables"][0]["columns"] }

    # convert to invoice structure
    o = { v: translate(v, keyPairs[k]) for k, v in invoiceMap.items() }
    o['company'] = { v: translate(v, keyPairs[k]) for k, v in companyMap.items() }
    o['person'] = { v: translate(v, keyPairs[k]) for k, v in personMap.items() }

    lineItemCount = min([len(v) for k, v in tableItems.items()])
    lineItems = [{} for i in range(lineItemCount)]
    for key in tableItems.keys():
        for i in range(lineItemCount):
            lineItems[i][lineItemMap[key]] = translate(lineItemMap[key], tableItems[key][i])

    o['lineItems'] = lineItems
    
    return o

def translate(key, value):
    if key in intMap:
        return int(value)
    elif key in decimalMap:
        return float(value.replace("$", "").replace("%", ""))
    elif key in dateMap:
        return parser.parse(value).strftime('%Y-%m-%dT%H:%M:%S')
    else:
        return value