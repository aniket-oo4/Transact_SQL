--Evaluate the use of row-based operations vs. set-based operations
/*
Syntax:
	Declare cursor	CUROSOR FOR SELECT statement FROM TABLE
	OPEN cursor
	FETCH cursor INTO 
	CLOSE cursor

	@@FETCH_STATUS

	Do not use cursor ecause it is slow 
*/	

--When to use cursors
declare @EmployeeID int
declare csr CURSOR FOR 
select EmployeeNumber--
from [dbo].[tblEmployee]
where EmployeeNumber between 120 and 299-- its a set based query it gives all the inot in single table  

open csr
fetch next from csr into @EmployeeID
while @@FETCH_STATUS = 0
begin
	select * from [dbo].[tblTransaction] where EmployeeNumber = @EmployeeID
	fetch next from csr into @EmployeeID  -- its row based query because it gives dfferent table for each row 
end
close csr
deallocate csr