-- QA DAFI FEBRUARY DAY 02
-- SELECT FROM STATEMENT
-- USED TO SELECT THE COLUMNS WE ARE TO QUERY FROM THE TABLE 

-- ALL THE COLUMNS (*)

SELECT * FROM CUSTOMERS;

SELECT * FROM ORDERS;

-- MULTIPLE COLUMNS 
SELECT CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE
FROM CUSTOMERS;


-- A SINGLE COLUMN
SELECT CUSTOMERNAME FROM CUSTOMERS;


-- We want to send out a promotional message to our  existing customers. 
-- We would need their phone numbers, first  name and last name.
SELECT PHONE, CONTACTFIRSTNAME, CONTACTLASTNAME 
FROM CUSTOMERS;

-- DISTINCT STATEMENT

SELECT * FROM PRODUCTS;
 
SELECT PRODUCTLINE FROM PRODUCTS;
SELECT DISTINCT PRODUCTLINE FROM PRODUCTS;

-- DIFFERENT JOB TITLES IN THE COMPANY
SELECT * FROM EMPLOYEES;
SELECT JOBTITLE FROM EMPLOYEES;
SELECT DISTINCT JOBTITLE FROM EMPLOYEES;


-- CLASS WORK
-- We want to know the types of office codes for our employees
SELECT DISTINCT OFFICECODE FROM OFFICES;


-- WHERE STATEMENT 
-- USED TO FILTER RECORDS 
-- customer with contactfistname  'Julie'
select contactfirstname, contactlastname from customers
where contactFirstName = 'Julie';

-- we want all the records of the customers whose firstname is Julie and Lastname is King
select * from customers 
where contactfirstname = 'Julie' and contactlastname = 'King';

-- If you want to know who paid the amount that is  either less than 1000USD or greater than 8000USD. Use the OR  operator

select * from payments;

select customernumber, amount from payments
where amount < 1000 or amount > 8000;

-- classwork 2
-- One of our customers, Baane Mini Imports, need to know who their contact person is. 
-- Use your SQL skills to get the this person and their  city
select customerName, contactFirstName, contactlastname, city from customers
where customerName = 'Baane Mini Imports';

-- Classwork 3
-- A customer is late on their product delivery. I know their  address is ‘67, rue des Cinquante Otages’. I want to call them to let  them know.
-- Can you get me the phone number for the person who lives at ‘67, rue des Cinquante Otages’

select addressLine1, phone from customers
where addressLine1 = '67, rue des Cinquante Otages';

select customername, addressLine1, phone from customers
where addressLine1 = '67, rue des Cinquante Otages';

-- AGGREGATES STATEMENTS
-- COUNT
-- HOW MANY TRANSACTIONS ARE IN THE PAYMENT TABLE 
SELECT * FROM PAYMENTS;
SELECT COUNT(*) FROM PAYMENTS;

-- SUM
-- WHAT IS THE TOTAL AMOUNT OF TRANSACTIONS 
SELECT SUM(AMOUNT) FROM PAYMENTS;

-- MIN
-- WHAT IS THE LEAST AMOUNT PAID BY A CUSTOMER
SELECT MIN(AMOUNT) FROM PAYMENTS;

-- MAX
-- WHAT IS THE HIGHEST AMOUNT PAID BY A CUSTOMER
SELECT MAX(AMOUNT) FROM PAYMENTS;

-- AVG
SELECT AVG(AMOUNT) FROM PAYMENTS;

-- ALIASES (AS)
-- USED TO CHANGE COLUMN NAMES 
SELECT SUM(AMOUNT) AS TOTAL_AMOUNT FROM PAYMENTS;

SELECT MIN(AMOUNT) AS LEAST_AMOUNT FROM PAYMENTS;
SELECT MIN(AMOUNT) LEAST_AMOUNT FROM PAYMENTS;

-- LIMIT
SELECT * FROM ORDERS
LIMIT 10;

-- ORDER BY 
-- USED TO SORT RECORDS ASCENDING OR DESCENDING MANNER 
SELECT CUSTOMERNAME FROM CUSTOMERS
ORDER BY CUSTOMERNAME ASC;

SELECT CUSTOMERNAME FROM CUSTOMERS
ORDER BY CUSTOMERNAME ;

SELECT CUSTOMERNAME FROM CUSTOMERS
ORDER BY CUSTOMERNAME DESC;

