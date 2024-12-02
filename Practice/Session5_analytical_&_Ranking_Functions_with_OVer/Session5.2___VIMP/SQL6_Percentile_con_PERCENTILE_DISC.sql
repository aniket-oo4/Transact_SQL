/*

Average
suppose we have data set 
1
3
6
7
7
types of averages 
*>mean = sum of all values divide by total number of values 
     Mean=24/5  =4.8
*> Mode -- mostly used value = 7

*> Median - sort the data in ascending then take middle value 
	median = 6
	if there are even number of rows 
	1
	3    then it take middle 2 and calculate there mean  such as
	4      4+6/2=5
	6
	7
	7    median is 5

*/
--	14. PERCENTILE_CONT and PERCENTILE_DISC
select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
CUME_DIST()    over(partition by E.EmployeeNumber 
               order by A.NumberAttendance) as MyCume_Dist,
PERCENT_RANK() over(partition by E.EmployeeNumber 
                order by A.NumberAttendance) * 100 as MyPercent_Rank
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

SELECT DISTINCT EmployeeNumber,
PERCENTILE_CONT(0.4) WITHIN GROUP (ORDER BY NumberAttendance) OVER (PARTITION BY EmployeeNumber) as AverageCont,
PERCENTILE_DISC(0.4) WITHIN GROUP (ORDER BY NumberAttendance) OVER (PARTITION BY EmployeeNumber) as AverageDisc
from tblAttendance


