-- GROUPING RECORDS 

-- GROUP BY ==> FUNCTION USED TO GROUP RECORDS 

SELECT * FROM Sales.SalesOrderDetail

-- HOW MANY PRODUCTS WERE ORDERED IN EACH ORDER
SELECT SalesOrderID, SUM(OrderQty) TOTAL_ORDERS FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;

-- HOW MANY PRODUCTS WERE ORDERED IN EACH ORDER AND HOW MANY DISTINCT PRODUCTS 
SELECT SalesOrderID, SUM(OrderQty) TOTAL_ORDERS, COUNT(productID) DISTINCT_PRODUCT FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;


-- SALES WITH HIGHEST NUMBER OF ORDERS 
SELECT SALESORDERID, SUM(ORDERQTY) TOTAL_ORDERS FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY TOTAL_ORDERS DESC

SELECT TOP 1 SALESORDERID, SUM(ORDERQTY) TOTAL_ORDERS FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY TOTAL_ORDERS DESC

-- SALES WITH LEAST NUMBER OF ORDERS
SELECT SALESORDERID, SUM(ORDERQTY) TOTAL_ORDERS FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY TOTAL_ORDERS asc

SELECT SALESORDERID, SUM(ORDERQTY) TOTAL_ORDERS, min(linetotal) as total_payment FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY TOTAL_ORDERS asc

SELECT SALESORDERID, SUM(ORDERQTY) TOTAL_ORDERS, min(linetotal) as total_payment FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY TOTAL_ORDERS, total_payment asc

SELECT top 1 SALESORDERID, SUM(ORDERQTY) TOTAL_ORDERS, min(linetotal) as total_payment FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY TOTAL_ORDERS, total_payment asc

SELECT SALESORDERID, SUM(ORDERQTY) TOTAL_ORDERS, min(linetotal) as total_payment FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY TOTAL_ORDERS desc, total_payment asc

-- PRODUCTS MOST PATRONISED 
-- LEAST PATRONISED PRODUCT
-- MOST EXPENSIVE ORDER 
-- LEAST EXPENSIVE ORDER 
-- THE TOTAL PRICE OF EACH ORDER 
-- Write a query using the Production.Product table that lists a count of the products in each product line.