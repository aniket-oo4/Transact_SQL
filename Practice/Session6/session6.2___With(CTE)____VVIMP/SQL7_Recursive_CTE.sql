-- CTE  Common Table Expression 
-- Recursive CTE 
--

begin tran
alter table tblEmployee
add Manager int
go
update tblEmployee
set Manager = ((EmployeeNumber-123)/10)+123
where EmployeeNumber>123;
with myTable As 
(  
select EmployeeNumber,EmployeeFirstName,EmployeeLastName,0 as BossLevel from tblEmployee where manager is null
union all
select E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName,myTable.BossLevel+1
from tblEmployee as E
join myTable on E.manager=myTable.EmployeeNumber
)

select * from myTable

rollback tran   --- recursive CTE
