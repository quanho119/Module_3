USE classic_model;
SELECT * FROM orders;
SELECT o.status, SUM(od.quantityOrdered*priceEach) AS 'Total_money (status)' FROM orders o
JOIN orderdetails od
ON o.orderNumber=od.orderNumber
GROUP BY o.status;

SELECT year(o.orderDate),o.status, SUM(od.quantityOrdered*priceEach) AS 'Total_money (over 2023)' FROM orders o
JOIN orderdetails od
ON o.orderNumber=od.orderNumber
WHERE year(o.orderDate)>'2003' and o.status="Resolved"
group by year(orderDate);

select year(orderDate) as year,count(orderNumber) as count 
from orders
group by year(orderDate);

select o.orderNumber from orders
join orderdetails od
on o.orderNumber=od.orderNumber
group by orderNumber
