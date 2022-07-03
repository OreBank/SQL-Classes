-- Data Query Language (DQL)
-- This is used to query the data within the tables in the database 

-- SELECT COLUMNS 
-- FROM A TABLE 
-- FILTER WITH WHERE 


-- SELECT 
-- ==> USED TO FETCH THE COLUMNS THAT ARE NEEDED

-- FROM
-- ==> SPECIFIES THE TABLE WE ARE PULLING DATA FROM

-- WHERE
-- ==> USED TO FILTER THE SELECTED COLUMNS 
-- ==> OPERATORS 
-- <,>, !, <>, !=, AND, OR 

-- AND ==> operator displays a record if all the conditions separated by AND are TRUE. 
-- OR ==> operator displays a record if any of the conditions separated by OR is TRUE.
SELECT * FROM Production.Product;

-- FETCH THE PRODUCTS THAT THEIR LISTPRICES ARE GREATER THAN $50
SELECT Productid, Name, listprice from Production.Product
WHERE ListPrice > 50 ;

-- FETCH THE LIST OF BLACK PRODUCT AND THIER PRICES
SELECT NAME, COLOR, LISTPRICE FROM Production.Product
WHERE COLOR = 'BLACK';

-- FETCH THE LIST OF SILVER PRODUCT THAT ARE GREATER THAN $100
SELECT NAME, COLOR, LISTPRICE FROM Production.Product
WHERE COLOR = 'SILVER' AND LISTPRICE > 100;

SELECT * FROM Sales.SalesOrderHeader;

-- FETCH THE SALES FOR THE MONTH OF AUGUST 

-- WITH DATES
-- DATES ARE STORED AS YYYY-MM-DD
-- 2011-08-01 -- 2011-08-31

SELECT * FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2011-08-01' AND OrderDate <= '2011-08-31';

-- ==> PREDICATES 
-- USED IN PLACE OF OPERATORS WHERE NECESSARY 
-- BETWEEN, IN, LIKE, NOT

-- BETWEEN ==> USED WHEN WE HAVE RANGE OF VALUES
-- MAINLY USED TO REPLACE THE >= AND <= 

SELECT * FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-08-01' AND '2011-08-31';

-- IN ==> USED TO REPLACE MULTIPLE =s
-- fetch the green, red and silver colored product and their prices 
select name, color, listprice from Production.Product
where color = 'green' or color = 'red' or color = 'silver';

select name, color, listprice from Production.Product
where color in ('green','red','silver');

-- Not ==> used to negate any of the predicates 
select name, color, listprice from Production.Product
where color not in ('green','red','silver');

SELECT * FROM Sales.SalesOrderHeader
WHERE OrderDate NOT BETWEEN '2011-08-01' AND '2011-08-31';


-- LIKE 
-- PATTERN FILTERING 
--  operator used in a WHERE clause to search for a specified pattern in a columN 

-- USED WITH TWO SYMBOLS 
-- % ==> ZERO,ONE OR MANY CHARACTERS 
-- _ ==> ONE SINGLE CHARACTER

-- FETCH PEOPLE WITH FIRSTNAMES STARTING WITH A and ending with A
select * from Person.Person
where FirstName like 'a%a';

--NOTE MSSQL has two more operators
-- [] ==> Any single character within the specified range

-- one way to use it is to use as range [a-z]
select * from Person.Person
where FirstName like '[m-s]%on';

select * from Person.Person
where FirstName like '[m-s]___on';

-- another way to use it is to use only the wanted character
select * from Person.Person
where FirstName like '[msp]%on';

-- Class-Work
-- Write a query that displays the business entity ID number, first name, middle 
-- name, and last name from the Person.Person table for only those rows that 
-- include E or B in the middle name column.

SELECT BusinessEntityID, FirstName, MiddleName, LastName FROM Person.Person
where MiddleName like '%[eb]%';

-- [^] ==> 	Any single character not within the specified range

select * from Person.Person
where FirstName like '[^msp]%on';

--