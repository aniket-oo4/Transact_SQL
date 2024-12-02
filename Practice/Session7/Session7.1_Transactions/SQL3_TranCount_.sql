-- nested transactions
		update tblEmployee
		set  EmployeeNumber=123
		where EmployeeNumber=122

select * from tblEmployee go
begin tran 
	begin tran 
		update tblEmployee
		set  EmployeeNumber=122
		where EmployeeNumber=123
	commit tran

commit tran   -- it commits  all the changes to data base 

select * from tblEmployee go

begin tran 
	begin tran 
		update tblEmployee
		set  EmployeeNumber=122
		where EmployeeNumber=123
	commit tran

rollback  tran  -- it rollbacks all the transaction   inner commit does not affect any
select * from tblEmployee go

begin tran 
	begin tran 
		update tblEmployee
		set  EmployeeNumber=122
		where EmployeeNumber=123
	rollback tran   -- it rollbacks all the transaction   including outer tran hence  below commit  throws error 
	commit tran   -- The COMMIT TRANSACTION request has no corresponding BEGIN TRANSACTION.
select * from tblEmployee go
--------------------------------------------------------------------------------------------------

--@@TRANCOUNT ------------------------------------------
 -- it returns the level of transaction  Low is higher(outer) level and high is low(inner) level
 --@@TRANCOUNT =0  begin tran @@TRANCOUNT+1, commit tran @@TRANCOUNT-1 ,Rollback tran @@TRANCOUNT=0
select * from tblEmployee go
select @@TRANCOUNT   -- 0 -- implicit tranasction
begin tran 
	select @@TRANCOUNT--1
	begin tran 
		select @@TRANCOUNT --2
		update tblEmployee
		set  EmployeeNumber=122
		where EmployeeNumber=123
	commit tran
	select @@TRANCOUNT --1
commit tran  
select @@TRANCOUNT  --0-- implicit tranasction


-- using in case of inner rollback 
select @@TRANCOUNT   -- 0 -- implicit tranasction
begin tran 
	select @@TRANCOUNT--1
	begin tran 
		select @@TRANCOUNT --2
		update tblEmployee
		set  EmployeeNumber=122
		where EmployeeNumber=123
	rollback tran
	select @@TRANCOUNT --0
--solving the error problem
if @@TRANCOUNT>0 
		commit tran  
select @@TRANCOUNT  --0-- implicit tranasction