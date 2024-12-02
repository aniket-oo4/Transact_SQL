alter table tblTransaction
Add Constraint  chkAmount Check ( amount> -1000 and amount<1000) 


--- check constraints works on the rows 
-- it  checks the value of specific  column in a row 

insert into tblTransaction
values (1100,'2020-12-22',1)

insert into tblTransaction
values (-1120,'2020-12-22',1)  

-- does not allow the values that does not match specified conditionn 

alter table tblEmployee
add constraint chkMiddleName check
(Replace(EmployeeMiddleName,'.','') =EmployeeMiddleName or EmployeeMiddleName is null)
--  The ALTER TABLE statement conflicted with the CHECK constraint "chkMiddleName" because existing values are with .

--then try like  
alter table tblEmployee with nocheck -- it will not check existing rows 
add constraint chkMiddleName check
(Replace(EmployeeMiddleName,'.','') =EmployeeMiddleName or EmployeeMiddleName is null)

select * from tblEmployee

begin tran
insert into tblEmployee
Values
(2003,'A','B','C','D','2014-12-12','Accounts');

insert into tblEmployee
Values
(2004,'A','Bvajs.','C','e','2014-12-12','Accounts');-- throws error because we added check constraint for that 
select * from tblEmployee where EmployeeNumber=2004;
rollback tran 
Go

--Adding chekc on date of birth to restrict user to insert future date


alter table tblEmployee with nocheck
add constraint chkDateOfBirth check
(DateOfBirth<Getdate())

begin tran 
insert into tblEmployee
Values
(2004,'A','B','C','D','3010-12-12','Accounts');  -- it will allos to insert before adding the check constrant 
-- try it after adddin check constraint 
select * from tblEmployee where EmployeeNumber=2004;

rollback tran 


-- adding check while creating new table 

create table tblEmployee2
(middlename varchar(40) null,
check (Replace(middlename,'.','')=middlename or middlename is null)) --htre is no name of constraint name compiler automatically creates uglyname 

-- we can give name to constraint as follo 
/*
create table tblEmployee2
(middlename varchar(40) null,
 Constraint chk_EmployeeMiddleName  check (Replace(middlename,'.','')=middlename or middlename is null))  
 */
insert into tblEmployee2
Values
(2004,'A','B.','C','D','3010-12-12','Accounts');
select * from tblEmployee2

drop table tblEmployee2