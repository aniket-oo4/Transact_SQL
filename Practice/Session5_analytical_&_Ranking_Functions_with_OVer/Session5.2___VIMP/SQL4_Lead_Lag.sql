--12. LAG and LEAD
-- Lag  goes Backward  
-- Lead goes Forward 
--                     default val is optional
--Lag(columnName,1,default value if null) over (partition by columnname order by column name ) the second column specifies  how many rows we need to go backward 
--Lead(columnName,2,default value if null) over (partition by columnname order by column name ) the second column specifies  how many rows we need to go forward    
-- Lag(Column) -- is equivalent to lag(column,1)
-- Lead(Column) -- is equivalent to Lead(column,1)
/*Ex mytbl
data
1  select Lag(data,2) over()from mytbl    ---->  null    |    select Lead(data,2) from mytbl    ---->  3     
2  select Lag(data,2) over() from mytbl    ---->  null    |    select Lead(data,2) from mytbl    ---->  4 
3  select Lag(data,2)  over()from mytbl    ---->  1    |    select Lead(data,2) from mytbl    ----> 5 
4   select Lag(data,1)  over()from mytbl    ----> 3    |    select Lead(data,2) from mytbl    ---->  null 
5	 select Lag(data,2) over() from mytbl    ---->  null    |    select Lead(data,2) from mytbl    ---->  3 
-- The functions 'LEAD'&'LAG' must have an OVER clause with ORDER BY.                                                                 

*/

select NumberAttendance,LEAD(NumberAttendance,1)  over (Order by EmployeeNumber),EmployeeNumber from tblAttendance

select NumberAttendance,Lag(NumberAttendance,1)  over (Order by EmployeeNumber),EmployeeNumber from tblAttendance


-- partion by
select NumberAttendance,LEAD(NumberAttendance,2)  over (partition by EmployeeNumber Order by EmployeeNumber) as After2Rows  ,EmployeeNumber from tblAttendance  -- return the value of tat column after skiping 2-1 rows

select NumberAttendance,LAG(NumberAttendance,3)  over (partition by EmployeeNumber Order by EmployeeNumber) as Before3Rows  ,EmployeeNumber from tblAttendance   --returns values of that column before 3 rows if not have 3-1 rows  to skip then it takes null 


----
select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
lag(NumberAttendance, 1)  over(partition by E.EmployeeNumber 
                            order by A.AttendanceMonth) as MyLag,
lead(NumberAttendance, 1) over(partition by E.EmployeeNumber 
                            order by A.AttendanceMonth) as MyLead,
NumberAttendance - lag(NumberAttendance, 1)  over(partition by E.EmployeeNumber 
                            order by A.AttendanceMonth) as MyDiff
--first_value(NumberAttendance)  over(partition by E.EmployeeNumber 
--                                    order by A.AttendanceMonth
--							        rows between 1 preceding and current row) as MyFirstValue,
--last_value(NumberAttendance) over(partition by E.EmployeeNumber 
--                                  order by A.AttendanceMonth
--								  rows between current row and 1 following) as MyLastValue
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber



-- we can also get similar results  by following 


select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
--lag(NumberAttendance, 1)  over(partition by E.EmployeeNumber 
 --                           order by A.AttendanceMonth) as MyLag,
--lead(NumberAttendance, 1) over(partition by E.EmployeeNumber 
 --                           order by A.AttendanceMonth) as MyLead,
--NumberAttendance - lag(NumberAttendance, 1)  over(partition by E.EmployeeNumber 
 --                           order by A.AttendanceMonth) as MyDiff,

first_value(NumberAttendance)  over(partition by E.EmployeeNumber 
                                   order by A.AttendanceMonth
							        rows between 1 preceding and current row) as MyFirstValue,
last_value(NumberAttendance) over(partition by E.EmployeeNumber 
                                 order by A.AttendanceMonth
								  rows between current row and 1 following) as MyLastValue
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber