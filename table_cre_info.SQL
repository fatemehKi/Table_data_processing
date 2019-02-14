/*Create database day2
use day2
create table employee
(
id int primary key,
name varchar (30),
dob datetime,
email varchar(40)
);
USE day2

CREATE TABLE faculty
(
id int primary key,
fname varchar(30),
lname varchar(30),
dept varchar(10),
email varchar(50) NOT NULL
);*/


USE day2

CREATE TABLE mine
(
id int primary key,
fist_name varchar(30),
last_name varchar(30),
email varchar(50) NOT NULL
);

alter table mine add dept varchar(30);  

INSERT mine VALUES (2, 'FATEME', 'KIAIE', 'F.KIAIE@GMAIL.COM', 'ENG')
SELECT * FROM mine

/*alter table mine add fac_id int;
INSERT INTO mine (id, fac_id)
VALUES (5, 10)*/

/*SOME FUNCTIONS PRACTICE */
SELECT ABS(-10) as absol_value

SELECT CEILING(10.2) as ceiling_val

SELECT FLOOR(10.8) as floor_value

SELECT EXP(10) as exponential_value

SELECT LOG(10) as logaritmic_value

SELECT POWER(10,2) as power_value

SELECT SQRT(10) as square_value

SELECT 10%3 as modular_value

SELECT SUBSTRING('Hello World!', 7,3)

SELECT RIGHT('Hello World!', 7)
SELECT LEFT('hello world!', 5)
SELECT LEN('Hello')

SELECT REPLACE('Hello Word', 'Word', 'world');

select LOWER('hELLO World')
SELECT UPPER ('heLLo World')

Select LTRIM('       Hello')
SElect ('       Hello')
select RTRIM('Hello     ')

SELECT RTRIM(LTRIM('        hello      '))

SELECT LEN('     hello')


/* CREATE THE TABLE*/
Create table employee_exe
( LASTNAME VARCHAR(50),
EMPLOYEENUM INT,
YEARS VARCHAR(50),
LEAVETAKEN VARCHAR(50)
);

/*GIVING THE VALUE TO THE TABLE */
INSERT INTO employee_exe 
VALUES 
 ('ABLE', 101, 2, 4),
 ('BAKER', 104, 5, 23),
 ('BLEDSOE', 107, 8, 45),
 ('BOLIVAR', 233, 4, 80),
 ('BOLD', 210, 15, 100),
 ('CONSTALES', 211, 10, 78);


SELECT * FROM employee_exe

/* CREATE A TABLE THAT LAST NAME START WITH B AND THE LEAVE TAKEN IS >50 */
SELECT * FROM employee_exe WHERE LASTNAME LIKE 'b%' AND LEAVETAKEN >50

/* REPLACE A WORD IN THE LAST NAME COLUMN WITH THE '**' */
SELECT REPLACE(LASTNAME, 'ST', '**') AS NEW_LASTNAME FROM employee_exe


/*ORDERING BY ASCENDING*/
SELECT * FROM employee_exe ORDER BY LASTNAME DESC;

SELECT * FROM employee_exe ORDER BY LASTNAME;

SELECT * FROM employee_exe ORDER BY YEARS ASC;

/* CREATE A NEW TABLE FROM THE OLD USING ANOTHER METHOD*/
SELECT * INTO EMPLOYEE_INFO FROM employee_exe WHERE LASTNAME LIKE 'b%' AND LEAVETAKEN >50;
SELECT * FROM EMPLOYEE_INFO

/* CREATE ANOTHE TABLE with identity-- you do not need to give the value to the first column*/
CREATE TABLE STAFF
(SNO INT primary key IDENTITY (100,1),
fname varchar(30),
lname varchar(30),
salary decimal(8,2),
position varchar(15)
);
INSERT INTO STAFF
VALUES 
('John', 'white', '30000.00', 'Manager'),
('Susan', 'Brand', '24000.00', 'Manager'),
('David', 'Ford', '30000.00', 'Project Manager'),
('Ann', 'Beech', '12000.00', 'Project Manager'),
('Mary', 'Howe', '9000.00', 'Project Manager');
Select * from STAFF
