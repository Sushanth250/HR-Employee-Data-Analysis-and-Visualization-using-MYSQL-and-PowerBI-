-- DATA CLEANING 

CREATE DATABASE projetcs;

USE projetcs;

SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

DESCRIBE hr;

SELECT birthdate FROM hr;

SET sql_safe_updates = 0;

UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

DESCRIBE hr;

SELECT birthdate FROM hr;

UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d'))
WHERE termdate IS NOT NULL AND termdate != '';

UPDATE hr
SET termdate = date_format(str_to_date('0000-00-00','%Y-%m-%d'),'%Y-%m-%d')
WHERE termdate = '';

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

SELECT termdate FROM hr;

DESCRIBE hr;

ALTER TABLE hr
ADD COLUMN age INT;

SELECT * FROM hr;

UPDATE hr
SET age = timestampdiff(YEAR,birthdate,CURDATE());

SELECT 
	MIN(age) AS youngest,
    MAX(age) AS oldest
FROM hr;

SELECT COUNT(*) FROM hr 
WHERE age < 18;

SELECT birthdate,age FROM hr;