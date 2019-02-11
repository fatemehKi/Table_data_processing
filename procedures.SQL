/* creating a procedure 
create procedure procedurename <@varName1 varName1_datatype, 
@varName2 varName2_datatype,...>
as 
select * from tablename
where tablecolumn = @varName1;
any queries can be selected as procedure
it is similar to the function
*/

use university



create procedure selectAll_fa
as 
select * from faculty

-- executing the procedure
Exec selectAll_fa

---droping a procedure
drop procedure selectSAS_fa2

/*procedures with the argument*/
create procedure selectSAS_fa2 @dep varchar(10)
as
select * from faculty
where dept=@dep 

Exec selectSAS_fa2 SAS

/*In order to avoid having exec inside the function, we need to have the GO at the end of the function
then you can run the whole part.. if you do not have the go, when you are running it is going to be retraitive func*/

create procedure selectSAS_fa3 @dep varchar(10)
as
select * from faculty
where dept=@dep 
GO 

Exec selectSAS_fa3 SAS

drop procedure inserfaculty_fa2
Create procedure inserfaculty_fa2 @id int, @fname varchar(30),
                              @lname varchar(30), @dep varchar(10), @email varchar(50)
as 
insert into faculty
values (@id, @fname, @lname, @dep, @email);
go
--to excute the procedure, we can either put exceu or noe
inserfaculty_fa2 226, 'Asif', 'Gff', 'SAP', 'a@g.ca'

                   
