--14. Ask for a range of employees
--if exists (select * from sys.procedures where name='NameEmployees')
if object_ID('NameEmployees','P') IS NOT NULL
drop proc NameEmployees
go
create proc NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int) as
begin
	if exists (Select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo)
	begin
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName
		from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
	end
end
go
NameEmployees 4, 5   -- not mention else query hence does not affect anything if there is no such renge 
execute NameEmployees 223, 227    -- return the rows from this mentioned rows 
exec NameEmployees @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327

-- procedure relace multiple select statement into one  procedure 