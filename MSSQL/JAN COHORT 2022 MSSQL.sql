-- MS SQL SERVER JANUARY COHORT DAY 01
-- SELECT STATEMENT

-- ALL (*)

SELECT * FROM HumanResources.Employee;

SELECT * FROM Person.Address;

SELECT * FROM [Person].[Person];

-- SELECT MULTIPLE COLUMNS 

SELECT LastName, FirstName FROM PERSON.Person;

-- SELECT SINGLE COLUMN
SELECT BusinessEntityID from Person.Person;

-- with aliases (AS)
select * from person.Person;

select PersonType as category from person.Person;

Select PersonType Category from person.Person;

-- With expressions 

select * from [Production].[Product];

Select Name, ListPrice + 10 AS Price from Production.Product;

Select Name,ListPrice, ListPrice + 10 AS Price from Production.Product;

Select Name, ListPrice * 10 AS Price from Production.Product;

-- removing duplicates (Distinct)

SELECT * FROM Production.Product;

SELECT COLOR FROM Production.Product;

SELECT DISTINCT COLOR FROM Production.Product;
-- How many colors of product do we have in our product table

select count (DISTINCT COLOR) FROM Production.Product;

-- Sorting Records (ORDER BY)
-- ASCENDING = ASC / ' '
-- DESCENDING = DESC

SELECT FirstName, LastName FROM Person.Person
order by FirstName asc;

SELECT FirstName, LastName FROM Person.Person
order by 1 asc;
--  1 is the first column

SELECT FirstName, LastName FROM Person.Person
order by LastName desc;

SELECT FirstName, LastName FROM Person.Person
order by 2 desc;

--  2 is the second column

-- Limiting Records (TOP n (Number 1,2,3, etc))

SELECT TOP 5 FirstName, LastName FROM Person.Person
order by 2 desc

SELECT TOP 5 FirstName, LastName FROM Person.Person
order by 1 DESC;

SELECT TOP 10 Name, ListPrice FROM Production.Product
ORDER BY ListPrice DESC


-- Filtering Records (WHERE)

-- =
-- WE WANT TO KNOW ALL PRODUCT THAT ARE BLACK 

SELECT Name, Color FROM Production.Product
Where Color = 'Black';

SELECT Name, Color FROM Production.Product
Where Color = 'black';

SELECT Name, Color FROM Production.Product
Where Color = 'bLack';

-- <>
-- Product greater than 1000
SELECT name, ListPrice FROM Production.Product 
where ListPrice > 1000

SELECT name, ListPrice FROM Production.Product 
where ListPrice > '1000'

SELECT name, ListPrice FROM Production.Product 
where ListPrice < 100
order by 2 desc;


-- LIKE
-- (%, _)

-- those whose firstname starts with A
Select FirstName, LastName from person.Person
where firstname like 'A%';

-- those whose firstname starts with A and lastname starts with C
Select FirstName, LastName from person.Person
WHERE FirstName LIKE 'A%' AND LastName LIKE 'C%';

Select FirstName, LastName from person.Person
WHERE FirstName LIKE 'A%' AND LastName LIKE 'c%';

-- BETWEEN
-- we want to knw the products that are within the range of 1000-2000
-- it works side by side with and
-- used to replace the use of >= and <=
SELECT name, ListPrice FROM Production.Product 
where ListPrice Between 1000 and 2000;

SELECT name, ListPrice FROM Production.Product 
where ListPrice >= 1000 and ListPrice <= 2000;

-- IN 
-- used to replace multiple ===

-- WE WANT TO KNOW ALL PRODUCT THAT ARE BLACK, Yellow and Red
SELECT Name, Color FROM Production.Product
Where Color In ('Black', 'Yellow', 'Red');

SELECT Name, Color FROM Production.Product
where color = 'black' or color ='Yellow' or color = 'Red';


