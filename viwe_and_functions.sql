/* deleting */

/*create a view to extract records from faculty table that has first name starting with A */
create view v_fac_fa
as
select * from faculty where fname like 'A%'

select * from v_fac_fa

/*changing the frst name for a faculty; update instead of alter view because the update is for data but alter
is for name and structure of the view
if we look at the base table(faculty) it also changed*/
update v_fac_fa
set fname='pq'
where id = 10119

 /*if we want to change the name of view */
alter view v_fac_fa
..

/*system defined functiosn*/
select square(3)
select GETDATE

/*function scalar, inline tabled and multi-statment tabled*/

/*syntax of a scalar function
CREATE FUNCTION function_name(@par1 datatype_par1, @par2 datatype_par2,..)
returns datatype_oftheresults
as
begin

      body 
	  return  someresult

end
the difference between store procedure and function is that in function we need to have 'select' 
*/
create function my_age(@DOB date)
returns int
as
begin

return (dateDiff(year, @dob, getdate()))
end
 
select dbo.my_age('1982-09-15') -- because scalar function in htis system is not the stored procedure we need dbo

/*finding how long the employees been hired, first name, last name and age*/
select * from emp

select fname, lname,dbo.findage(hiredate) as seniority from emp
order by Seniority

/*syntax of an Inline table valued function
CREATE FUNCTION function_name(@par1 datatype_par1, @par2 datatype_par2,..)
returns table
as
return (some select query)
the difference between view and inline function is that we can send the parameters for inline but not in view*/

/*creating a view that does show the employee table that city is special that been passed by city)*/
create function empbycity_fa(@city varchar(20))
Returns Table
as
return (select * from emp where city = @city)

select * from empbycity_fa('london')
select * from empbycity_fa('seattle')
  
 /* create a function to show the length of been hired based on the city been selected)*/
 create function age_hired3 (@city varchar(20))
 returns table
 as
 return ( select  fname, dbo.findage(hiredate) as duration from emp where city = @city)

select * from age_hired3('london')
select * from age_hired3('seattle')

/*returns employees from particular city and years of service greater than specific time*/

 create function age_hired4 (@city varchar(20), @yos int)
 returns table
 as
 return ( select  fname, dbo.findage(hiredate) as duration from emp where city = @city and dbo.findage(hiredate)>@yos)

 select * from age_hired4 ('london', 23)


/*syntax of an multi statment valued function
CREATE FUNCTION function_name(@par1 datatype_par1, @par2 datatype_par2,..)
returns @tablename Table(col1 datatype_ofcol1, col2 datatype_ofcol2,..)
as
begin
     insert into @tablename
	 some query that generates a table
	 return
end

--more restricted compared to the inline, the column list of tables need to be the same and identical */
 create function age_hired5 (@city varchar(20), @yos int)
 returns @table_my table (fname varchar(20), lname varchar(20), yrsofSer int)
 as
 begin
 insert into @table_my
 select  fname, lname, dbo.findage(hiredate) as duration 
 from emp 
 where city = @city and dbo.findage(hiredate)>@yos
 return
 end

 select * from age_hired5('london', 24)

 /*inline and scalar function get 
 updated as below.. as the result emp gets updated.. but multi valued function does not allow to update.. 
 therefore we use inline instead of multi statment*/
 update age_hired4('london', 24)
 Set lname='boss'
where fname = 'Micheal'

