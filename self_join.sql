/* inner and self join*/
use day4_fa
drop TABLE TABLE_ONE 
drop TABLE TABLE_two
create table TABLE_ONE
( X int primary key,
A varchar(30),  
);
INSERT INTO TABLE_ONE
values
(1, 'a'),
(4, 'd'),
(2, 'b');

create table TABLE_TWO
( X int primary key,
B varchar(30),  
);
INSERT INTO TABLE_TWO
values
(2, 'x'),
(3, 'y'),
(5, 'z');



select * from table_one cross join TABLE_TWO
where table_one.X = TABLE_TWO.X
 

SELECT *
from table_one as t1 join table_two as t2
ON t1.x = t2.x

select * from TABLE_ONE
select * from TABLE_TWO

SELECT *
from table_one full join table_two
ON table_one.x = TABLE_TWO.x

--- add single line comment
/* self - join*/
create table employee_
(
emp_id int           primary key identity,
name   varchar(30)   not null,
position varchar(20) not null,
manager_id int
);

insert into employee_(name, position, manager_id) 
values
('ABC', 'bla', NULL),
('xyz', 'gibber', 1),
('pq', 'jabber',2),
('lmo', 'jabber', 2),
('Def', 'jabber', 2); 

select * from employee_

/* if we don't do the left join and do only */
SELECT e1.name as Em_Name, e2.name as Manager
from employee_ as e1 left join employee_ as e2
on e2.emp_id = e1.manager_id

 
