
-- creating user defned functions   UDF
--syntax  -- right click then go insert snippets then functions   choose scalar


CREATE FUNCTION AmountPlusOne  -- created scalar function returns only one value back 
(
    @amount smallmoney  -- matching with our column type 
)
RETURNS smallmoney 
AS
BEGIN

    RETURN @amount + 1

END

select DateOfTransaction, EmployeeNumber, Amount, dbo.AmountPlusOne(Amount) as AmountAndOne
from tblTransaction---------------------------- always use dbo.FunctionName  --it differentiates builtin functions with user defined functions 

-- we can also use these functions as 
DECLARE @myValue smallmoney
EXEC @myValue = dbo.AmountPlusOne 345.67
--EXEC @myValue = dbo.AmountPlusOne @Amount = 345.67
select @myValue


--Modular programming. You can create the function once, store it in the database, and call it any number of times in your program. User-defined functions can be modified independently of the program source code.

--Faster execution. Similar to stored procedures, Transact-SQL user-defined functions reduce the compilation cost of Transact-SQL code by caching the plans and reusing them for repeated executions. This means the user-defined function doesn't need to be reparsed and reoptimized with each use resulting in much faster execution times.

--Reduce network traffic. An operation that filters data based on some complex constraint that can't be expressed in a single scalar expression can be expressed as a function. The function can then be invoked in the WHERE clause to reduce the number of rows sent to the client.