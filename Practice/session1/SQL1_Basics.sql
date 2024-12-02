
use Practice;
-- Truncating it deletes all the existing rows in the specified table 
TRUNCATE TABLE dbo.Products;
-- Create tables 


CREATE TABLE dbo.Products
(ProductID int PRIMARY KEY NOT NULL,
ProductName varchar(26) NOT NULL UNIQUE, 
Price money NULL,
ProductDescription varchar(max)NULL);
GO

-- INSERTING VALUES 
INSERT INTO DBO.Products 
(ProductID ,ProductName,Price,ProductDescription) 
VALUES
(1,'colgate',NULL,'toothpaste');



INSERT INTO DBO.Products 
(ProductName,ProductID,Price,ProductDescription) 
VALUES
('Patanjali',2,100,'toothpaste');


INSERT INTO dbo.Products	VALUES (3,'detol',133,'handwash');

GO


-- UPDATE  statement is used to update the existing rows from the table 
UPDATE Products 
	SET ProductName ='doraemon' 
	where ProductID = 2
GO

-- select statement is used to retrieve the values from the data base 

SELECT * FROM Products;
GO
SELECT Products.ProductName,Products.ProductDescription,Products.Price,Products.ProductID from Products;
GO
SELECT Products.ProductName,Products.Price from Products;
GO
SELECT ProductName,Price*1.5 AS CAlculation 
FROM Products;
GO

-- using functions with select 
DECLARE @i INT;  
SET @i = -2147483647;  -- if the number is greater than INT limit 2147483647 then it throws the exception that number cannot be converted out pf limit 

SELECT ABS(@i);   -- mathe matical expression	
GO  
SELECT CEILING($123.45), CEILING($-123.45), CEILING($0.0);
GO


DECLARE @input1 FLOAT;  
DECLARE @input2 FLOAT;  
SET @input1= 2;  
SET @input2 = 2.5;  
SELECT POWER(@input1, 3) AS Result1, POWER(@input2, 3) AS Result2;


-- casting  results 
SELECT   
POWER(CAST(2.0 AS FLOAT), -100.0) AS FloatResult,  
POWER(2, -100.0) AS IntegerResult,  
POWER(CAST(2.0 AS INT), -100.0) AS IntegerResult,  
POWER(2.0, -100.0) AS Decimal1Result,  
POWER(2.00, -100.0) AS Decimal2Result,  
POWER(CAST(2.0 AS DECIMAL(5,2)), -100.0) AS Decimal2Result;  
GO

DECLARE @value INT, @counter INT;  
SET @value = 2;  
SET @counter = 1;  
  
WHILE @counter < 5  
   BEGIN  
      SELECT POWER(@value, @counter)   AS POWERS
      SET NOCOUNT ON  
      SET @counter = @counter + 1  
      SET NOCOUNT OFF  
   END;  
GO