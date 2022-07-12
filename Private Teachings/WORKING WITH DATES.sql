-- WORKING WITH DATES 


-- GETDATE
-- RETURNS THE CURRENT DATE OF THE SYSTEM 
SELECT GETDATE();

-- SYSDATETIME
-- RETURNS THE CURRENT DATE OF THE SYSTEM
SELECT SYSDATETIME();

-- DATEPARTS
-- PART OF THE DATE

-- YEAR			-- YY, YYYY
-- QUARTER		-- QQ, Q
-- MONTH		-- MM, M
-- WEEK			-- WK, WW
-- DAY			-- DD, D
-- HOUR			-- HH
-- MINUTES		-- MI
-- SECONDS		-- ss, s
-- WEEK DAY		-- dw, w
-- DAY OF YEAR	-- dy


-- DATEADD
-- ITS ADD A NUMBER TO THE SPECIFIED DATEPART 
-- It takes three values 
-- DATEADD(DATE_PART, VALUE, INPUT)
SELECT DATEADD(DD, 1, GETDATE());
SELECT DATEADD(YY, 1, GETDATE());
SELECT DATEADD(YYYY, 1, GETDATE());

SELECT * FROM SALES.SalesOrderHeader;
-- OUR CUSTOMERS ARE EXPECTED TO RECEIVE THEIR ORDERS EVERY 5 DAYS 
SELECT ORDERDATE, DATEADD(DD, 5, ORDERDATE) EXPECTED_DATE FROM SALES.SalesOrderHeader;

-- WE CAN ALSO REDUCE THE DATES 
SELECT ORDERDATE, DATEADD(DD, -5, ORDERDATE) EXPECTED_DATE FROM SALES.SalesOrderHeader;

-- DATEDIFF
-- IT IS USED TO FIND THE DIFFERENCE BETWEEN TWO DATES 

-- DATEDIFF(DATE_PART, START_DATE, END_DATE)
-- HOW MANY YEARS ARE BETWEEN THE ORDERDATE AND TODAYS DATE 

SELECT ORDERDATE, GETDATE(), DATEDIFF(YEAR, ORDERDATE, GETDATE()) YEAR_INTERVAL
FROM Sales.SalesOrderHeader;

SELECT ORDERDATE, GETDATE(), DATEDIFF(MONTH, ORDERDATE, GETDATE()) MONTH_INTERVAL
FROM Sales.SalesOrderHeader;

-- DATEPARTS  EXTRACTIONS
-- DATEPART 
-- IT RETURNS A NUMERICAL VALUE FOR PART OF A DATE VALUE

SELECT DATEPART(YEAR, GETDATE());
SELECT DATEPART(DAY, GETDATE());
SELECT DATEPART(DAYOFYEAR, GETDATE());
SELECT DATEPART(DW, GETDATE());

SELECT DATEPART(MONTH, GETDATE());
SELECT DATEPART(QUARTER, GETDATE());

-- DATENAME 
-- THIS RETURNS THE CHARACTER NAME OF THE DATEPARTS
SELECT DATENAME(DAY, GETDATE());
SELECT DATENAME(DW, GETDATE());
SELECT DATENAME(MONTH, GETDATE());

-- YEAR 
SELECT GETDATE(), YEAR(GETDATE());

-- MONTH 
SELECT GETDATE(), MONTH(GETDATE());

-- DAY 
SELECT GETDATE(), DAY(GETDATE());

-- ASSGINMENTS
-- 01 Write a query that calculates the number of days between the date an order was placed 
-- and the date that it was shipped using the Sales.SalesOrderHeader table. 
-- Include the SalesOrderID, OrderDate, and ShipDate columns.

-- 02 Write a query that displays only the date, not the time, 
-- for the order date and ship date in the Sales.SalesOrderHeader table

-- 03 Write a query that adds six months to each order date in the Sales.SalesOrderHeader 
-- table. Include the SalesOrderID and OrderDatecolumns

-- 04 Write a query that displays the year of each order date and the numeric 
-- month of each order date in separate columns in the results. 
-- Include the SalesOrderID and OrderDate columns.