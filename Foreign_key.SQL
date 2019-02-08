/*connecting two tables together*/
/*faculty table refers to the department (parent)
- data type has to be the same
- the column we are referncing needs to be primary in the parent
- the child should has the same type of data (even multiple time it is fine)
- we can not add value to the schild when it does not exit in the parent
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

select * from faculty


