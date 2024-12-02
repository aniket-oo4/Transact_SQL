begin tran 

update tblEmployee
set EmployeeGovernmentID='aaaa'  -- throws error Violation of UNIQUE KEY constrain 
where EmployeeNumber between 530 and 560
go 

select * from tblEmployee;
rollback tran

begin tran 
insert into tblEmployee
select null ,employeefirstname, EmployeeMiddleName,EmployeeLastName,EmployeeGovernmentID,DateOfBirth
,Department
from tblEmployee
-- thorws error  Cannot insert the value NULL into column 'EmployeeNumber' 
rollback tran 



insert into tblEmployee
values 
(2001,'aniket','vijay','varkhade','sdffdsf6787','2020-12-2','accounts'),
(null ,'employeefirstname', 'EmployeeMiddleName','EmployeeLastName','EmployeeGovernmentID','DateOfBirth','Department' )
-- it does not get inserted 
-- and also  when we insert the data in batch  then when any of the  row contains false data  then it does not insert any 
-- of the following batch 

begin tran

select * from tblEmployee where EmployeeNumber=2001; -- not inserted because 

Alter table tblEmployee
Add Constraint uniqGovId UNIQUE(EmployeeGovernmentID) 

select Distinct EmployeeGovernmentID from tblEmployee  --- confirming distinct rows match with select statements 

commit tran --  saves the changes made int transaction block 

-- adding constraints to tbl transaction 
Alter Table tblTransaction
Add Constraint unqTransaction UNIQUE(Amount,DateOfTransaction,EmployeeNumber)
go
--now all the transactions become unique
select * from tblTransaction where EmployeeNumber=131
go

delete from tblTransaction
where EmployeeNumber=131;  -- deleted all the rows wohse emp number was 131
go

insert into tblTransaction
values(1,'2015-01-01',131)  
insert into tblTransaction  -- Violation of UNIQUE KEY constraint 'unqTransaction'  did not get inserted 
values(1,'2015-01-01',131)


-- remove constraint 
Alter Table tblTransaction
Drop constraint unqTransaction  -- rremoving the constraint from the table transaction

-- then try to insert the rows it successfully got inserted 
insert into tblTransaction
values(1,'2015-01-01',131)
insert into tblTransaction
values(1,'2015-01-01',131)

--- we can also add constraint at the time of creation of table 

create table tblTransaction2
(Amount smallmoney not null ,
DateOfTransaction  smallDateTime not null,
EmployeeNumber int not null,
Constraint unqTransaction Unique(amount,DateOfTransaction,EmployeeNumber)
)
Go

-- then try to insert the rows it throw error while inserting second row 
insert into tblTransaction2
values(1,'2015-01-01',131)
insert into tblTransaction2
values(1,'2015-01-01',131)


--  we applied unique constraint on a group 
--    unqTransaction Unique(amount,DateOfTransaction,EmployeeNumber) 
--       hence we can insert  the  values as any one of the olumns value is diffrent 
insert into tblTransaction2
values(12,'2015-01-01',131) -- amount is different 
--  it check uniquness if applied constraint on groupthe as follow
-- there are three cols A,B ,C 
--  iF rows are duplicated in Col A then it check in Col B if there is no duplication got inserted 
--- if duplication then it check fo col C if there is no duplicationthen inserted  otherwise not inserted row and throws error dupplication of  unique constraint

drop table tblTransaction2
