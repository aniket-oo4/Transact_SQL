-- insert snippet 
-- functions  can e alterable as alter function function name 

-- creating inline Table Functions  Syntax 
/*
CREATE FUNCTION [dbo].[FunctionName]
(
    @param1 int,
    @param2 char(5)
)
RETURNS TABLE AS RETURN
(
    SELECT @param1 AS c1,
	       @param2 AS c2
)
go

*/
CREATE FUNCTION TransactionList (@EmployeeNumber int)

RETURNS TABLE AS RETURN
(
    SELECT * from tblTransaction where EmployeeNumber=@EmployeeNumber
)

   -- calling inline Table function  dbo. is must 
   select * from dbo.TransactionList( 123)


  -- getting only those data who hav atleast one transaction 
select * from tblEmployee
where exists(   select * from dbo.TransactionList( EmployeeNumber))  -- where clause check rows one by one and check all the rows 