-- NOT ( used to negate a search result/ condition
SELECT name, ListPrice FROM Production.Product 
where ListPrice not Between 1000 and 2000;

-- Assignment 
--Nulls
-- isnull
-- nullif 
-- coalesce 

-- DAY 03 
-- JOINS 
-- INNER JOIN
-- I WANT TO GET THE EMPLOYEES NAMES, JOBTITLE AND LOGIN ID

-- TABLE 1
SELECT * FROM HumanResources.Employee;
-- JOB TITLE, LOGIN ID 

-- TABLE 2
SELECT * FROM Person.Person;
-- Firstname , lastname 



-- to merge all together 

SELECT FIRSTNAME, LASTNAME, JOBTITLE, LOGINID
FROM HumanResources.Employee HRE  INNER JOIN Person.Person PP
ON HRE.BusinessEntityID = PP.BusinessEntityID;

SELECT FIRSTNAME, LASTNAME, JOBTITLE, LOGINID
FROM Person.Person PP INNER JOIN  HumanResources.Employee HRE 
ON HRE.BusinessEntityID = PP.BusinessEntityID;


-- LETS FIND THE NAME, COLORS AND PRICES OF OUR SOLD PRODUCTS 

SELECT * FROM PRODUCTION.Product;
-- NAME, COLORS, PRODUCTID
SELECT * FROM SALES.SalesOrderDetail;
--UNITPRICE

-- MERGING TOGETHER

SELECT NAME, COLOR, SOD.PRODUCTID, UNITPRICE
FROM PRODUCTION.Product PP  INNER JOIN SALES.SalesOrderDetail SOD
ON PP.PRODUCTID = SOD.ProductID ;

--LEFT AND RIGHT JOINS
-- LEFT JOIN 
-- SHOW ALL PRODUCT, SALES ORDER OF OUR PRODUCT EVEN IF THEY HAVE NOT BEEN ORDERED FOR BEFORE

SELECT * FROM PRODUCTION.Product;
-- NAME, COLORS, PRODUCTID
SELECT * FROM SALES.SalesOrderDetail;
--UNITPRICE, SALESORDERID

-- MERGING TOGETHER
SELECT NAME, COLOR, PP.PRODUCTID, UNITPRICE, SalesOrderID
FROM PRODUCTION.Product PP  LEFT JOIN SALES.SalesOrderDetail SOD
ON PP.PRODUCTID = SOD.ProductID 

SELECT NAME, COLOR, PP.PRODUCTID, UNITPRICE, SalesOrderID
FROM PRODUCTION.Product PP  INNER JOIN SALES.SalesOrderDetail SOD
ON PP.PRODUCTID = SOD.ProductID 

--CLASSWORK
/*Write a query that returns all the rows from the Sales.SalesPerson table joined to the 
Sales.SalesOrderHeader table along with the SalesOrderID column even if no orders match. 
Include the SalesPersonID and SalesYTD columns in the results.
*/
--
SELECT * FROM SALES.SalesPerson;
SELECT * FROM SALES.SalesOrderHeader;

SELECT  BusinessEntityID, SalesPersonID, SalesYTD, SalesOrderID
FROM SALES.SalesPerson SSP LEFT JOIN SALES.SalesOrderHeader SOH
ON SSP.TerritoryID = SOH.TerritoryID;

SELECT  BusinessEntityID,  SalesYTD, SalesPersonID, SalesOrderID
FROM SALES.SalesPerson SSP LEFT JOIN SALES.SalesOrderHeader SOH
ON SSP.TerritoryID = SOH.TerritoryID;

-- DATA DEFINITION LANGUAGE
-- CREATE = USED TO CREATE TABLES, DATABASE, SCHEMA
-- DROP = USED TO DELETE TABLES, DATABASE, SCHEMA
-- INSERT INTO = USED TO ISERT RECORDS TO TABLES
-- CREATING TABLES

--LETS CREATE A TABLE FOR QA students
-- STUDENTID, NAME, COURSE, SCORE

CREATE TABLE Semester_1(
	STUDENTID INT IDENTITY(1,1) NOT NULL,
	NAME VARCHAR(100) NOT NULL,
	COURSE VARCHAR(10) NOT NULL,
	SCORE FLOAT NOT NULL
	);
	--
CREATE TABLE Semester_2(
	STUDENTID INT IDENTITY(1,1) NOT NULL,
	NAME VARCHAR(100) NOT NULL,
	COURSE VARCHAR(10) NOT NULL,
	SCORE FLOAT NOT NULL
	);

INSERT INTO Semester_1 VALUES  ()
-- WE CAN USE THE EDIT TOP 200 FOR QUICKNESS

SELECT * FROM Semester_1;
SELECT * FROM Semester_2;


-- DROP 
-- DROP TABLE Semester_2;

-- AGGREGATE FUNCTIONS 
SELECT * FROM SALES.SalesOrderDetail;
-- COUNT 
SELECT COUNT(*) SALES_COUNT FROM SALES.SalesOrderDetail

-- MIN
SELECT MIN(UNITPRICE) LEAST_PRICE FROM SALES.SalesOrderDetail;

-- MAX
SELECT MAX(UNITPRICE) HIGHEST_PRICE FROM SALES.SalesOrderDetail;

-- SUM
SELECT SUM(LineTotal) TOTAL_SALES FROM SALES.SalesOrderDetail;

-- VAR
-- STDEV

-- count (Mr Princewill)
-- we want to know the number of products greater than $1000
SELECT COUNT (SalesOrderDetailID) FROM SALES.SALESORDERDETAIL
WHERE LineTotal > 1000

-- we want to know the products greater than $1000
SELECT * FROM SALES.SalesOrderDetail;
SELECT DISTINCT PRODUCTID,LINETOTAL FROM SALES.SalesOrderDetail
WHERE LineTotal > 1000;

-- GROUP BY
-- WE WANT TO KNOW THE PRODUCTS WHICH TOTAL SALES IS GREATER THAN 10000

SELECT PRODUCTID, SUM(LINETOTAL) TOTAL_SALES FROM SALES.SalesOrderDetail
GROUP BY ProductID

-- HAVING 
-- USED TO FILTER GROUPED RECORDS 

SELECT PRODUCTID, SUM(LINETOTAL) TOTAL_SALES FROM SALES.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LINETOTAL) > 10000
ORDER BY 2;

