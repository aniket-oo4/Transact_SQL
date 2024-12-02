select * from [dbo].[tblEmployee]

select * from [dbo].[tblEmployee]
where EmployeeNumber=134   -- seek becase there is a index on employee number 
-- Seek is fastest operation
-- Scan is slowest operation 
-- check execution path 

drop index [idx_tblEmployee] on [dbo].[tblEmployee]
select * from [dbo].[tblEmployee]
where EmployeeNumber=134   -- Scan becase there is no any index 


--- different join types 
/* 
1. Hash Match 
2. Nested Loop Match  :: one small table ,One large  table 
3. Merge MAtch -:: LArger tables ,sorted on join 
	
*/

--Hash match:
select * 
from [dbo].[tblDepartment] as D
left join [dbo].[tblEmployee] as E
on D.Department = E.Department

select D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName 
from [dbo].[tblDepartment] as D
left join [dbo].[tblEmployee] as E
on D.Department = E.Department


---Nested Loop ::
-- nested loop requires small tables 

select D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName 
from [dbo].[tblDepartment] as D
left join [dbo].[tblEmployee] as E
on D.Department = E.Department
where D.Department = 'HR'

select *
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber  -- its hash match because of both tables are big 

select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber   -- it still hash match 
-----------------------------------------------------------------------

--- MErge Join ::::::::::
-- creating unique clustered index 
create unique clustered index [idx_tblEmployee] on dbo.tblEmployee(employeeNumber )

create unique clustered index [idx_tblTransaction] on dbo.tblTransaction(employeeNumber,amount,DateOfTransaction )  --- because employeenumber is duplicate 
select  * from tblTransaction

--CREATE UNIQUE CLUSTERED INDEX [idx_tblEmployee] ON [dbo].[tblEmployee]
--([EmployeeNumber])

--GO

--CREATE UNIQUE CLUSTERED INDEX [idx_tblTransaction] ON [dbo].[tblTransaction]
--([EmployeeNumber],[DateOfTransaction],[Amount])

--GO
select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber

select *
into dbo.tblEmployeeNoIndex
from dbo.tblEmployee

select *
into dbo.tblTransactionNoIndex
from dbo.tblTransaction

select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber

select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployeeNoIndex] as E
left join [dbo].[tblTransactionNoIndex] as T
on E.EmployeeNumber = T.EmployeeNumber