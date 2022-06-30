-- mssql class 2
-- filtering - WHERE keyword

-- we want to know the persons whose firstname starts wtih A and lastname starts with Z
SELECT * FROM PERSON.PERSON;

SELECT FIRSTNAME, LASTNAME FROM PERSON.PERSON
WHERE FIRSTNAME LIKE 'A%' AND LASTNAME LIKE 'Z%'; 

-- WE WANT TO KNOW THE CUSTOMER WHOSE FIRSTNAME IS AARON

SELECT FIRSTNAME, LASTNAME FROM PERSON.PERSON
WHERE FIRSTNAME = 'Aaron';

SELECT FIRSTNAME, LASTNAME FROM PERSON.PERSON
WHERE FIRSTNAME in ('Aaron', 'Amy');

-- QUERYING MULTIPLE TABLES 
-- JOIN
-- INNER JOIN, 
-- OUTER JOIN [LEFT OUTER JOIN, RIHT OUTER JOIN, FULL OUTER JOIN],
-- SELF JOIN

-- INNER JOIN
-- I WANT THE EMPLOYEE NAMES, THEIR JOB TITLE, LOGIN ID

SELECT * FROM [HumanResources].[Employee];
-- LOGINID JOBTITLE

SELECT * FROM [Person].[Person];
-- LAST NAME, FIRSTNAME

-- COMMON COLUMN
-- BUSINESSENTITYID

-- SOLUTION 
SELECT FIRSTNAME, LASTNAME, JOBTITLE, LOGINID
FROM HumanResources.Employee AS HRE INNER JOIN PERSON.Person AS PP
ON HRE.BusinessEntityID = PP.BusinessEntityID;


-- LEFT OUTER JOIN 
-- SHOW ALL PRODUCT, SALES ORDER OF THOSE PRODUCT EVEN IF THEY HAVE NOT BEEN ORDERED BEFORE

SELECT * FROM Production.Product;
-- PRODUCTID, NAME, COLOR

SELECT * FROM [Sales].[SalesOrderDetail];
-- SALESORDERID, UNITPRICE

-- SOLUTION

SELECT PRD.PRODUCTID, NAME, COLOR, SALESORDERID, UNITPRICE
FROM Production.Product AS PRD LEFT OUTER JOIN SALES.SalesOrderDetail AS SOD
ON PRD.ProductID = SOD.ProductID;

SELECT PRD.PRODUCTID, NAME, COLOR, SALESORDERID, UNITPRICE
FROM Production.Product AS PRD INNER JOIN SALES.SalesOrderDetail AS SOD
ON PRD.ProductID = SOD.ProductID;


-- CREATING TABLES
CREATE TABLE Semester1 (
std_id int identity(1,1) primary key,
std_name varchar(100) not null,
course varchar(100) not null,
score int not null
)
Drop table Semester2;

CREATE TABLE Semester2 (
std_id int identity(100,1) primary key,
std_name varchar(100) not null,
course varchar(100) not null,
score int not null
)

--DELETE TABLE
--DROP TABLE Semester1;

-- INSERT VALUES INTO TABLE


SELECT * FROM Semester1;
SELECT * FROM Semester2;


-- SET OPERATORS
-- USED TO COMBINE OR WORK ON ROWS OF TABLES
-- UNION / UNION ALL
-- UNION RETURNS DISTINCT ROWS
SELECT course, score FROM Semester1
UNION
SELECT course, score FROM Semester2;

SELECT course FROM Semester1
UNION
SELECT course FROM Semester2;

SELECT course, std_id FROM Semester1
UNION
SELECT course, std_id FROM Semester2;


-- UNION ALL RETURNS ALL ROWS,
SELECT * FROM Semester1
UNION ALL
SELECT * FROM Semester2;

SELECT course FROM Semester1
UNION all
SELECT course FROM Semester2;


-- INTERSECT
-- interSECt retuns only distinct rows that appears in both reslt set
SELECT course FROM Semester1
intersect
SELECT course FROM Semester2;

-- EXCEPT
-- RETURNS ONLY DISTINT ROWS THAT APPEAR IN THE FIRST SET BUT NOT IN THE SECOND
SELECT course FROM Semester1
EXCEPT
SELECT course FROM Semester2;

SELECT course FROM Semester2
EXCEPT
SELECT course FROM Semester1;


-- AGGRREGATE FUNTIONS
-- MIN
SELECT MIN(UNITPRICE) AS MINIMUM FROM  [Sales].[SalesOrderDetail];
-- MAX
SELECT MIN(UNITPRICE) AS MINIMUM FROM  [Sales].[SalesOrderDetail];
-- SUM 
-- STDEV
-- VAR
SELECT VAR(UNITPRICE) AS VARIANCE FROM  [Sales].[SalesOrderDetail];
-- COUNT
SELECT COUNT(*) AS TOTAL_TRANSACTION FROM [Sales].[SalesOrderDetail];

-- GROUP BY 

SELECT SalesOrderID, SUM(UNITPRICE) AS TOTAL_AMOUNT FROM SALES.SalesOrderDetail
GROUP BY SalesOrderID;

-- HAVING 
-- USED TO FILTER GROUPRED RECORDS, SIMILAR TO THE WHERE CLAUSE
SELECT SalesOrderID, SUM(UNITPRICE) AS TOTAL_AMOUNT FROM SALES.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(UNITPRICE) > 20000;