-- WE WANT TO KNOW THE PRODUCTS WHICH TOTAL SALES IS GREATER THAN 10000 AND AMOUNT OF PRODUCT SOLD
SELECT PRODUCTID, SUM(LINETOTAL) TOTAL_SALES, COUNT(PRODUCTID) PRODUCT_COUNT FROM SALES.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LINETOTAL) > 10000
ORDER BY 2;

--Group By (Mr Aminu)
-- How many product do we have per color

SELECT * FROM PRODUCTION.Product;

SELECT COLOR , COUNT(PRODUCTID) NO_OF_PRODUCTS FROM Production.Product
GROUP BY COLOR

-- WE WANT TO KNOW THE NAMES OF PRODUCTS WHICH TOTAL SALES IS GREATER THAN 10000 AND AMOUNT OF PRODUCT SOLD

-- IN THIS CASE. WE JOIN 

SELECT * FROM PRODUCTION.Product;
-- NAME
SELECT * FROM SALES.SalesOrderDetail
-- PRODUCTID, LINETOTAL

-- MERGING 
SELECT NAME, PP.PRODUCTID, LINETOTAL 
FROM PRODUCTION.Product PP INNER JOIN SALES.SalesOrderDetail SOD
ON PP.PRODUCTID = SOD.PRODUCTID 

SELECT NAME, COUNT(PP.PRODUCTID) PRODUCT_COUNT, SUM(LINETOTAL) TOTAL_SALES
FROM PRODUCTION.Product PP INNER JOIN SALES.SalesOrderDetail SOD
ON PP.PRODUCTID = SOD.PRODUCTID 
GROUP BY NAME
HAVING SUM(LINETOTAL) > 10000
ORDER BY 3

-- WE WANT TO KNOW OUR MOST PERFOMING PRODUCT (HIGHEST SALES OR HIGHEST COUNT)
-- WE HAVE AGREED TO BE HIGHEST COUNT
SELECT NAME, COUNT(PP.PRODUCTID) PRODUCT_COUNT, SUM(LINETOTAL) TOTAL_SALES
FROM PRODUCTION.Product PP INNER JOIN SALES.SalesOrderDetail SOD
ON PP.PRODUCTID = SOD.PRODUCTID 
GROUP BY NAME
ORDER BY 2 DESC

-- SET OPERATION
-- UNION/ UNION ALL
-- INTERSECT
-- EXCEPT 


-- ABDULLAH BANKOLE
-- LINKEDIN.