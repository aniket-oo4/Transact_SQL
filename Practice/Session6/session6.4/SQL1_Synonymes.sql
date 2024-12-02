--23. Synonyms   -- refers something else 
--other name for accessing the table
-- it does not create any new table it just references existing table such as reference variable 
-- change in synonyme  affect root table 
-- Syntax ::

create synonym EmployeeTable
for tblEmployee
go

select * from EmployeeTable
update EmployeeTable set  EmployeeMiddleName ='mid' where Employeenumber=123
select * from tblEmployee  -- change affected here 
update tblEmployee set  EmployeeMiddleName =null where Employeenumber=123
select * from EmployeeTable

--mproven that it referes common memory location 

create synonym DateTable
for tblDate
go

select * from DateTable   ---synonym can also referes invalid objects 


-- synonyme is usefull for long paths such as 
create synonym remoteTable  -- path reduced  to remoteTable
for server_name.Database_name.Schema_name.object_name  
  --example 
create synonym RemoteTable
for OVERTHERE.70-461remote.dbo.tblRemote
go

select * from RemoteTable