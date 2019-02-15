/*cheat sheet*/

/*comma is used for the list only*/
/*--1. Creat/drop data base:
 create database databasename*/
create database day9_fa
drop database day9_fa

/*--2. Create/drop table: */
create table tablename
(
   column_name_1 data_type <option for constraints>,
   column_name_2 data_type
)


/*Alter is only for restructure and does not change the records */
Alter table table_name_that_exist
    drop column column_name
	add column column_name
    alter column column_name


/*update, insert and delete is used to change the records of a table (even one cell) */
update tablename
set column_name= some_value
where row_selector_condition

delete from table_name 
where row_selected_condition

Insert into tablename ()
values ()

/* select is used to retrive values of a table*/
select column_list from table 

/*we can add a condition option too*/
select column_list from table 
where row_selection_condition

/* we can have the order by option as well*/
select column_list from table 
<where row_selection_condition>
order by column_name

/* the column at the begining of the select needed to be included in the group by*/
/* the list of column in the selected part should be part of aggregate function or the group by function */
select specific_column, aggregatefn1(any column), aggregatefn2(any column),.. from table_name
<where row_selection_condition>
group by  specific_column
having row_selection_condition
order by column_list

/*finding the product name, total quentity that been sold,  and available
we need to specify the product_details.id since we have the id  in both side

The list of column in the selected part should be part of aggregate function or the group by function so if 
we want to add something in the select, we needed to add it in the group by*/
use mynewdb
select product_details.id, name, QntyAvail, sum(qty) as Total_sold
from Product_Details join Product_Sales 
on Product_Details.ID = product_sales.ProductID
group by Product_Details.ID, name, QntyAvail

/*cheat sheet*/

/*comma is used for the list only*/
/*--1. Creat/drop data base:
 create database databasename*/
create database day9_fa
drop database day9_fa

/*--2. Create/drop table: */
create table tablename
(
   column_name_1 data_type <option for constraints>,
   column_name_2 data_type
)


/*Alter is only for restructure and does not change the records */
Alter table table_name_that_exist
    drop column column_name
	add column column_name
    alter column column_name


/*update, insert and delete is used to change the records of a table (even one cell) */
update tablename
set column_name= some_value
where row_selector_condition

delete from table_name 
where row_selected_condition

Insert into tablename ()
values ()

/* select is used to retrive values of a table*/
select column_list from table 

/*we can add a condition option too*/
select column_list from table 
where row_selection_condition

/* we can have the order by option as well*/
select column_list from table 
<where row_selection_condition>
order by column_name

/* the column at the begining of the select needed to be included in the group by*/
/* the list of column in the selected part should be part of aggregate function or the group by function */
select specific_column, aggregatefn1(any column), aggregatefn2(any column),.. from table_name
<where row_selection_condition>
group by  specific_column
having row_selection_condition
order by column_list

/*finding the product name, total quentity that been sold,  and available
we need to specify the product_details.id since we have the id  in both side

The list of column in the selected part should be part of aggregate function or the group by function so if 
we want to add a column (something) in the select, we needed to add it in the group by*/
use mynewdb
select product_details.id, name, QntyAvail, sum(qty) as Total_sold
from Product_Details join Product_Sales 
on Product_Details.ID = product_sales.ProductID
group by Product_Details.ID, name, QntyAvail

/*showing the big sold items*/
/* we CANNOT have the aggregated function after where condition*/
select name, sum(qty) as Total_sold
from Product_Details join Product_Sales 
on Product_Details.ID = product_sales.ProductID
group by  name
having sum(Product_Sales.Qty)>100
order by Total_sold

select name, sum(qty) as Total_sold
from Product_Details join Product_Sales 
on Product_Details.ID = product_sales.ProductID
group by  name
having sum(Product_Sales.Qty)>100
order by Total_sold
