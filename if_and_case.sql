
if DATENAME(weekday, getdate()) in ('Monday', 'Tuesday')
   print ('weekday begins')
   else
   print('weekday ending')
/*case*/
print (case
when datename(weekday, getdate()) in ('Saturday' , 'Sunday')
   then 'weekend'
when datename(weekday, getdate()) in ('Monday', 'Tuesday')
  then 'weekday begin'
  else 'weekday ending'
  end) 
case
 when datename(weekday, getdate()) in ('Saturday' , 'Sunday')
   then print('weekend')
 when datename(weekday, getdate()) in ('Monday', 'Tuesday')
  then print('weekday begin')
  else print('weekday ending')
  end) 

/*to find a function or procedure we use sp_helptext
  /*finding the find age function*/*/
sp_helptext findage

print dbo.findage('2018-02-15')
/*modifying the function if the number of months from the year is less than 12*/

select datepart (month,'2018-02-15')

alter function findage(@dob date)
returns int
as
begin
return (

case
when DATEPART(month, @dob)> DATEPART(MONTH,GETDATE())
or (DATEPART(month, @dob) = DATEPART(month,getdate()) and DATEPART(day, @dob)> DATEPART(day,getdate()))
 then datediff(year, @dob, getdate())-1
else
datediff(year, @dob, getdate())
end
)
end

select dbo.findage('2018-03-11')
