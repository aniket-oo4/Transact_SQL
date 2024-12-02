-- Multistatement table functions 
--Syntax ::
CREATE FUNCTION [dbo].[FunctionName]
(
    @param1 int,
    @param2 char(5)
)
RETURNS @returntable TABLE   -- creating table to return 
(
	[c1] int,
	[c2] char(5)
)
AS
BEGIN
    INSERT @returntable      -- the tablename where to insert the values 
    SELECT @param1, @param2   -- the column names  which are going to insert into above table 
    RETURN   -- it return the table which is created  @returntable 
END   
go


CREATE FUNCTION TransList(@employeenumber int)
RETURNS @TransList TABLE 
(
	amount smallmoney,
	dateOfTransaction smallDAteTime ,
	EmployeeNumber int 
)
AS
BEGIN
    INSERT into @TransList(amount,dateOfTransaction,EmployeeNumber)
    SELECT amount,dateOfTransaction,EmployeeNumber from tblTransaction  -- the column names  which are going to insert into above table 
	where EmployeeNumber=@employeenumber
    RETURN 
END

select * from dbo.transList(123)  -- multistatement table function

   select * from dbo.TransactionList( 123)  -- inline table function

   -- difference is we can add addition logic  in a Insert statement of multistatement function 
   -- to add  value as per different conditions 