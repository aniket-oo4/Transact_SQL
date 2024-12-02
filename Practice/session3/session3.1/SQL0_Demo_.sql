begin tran 

update tblEmployee
set EmployeeGovernmentID='aaaa'  -- throws error Violation of UNIQUE KEY constraint 
where EmployeeNumber between 530 and 560

select * from tblEmployee;
rollback tran


-- we can insert elements into the table by using select statements also 
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


select * from tblEmployee where EmployeeNumber=2001; -- not inserted because 
