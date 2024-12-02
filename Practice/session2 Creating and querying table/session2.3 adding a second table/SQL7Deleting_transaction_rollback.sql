begin transaction  -- this is a block where we can do any changes to data but it can be roo

select count(*) from tblTransaction

Delete tblTransaction
from tblEmployee as E
right join tblTransaction T 
on T.EmployeeNumber=E.EmployeeNumber
where E.EmployeeNumber Is Null 

select count(*)from tblTransaction

rollback transaction   -- undo all the changes made into this block it keeps data as it ss

----------------------
select count(*)from tblTransaction


-- we can also do that as follows 
begin transaction 

select count(*)from tblTransaction

delete top (100) tblTransaction  -- top is used to specify how many rows you need to delete 
from tblTransaction
where EmployeeNumber In
(
select Tnum from
(
select  E.EmployeeNumber as Enum,E.EmployeeFirstName,E.EmployeeLastName,
 T.EmployeeNumber as Tnum
 from tblEmployee E
 right join  tblTransaction as T
 on E.EmployeeNumber=T.EmployeeNumber
 group by E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName, T.EmployeeNumber) as newTable
where Enum is null)

select count(*)from tblTransaction

rollback transaction 