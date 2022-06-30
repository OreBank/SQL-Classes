-- MYSQL DAFI MARCH COHORT DAY 2 

-- SELECT STATEMENT 
-- USED TO SELECT THE COLUMNS WE ARE TO QUERY FROM THE TABLE 
-- WE CAN SELECT:

-- ALL THE COLUMNS (*)
SELECT * FROM CUSTOMERS;

SELECT * FROM PRODUCTS;

--  MULTIPLE COLUMNS 
select PRODUCTNAME, PRODUCTDESCRIPTION, BUYPRICE FROM PRODUCTS;

select CUSTOMERNAME, contactlastname, contactfirstname, creditlimit from customers;

-- A COLUMN
select customername from customers;

-- DISTINCT
-- USED TO REMOVE DUPLICATES ROWS IN A COLUMN

SELECT * FROM PRODUCTS ;

SELECT PRODUCTLINE FROM PRODUCTS;

SELECT DISTINCT PRODUCTLINE FROM PRODUCTS;

-- DIFFERENT JOB TITLES 
SELECT * FROM EMPLOYEES;
SELECT DISTINCT JOBTITLE FROM EMPLOYEES;

-- -- We want to know the types of office codes for our employees
SELECT DISTINCT OFFICECODE FROM EMPLOYEES;

-- WHERE 
-- USED TO FILTER RECORDS

-- ALL INFO ABUOT customer with contactfistname  'Julie'
SELECT * FROM CUSTOMERS
WHERE CONTACTFIRSTNAME = 'JULIE';

-- we want all the records of the customers whose firstname is Julie and Lastname is King
SELECT * FROM CUSTOMERS 
WHERE CONTACTFIRSTNAME = 'JULIE' AND CONTACTLASTNAME = 'KING';

-- If you want to know who paid the amount that is  either less than 1000USD or greater than 8000USD. 
-- Use the OR  operator

SELECT * FROM PAYMENTS;

SELECT CUSTOMERNUMBER, AMOUNT FROM PAYMENTS
WHERE AMOUNT < 1000 OR AMOUNT > 8000;

-- WWHERE AMOUNT NOT EQUAL TO $4990 
SELECT CUSTOMERNUMBER, AMOUNT FROM PAYMENTS
WHERE AMOUNT <> 4990;

-- classwork 2
-- One of our customers, Baane Mini Imports, need to know who their contact person is. 
-- Use your SQL skills to get the this person and their  city

-- MR ADEBOLA
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME, CITY FROM CUSTOMERS
WHERE CUSTOMERNAME = 'Baane Mini Imports';


-- LIMIT 
-- USED TO LIMIT THE AMOUNT OF RECORDS TO BE SHOWN
SELECT * FROM ORDERS
LIMIT 10;

SELECT * FROM PRODUCTLINES
LIMIT 2;

-- ORDER BY 
-- USED TO SORT RECORDS, EITHER IN ASCERNDING OR DESCENDING ORDER 
-- ASC = ASCENDING - LOWEST TO HIGHEST / SMALL TO BIG = A-Z / 0-INFINITY
-- DESC = DESCENDING - HIGHEST TO LOWEST /  BIG TO SMALL = Z-A / INFINITY-0

SELECT * FROM CUSTOMERS
ORDER BY CUSTOMERNAME ASC;

SELECT * FROM CUSTOMERS 
ORDER BY CONTACTLASTNAME DESC;

-- AGGREGATE FUCTIONS
-- USED TO PERFORM SIMPLE STATISTICAL OPERATIONS 
-- THE COLUMN TO WORK WITH IS USUALY IN PARENTHETIS ()
-- THEY CHANGE THE COLUMN NAMES TO THEMSELVES

-- MIN
-- USED FIND THE MINIMUM VALUE IN A COLUMN
SELECT * FROM PAYMENTS;
SELECT MIN(AMOUNT) FROM PAYMENTS;

-- MAX
-- USED TO SHOW THE MAXIMUM VALUE IN A COLUMN
SELECT MAX(AMOUNT) FROM PAYMENTS;

-- SUM 
-- THIS ADDS UP ALL THE VALUES IN THE COLUMN
SELECT SUM(AMOUNT) FROM PAYMENTS;

-- AVG
-- USED TO PERFM THE AVERAGE MEAN OF THE VALUES IN THE COLUMN
SELECT AVG(AMOUNT) FROM PAYMENTS;

-- COUNT 
-- COUNT THE FREQUENCY OF THE VALUES IN THE COLUMN
SELECT COUNT(AMOUNT) FROM PAYMENTS;

