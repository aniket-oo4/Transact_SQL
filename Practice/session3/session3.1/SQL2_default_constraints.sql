
-- add new column to tbltransaction
alter table tblTransaction
add DateOfEntry dateTime  -- its bydefaul nullable type 

--adding   a new constraints to existing table 

Alter table tblTransaction 
add Constraint defDateOfEntry Default GetDate() for DateOfEntry;

select * from tblTransaction where EmployeeNumber<3

delete from tblTransaction
where EmployeeNumber<3

insert into tblTransaction (Amount,DateOfTransaction,EmployeeNumber)
values(1,'2014-01-01',1);  -- it insert defautl value  as todays datetime for dateofentry 

insert into tblTransaction (Amount,DateOfTransaction,EmployeeNumber,DateOfEntry)
values(2,'2014-01-02',1,'2013-01-01');  -- it stores user provided values into Date of entry 

select * from tblTransaction where EmployeeNumber<3

-- addding default constraint while creating a table 
create table tblTransaction2
(Amount smallmoney not null ,
DateOfTransaction  smallDateTime not null,
EmployeeNumber int not null,
DateOfEntry datetime null  Constraint  tblTransaction2_defDateOfEntry Default getdate() 
)  -- changed name of constraint becaus in database already have same name of constraint object 
Go

insert into tblTransaction2 (Amount,DateOfTransaction,EmployeeNumber)
values(1,'2014-01-01',1);  -- it insert defautl value  as todays datetime for dateofentry 

insert into tblTransaction2 (Amount,DateOfTransaction,EmployeeNumber,DateOfEntry)
values(2,'2014-01-02',1,'2013-01-01');  -- it stores user provided values into Date of entry 

select * from tblTransaction2 where EmployeeNumber<3


drop table tblTransaction2 -- drops all the table 


alter table tbltransaction 
drop column DateOfEntry  -- it gives error The object 'defDateOfEntry' is dependent on column 'DateOfEntry

--if we need to drop specific column but  if the some object of constraint dependended on it 
-- then it not allow you to delete this col then you do that  
-- first  drop the constraint then   drop the column 
alter table  tbltransaction
drop constraint defDateOfEntry  -- deleted constraint dependent on column
alter table tblTransaction  -- then deleted the column 
drop column DateOfEntry 