-- CLASS WORK 
-- Get the Customer ID numbers for the top 10 highest amounts.
-- MR ABDULLATEEF
SELECT CUSTOMERNUMBER, AMOUNT FROM payments
ORDER BY AMOUNT DESC
LIMIT 10;

-- MR BARTHO
SELECT CUSTOMERNUMBER, AMOUNT FROM payments
ORDER BY AMOUNT DESC
LIMIT 10 ;

-- MR MONSOR
SELECT CUSTOMERNUMBER, AMOUNT FROM PAYMENTS
ORDER BY AMOUNT DESC
LIMIT 10;

-- ELO
SELECT CUSTOMERNUMBER, AMOUNT FROM PAYMENTS
ORDER BY AMOUNT DESC
LIMIT 10; 

-- WOMEN
-- OJE, ESTHER
SELECT CUSTOMERNUMBER, AMOUNT FROM PAYMENTS 
ORDER BY AMOUNT DESC
LIMIT 10;

-- Get the Customer ID numbers for the top 10 highest amounts.
SELECT * FROM PAYMENTS;

SELECT CUSTOMERNUMBER, AMOUNT FROM payments
ORDER BY AMOUNT DESC
LIMIT 10;

-- BETWEEN 
-- We use the BETWEEN operator to match a value against a  raNge of values. E.g. value BETWEEN low AND high;
-- Get the customernumber and checknumber for payments that are between 8000 and 9000 USD
SELECT CUSTOMERNUMBER, CHECKNUMBER FROM payments
WHERE AMOUNT BETWEEN 8000 AND 9000;

SELECT CUSTOMERNUMBER, CHECKNUMBER FROM payments
WHERE AMOUNT >= 8000 AND AMOUNT <= 9000;
-- NOT BETWEEN 
SELECT CUSTOMERNUMBER, CHECKNUMBER FROM payments
WHERE AMOUNT NOT BETWEEN 8000 AND 9000;

-- IN 
-- You use the IN statement with the WHERE clause to check if a  value matches any value in a list of values
-- USED TO REPLACE THE = 

-- Suppose I want to know find the offices located in the USA and France
SELECT OFFICECODE, COUNTRY FROM OFFICES
WHERE COUNTRY = 'USA' OR COUNTRY = 'FRANCE';

SELECT OFFICECODE, COUNTRY FROM OFFICES
WHERE COUNTRY IN ('USA', 'FRANCE');


-- LIKE
-- % = represents zero, one, or multiple characters
-- _ = represents one, single character

-- CUSTOMERS WTH FIRST NAME STARTING WITH 'Je'
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS
WHERE CONTACTFIRSTNAME LIKE 'Je%';

-- CUSTOMERS WTH lastname  ending WITH 'on'
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS;
WHERE CONTACTlastname LIKE '%on';

-- To find employees whose last names start with the letter L , end with the letter e, we are sure the name is a three letter words
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS
WHERE CONTACTlastNAME LIKE 'L_e';


-- classwork 
-- I want to see the contactfirst name of customers that has ‘her’ as the second alphabets

--  Mr Bartho
select contactfirstname from customers
where contactfirstname like '%her%';

-- Class Rep 
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS
WHERE CONTACTFIRSTNAME LIKE '%her%';

-- Abdullateef = CORRECT
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS
WHERE CONTACTFIRSTNAME LIKE '_her%';

-- Oje
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM CUSTOMERS
WHERE CONTACTFIRSTNAME LIKE '%_her%';


-- GROUP BY 
SELECT * FROM PAYMENTS;

SELECT CUSTOMERNUMBER, COUNT(AMOUNT), SUM(amount) FROM payments
GROUP BY customerNumber;

-- WHO IS OUR MOST VALUABLE CUSTOMER
SELECT CUSTOMERNUMBER, COUNT(AMOUNT), SUM(amount) FROM payments
GROUP BY customerNumber
ORDER BY 2 DESC;

SELECT CUSTOMERNUMBER, COUNT(AMOUNT) AS NO_OF_TIMES, SUM(amount) TOTAL_SPENT FROM payments
GROUP BY customerNumber
ORDER BY 2 DESC;

-- How many customers do we have from each country?
SELECT * FROM CUSTOMERS;

SELECT COUNTRY, COUNT(CUSTOMERNUMBER) FROM CUSTOMERS
GROUP BY COUNTRY
order by  COUNT(CUSTOMERNUMBER) DESC;

SELECT COUNTRY, COUNT(CUSTOMERNUMBER) POPULATION  FROM CUSTOMERS
GROUP BY COUNTRY
order by 2 DESC;

