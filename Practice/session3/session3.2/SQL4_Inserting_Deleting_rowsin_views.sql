use Practice

--if exists(select * from sys.views where name = 'ViewByDepartment')
if exists(select * from INFORMATION_SCHEMA.VIEWS
where [TABLE_NAME] = 'ViewByDepartment' and [TABLE_SCHEMA] = 'dbo')
   drop view dbo.ViewByDepartment
go

CREATE view [dbo].[ViewByDepartment] as 
select D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
from tblDepartment as D
left join tblEmployee as E
on D.Department = E.Department
left join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber between 120 and 139
-- WITH CHECK OPTION   --- its the check option wich restrict modification on tables 
--order by D.Department, T.EmployeeNumber
GO

--- the views are created  by joining	multiple tables via join queies then this view is not updatable ,deletable it throws erroor 
-- changes made on views also affects the original base table 

-- we cannot update insert or delete the views if views are created with (  With check )constrain
--
begin tran

use Practice
insert into ViewByDepartment(EmployeeNumber,DateOfTransaction,TotalAmount)
values (132,'2015-07-07', 999.99)

select * from ViewByDepartment order by Department, EmployeeNumber
select * from	 tblTransaction where Amount =999.99
rollback tran

begin tran
--select * from ViewByDepartment order by EmployeeNumber, DateOfTransaction
--Select * from tblTransaction where EmployeeNumber in (132,142)

--- Updating -----------------------------
-- we can update the view if it is not created with (  With Check )
update ViewByDepartment
set EmployeeNumber = 142
where EmployeeNumber = 132

select * from dbo.ViewByDepartment order by EmployeeNumber, DateOfTransaction
--Select * from tblTransaction where EmployeeNumber in (132,142)
rollback tran


--- Deleting rows in views --- rows  
-- we cannot update insert or delete the views if views are created with (  With check )constrain
--


SELECT * FROM ViewByDepartment
delete from ViewByDepartment
where TotalAmount = 999.99 and EmployeeNumber = 132
GO
CREATE VIEW ViewSimple
as
SELECT * FROM tblTransaction
GO

BEGIN TRAN
delete from ViewSimple
where EmployeeNumber = 132
--select * from ViewSimple
ROLLBACK TRAN