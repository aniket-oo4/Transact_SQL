--Altering and dropping views
USE [Practice]
GO

select * from sys.tables -- command to select al te tables in the system
select * from sys.objects  -- query to select all the objects in the systsem 
--if exists(select * from sys.views where name = 'ViewByDepartment')  --checks view is exist or not if not then crreate new 
if exists(select * from INFORMATION_SCHEMA.VIEWS
where [TABLE_NAME] = 'ViewByDepartment' and [TABLE_SCHEMA] = 'dbo')
   drop view dbo.ViewByDepartment
go

-- creating view without Encrypton 
CREATE view [dbo].[ViewByDepartment] as
select D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
from tblDepartment as D
left join tblEmployee as E
on D.Department = E.Department
left join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber between 120 and 139
--order by D.Department, T.EmployeeNumber

GO

-- creating view with encryption before exucute please deelte the privoiusly created 
CREATE view [dbo].[ViewByDepartment] With Encryption  as   -- with Encryption secures the table100% it cannot be retrieved by any chance 
select D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
from tblDepartment as D
left join tblEmployee as E
on D.Department = E.Department
left join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber between 120 and 139
--order by D.Department, T.EmployeeNumber

GO

select  * from [dbo].[ViewByDepartment];

USE [Practice]
GO

SELECT [Department]
      ,[EmployeeNumber]
      ,[DateOfTransaction]
      ,[TotalAmount]
  FROM [dbo].[ViewByDepartment]

GO

