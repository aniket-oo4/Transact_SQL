
-- foreign is is the key  that  references the primary key of another table of  another table 
-- it connects two tables together 
/*
Alter table TblTransaction with nocheck 
Add Constraint FK_TblTransaction_Employee Foreign KEY (EmployeeNumber)  --(column name in tbltransaction )
References tblEmployee(EmployeeNumber)
--         tblname   (  primary key name  ) 

*/

--run full block 

Begin tran

Alter table tbltransaction Alter column EmployeeNumber Int null
Alter table tbltransaction Add Constraint DF_tblTransaction  Default 124 for  EmployeeNumber
Alter table TblTransaction  with nocheck
Add Constraint FK_TblTransaction_Employee Foreign KEY (EmployeeNumber)  --(column name in tbltransaction )
References tblEmployee(EmployeeNumber)
--On update cascade    --  on update cascade is used for any updates to the primary key also  reflects in								other table foreign key 
--On Update set null -- it sets the value of foreign keys and also primary key n both table as null
On Update set Default      -- sets to  default value if   tried to update primary key           
--On DELETE  No Action   -- when try to delete entire row it  it will throw error 
--On DELETE  Cascade  -- al the data of both tables is being deleted 
--On DELETE  Set null   -- Employee number is set to null which is deleted 
On DELETE  Set Default  -- it will set the default value in the replacement of the value which is deleted in both table 

Delete tblEmployee  from tblEmployee where EmployeeNumber=123

update tblEmployee set EmployeeNumber =9123 where  EmployeeNumber=123  -- errror before adding On update cascade 
-- do that as

update tblEmployee set EmployeeNumber =9123 where  EmployeeNumber=123
--delete tblEmployee where EmployeeNumber=123;
--

select E.EmployeeNumber,T.*
from tblEmployee E
right join tblTransaction T
on E.EmployeeNumber=t.EmployeeNumber
where  T.Amount in(-179.47,786.22,-967.036,957.03)
RollBack tran 

select E.EmployeeNumber,T.*
from tblEmployee E
right join tblTransaction T
on E.EmployeeNumber=t.EmployeeNumber
where  T.Amount in(-179.47,786.22,-967.036,957.03)

--select * from tblEmployee