-- ALIAS
-- USED TO RENAME A COLUMN OR A TABLE 
-- WE USE THE 'AS' TO DO THIS 
SELECT SUM(AMOUNT) AS TOTAL_TRANSACTION FROM PAYMENTS;
SELECT COUNT(AMOUNT) AS NO_OF_TRN FROM PAYMENTS;

SELECT AVG(AMOUNT) AVG_AMOUNT FROM PAYMENTS;
-- CLASSWORK
-- 01 -Get the Customer ID numbers for the top 10 highest amounts
-- FUNMBI
SELECT CUSTOMERNUMBER FROM PAYMENTS
ORDER BY AMOUNT DESC
LIMIT 10;

-- ADEBOLA, ADEOLA 
SELECT CUSTOMERNUMBER, AMOUNT FROM PAYMENTS
ORDER BY AMOUNT DESC
LIMIT 10;

-- ABIDEMI 
SELECT CUSTOMERNUMBER FROM PAYMENTS 
ORDER BY AMOUNT  DESC
LIMIT 10 ; 

-- ADVANCED FILTERING 
-- BETWEEN
-- We use the BETWEEN operator to match a value against a  range of values. E.g. value BETWEEN low AND high;
-- Get the customernumber and checknumber for payments that are between 8000 and 9000 USD

select customernumber, checknumber, amount from payments 
where amount >= 8000 and amount <= 9000;

-- using between 
select customernumber, checknumber, amount from payments 
where amount BETWEEN 8000 and 9000;


-- NOT BETWEEN
-- negative of between 
select customernumber, checknumber, amount from payments 
where amount not BETWEEN 8000 and 9000;



-- IN 
-- You use the IN statement with the WHERE clause to check if a  value matches any value in a list of values
-- used to replace =

-- Suppose I want to know find the offices located in the USA and France
select * from offices;
select * from offices 
where country = 'usa' or country = 'France';
-- using in 
select * from offices 
where country in ('usa', 'france');

-- NOT IN 
-- negation of in statement
select * from offices 
where country not in ('usa', 'france');

-- LIKE 
-- % = represents zero, one, or multiple characters /  as many characters as possible
-- _ = represents one, single character

-- CUSTOMERS WTH FIRST NAME STARTING WITH 'Je'
select contactfirstname, contactlastname from customers
where contactfirstname like 'je%';

select contactfirstname, contactlastname from customers
where contactfirstname like 'je__';
-- 
select contactfirstname, contactlastname from customers
where contactfirstname like 'su_';

-- CUSTOMERS WTH lastname  ending WITH 'on'
select contactfirstname, contactlastname from customers
where contactlastname like '%on';

-- To find employees whose last names start with the letter L , end with the letter e, we are sure the name is a three letter words
select contactfirstname, contactlastname from customers
where contactlastname like 'L_e';

-- classwork 
-- I want to see the contactfirst name of customers that has 'her' as the second alphabets

-- adesola -- wrong
select contactfirstname, contactlastname from customers
where contactfirstname like 'her';

-- ezinne 

-- abidemi - 6/10
select contactfirstname, contactlastname from customers
where contactfirstname like  '_her';

-- adebola, isabella, funmbi - much more correct
select contactfirstname, contactlastname from customers
where contactfirstname like '_her%';

-- adeola -- wwrong
select contactfirstname, contactlastname from customers
where contactfirstname like '_her_';


select contactfirstname, contactlastname from customers
where contactfirstname like '___her%';


-- GROUP BY 
-- USED TO GROUP RECORDS IN A COLUMN 
-- USED BETTER WITH AGGREGATE FUCTIONS = MIN, SUM, COUNT ETC 

SELECT * FROM PAYMENTS;

-- TOTAL AMOUNT OF MONEY EACH CUSTOMERS HAS SPENT IN THE COMPANY 
SELECT CUSTOMERNUMBER, SUM(AMOUNT) TOTAL_AMOUNT FROM PAYMENTS
GROUP BY CUSTOMERNUMBER;

-- TOTAL AMOUNT OF MONEY EACH CUSTOMERS HAS SPENT IN THE COMPANY  AND THEIR FREQUENCY
SELECT CUSTOMERNUMBER, SUM(AMOUNT) TOTAL_AMOUNT, COUNT(AMOUNT) PATRONAGE FROM PAYMENTS
GROUP BY CUSTOMERNUMBER;

-- WHO IS OUR MOST VALUABLE CUSTOMER

