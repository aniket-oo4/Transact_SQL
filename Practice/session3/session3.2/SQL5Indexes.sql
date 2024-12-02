USE Practice
GO
--select * from dbo.viewByDepartment

--if exists(select * from sys.views where name = 'ViewByDepartment')
if exists(select * from INFORMATION_SCHEMA.VIEWS
where [TABLE_NAME] = 'ViewByDepartment' and [TABLE_SCHEMA] = 'dbo')
   drop view dbo.ViewByDepartment
go

CREATE view [dbo].[ViewByDepartment] with schemabinding as  -- SchemaBinding is nessesaary for creating index 
select D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
from dbo.tblDepartment as D
inner  join dbo.tblEmployee as E
on D.Department = E.Department
inner join dbo.tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber between 120 and 139
GO

select * from [dbo].[ViewByDepartment]
--delete top (3 )from  tbltransaction
where DateOfTransaction ='Jan  1 2015 12:00AM'

-- creating index on ViewDepartment

create unique clustered index inx_ViewByDepartment
on dbo.ViewByDepartment(EmployeeNumber,Department )

-- Throws error
/*
Msg 10113, Level 16, State 1, Line 24
Cannot create index on view "Practice.dbo.ViewByDepartment" because it uses
 a LEFT, RIGHT, or FULL OUTER join, and no OUTER joins are allowed in indexed views. Consider using an INNER join instead.

*/

 --add: with  schemabinding while  creataing a view  then try it 
 -- it throws error 
 --The CREATE UNIQUE INDEX statement terminated because a duplicate key was found for the object name 'dbo.ViewByDepartment' and the index name 'inx_ViewByDepartment'. The duplicate key value is (122, consumer help).

 create unique clustered index inx_ViewByDepartment
on dbo.ViewByDepartment(EmployeeNumber,Department ,DateofTransaction)

begin tran
drop table tblEmployee-- ERROR :: Cannot DROP TABLE 'tblEmployee' because it is being referenced by object 'ViewByDepartment'.

rollback trAN

select * from   inx_ViewByDepartment