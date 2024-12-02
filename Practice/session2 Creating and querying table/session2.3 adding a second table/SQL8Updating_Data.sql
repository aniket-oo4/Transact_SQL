select * from tblEmployee where EmployeeNumber=194;
select * from tblTransaction where EmployeeNumber=3;
select * from tblTransaction where EmployeeNumber=194;

begin tran
select * from tblTransaction where EmployeeNumber=194;

update  tblTransaction
set EmployeeNumber=194 where EmployeeNumber=3;

select * from tblTransaction where EmployeeNumber=194;
rollback tran


--- using output inserted.*,deleted.* 
-- to track which records are inserted and which are deleted 
begin tran
--select * from tblTransaction where EmployeeNumber=194;

update  tblTransaction
set EmployeeNumber=194
output inserted.* ,deleted.*
from tblTransaction
where EmployeeNumber  between 3 and 10
--select * from tblTransaction where EmployeeNumber=194;
rollback tran

---------------------------------------------------------------------------------
-- for getting comparison between specific twi column 
begin tran
---select * from tblTransaction where EmployeeNumber=194;
update  tblTransaction
set EmployeeNumber=194
output inserted.EmployeeNumber ,deleted.EmployeeNumber,deleted.DateOfTransaction
from tblTransaction
where EmployeeNumber  between 3 and 10

--select * from tblTransaction where EmployeeNumber=194;
rollback tran
---------



-- other conditions  using in
begin tran
select * from tblTransaction where EmployeeNumber=194;

update  tblTransaction
set EmployeeNumber=194 where EmployeeNumber in (3,5,7,8,9)

select * from tblTransaction where EmployeeNumber=194;
rollback tran

-- other condition using between 
-- other conditions 
begin tran
select * from tblTransaction where EmployeeNumber=194;

update  tblTransaction
set EmployeeNumber=194 where EmployeeNumber  between 3 and 10

select * from tblTransaction where EmployeeNumber=194;
rollback tran
-----



