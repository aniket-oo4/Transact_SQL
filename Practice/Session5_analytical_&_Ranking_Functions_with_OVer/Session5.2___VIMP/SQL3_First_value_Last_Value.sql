--search Analytic Functions (Transact SQL) on microsoft Sql server 
-- fllowing are the Analyticc functions as follows



--11. FIRST_VALUE and LAST_VALUE
-- first_Value(Column) returns the the value of speicified column in the first row  of that partition 
-- Last_value(Column) It returns the  value  of the specified column in the last row of that partition 

select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
first_value(NumberAttendance)
over ( partition by E.EmployeeNumber order by A.AttendanceMonth ) as FirstMonth,
last_value(NumberAttendance)
over  ( partition by E.EmployeeNumber order by A.AttendanceMonth
rows between unbounded preceding and unbounded following )  as LastMonth
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

-- getting last value after 3 rows  that row
select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
first_value(NumberAttendance)
over ( partition by E.EmployeeNumber order by A.AttendanceMonth ) as FirstMonth,
last_value(NumberAttendance)
over  ( partition by E.EmployeeNumber order by A.AttendanceMonth
rows between unbounded preceding and 3 following  )  as LastMonth
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber