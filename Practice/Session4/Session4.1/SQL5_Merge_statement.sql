--7. Let’s build our MERGE statement
-- merge statement merges(adds) the matching values of multiple table means adds the  all the matching value into one that had same   date ,column vakues 
-- it takes not matched rows as it is 
-- Source is one table
-- Target is targeted table 
-- we use conditions such as  -- condition  applies on each individual rows 
/*
When Matched  Then -- we can also add sub conditions also like
when Matched  And someOther condition Then   -- we can use and ,or, etc  
When Not matched by Target Then           
When not matched by Source and AnyOthersubconditions Then   
When not matched by Source Then            
When not matched by Source and AnyOther sub condition Then 
*/

/* Which  Operations allowed to performs in Which Case 

When Matched  Then        -- we can Do Update,Delete Operation  on targett ,source 
When Not matched by Target Then           -- we  Can Do Insert  on Target 
When not matched by Source Then         -- we can Do Update,Delete Operation on source targett  
*/


-- writing query to merge t
-- Source - tblTransactionNew
-- Target - tblTransaction

Select * from tblTransaction  --2495  ows 

Select * from tblTransactionNew  --1663 rows

BEGIN TRAN
MERGE INTO tblTransaction as T    -- Target 
USING tblTransactionNew as S   -- Source
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction   --specified columns  to Match  
WHEN MATCHED THEN    
    UPDATE SET Amount = T.Amount + S.Amount    -- added amount of both tables on same DOT
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Amount], [DateOfTransaction], [EmployeeNumber])   -- column names defined where to insert its compulsary
	VALUES (S.Amount, S.DateOfTransaction,  S.EmployeeNumber);  --  values   its compulsary
ROLLBACK TRAN   -- it throws error  becase one row of target will be update only once 
-- if there is having multiple source rows of same date and same empnumber then it throws error 

-- tblTransaction (no) - tblTransactionNew (yes)
-- 1 tblTransaction - 1 tblTransactionNew
-- 1 tblTransaction - multiple rows TblTransactionNew


--solving the privious error 
SELECT DateOfTransaction, EmployeeNumber, COUNT(*) AS NumberOfRows
FROM tblTransactionNew 
GROUP BY DateOfTransaction, EmployeeNumber
HAVING COUNT(*)>1
 -- it return the data which having multiple records on same date by same employee number  


BEGIN TRAN
go
--DISABLE TRIGGER TR_tblTransaction ON dbo.tblTransaction
GO
MERGE INTO tblTransaction as T
USING (SELECT DateOfTransaction, EmployeeNumber, MIN(Amount) as Amount
      FROM tblTransactionNew
	  GROUP BY DateOfTransaction, EmployeeNumber) as S   --alias here is compulsary 
ON T.EmployeeNumber = S.EmployeeNumber AND
	T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
    UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED THEN
	INSERT (Amount, DateOfTransaction, EmployeeNumber)
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber)
	OUTPUT  inserted.*,deleted.*;   -- to get which is inserted and which deleted 
ROLLBACK TRAN

select * from tblTransactionNew
order by EmployeeNumber
/*
Alter Table tblTransaction
Drop Constraint chkAmount
*/

-- ading additional column to get which is updated 

-- A MERGE statement must be terminated by a semi-colon (;).

--Alter table tblTransaction    -- DDL  not need semicolon strictly 
--Add Comments varchar(40)
BEGIN TRAN
MERGE INTO tblTransaction as T    -- merge is DML   it needs semicolon
USING (SELECT DateOfTransaction, EmployeeNumber, MIN(Amount) as Amount
      FROM tblTransactionNew
	  GROUP BY DateOfTransaction, EmployeeNumber) as S   --alias here is compulsary 
ON T.EmployeeNumber = S.EmployeeNumber AND
	T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
    UPDATE SET Amount = T.Amount + S.Amount,Comments='Updated Row'
WHEN NOT MATCHED by Target  THEN
	INSERT (Amount, DateOfTransaction, EmployeeNumber,Comments)
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber,'Inserted Row')
 When Not Matched by Source Then 
	 UPDATE SET Comments='Unchanged Notmatched  Row';
	--OUTPUT  inserted.*,deleted.*;   -- to get which is inserted and which deleted 
	select * from tblTransaction
ROLLBACK TRAN
ALTER TABLE  tblTransaction
drop column Comments


--------------------------------------------
BEGIN TRAN
ALTER TABLE tblTransaction
ADD Comments varchar(50) NULL
GO -- DDL
MERGE TOP (5) PERCENT INTO tblTransaction as T --DML   -- Percent is property automatically calculates the top 5% rows count 
USING (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransactionNew
group by EmployeeNumber, DateOfTransaction) as S
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction-- complsary
WHEN MATCHED AND T.Amount + S.Amount >0 THEN
    UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updated Row'
WHEN MATCHED THEN
	DELETE  -- checks the previous condition is true or false if false then it delete the row 
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Amount], [DateOfTransaction], [EmployeeNumber], Comments)
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted Row')
WHEN NOT MATCHED BY SOURCE THEN
	UPDATE SET Comments = 'Unchanged'
OUTPUT inserted.*, deleted.* , $action;
--Select * from tblTransaction ORDER BY EmployeeNumber, DateOfTransaction
ROLLBACK TRAN