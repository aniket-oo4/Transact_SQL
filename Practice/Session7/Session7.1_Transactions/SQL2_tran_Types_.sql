select * from tblemployee
--update tblEmployee
--set  EmployeeNumber=122
--where EmployeeNumber=123
--Transaction Types are -- Implicit & explicit 
-- above code is  by default implicit transaction
-- anything runs in sql is a transaction they are implicit transaction 


-- Explicit transaction

begin transaction
select * from tblemployee
update tblEmployee
set  EmployeeNumber=122
where EmployeeNumber=123
--commit transaction  -- it is for saving the chages permanently 
rollback  transaction   -- it does not saves the changes it undo alll the changes 

select * from tblemployee  -- implicit transaction 


-- transaction lock   (where  we cannnot mention commit or rollback then the transaction runs continuosly it cant allow any other implicit or explicit tranasaction  ono other file to run )
begin transaction
select * from tblemployee
update tblEmployee
set  EmployeeNumber=122
where EmployeeNumber=123

--commit tran
rollback  tran
select * from tblEmployee
go

-- marked Trnastion (transaction with names )

begin transaction MyTranasaction  With Mark  'my Transaction'  --other name
Select * from tblEmployee
update tblEmployee
set  EmployeeNumber=122
where EmployeeNumber=123
rollback Tran MyTranasaction