/** T-SQL/MSSSQL SERVER CLASS 2
-- SELECT STATEMENT
-- WILDCARD/ FULL SELECT (*) **/

SELECT * 
FROM PRODUCTION.Product;

SELECT * 
FROM [Person].[Address];

-- SELECT SPECIFIC COLUMNS
SELECT nationalidnumber, organizationlevel, jobtitle
FROM [HumanResources].[Employee];

-- Write a SELECT statement that lists the name, 
-- product number, and color of each product.	
	
	select Name, ProductNumber, Color
	from production.Product;

-- Write a SELECT statement that lists the 
-- customer ID numbers and sales order ID numbers
 select CustomerID, SalesOrderID
 from [Sales].[SalesOrderHeader];

 -- REMOVING DUPLICATES (DISTINCT)

select distinct color
from Production.Product

select distinct City
from Person.Address

--select count(distinct City) as CityCount
--from Person.Address

-- Sorting Queries (ORDER BY) [asc or desc]
-- single column
SELECT Name, Color, ListPrice, ProductSubcategoryID
FROM Production.Product
order by ListPrice asc

SELECT Name, Color, ListPrice, ProductSubcategoryID
FROM Production.Product
order by ListPrice desc

--multiple column
SELECT Name, Color, ListPrice, ProductSubcategoryID
FROM Production.Product
order by ListPrice desc, name; 

--limited sort (TOP)
SELECT TOP 100 * FROM [Sales].[Customer]  -- TOP EVERYTHING
select top 100 customerid, PersonID, AccountNumber --top specfic columns
FROM [Sales].[Customer]

select distinct top 10 UnitPrice  
from [Sales].[SalesOrderDetail]
order by UnitPrice desc

-- filtering (where)
select BusinessEntityID, LoginID, JobTitle
from [HumanResources].[Employee]
where JobTitle = 'Research and Development Engineer'

--like (_) - one character, (%) - as much character as possible
select BusinessEntityID, LoginID, JobTitle
from [HumanResources].[Employee]
where JobTitle like 'Research%'

select BusinessEntityID, LoginID, JobTitle
from [HumanResources].[Employee]
where JobTitle like '%Engineer%'

--Write a query using a WHERE clause that displays 
--all the names in Person.Person 
--with the middle name J and lastname starts with SE. Display the 
--first, last, and middle names along with the ID numbers. 

select firstname, middlename, lastname
from person.person 
where MiddleName like 'J%'

-- and last namestarts with 'se'
select firstname, middlename, lastname
from person.person 
where MiddleName like 'J%' and LastName like 'se%'

-- working with null
--isnull
SELECT Name, Color , ListPrice, 
	isnull(ProductSubcategoryID,0) as NullProdCategory 
	--replaced values
FROM Production.Product
where Color is null --filter null

--nullif
SELECT Name, Color, ListPrice, ProductSubcategoryID
FROM Production.Product
where color = 'Red'

SELECT Name, NULLIF(Color,'Red'), ListPrice, ProductSubcategoryID
FROM Production.Product
where color = 'Red'

-- coalesce (read-up)