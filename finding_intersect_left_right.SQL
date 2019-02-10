/*connecting two tables together*/
/*faculty table refers to the department (parent)
- data type has to be the same
- the column we are referncing needs to be primary in the parent
- the child should has the same type of data (even multiple time it is fine)
- we can not add value to the schild when it does not exit in the parent (except null)
- one advantage is avoid conflict when we merge two table 
- in the primary key variable we can not have the null
 faculty(dep) ------(foreign key)----> department(code)*/

create database day4_fa 
use day4_fa
drop table faculty
drop table department

CREATE TABLE faculty
(
	id int primary key,
	fname varchar(30) NOT NULL,
	lname varchar(30) NOT NULL,
	dept varchar(10),
	email varchar(50) NOT NULL
);

/*child*/
INSERT INTO faculty
VALUES
(123, 'Gitimoni', 'Saikia', 'DSA', 'lmn@xyz.com'),
(876, 'Lmn', 'Xyz', 'N/W', 'lmn@xyz.com'),
(999, 'ABC', 'Xyz', 'SAS', 'lmn@xyz.com'),
(951, 'ABC', 'Xyz', NULL, 'lmn@xyz.com'),
(87, 'ABC', 'Xyz', 'DSA', 'lmn@xyz.com');

/*parent*/
create table department
(
code varchar(10) primary key,
name varchar(50) not null,
location varchar(50) not null,
budget decimal (9,2)
);

insert into department
values
('DSA', 'Data science analytics', '516 - metro colledge', 10000.00),
('N/W', 'Networking Tools', '514 - metro college', 30000.00),
('STN', 'Networking Tools', '514 - metro college', 30000.00),
('SAS', 'statisticsal analysis', '511 - metro college', 50000.00);

/*the name faculty_dept_fk is just for naming and used for the joint*/
alter table faculty add constraint faculty_dept_fk 
foreign key (dept) references department(code); 

SELECT * from faculty
SELECT * from department

SELECT concat( faculty.fname, ' ', faculty.lname) as faculty_name,
department.name as dept_name, department.location as dept_location
from faculty
JOIN department
ON faculty.dept = department.code

/*droping a constraint
Alter table faculty
drop constraint faculty_dept_fk 
*/

/*inner join (join) will find the common (that does not have null)*/
SELECT concat( faculty.fname, ' ', faculty.lname) as faculty_name,
department.name as dept_name, department.location as dept_location
from faculty
INNER JOIN department
ON faculty.dept = department.code

/*outer join: left, full, right (left outer jouin = left join, right outer join = right join, full outer join = full join 
- left outer join (left join) showing the all record of commoan as well as the table in the left of "OUTER JOINT" command , 
therefore we can have only two tables in the outer join 
the full showing all common and those does not have a matches in both tables*/
SELECT concat( faculty.fname, ' ', faculty.lname) as faculty_name,
department.name as dept_name, department.location as dept_location
from faculty left outer JOIN department
ON faculty.dept = department.code

SELECT concat( faculty.fname, ' ', faculty.lname) as faculty_name,
department.name as dept_name, department.location as dept_location
from faculty right outer JOIN department
ON faculty.dept = department.code

SELECT concat( faculty.fname, ' ', faculty.lname) as faculty_name,
department.name as dept_name, department.location as dept_location
from faculty full outer JOIN department
ON faculty.dept = department.code

/* creating a query that shows only left (not intersection)*/
SELECT *
from faculty left outer JOIN department
ON faculty.dept = department.code
Where faculty.dept is NULL

/* creating a query that shows only right (not intersection)*/
SELECT *
from faculty right outer JOIN department
ON faculty.dept = department.code
Where faculty.dept is NULL


/* creating a query that shows full join (not intersection)*/
SELECT *
from faculty full outer JOIN department
ON faculty.dept = department.code
Where faculty.dept is NULL
