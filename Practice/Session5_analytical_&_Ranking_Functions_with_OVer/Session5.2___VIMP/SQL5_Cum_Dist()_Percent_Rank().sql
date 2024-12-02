--13. CUME_DIST and PERCENT_RANK
-- Cum_Dist() -- gives the  (row number)/(total number of rows)  in that particular partition 
-- PERCENT_RANK() -- gives the  (row number)-1/(total number of rows)  in that particular partition 

select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
CUME_DIST()    over(partition by E.EmployeeNumber 
               order by A.AttendanceMonth) as MyCume_Dist,
PERCENT_RANK() over(partition by E.EmployeeNumber 
                order by A.AttendanceMonth) as MyPercent_Rank
--				,
--cast(row_number() over(partition by E.EmployeeNumber order by A.AttendanceMonth) as decimal(9,5))
--/ count(*) over(partition by E.EmployeeNumber) as CalcCume_Dist,
--cast(row_number() over(partition by E.EmployeeNumber order by A.AttendanceMonth) - 1 as decimal(9,5))
--/ (count(*) over(partition by E.EmployeeNumber) - 1) as CalcPercent_Rank
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

-- we can get same results by using this also

select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
--CUME_DIST()    over(partition by E.EmployeeNumber 
--               order by A.AttendanceMonth) as MyCume_Dist,
--PERCENT_RANK() over(partition by E.EmployeeNumber 
--                order by A.AttendanceMonth) as MyPercent_Rank
--				,
cast(row_number() over(partition by E.EmployeeNumber order by A.AttendanceMonth) as decimal(9,5))
/ count(*) over(partition by E.EmployeeNumber) as CalcCume_Dist,
cast(row_number() over(partition by E.EmployeeNumber order by A.AttendanceMonth) - 1 as decimal(9,5))
/ (count(*) over(partition by E.EmployeeNumber) - 1) as CalcPercent_Rank
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber


/*Example: Suppose you have an EmpSalary table with salary data. The CUME_DIST() function would help you determine the percentile for each employee’s salary within their department  */
 then s

-- if ther=ir s a ties
select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
CUME_DIST()    over(partition by E.EmployeeNumber 
               order by A.numberAttendance) *22 as MyCume_Dist,
PERCENT_RANK() over(partition by E.EmployeeNumber 
                order by  A.numberAttendance)*22 as MyPercent_Rank

from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