-- We want to send coupons to the 5 customers who have spent the most amount of money.
-- Mr Mathew 
SELECT CUSTOMERNUMBER, SUM(AMOUNT) TOTAL_AMOUNT FROM PAYMENTS
GROUP BY CUSTOMERNUMBER 
ORDER BY 2 DESC 
LIMIT 5;

-- Madam Victoria = Wrong
SELECT CUSTOMERNUMBER, AMOUNT FROM PAYMENTS
ORDER BY AMOUNT DESC
LIMIT 5;

-- Madam Nafisat
select customernumber, count(amount) as total_amount, sum(amount) total_spent from payments
group by customernumber
order by 2 desc
limit 5;

-- HAVING 
-- used to filter grouped records
-- it does every a WHERE can do

-- How much has the customers who spent above $100000 spent  exactly?

select customernumber, sum(amount) total_amount from payments
group by customernumber
having sum(amount) > 100000;

-- We want to know the average payment amount of these 3 customers: 103, 146, 172.

-- Mr Mathew
select customernumber, avg(amount) as average from payments
group by customerNumber
having customerNumber = 103 or customernumber = 146 or customernumber = 172;

-- victoria
select customernumber, avg(amount) as average from payments
group by customerNumber
having customerNumber in (103, 146, 172);




-- JOINS
-- used to merge tables together
-- STEPS
-- specify the columns needed from the different tables we would be joining
-- specify the main table 
-- specify join type = inner, left, right,full
-- specify the joining condition with ON
-- use the table.column nametype to prevent ambigous columns

-- inner

select * from customers;
select * from payments;


-- lets get the names of customers that patronizez the company
-- customernumber, customername from customers
--  amount  from payments

select customernumber, customername, amount
from customers  inner join payments
on customernumber = customernumber;

select customers.customernumber, customername, amount
from customers  inner join payments
on customers.customerNumber = payments.customernumber;

-- we could alias our table names
select c.customernumber, customername, amount
from customers c inner join payments p
on c.customerNumber = p.customernumber;


-- left join
-- fetch all customers with thier orders, whether they have take an order or not 
select * from customers;
select * from orders;

-- customernumber, contactfirstname, contactlast = customers 
-- ordernumber, satus = orders

select c.customernumber, contactfirstname, contactlastname, ordernumber, status 
from customers  c left join orders o
on c.customernumber = o.customernumber;

select c.customernumber, contactfirstname, contactlastname, ordernumber, status 
from customers  c inner join orders o
on c.customernumber = o.customernumber;

-- right join 
-- just a reverse of the left join 

-- UNION 
-- WE COMBINE COLUMNS OR RESULTS OF SELECT STATEMENT

-- 1.	Both queries must return the same number of columns
-- 2.	The corresponding columns in the queries must have  compatible data types.

-- Suppose that you want to combine the first name and last name of employees and customers into a single result set,

SELECT * FROM EMPLOYEES;
-- FIRSTNAME, LASTNAME 

SELECT * FROM CUSTOMERS;
-- CONTACT LASTNAME, CONTACTFIRSTNAME 

-- TO COMBINE, USING UNION 

SELECT FIRSTNAME, LASTNAME FROM employees
UNION
SELECT CONTACTFIRSTNAME, CONTACTLASTNAME FROM customers;

-- UNION ALL


-- CREATE TABLE 
-- USED TO CREATE NEW TABLES 

CREATE TABLE DAFICLASS (
	STUDENTID INT AUTO_INCREMENT PRIMARY KEY,
    STUDENTNAME varchar(100) NOT NULL,
    LOCATION VARCHAR(50) NOT NULL,
    PHONENUMBER INT NOT NULL,
    GENDER VARCHAR(1) NOT NULL
);

SELECT * FROM DAFICLASS;
-- INSERT INTO TABLES 
-- WE USE INSERT INTO TO PUT DATA INTO THE COLUMNS

INSERT INTO DAFICLASS (STUDENTNAME, LOCATION, PHONENUMBER, GENDER)
VALUES 
( 'EMMANUEL', 'NIGERIA', '123456789', 'M' ),
( 'NAFISAT', 'USA', '58796413', 'F'),
( 'BELLA', 'CANADA', '147852369', 'F');


-- DROP TABLES
-- USED TO DELETE TABLES 

DROP TABLE DAFICLASS;


-- ABDULLAH BANKOLE 
-- LINKEDIN = www.linkedin.com/in/abdullahbankole/