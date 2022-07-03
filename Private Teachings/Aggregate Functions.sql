--Grouping and Aggregating Records

select * from sales.SalesOrderHeader;
-- Aggregate Functions
-- Aggregates are used to perform simple statiscal operations. They are also used to summarize data in querries. 

-- Tips about aggregate functions 
-- They are always in the select statement
-- The column they operate on is usually in a bracket after the aggregate function 
-- They always work with only one column at a time, unless when merged with multiple aggregate functions 
-- To work with more than one column without aggregate, we need to group the un aggregated column 
-- They change the name of the columns to themselves or no column name ==> to change we use alias



-- SUM 
-- This sums up or adds all the numeric values in a column 
select sum(totaldue) from Sales.SalesOrderHeader;

select sum(totaldue) as Sum_of_Totaldue from Sales.SalesOrderHeader;
-- COUNT 
-- This counts all the values in a column, or gives the frequency of values 
select count(totaldue) from Sales.SalesOrderHeader;

-- Count(*) ==> this counts all,including the null values
-- Count(columname) ==> this counts excluding the null value
select * from Person.Person;
Select count(*) from person.Person;
select count(middlename) from Person.Person;

-- MAX
-- This gives the maximum value of the values in a column
select max(totaldue) from Sales.SalesOrderHeader;

-- MIN 
-- This gives the minimum value of the values in a column 
select min(totaldue) from Sales.SalesOrderHeader;

-- AVG
-- This gives the average value of the values in a column
select avg(totaldue) from Sales.SalesOrderHeader;
-- VAR 
-- This gives the variance of the values in a column
select var(totaldue) from Sales.SalesOrderHeader;

-- STDEV
-- This gives the standard deviation of the values in a column
select stdev(totaldue) from Sales.SalesOrderHeader;



select * from sales.SalesOrderHeader;
select sum(totaldue), min(totaldue), sum(subtotal), max(subtotal) from Sales.SalesOrderHeader;


-- Class Work 
-- Write a query that retrieves the total number of products ordered. Use the 
-- OrderQty column of the Sales.SalesOrderDetail table and the SUM function

-- Write a query using the Production.Product table that displays the 
-- minimum, maximum, and average ListPrice.

-- Write a query to determine the price of the most expensive product ordered. 