-- FUNMBI BASED ON TOTAL AMOUNT SPENT 
SELECT CUSTOMERNUMBER, SUM(AMOUNT) TOTAL_AMOUNT, COUNT(AMOUNT) PATRONAGE FROM PAYMENTS
GROUP BY CUSTOMERNUMBER
ORDER BY TOTAL_AMOUNT DESC
LIMIT 1;

-- ABIDEMI 
SELECT CUSTOMERNUMBER, SUM(AMOUNT) TOTAL_AMOUNT, COUNT(AMOUNT) PATRONAGE FROM PAYMENTS
GROUP BY CUSTOMERNUMBER
ORDER BY 3 DESC
LIMIT 1;


-- HAVING 
-- USED TO FILTER GROUPED RECORDS
-- CAN DO EVERYTHING  'WHERE' DOES - BETWEEN, LIKE, IN, =,<,> ; 

-- We want to know the average payment amount of these 3 customers: 103, 146, 172.
SELECT CUSTOMERNUMBER, AVG(AMOUNT) AS AVG_AMOUNT FROM PAYMENTS
GROUP BY CUSTOMERNUMBER
HAVING CUSTOMERNUMBER = 103 OR CUSTOMERNUMBER = 146 OR CUSTOMERNUMBER = 172;

SELECT CUSTOMERNUMBER, AVG(AMOUNT) AS AVG_AMOUNT FROM PAYMENTS
GROUP BY CUSTOMERNUMBER
HAVING CUSTOMERNUMBER IN (103,146,172);

-- ASSIGNMENT
-- -- We want to send coupons to the 5 customers who have spent the most amount of money.
-- FUNMBI
select customernumber, amount from payments 
group by customernumber
order by amount desc
limit 5;

select customernumber, sum(amount) total_amount from payments 
group by customernumber
order by amount desc
limit 5;

-- -- How many customers do we have from each country?
-- ADEBOLA
SELECT COUNTRY, COUNT(CUSTOMERNUMBER) FROM CUSTOMERS
GROUP BY COUNTRY
ORDER BY 2 DESC;

SELECT * FROM CUSTOMERS;

-- -- How much has the customers who spent above $100000 spent  exactly?
-- 
SELECT customernumber, sum(amount) from payments
group by 1
having sum(amount) > 100000
order by 2 desc;

-- JOINS 
-- USED TO MERGE TWO OR MORE TABLES TOGETHER
-- 4 TYPES -  INNER, LEFT, RIGHT AND FULL 

-- HOW TO JOIN:
-- 01 - SPECIFY THE COLUMNS NEEDED FROM THE TABLES WE ARE JOINING
-- 02 - SPECIFY THE MAIN TABLE 
-- 03 - SPECIFY THE JOIN TYPE (INNER, LEFT, RIGHT OR FULL)
-- 04 - SPECIFY THE OTHER TABLE
-- 05 - SPECIFY THE JOINING CONDITION  USING THE SYNTAX = 'ON'
-- 06 - TO AVOID AMBIGOUS COLUMN, WE USE THE TABLE.COLUMNNAME NAMETYPE



-- INNER
-- lets get the names of customers that patronize the company
SELECT * FROM CUSTOMERS;
-- CUSTOMERNAME

SELECT * FROM PAYMENTS;
-- PAYMENTDATE, AMOUNT 

-- JOINING
SELECT CUSTOMERNAME, PAYMENTDATE, AMOUNT 
FROM CUSTOMERS INNER JOIN PAYMENTS 
ON CUSTOMERS.CUSTOMERNUMBER = PAYMENTS.CUSTOMERNUMBER ;

SELECT CUSTOMERNAME, PAYMENTDATE, AMOUNT 
FROM CUSTOMERS C INNER JOIN PAYMENTS P
ON C.CUSTOMERNUMBER = P.CUSTOMERNUMBER ;

SELECT C.CUSTOMERNUMBER,CUSTOMERNAME, PAYMENTDATE, AMOUNT , P.CUSTOMERNUMBER
FROM CUSTOMERS C INNER JOIN PAYMENTS P
ON C.CUSTOMERNUMBER = P.CUSTOMERNUMBER ;


-- LEFT 
-- lets get the names of ALL customers WHETHER OR NOT THEY patronize the company
SELECT * FROM CUSTOMERS;
-- CUSTOMERNAME
 
 SELECT * FROM PAYMENTS;
-- AMOUNT 

-- JOINING 
SELECT CUSTOMERNAME, AMOUNT 
FROM CUSTOMERS C LEFT JOIN PAYMENTS P
ON C.CUSTOMERNUMBER = P.CUSTOMERNUMBER
ORDER BY 2;

