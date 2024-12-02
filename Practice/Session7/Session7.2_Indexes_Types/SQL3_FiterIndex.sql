--Filtered indices


CREATE NONCLUSTERED INDEX idx_tblEmployee_Employee  
 ON dbo.tblEmployee(EmployeeNumber) where EmployeeNumber<139; -- filtering the index 


--INCLUDE  -- include allows us to add extra  columns to index 
CREATE NONCLUSTERED INDEX idx_tblEmployee_Employee  
    ON dbo.tblEmployee(EmployeeNumber) include (EmployeeFirstName);

DROP INDEX idx_tblEmployee_Employee ON dbo.tblEmployee