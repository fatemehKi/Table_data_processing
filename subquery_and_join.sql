
drop table productDetail, productSale

create table productDetail
(
 ID int primary key identity,
 Name varchar(50),
 [Description] varchar(20)
);

create table productSale
(
ID int primary key identity,
productID int foreign key references productDetail(ID) not null,
unit_price decimal(7,2) not null,
QTY int not null
);

INSERT INTO productDetail(Name, [Description])
values
    ('TV', 'SAMSUNG LCD 56' ),
    ('Samrtphone', 'Appl eiphone X 64GB' ),
    ('Laptop', 'HP 13" i% 7Gen 1Tb' )



INSERT INTO productSale(productID,unit_price,QTY)
values
   (2, 1200.00, 5),
   (3, 1450.00, 5),
   (2, 999.99, 10),
   (2, 1250.00, 3)

use Mon_11_fa
Select * from productDetail
Select * from productSale

/*finding the product that not been sold at all*/
Select * 
from productDetail
full join productSale
on productDetail.ID = productSale.productID
where productSale.ID is NULL

---another method
Select pd.id, pd.name, pd.[description]
from productDetail as pd
left join productSale as ps
on pd.ID = ps.productID
where ps.ID is NULL

---using sub query
select pd.id, pd.name, pd.[description]
from productDetail as pd
where pd.id not in (select distinct productID from productSale)


/* finding department that there is no faculty in*/
use university
select * from department
select * from faculty

-- we like to have a null in the table
update faculty
set dept = Null
where id =155

---using sub query// department that there is no faculty in
select name, Location
from department 
where department.code not in (select distinct dept from faculty where dept is not null) -- inside paranthesiz we are excluding the
-- NUll otherwise we will be failed to list what we want because everything that is not in the list can be treated as NULL(unknown)

/*correlated subquery -- we can not run the inside query alone... depends on the value of out of sub-query
- each subquery run to the number rows of in the outer table*/
-- sum of null is null
use Mon_11_fa
select name, (select sum(Qty) from productSale where productSale.productID = productDetail.ID) as qntySold
from productDetail

Select * from productDetail
--using the join

select name, sum(qty)
from productDetail
left join productSale
on productDetail.ID = productSale.productID
group by Name

/*counting the number of faculty memebers in each department*/
--using count we can count the number of rows
use university
select * from department
select * from faculty

Select Name, (select count(id) from faculty where dept =department.CODE ) as number_of_faculty
from department

/*Adding the null to each count*/
Select Name, (select count(id) from faculty where dept =department.CODE or dept is null ) as number_of_faculty
from department


