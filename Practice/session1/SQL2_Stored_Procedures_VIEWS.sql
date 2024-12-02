-- Creating views and stored procedures 
/*A view is a stored SELECT statement, and a stored procedure
is one or more Transact-SQL statements that execute as a batch.
*/


use Practice;-- to use the table products

CREATE VIEW vw_Names  -- Views are queried like tables and don't accept parameters
	AS
	SELECT ProductName,Price FROM Products;
GO

SELECT * FROM  vw_Names;
GO


-- creating stored procedures 
CREATE PROCEDURE pr_Names @VarPrice money
   AS
   BEGIN
      -- The print statement returns text to the user
      PRINT 'Products less than ' + CAST(@VarPrice AS varchar(10));
      -- A second statement starts here
      SELECT ProductName, Price FROM vw_Names
            WHERE Price < @VarPrice;
   END
GO


--test the procedure 

EXECUTE pr_Names 1000.00;  -- this method  accepts the price for comparison than and return the results which price is less than parameter passed 
GO