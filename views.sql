/*
CREATE PROCEDURE procedureName <@varName1 varName1_datatype, 
			@varName2 varName2_datatype, ...>
AS
SELECT * FROM tableName
WHERE tableColumn = @varName1;
*/

select * from faculty

CREATE PROCEDURE SelectAll 
AS
SELECT * FROM faculty;
Go
Exec SelectAll;

drop procedure SelectAll;



CREATE PROCEDURE SelectSAS @dep varchar(10) 
AS
SELECT * FROM faculty
WHERE dept = @dep;
GO
Exec SelectSAS SAS;

CREATE PROCEDURE insertFaculty @id int, @fname varchar(30),
			@lname varchar(30), @dep varchar(10), @email varchar(50)  
AS
INSERT INTO faculty
VALUES (@id, @fname,@lname, @dep, @email);
GO

insertFaculty 222, 'Asif', 'Gff', 'SAP', 'a@g.ca'

/*views*/

CREATE VIEW VW_faculty
AS
SELECT * from faculty;

Select * from VW_faculty;


select * from faculty
select * from department

CREATE VIEW VW_faculty_department
AS
SELECT concat(fname,' ',lname) as fac_Name, 
				Name as dept_Name, Location
from faculty join department 
on dept=code
where dept='sas' or dept='sap';

select * from VW_faculty_department
