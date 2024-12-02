select  datename (MONTH, DateOfBirth)  as month_,count(*) as nOfEmp
from tblEmployee
group by datename (MONTH, DateOfBirth),DATEPART(month,dateofBirth)
order by DATEPART(month,DateOfBirth)
Go


select  datepart (MONTH, DateOfBirth)  as month_,count(*) as nOfEmp
from tblEmployee
group by datepart (MONTH, DateOfBirth)
order by month_
Go

--select EmployeeLastName  from tblEmployee

select  datepart (MONTH, DateOfBirth)  as month_,count(*) as nOfEmp,year(dateofbirth) as yearr
from tblEmployee
group by datepart (MONTH, DateOfBirth),datepart(year,dateofbirth)
order by month_,yearr
Go

-- selecting employees having middlenames 

select  datename (MONTH, DateOfBirth)  as month_,count(*) as numberOfEmployees,
count(EmployeeMiddleName) as numerOfMiddlename,
count(*)-count(EmployeeMiddleName) as noMiddleName,
min(dateofbirth) as earliestDOB,
max(DateOfBirth) as latestDOB
from tblEmployee
group by datename (MONTH, DateOfBirth),DATEPART(month,dateofBirth)
order by DATEPART(month,DateOfBirth)
Go


select  datename (MONTH, DateOfBirth)  as month_,count(*) as numberOfEmployees,
count(EmployeeMiddleName) as numerOfMiddlename,
count(*)-count(EmployeeMiddleName) as noMiddleName,
format(min(dateofbirth),'D') as earliestDOB,
format(max(DateOfBirth) ,'D') as latestDOB
from tblEmployee
group by datename (MONTH, DateOfBirth),DATEPART(month,dateofBirth)
order by DATEPART(month,DateOfBirth)
Go