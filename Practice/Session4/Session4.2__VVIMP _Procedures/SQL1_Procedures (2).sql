/* syntax 
Declaration 
create proc   ProcedureName (parameterName datatype ) As
Begin 
	statements
	statements
End
Go

calling  3 types of calling 
ProcedureName (arguments)
execute ProcedureName (arguments)
exec ProcedureName (arguments)

C# statement ExecuteQuery( Exec ProcedureNAme)   ----> SQL Server ✅ 
C# statement ExecuteQuery( "select Something From something etc")   ----> SQL Server ❎
*/


create proc NameEmployees as
begin
	select EmployeeNumber, EmployeeFirstName, EmployeeLastName
	from tblEmployee
end
go
NameEmployees
execute NameEmployees
exec NameEmployees
/*

C# statement ExecuteQuery( Exec ProcedureNAme)   ----> SQL Server ✅ 
C# statement ExecuteQuery( "select Something From something etc")   ----> SQL Server ❎
other option is 
and other option is View and  just call the view 
------------------
C# statement ExecuteQuery(  Select viewName)   ----> SQL Server ✅ 
Remember that You are going to create many stored procedures because 
when your are communicating  to the  Data Base  
using C# 
you will be not going to Wrire To much complex queries 
in the c# Itself 
we just create the Stored Procedure that performs the action then return the value we needed 


*/

