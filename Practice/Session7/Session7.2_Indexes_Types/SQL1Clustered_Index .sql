select * from tblEmployee
select * from tblDepartment

-- Heap & B-Tree(Balance Tree)
select * from tblEmployee
where EmployeeNumber=124 --- for single value also it scans entire table check estimate execution path 
-- creating cluster index on tbl employeee 
go 
--when we create the index the rows are sorted accordingly to index 

Create clustered index idx_tblEmployee on [dbo].[tblEmployee]([EmployeeNumber])

drop index  idx_tblEmployee on [dbo].[tblEmployee]
 
-- seek =few number of rows based on index 
-- scan =going through the entire table  --
select * from tblEmployee -- it does scan entire     -- check estimate path of  both 
select * from tblEmployee -- it does seek 
where EmployeeNumber=131
go
-- creating index by default if we create primary key it creates index  the only difference is primary key must be unique but clustered index can be duplicate also
alter table tblemployee
add constraint pk_tblEmployee primary key (employeenumber)  -- error 

select *  into tblEmployee2
from tblEmployee where EmployeeNumber<>131

alter table tblemployee2
add constraint pk_tblEmployee primary key (employeenumber)