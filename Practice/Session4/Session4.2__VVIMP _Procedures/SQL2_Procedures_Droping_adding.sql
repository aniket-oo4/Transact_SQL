---12. Ask for a specific employee

-- drop the procedure   if exists  like we dropped views 

if exists (select * from sys.procedures where name='NameEmployees')
if object_ID('NameEmployees','P') IS NOT NULL   -- other way to check  exist or not procedure 2nd arg is P for procedure s
drop proc NameEmployees
go
create proc NameEmployees(@EmployeeNumber int) 
as        -- the procedure which returns the  row who having specific emp number 
begin
	if exists (Select * from tblEmployee where EmployeeNumber = @EmployeeNumber)
	begin
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName
		from tblEmployee
		where EmployeeNumber = @EmployeeNumber
	
	end-- we use begin and end as {} en c#  but here it is not compulsary 
	else Select 'Employee not exist' as Result
end
go
NameEmployees 4   -- does not exists hence it will skip the select statement  exucutes else case 
execute NameEmployees 223   -- return the  data  whose Employee number is 223
exec NameEmployees 323     -- return the  data  whose Employee number is 323
select EmployeeNumber from NameEmployees  -- we cannot use procedures as follows 

DECLARE @EmployeeName int = 123
select @EmployeeName