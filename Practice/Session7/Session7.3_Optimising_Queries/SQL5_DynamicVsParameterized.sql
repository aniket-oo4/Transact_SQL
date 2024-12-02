--dynamic vs. parameterised queries

-- Dynamic Queries 
DECLARE @param varchar(1000) = '127';  --'127 or 1=1'  -- sql injection

DECLARE @sql nvarchar(max) =
    N'
    SELECT *
    FROM [dbo].[tblTransaction] AS T
    WHERE T.EmployeeNumber = ' + @param;

EXECUTE (@sql);  -- EXECUTE ('query')-- t executes the sql query 


DECLARE @parameter varchar(1000) = '127' + char(10) + 'SELECT * from dbo.tblTransaction';

DECLARE @sql nvarchar(max) =
    N'
    SELECT *
    FROM [dbo].[tblTransaction] AS T
    WHERE T.EmployeeNumber = ' + @parameter;

EXECUTE (@sql);

-- parameterized Queries 

--DECLARE @param varchar(1000) = '127' + char(10) + 'SELECT * from dbo.tblTransaction';
--Conversion failed when converting the varchar value '127
--SELECT * from dbo.tblTransaction' to data type int
DECLARE @param varchar(1000) = '127';
EXECUTE sys.sp_executesql
    @statement = 
        N'
        SELECT *
        FROM [dbo].[tblTransaction] AS T
    WHERE T.EmployeeNumber = @EmployeeNumber;',
    @params = N'@EmployeeNumber varchar(1000)',
    @EmployeeNumber = @param;
