--16. Returning values
--if exists (select * from sys.procedures where name='NameEmployees')
if object_ID('NameEmployees','P') IS NOT NULL
drop proc NameEmployees
go

-- when we want to return a value from the  procedure then we add the extra parameter  DataType and Keyword Output after that parameter 

-- we need to add Out / output near the parameter of procedure 
-- and also  while calling that procedure at the end of Exec statement 

create proc NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int, @NumberOfRows int OUTPUT) as
--  @Var DAtaType output is the Return value with its data type
begin
	if exists (Select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo)
	begin
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName
		from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		SET @NumberOfRows = @@ROWCOUNT  -- returns current Rownumber 
		RETURN 0   -- all procedures return the numeric value  0 represent Succes 1 - Failure 
	end
--end--
--Go--
  -- use belowpart to handle the condition if argument renge is not  exists 
	ELSE
	BEGIN
	    SET @NumberOfRows = 0
		RETURN 1
	END
end
go


-- we need to store the return value in integer type variabel 
-- Declare @MyVar int = Procedurename parameters   -- = is assignment operator 

Declare @NumberOfRows int
 exec NameEmployees 223,327,@NumberOfRows Output -- return the  output  into this variable  it like out parameter in c# 
 select @NumberOfRows as ReturnFromProc   
 go  

DECLARE @NumberRows int, @ReturnStatus int
EXEC @ReturnStatus = NameEmployees 4, 5, @NumberRows OUTPUT      -- output is null becase the several mentioned renge is not available 
select @NumberRows as MyRowCount, @ReturnStatus as Return_Status   
GO

DECLARE @NumberRows int, @ReturnStatus int
execute @ReturnStatus = NameEmployees 4, 327, @NumberRows OUTPUT
select @NumberRows as MyRowCount, @ReturnStatus as Return_Status
GO

DECLARE @NumberRows int, @ReturnStatus int
exec @ReturnStatus = NameEmployees @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327, @NumberOfRows = @NumberRows OUTPUT
select @NumberRows as MyRowCount, @ReturnStatus as Return_Status