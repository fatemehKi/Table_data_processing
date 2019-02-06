use day3

drop table Employee2
drop table giti_employee

CREATE TABLE Employee2
(
EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
City varchar(50)
);

INSERT INTO Employee2
VALUES
(3, 'Janet', 'Leverling', 'Kirkland'),
(5, 'Steven', 'Buchanan', 'London'),
(6, 'Micheal', 'Suyama', 'London'),
(7, 'Robert', 'King', 'London'),
(9, 'Anne', 'Dodsworth', 'London'),
(4, 'Margaret', 'Peacock', 'Redmond'),
(1, 'Nancy', 'Davolio', 'Seattle'),
(8, 'Laura', 'Callahan', 'Seattle'),
(2, 'Andrew', 'Fuller', 'Tacoma');

Select * from Employee2

/*using the identity method*/
create table giti_employee
(
EmployeeID int primary key identity(1,1),
FirstName varchar(50),
LastName varchar(50),
Hiredate datetime,
City varchar(50)
);

INSERT INTO giti_employee
values
('Nancy', 'Davolio', '1992-05-01 00:00:00:000', 'Seattle'),
('Andrew', 'Fuller', '1992-08-14 00:00:00:000', 'Tacoma'),
('Janet', 'Leverling', '1991-04-01 00:00:00:000', 'Kirkland'),
('Margaret', 'Peacock', '1993-05-03 00:00:00:000', 'Redmond'),
('Steven', 'Buchanan', '1993-10-17 00:00:00:000','London'),
('Micheal', 'Suyama', '1992-10-17 00:00:00:000','London'),
('Robert', 'King', '1994-01-02 00:00:00:000','London'),
('Laura', 'Callahan',  '1994-03-05 00:00:00:000', 'Seatle'),
('Anne', 'Dodsworth', '1994-03-05 00:00:00:000', 'London');

/* showing the cities in order*/
Select * from giti_employee Order by City

/*showing the hired date in different style.. reder to the library for the all styles*/
/* convert function take the arguments 1. data_type (int, varchar, ) 2. expression, 3. style(optional)*/
SELECT EmployeeID, FirstName, LastName, CONVERT(varchar, Hiredate, 102) as Hired_convert, city 
from giti_employee
SELECT EmployeeID, FirstName, LastName, CONVERT(varchar, Hiredate, 101) as Hired_convert, city 
from giti_employee

/* showing those been hired after/before specific time */
SELECT EmployeeID, FirstName, LastName, CONVERT(varchar, Hiredate, 100) as Hired_convert, city 
from giti_employee
where Hiredate >= '1-jan-1993' and Hiredate < '1-jan-1994'

/* not related to the table.. just showing the differences in the date*/
SELECT DATEDIFF(month, '1993-01-01', '2019-02-06')

/*showing the number of employees in each year*/
drop table new_tab_
SELECT employeeID, DATEPART(year, Hiredate) as YEAR_only
INTO new_tab_
from giti_employee;

Select * from new_tab_

SElect YEAR_only, count(employeeID) as Number_in_year
from new_tab_
Group by YEAR_only;

/****second method*/
SELECT datepart(year, hiredate) as hiredate, COUNT(employeeID) as NUM_employee
from giti_employee
group by datepart(year, hiredate)

