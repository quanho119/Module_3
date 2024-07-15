SELECT ord.orderNumber, ord.orderDate, cus.customerName, prod.productName FROM customers cus
JOIN orders ord
ON ord.customerNumber = cus.customerNumber
join orderdetails ordt
on ord.orderNumber= ordt.orderNumber
join products prod
on ordt.productCode=prod.productCode
where ord.orderNumber=10100;