USE student;
-- DATA MANIPULATION LANGUAGE (DML)
-- USED TO MANIPULATE THE DATA WITHIN THE TABLE
-- THERE ARE 4 IN NUMBER 

-- SELECT 
-- MOST COMMONLY USED STATMENT IN SQL.
-- USED TO RETRIEVE ROWS FROM A TABLE AND USED TO RETRIEVE OR FETCH DATA FROM A DATABASE

-- USED TO FETCH ALL THE COLUMNS 
-- TU FETCH ALL COLUMNS, WE USE THE * AFTER SELECT STATMENT 
SELECT * FROM biodata

-- USED TO FETCH SPECIFIC COLUMNS 
-- TO SELECT SPECIFIC, WE PUT THE NAMES OF THE COLUMNS NEEDED AFTER THE SELECT STATEMENT 
SELECT FULL_NAME, GENDER FROM biodata;

SELECT FULL_NAME FROM BIODATA;

USE NEW_JERSEY;


-- INSERT
-- USED TO INSERT DATA INTO A TABLE

-- RULES
--01 USE THE 'INSERT INTO' KEYWORD
--02 ADD THE TABLENAME AFTER THE INSERT INTO KEYWORD 
--03 ADD THE COLUMNS YOU WANT TO INSERT DATA INTO WITHIN A BRACKET 
--04 ADD THE KEYWORD ==> VALUES
--05 ADD THE DATA YOU WANT TO INSERT, SEPERATING THEM WITH A COMMA 

-- LET US INSERT INTO THE CUSTOMER_INFO TABLE 
 INSERT INTO CUSTOMER_INFO
	(FIRSTNAME, LASTNAME, ACCOUNT_NUMBER)
	VALUES
	('TEMI', 'ADES', '1007475860'),
	('FIYIN', 'OLA', '0078459238');

	SELECT * FROM CUSTOMER_INFO;
-- NOTE: THE CUSTOMER ID COLUMN WAS NOT ADDED BECAUSE IT HAS THE IDENTITY COSNTRAINTS

-- UPDATE
-- THIS IS USED TO UPDATE THE DATA OF AN EXISTING TABLE IN A DATABASE

UPDATE CUSTOMER_INFO
SET LASTNAME = 'OLAS'
WHERE CUSTOMER_ID = 2;


-- DELETE
-- USED TO DELETE RECORDS IN A TABLE IN A DATABASE

DELETE FROM CUSTOMER_INFO
WHERE CUSTOMER_ID = 3;

-- IT CAN ALSO BE USED TO DELETE ALL THE DATA IN THE COLUMNS
DELETE FROM CUSTOMER_INFO;





