-- FILTERING GROUPED RECORDS

-- HAVING ==> KEYWORD USED FOR FILTERING GROUPED RECORDS
-- IT WORKS JUST LIKE A WHERE FUNCTION; WITH THE DIFFERENCE IT IS ALWAYS AFTER A GROUP BY
-- IT USES OPERATORS(>,<,<>,= , AND, OR ) AND PREDICATES (LIKE, BETWEEN, IN) AS WELL

-- WE WANT TO KNOW THE ORDERS THAT HAVE A TOTAL SUM BETWEEN 50000 AND 100000 DOLLARS 

SELECT SalesOrderID, SUM(LINETOTAL) AS TOTAL_AMT FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LINETOTAL) BETWEEN 50000 AND 100000;

-- WE WANT TO KNOW CUSTOMERS WHO HAVE SPENT AT LEAST 150000
SELECT * FROM Sales.SalesOrderHeader;
SELECT CustomerID, SUM(TotalDue) AS TOTAL_AMT FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING SUM(TotalDue) >= 150000
ORDER BY 2;

-- WE WANT KNOW THE CUSTOMER THAT SPENT 50000
SELECT CUSTOMERID, TOTALDUE FROM [Sales].[SalesOrderHeader]
WHERE TOTALDUE >=50000
ORDER BY 1;

-- FOR THE MONTH OF JULY 2011, WE WANT TO KNOW THE CUSTOMERS THAT SPENT 50000

SELECT CUSTOMERID, ORDERDATE, SUM(TOTALDUE) AMOUNT_SPENT FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-07-01' AND '2011-07-31'
GROUP BY CustomerID, OrderDate
HAVING SUM(TotalDue) >= 50000;


SELECT CUSTOMERID, SUM(TOTALDUE) AMOUNT_SPENT FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-07-01' AND '2011-07-31'
GROUP BY CustomerID
HAVING SUM(TotalDue) >= 50000
ORDER BY 2;

-- Write a query that returns a count of detail lines in the Sales.SalesOrderDetail table by SalesOrderID. 
-- Include only those sales that have more than three detail lines.
SELECT SALESORDERID, COUNT(SALESORDERDETAILID) CountOfDetailsLine FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT(SALESORDERDETAILID) >= 3;

-- Write a query that groups the products by ProductModelID along with a count. 
-- I want only the products with the color blue or red to be included

SELECT PRODUCTMODELID , COUNT(PRODUCTID) COUNT_OF_PRODUCT, COLOR FROM [Production].[Product]
WHERE COLOR ='BLUE' or Color ='Red'
GROUP BY ProductModelID, COLOR;

SELECT PRODUCTMODELID , COUNT(PRODUCTID) COUNT_OF_PRODUCT, COLOR FROM [Production].[Product]
WHERE COLOR in ('blue', 'red') 
GROUP BY ProductModelID, COLOR
having COUNT(PRODUCTID) >= 5;

------------------------------
-- Assignments 
-- 01 Write a query using a WHERE clause that displays all the names in Person.Person with the middle name J 
-- and lastname starts with SE. Display the first, last, and middle names along with the ID numbers.
-- 02 WE WANT TO KNOW THE PRODUCTS WHICH TOTAL SALES IS GREATER THAN 10000 AND AMOUNT OF PRODUCT SOLD
-- 03 How many products do we have per color
-- 04 GET DETAILS OF SALES DONE IN THE MONTH OF August 2011 with prices within the range of 100000 and 200000
-- 05 Write a query that displays the count of orders placed by year for each customer using the Sales.SalesOrderHeader table