SELECT C.CUSTOMERNUMBER, CUSTOMERNAME, AMOUNT, P.CUSTOMERNUMBER
FROM CUSTOMERS C LEFT JOIN PAYMENTS P
ON C.CUSTOMERNUMBER = P.CUSTOMERNUMBER
ORDER BY 3 desc;


-- RIGHT 
-- JUST A REVERSE OF THE LEFT JOIN
SELECT C.CUSTOMERNUMBER, CUSTOMERNAME, AMOUNT, P.CUSTOMERNUMBER
FROM CUSTOMERS C right JOIN PAYMENTS P
ON C.CUSTOMERNUMBER = P.CUSTOMERNUMBER
ORDER BY 3 desc;

-- FULL
-- MERGES BOTH TABLE TOGETHER IN FULL
-- MYSQL DOESNT SUPPORTS FULL JOIN
SELECT *
FROM CUSTOMERS FULL JOIN  PAYMENTS 
ON CUSTOMERS.customerNumber = PAYMENTS.CUSTOMERNUMBER;

-- Fetch the names and total amount each customers spents in the company 
-- using inner join

select customername, sum(amount) as total_amount 
from c.customers inner p.payments;


-- UNION
-- USED TO MERGE TWO SELECT STATEMENTS TOGETHER 
-- RULES 
-- 1.	Both queries must return the same number of columns
-- 2.	The corresponding columns in the queries must have  compatible data types.

-- UNION 
--  REMOVES DUPLICATE RECORDS 
-- LETS COMBINE THE FIRST AND LASTNAMES OF ALL CUSTOMERS AND EMPLOYEES
SELECT * FROM CUSTOMERS;
SELECT * FROM EMPLOYEES;

SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS
UNION 
SELECT FIRSTNAME, LASTNAME FROM EMPLOYEES;

-- UNION ALL 
-- DOES NOT REMOVE DUPLICATES 
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS
UNION ALL
SELECT FIRSTNAME, LASTNAME FROM EMPLOYEES;


-- DATA DEFINITION LANGUAGES 

-- CREATING TABLES
CREATE TABLE MARCH_COHORT (
STUDENTID INT AUTO_INCREMENT PRIMARY KEY,
STUDENTNAME  VARCHAR(50) NOT NULL,
LOCATION VARCHAR(20) NOT NULL,
PHONENUMBER INT NOT NULL,
GENDER VARCHAR(1) NOT NULL
);

-- INSERTING INTO TABLES 
INSERT INTO MARCH_COHORT (STUDENTNAME, LOCATION, PHONENUMBER, GENDER)
VALUES 	('ADESOLA', 'USA', '12547668', 'F'),
		('ADEBOLA', 'JAMAICA', '5784468', 'M'),
        ('ADEOLA', 'NIGERIA', '145587', 'F'),
        ('ABIDEMI', 'AUSTRALIA', '44477863', 'M'),
        ('EZINNE', 'CANADA', '988466', 'F' ),
        ('FUNMBI', 'CANADA', '116474', 'F'),
        ('ISABELLA', 'NIGERIA', '1564755', 'F' ),
        ('VICTORY', 'USA', '145799', 'F');
        
SELECT * FROM MARCH_COHORT;

-- HOW MANY FEMALES DO WE HAVE IN CLASS
SELECT COUNT(GENDER) GENDER_COUNT FROM MARCH_COHORT
WHERE GENDER = 'F';

-- HOW MANY PEOPLE DO WE HAVE IN EACH COUNTRY 
SELECT LOCATION, COUNT(STUDENTID) FROM MARCH_COHORT
GROUP BY LOCATION;

-- GIVE ME THE NAMES OF FEMALES IN CLASS 
SELECT STUDENTNAME, GENDER FROM MARCH_COHORT 
WHERE GENDER = 'F';
-- 


-- UPDATING TABLES 

UPDATE MARCH_COHORT 
SET LOCATION = 'AUSTRALIA'
WHERE STUDENTID = 2;



UPDATE MARCH_COHORT 
SET STUDENTNAME = 'DEOLA', LOCATION = 'POLAND', PHONENUMBER = '5684137'
WHERE STUDENTID = 3;

SELECT * FROM MARCH_COHORT; 

-- DELETING TABLES/ DATABASES
-- DELETE TABLE
DROP TABLE MARCH_COHORT;

-- DELETE DATABASE
DROP DATABASE CLASSICMODELS;

-- DELETE ROWS 
DELETE FROM MARCH_COHORT 
WHERE STUDENTID = 3;



-- ABDULLAH BANKOLE 
-- LINKEDIN = www.linkedin.com/in/abdullahbankole/









