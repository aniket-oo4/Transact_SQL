--- Locks in practice and using Wait for 
begin tran 
--select * from tblEmployee  --- automatically  shared lock 
-- first it goes to shared lock
update tblEmployee set EmployeeNumber=123 where EmployeeNumber=122  -- it goes to Update lock

waitfor delay '00:00:10'     -- here it goes to exclusive Lock
-- it waits for 10 seconds to commit 

commit tran  -- or Rollback  -- it releases all the locks 

select * from tblEmployee