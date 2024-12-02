
/*
-- transaction Isolation Levels - Why 
-- 1.Locks taken
-- 2.How Long 
-- 3.What happens 

Isolation Levels as follows ::
	1. Read Committed 
	2.Read Uncommitted 
	3. Repeatable Read 
	4.SnapShot 
	5. Serializable 

	-- isolation Levels in action ::
*/


set transaction isolation level read uncommitted  --we can access data while another tranasaction is not rollbacked yet 
begin tran 
Select * from tblEmployee
commit tran 

set transaction isolation level repeatable read   --it allows other tranasaction to modify data Insert ,Update,Delete
begin tran 
Select * from tblEmployee
commit tran 

set transaction isolation level serializable read   --it does not  allows other tranasaction to modify data Insert ,Update,Delete
begin tran 
Select * from tblEmployee
commit tran 