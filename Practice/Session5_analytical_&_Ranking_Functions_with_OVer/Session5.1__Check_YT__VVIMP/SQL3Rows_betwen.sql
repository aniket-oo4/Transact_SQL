/*
we can perform the operations on specific renge also by using the 
	rows between 12 preceding and 13 following  -- preciding and following are optional
	-- if row contains values 1,2,3,4,5,6,7 then  
	suppose if we are currently on 4
	rows between  2  preceding and 1 following -- it select 2,3,4,5, |  2&3 are precedings And 5 is following 
*/

select A.EmployeeNumber,A.AttendanceMonth,A.NumberAttendance,
sum(A.NumberAttendance ) over ( partition by A.EmployeeNumber ,year(A.AttendanceMonth)
order by A.attendanceMonth rows between 1 Preceding and 1 following )    --  
as runningTotal
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber=A.EmployeeNumber


select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
SUM(A.NumberAttendance) over(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) as RollingTotal
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber


-- order by is Compulsary  to use rows 

--   sum(attendance ) over (rows between 1 preceding and 1 following )
12  -- sum = 55
43   -- current  um=77   
22  --  sum =87
22  -- sum = 44
