-- the name of function is case sensitive 

-- the functions is stored in 
-- Programmability -> Functions  
-- select * from sys.objects  where name ='NumberOfTransaction'  -- your can do this with all types of objects such as tablenames ,procedure names ,viw names etc 
-- if the function exists already then use
-- if exists( select * from sys.objects  where name ='NumberOfTransactions')
--		DROP FUNCTION numberOfTransaction
-- other way to delete is 
/*
 if Object_Id('numberOfTransaction','FN') is not null
		DROP FUNCTION numberOfTransaction

*/

-- the function which returns the numebr of transaction by accepting argument employee number
create function numberOFTransaction  (@employeeNumber int)
returns int 
Begin
 Declare @numberOfTransactions int 
 Select @numberOfTransactions=Count(*) from tblTransaction where EmployeeNumber=@employeeNumber
 return @numberOfTransactions
End 
go
-- using the UDF --- scalar

select *,dbo.numberOFTransaction(EmployeeNumber) as noOFTran
from tblEmployee  -- the name of function is case sensitive 
go
			-- function makesit faster where group by is slower 

select E.employeenumber,count(T.EmployeeNumber) as NOOfTran from tblEmployee E 
left join tblTransaction T
on E.EmployeeNumber=t.EmployeeNumber
group by E.EmployeeNumber

-- check the execution path of  both
