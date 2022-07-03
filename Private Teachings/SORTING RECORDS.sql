-- SORTING RECORDS

-- This is the arrangements of our result set 
-- ascending ==> smallest to the biggest ==> 1-10, 'A-Z'
-- Tthe keyword used after the order by clause ==> ASC or empty space

-- descending ==> biggest to the smallest ==> 10-1, 'Z-A'
-- Tthe keyword used after the order by clause ==> DESC 


SELECT * FROM Sales.SalesOrderHeader;

-- LET US SORT THE TOTAL DUE RECORDS IN THE SALESORDERHEADER TABLE IN ASCENDING 
SELECT * FROM Sales.SalesOrderHeader
ORDER BY TotalDue ASC;

-- LET US SORT THE TOTAL DUE RECORDS IN THE SALESORDERHEADER TABLE IN DESCENDING 
SELECT * FROM Sales.SalesOrderHeader
ORDER BY TotalDue DESC;


-- SORT THE NAMES OF PEOPLE IN ASCENDING
SELECT * FROM Person.Person
ORDER BY FirstName ASC

-- SORT THE NAMES OF PEOPLE IN DESCENDING  
SELECT * FROM Person.Person
ORDER BY LastName deSC


