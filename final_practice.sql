/*Final Exam*/
/*author :fatemeh kiaie*/

use fatemeh_kiaie

/*****Problem 2****/

/*Q1*/
create table UserAccount
( 
  AccountId int primary key identity,
  FirstName varchar(50),
  LastName varchar(50),
  EmailAddress varchar(70),
  Age int,
  CurrentBalance decimal(7,2),
);

/*Q2*/
insert into UserAccount(FirstName, LastName, EmailAddress, Age, CurrentBalance)
values 
      ('Jonie', 'Weber', 'jonie@gmail.com', 28, 19500.00),
      ('Potsy', 'Weber', 'potsywebber@gmail.com', 32, 45300.00),
      ('Drink', 'Smith', NULL, 45, 75020.00)

/*Q3*/
select FirstName, LastName, CurrentBalance from UserAccount
where LastName LIKE '%Weber%'

/*Q4*/
select * from UserAccount
where LastName LIKE '%ebe%'

/*Q5*/
select FirstName from UserAccount
where FirstName = 'Potsy'

/*Q6*/
select * from UserAccount
where EmailAddress IS NOT NULL

/*Q7*/
select * from UserAccount
where LastName LIKE '%ith'

/*Q8*/
select * from UserAccount

/*Q9*/
select * from UserAccount
where CurrentBalance > 30000

/*Q10*/
select FirstName, LastName from UserAccount

/*Q11*/
update UserAccount
set LastName = 'Weber-Williams'
where FirstName = 'Jonie'

select * from UserAccount

/*Q12*/
update UserAccount
set CurrentBalance = CurrentBalance + 5000 
where FirstName LIKE 'Drink' and LastName LIKE 'Smith'

/*Q13*/
select FirstName, LastName from UserAccount
where Age < 30

/*Q14*/
select * from UserAccount
where Age >50 and Age <80

/*Q15*/
alter table UserAccount
add AccountType varchar(70)

/*Q16*/
alter table UserAccount
drop column AccountType

/*Q17*/
delete from  UserAccount
where FirstName LIKE 'Jonie' and LastName LIKE 'Weber-Williams'

/*Q18*/
update UserAccount
set Age = Age +1
where FirstName LIKE 'Drink' and LastName LIKE 'Smith'

/*Q19*/
delete from UserAccount
where CurrentBalance > 70000

/*Q20*/
drop table UserAccount


/*****Problem 3****/

create table Employee
( 
  "First" varchar(50),
  "Last" varchar(50),
  Id varchar(70),
  Age int,
  City varchar(50),
  "State" varchar(50),
);

insert into Employee("First", "Last", Id, Age, City, "State")
values 
      ('John', 'Jones', '99980', 45, 'Payson', 'Arizona'),
      ('Mary', 'Jones', '99982', 25, 'Payson', 'Arizona'),
      ('Eric', 'Edwards', '88232', 32, 'San Diego', 'California'),
	  ('Mary Ann', 'Edwards', '88233', 32, 'Phoenix', 'Arizona'),
	  ('Ginger', 'Howell', '98002', 42, 'Cottonwood', 'Arizona'),
	  ('Sebastian', 'Smith', '92001', 23, 'Gila Bend', 'Arizona'),
	  ('Gus', 'Gray', '22322', 35, 'Bagdad', 'Arizona'),
	  ('Mary Ann', 'May', '32326', 52, 'Tucson', 'Arizona'),
	  ('Erica', 'Williams', '32327', 60, 'Show Low', 'Arizona'),
	  ('Leroy', 'Brown', '32380', 22, 'Pinetop', 'Arizona'),
	  ('Elroy', 'Cleaver', '32380', 22, 'Globe', 'Arizona')

/*Q1*/
select "First", "Last", city from Employee
where city not like 'Payson'

/*Q2*/
select * from Employee
where "First" LIKE 'Er%'

/*Q3*/
select * from Employee
where Age > 20 and Age< 50

/*Q4*/
select "First", "Last" from Employee
where "last" LIKE '%ay'

/*****Problem 4****/

create table items_ordered
( 
  customerid int,
  order_date date,
  Item varchar(70),
  quantity int,
  price money,
);

insert into items_ordered (customerid, order_date, Item, quantity, price)
values
     (10330, '30-Jun-1999', 'Pogo stick', 1, 28.00),
	 (10101, '30-Jun-1999', 'Raft', 1, 58.00),
	 (10298, '01-Jul-1999', 'Skateboard', 1, 33.00),
	 (10101, '01-Jul-1999', 'Life Vest', 4, 125.00)

create table customers
( 
  customerid int,
  Firstname varchar(50),
  Lastname varchar(50),
  city varchar(50),
  "state" varchar(50),
);

insert into customers (customerid, Firstname, Lastname, city, "state")
values
     (10101, 'John', 'Gray', 'Lynden', 'Washington'),
	 (10298, 'Leroy', 'Brown', 'Pinetop', 'Arizona'),
	 (10299, 'Elroy', 'Keller', 'Snoqualmie', 'Washington'),
	 (10315, 'Lisa', 'Jones', 'Oshkosh', 'Wisconsin')

/*Q1*/
select * from items_ordered 
where Item Like 'Raft'

/*Q2*/
select item, price, items_ordered.customerid
from items_ordered JOIN customers
on customers.customerid = items_ordered.customerid
where "state" Like 'Washington'

/*Q3*/
select customerid,order_date, item from items_ordered
where item like 'S%'

/*Q4*/
select * 
from items_ordered
where items_ordered.customerid not in (select distinct customers.customerid from customers where customers.customerid is not null)

/*Q5*/
create function state_wise (@state varchar(50))
returns TABLE
as
return (select * from customers where "state" Like @state )
-- executing func
select * from state_wise ('Washington')

/*****Problem 5****/

/*Q1*/
select Item, customers.customerid, Firstname, Lastname, order_date, price 
from items_ordered join customers
on customers.customerid = items_ordered.customerid
 
/*Q2*/
select Item, customers.customerid, Firstname, Lastname, order_date, price 
from items_ordered join customers
on customers.customerid = items_ordered.customerid
order by "state" DESC

/*Q3*/
select count(*) as number_of_people, "state" from customers 
group by "state"

/*Q4*/
select item, max(price) as max_price, min(price) as min_price from items_ordered
group by Item

/*Q5*/
Select customerid, count(*) as number_of_orders, sum(quantity) as sum_of_orderes from items_ordered
group by customerid
