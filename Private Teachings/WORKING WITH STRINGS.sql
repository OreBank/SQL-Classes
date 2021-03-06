-- WORKING WITH STRINGS 
-- USEFUL FOR DATA CLEANING

-- MERGING TWO COLUMNS 
SELECT * FROM Person.Person;
-- LETS GET THE FULL NAME OF EVERYONE 

SELECT FIRSTNAME, LASTNAME FROM Person.Person;
SELECT FIRSTNAME + LASTNAME FROM Person.Person;

SELECT FIRSTNAME + ' ' + LASTNAME FROM Person.Person;

SELECT FIRSTNAME + ' ' + LASTNAME AS FULLNAME FROM Person.Person;

-- USING CONCAT
-- USED TO MERGE COLUMNS TOGETHER 
SELECT * FROM Person.Address;

SELECT CONCAT(ADDRESSLINE1, POSTALCODE)  FROM Person.Address;
SELECT CONCAT(FIRSTNAME, LASTNAME) FROM Person.Person;

-- USING CONCAT_WS
-- THIS ALLOWS US TO ADD A DELIMITER/SEPERATOR
SELECT CONCAT_WS(' ', FIRSTNAME, LASTNAME) FROM Person.Person;
SELECT CONCAT_WS('-', FIRSTNAME, LASTNAME) FROM Person.Person;
SELECT CONCAT_WS(',', FIRSTNAME, LASTNAME) FROM Person.Person;

-- LEFT 
-- USED TO STRINGS EXTRACT FROM STRINGS STARTING FROM THE LEFT 

SELECT LEFT(FIRSTNAME, 2) FROM Person.Person;

-- RIGHT 
-- USED TO STRINGS EXTRACT FROM STRINGS STARTING FROM THE END
SELECT RIGHT(FIRSTNAME, 2) FROM Person.Person;

-- LOWER
-- USED TO CHANGE TO LOWERCASE
SELECT LOWER(FIRSTNAME), LASTNAME FROM Person.Person;

-- UPPER
-- USED TO CHANGE TO HIGHERCASE
SELECT FIRSTNAME, UPPER(LASTNAME) FROM Person.Person;

-- SUBSTRING 
-- JUST LIKE LEFT AND RIGHT
-- HAS THREE VARIABLES 
-- - COLUMN/STRING TO EXTRACT FROM
-- - START POINT ==> STARTING POSITION
-- - LENGTH ==> THE NUMBER OF CHAACTERS TO EXTRACT

SELECT SUBSTRING(LASTNAME, 1, 3) FROM Person.Person;

SELECT SUBSTRING(LASTNAME, 3, 3) FROM Person.Person;

-- LEN
-- USED TO FIND THE LENGTH OF THE CAHRACTERS IN A STRING 

SELECT LEN(FIRSTNAME) FROM Person.Person;

-- BANKOLE, Abdullah

select CONCAT_WS(', ', Upper(firstname), lastname) as fullname, 
len(CONCAT_WS(', ', Upper(firstname), lastname)) as length_of_fullname 
from Person.Person
order by fullname;

