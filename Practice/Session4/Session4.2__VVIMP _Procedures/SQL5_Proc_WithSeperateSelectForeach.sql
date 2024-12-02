--15. A different SELECT statement per employee
-- Worst case of usingn Procedure 

--if exists (select * from sys.procedures where name='NameEmployees')
if object_ID('NameEmployees','P') IS NOT NULL  -- P for procedure
drop proc NameEmployees
go
create proc NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int) as
begin
	if exists (Select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo)
	begin
		declare @EmployeeNumber int = @EmployeeNumberFrom
	while @EmployeeNumber <= @EmployeeNumberTo  --whle loop is used 
		BEGIN     -- while start
			if @EmployeeNumber=450
				continue  -- skips the part after that return to condition 
			if exists (Select * from tblEmployee where EmployeeNumber = @EmployeeNumber)
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName   -- executing select statement for each row  
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber

		
			if @EmployeeNumber=500 
				break  -- breaks the loop
		
			SET @EmployeeNumber = @EmployeeNumber + 1   -- incrementing  by 1 
	
		END  -- while end 
	end  -- if end 
end -- proc end
go

/*
label:
	Hello:select 'we jumped by using Goto'
goto Hello
*/
NameEmployees 4, 5
execute NameEmployees 223, 227
exec NameEmployees @EmployeeNumberFrom = 323, @EmployeeNumberTo = 1327   -- it will take a time of 1 second see on the right side down corner 
