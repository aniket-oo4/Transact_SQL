-- 3. Over    -- it groups the specific  range  of rows and performs the aggregate function such as 
--  sum(column name) over () as alias
-- average(column) over() as 
-- any many more max() min() , etc 
-- it performs such operaton without group by 
-- such as 
-- Declare @variable int
-- select  @variable =max()/ min()/average()/sum(coulumn) Over()  from tblName

-- below query gives the total number of attendance of per month 
select A.EmployeeNumber, datename(MONTH,A.AttendanceMonth), A.NumberAttendance
from tblEmployee As E 
join tblAttendance  as A
on E.EmployeeNumber=A.EmployeeNumber

-- below qery give the total numer of attendance is the specific year 
select A.EmployeeNumber, year(A.AttendanceMonth) as AttendanceYear, sum(A.NumberAttendance) as TotalAttendance
from tblEmployee As E 
join tblAttendance  as A
on E.EmployeeNumber=A.EmployeeNumber
group by  A.EmployeeNumber, year(A.AttendanceMonth)
order by  A.EmployeeNumber, year(A.AttendanceMonth)



-- using Over() as alias
select A.EmployeeNumber, datename(MONTH,A.AttendanceMonth), A.NumberAttendance,
sum(a.NumberAttendance) over () as TotalAttendance   -- over gives the total of all number of Attendance 
from tblEmployee As E 
join tblAttendance  as A
on E.EmployeeNumber=A.EmployeeNumber


-- maximum attended  employees 
Declare @Maximum int
select @Maximum=max(A.NumberAttendance) over () from tblAttendance as A    --  used over to assign the maximum value

select A.EmployeeNumber, datename(MONTH,A.AttendanceMonth), A.NumberAttendance,
max(a.NumberAttendance) over () as maximumn   -- over gives the total of all number of Attendance
from tblEmployee As E 
join tblAttendance  as A
on E.EmployeeNumber=A.EmployeeNumber
where A.NumberAttendance=@maximum


-- getting percentage of each employeee in each month out of total attandance 35409 of all employee in year 
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
,sum(A.NumberAttendance) over() as TotalAttendance,
convert(decimal(18,7),A.NumberAttendance) / sum(A.NumberAttendance) over() * 100.0000 as PercentageAttendance   -- calculating percentage 
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

select sum(NumberAttendance) from tblAttendance