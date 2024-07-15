/*1a.Hiển thị danh sách đơn hàng có tổng tiền là nhỏ nhất*/
SELECT o.orderNumber, SUM(od.quantityOrdered*od.priceEach) AS total
FROM orders o
JOIN orderdetails od
ON o.orderNumber=od.orderNumber
GROUP BY o.orderNumber
ORDER BY total 
LIMIT 1;

/*1b. Hiển thị danh sách đơn hàng có tổng tiền là lớn nhất*/
SELECT o.orderNumber, SUM(od.quantityOrdered*od.priceEach) AS total
FROM orders o
JOIN orderdetails od
ON o.orderNumber=od.orderNumber
GROUP BY o.orderNumber
ORDER BY total DESC
LIMIT 1;

/*2. Hiển thị thông tin sản phẩm được mua nhiều nhất*/
SELECT p.*,p.productCode,SUM(od.quantityOrdered) total FROM orderdetails od
JOIN products p
ON p.productCode=od.productCode
GROUP BY p.productCode
ORDER BY total DESC
LIMIT 1;

/*3. Tính doanh thu trung bình*/
SELECT AVG(total) AS doanh_thu_trung_binh
FROM (
	SELECT o.orderNumber, SUM(od.quantityOrdered*od.priceEach) total  
	FROM orders o  
    JOIN orderdetails od  
    ON o.orderNumber=od.orderNumber  
    WHERE o.status='Resolved'
    GROUP BY o.orderNumber
    ) AS average;

    

