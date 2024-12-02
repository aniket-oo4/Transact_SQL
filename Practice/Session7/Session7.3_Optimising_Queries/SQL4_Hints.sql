--Hints
/*

1.NOLOCK 2.READUNCOMMITTED 3.UPDLOCK 4.REPEATABLEREAD 5.SERIALIZABLE 6.TABLOCK 7.TABLOCKX 
8.PAGLOCK 9.ROWLOCK 10.NOWAIT 11.READPAST 12.XLOCK 13.SNAPSHOT 14.NOEXPAND 15.FORCESEEK 16.FORCESCAN

*/
-- LOB = Large Object Blocks 

Set Statistics IO on
Set Statistics IO Off

Set  SHOWPLAN_ALL ON  -- SHOWPLAN_TEXT  SHOWPLAN_XML
Set  SHOWPLAN_ALL OFF
select D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName 
from [dbo].[tblDepartment] as D  WITH (NOLOCK)
left join [dbo].[tblEmployee] as E
on D.Department = E.Department
where D.Department = 'HR'
select D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName 
from [dbo].[tblDepartment] as D  WITH (REPEATABLEREAD)
left join [dbo].[tblEmployee] as E
on D.Department = E.Department
where D.Department = 'HR'
