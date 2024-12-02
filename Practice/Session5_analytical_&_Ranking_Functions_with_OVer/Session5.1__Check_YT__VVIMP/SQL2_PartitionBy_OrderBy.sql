--4. Partition by and Order by
-- partition by defines the number of rows that we goingto take 
-- partition by takes the sepeparte renge  for each calculation of over()  
-- sum(A.numberAttendance) Over(PArtition by A.EmployeeNumber) -- it gives the sum of only  specific employee to that employee  sum will be calculated separately for each employee number 

select sum(NumberAttendance)  as sumOfAllAttendance from tblAttendance
where EmployeeNumber=123 and AttendanceMonth <'20150101'; 
-- for confirming  we set same results 

select A.EmployeeNumber, datename(MONTH,A.AttendanceMonth), A.NumberAttendance,
sum(a.NumberAttendance) over (PArtition by a.EmployeeNumber) as TotalAttendance   -- over gives the total of all number of Attendance 
from tblEmployee As E 
join tblAttendance  as A
on E.EmployeeNumber=A.EmployeeNumber
where A.AttendanceMonth<'20150101'      


-- getting total percentage wise display calculated separatelty for each emp number
select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
sum(A.NumberAttendance) over(PARTITION BY E.EmployeeNumber) as SumAttendance,
convert(money,A.NumberAttendance) / 
sum(A.NumberAttendance) over(PARTITION BY E.EmployeeNumber) * 100 as PercentageAttendance
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber


-- check the column values Numerattendance & SumAttendance 
--- orderby calculates the values upto the following date/column/number/row not on whole table 
--Order by performs the calculation of over on only on before that rows takeinto consideration 

select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
sum(A.NumberAttendance) over(PARTITION BY E.EmployeeNumber, year(A.AttendanceMonth) ORDER BY A.AttendanceMonth ) as SumAttendance,
convert(money,A.NumberAttendance) / 
sum(A.NumberAttendance) over(PARTITION BY E.EmployeeNumber) * 100 as PercentageAttendance
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
order by A.EmployeeNumber, A.AttendanceMonth

-- Order by columnname desc 
select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
sum(A.NumberAttendance) over(PARTITION BY E.EmployeeNumber, year(A.AttendanceMonth) ORDER BY A.AttendanceMonth desc) as SumAttendance,
convert(money,A.NumberAttendance) / 
sum(A.NumberAttendance) over(PARTITION BY E.EmployeeNumber) * 100 as PercentageAttendance
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
--order by A.EmployeeNumber, A.AttendanceMonth