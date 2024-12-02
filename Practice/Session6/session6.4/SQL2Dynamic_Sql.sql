--24. Dynamic Queries
-- we can storethe queries into the variable 
-- and we can change the query as perthe need  that is dynamic version 
select * from tblEmployee where EmployeeNumber = 129;
go
declare @command as varchar(255);   -- declared the variable 
set @command = 'select * from tblEmployee where EmployeeNumber = 129;'  -- stored the query inside the Variable   
set @command = 'Select * from tblTransaction'   -- changed the query 
execute (@command);
go


declare @command as varchar(255), @param as varchar(50);
set @command = 'select * from tblEmployee where EmployeeNumber = '
set @param ='129'      --- try set @param ='129 or 1=1'       -- thats why do not use it to set parameters 
execute (@command + @param); --sql injection potential   -- such as hacker try   to enter data such as 129 or 1=1   then he will get  data about all the users 

go
declare @command as nvarchar(255), @param as nvarchar(50);
set @command = N'select * from tblEmployee where EmployeeNumber = @ProductID'
set @param =N'129'
execute sys.sp_executesql @statement = @command, @params = N'@ProductID int', @ProductID = @param; -- securing the sql accepting parameters  