select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
,sum(A.NumberAttendance) over() as TotalAttendance
--convert(decimal(18,7),A.NumberAttendance) / sum(A.NumberAttendance) over() * 100.0000 as PercentageAttendance 
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

select sum(NumberAttendance) from tblAttendance
-- when there is nopartition by 
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
,sum(A.NumberAttendance) over( order by A.EmployeeNumber, A.AttendanceMonth rows between unbounded preceding and unbounded following) as TotalAttendance
--convert(decimal(18,7),A.NumberAttendance) / sum(A.NumberAttendance) over() * 100.0000 as PercentageAttendance 
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber


--Defaults 
-- when there is no order by  in tthe Over also  then 
-- it will take 
-- rows between unbounded preceding and unbounded following  by default we not need to mention just need to call over 
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
,sum(A.NumberAttendance) over() as TotalAttendance
,count(A.EmployeeNumber) over( ) as TotalCountOfemployees
--convert(decimal(18,7),A.NumberAttendance) / sum(A.NumberAttendance) over() * 100.0000 as PercentageAttendance 
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber



 -- if there is only orderby  then 
--Defaults is 
--rows between unbounded preceding and Current Row
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
,sum(A.NumberAttendance) over( order by A.EmployeeNumber, A.AttendanceMonth) as TotalAttendance
,count(A.EmployeeNumber) over( order by A.EmployeeNumber, A.AttendanceMonth) as TotalCountOfemployees
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
