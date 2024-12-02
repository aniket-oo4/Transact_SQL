-- 6. Current Row and Unbounded
-- unbounded is used when we dont know how many rows have in preceding or following 
--rows between  0 preceding and unbounded following  -- it takes currenct row and  all other rows that comes after that row
--rows between  unbounded preceding and 0 following  -- it takes currenct row and  all other rows that comes before that row 

-- we can also use Current row which replaces the 
rows between current Row and  unbounded following  
-- it replced rows between 0 preceding and  unbounded following 
rows between 4   preceding and Current Row
rows between  unbounded   preceding and Current Row
-- it replaced rows between  unbounded   preceding and 0 following



-- 2 preceding and current row 
select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
SUM(A.NumberAttendance) over(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as RollingTotal
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber


-- unbounded preceding rows and currrent  row 
select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
SUM(A.NumberAttendance) over(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as RollingTotal
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

-- unbounded following and current row 
select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
SUM(A.NumberAttendance) over(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) as RollingTotal
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber



