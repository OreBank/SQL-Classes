-- Limiting Records
-- This is used to limit the amounts of records displayed as results 
-- In MSSQL, we use TOP N
-- IT IS ALSO INCLUDED IN THE SELECT STATEMENT 


-- In MySQL, POSTGRESQL, we use LIMIT N
-- IT IS NOT INCLUDED IN THE SELECT STATEMENT

-- Fetch the first 10 people based on their firstnames 
SELECT TOP 10 * FROM Person.Person
ORDER BY FirstName ASC