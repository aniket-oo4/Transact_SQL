
--if exists (select * from sys.procedures where name='NameEmployees')
if exists ( select * from sys.procedures where procedures.name= 'NameEmployees')
	drop proc NameEmployees
	go
if object_ID('NameEmployees','P') IS NOT NULL
drop proc NameEmployees
go

create proc NameEmployees(@EmployeeNumber int) as
begin    -- procedure start
	if exists (Select * from tblEmployee where EmployeeNumber = @EmployeeNumber)   --outer if
	begin                --outer if
		if @EmployeeNumber < 300  -- inner if 
		begin
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber
		end                       --  -- inner if  end
		else                      --  inner else    empnumber>300
		begin
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName, Department
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber			
			select * from tblTransaction where EmployeeNumber = @EmployeeNumber
		end                       --inner else end
	end            --outer if end 
	Else   -- out else 
		Begin
		select 'Employee does not found ' as result 
		End     -- outer else end 
end       --- procedure end
go
NameEmployees 4
execute NameEmployees 223
exec NameEmployees 300
exec NameEmployees 324
