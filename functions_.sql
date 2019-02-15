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


  
