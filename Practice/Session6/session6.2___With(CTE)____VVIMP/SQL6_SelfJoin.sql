
-- the employees having workflow they have managers themanager isalso a employee hence 
-- wee need the self join in this case 

begin tran 

alter table tblEmployee
add manager int
go

update tblEmployee
set manager=((EmployeeNumber-123)/10)+123
where EmployeeNumber >123
--select EmployeeNumber,EmployeeFirstName,EmployeeLastName,manager  from tblEmployee


select  E.EmployeeNumber,E.EmployeeFirstName,E.manager ,
M.EmployeeNumber,M.EmployeeFirstName,M.manager
from tblEmployee E
join  tblEmployee M
on E.Manager=M.EmployeeNumber
 

rollback tran 

---------------------------------------------------------------
begin tran 

alter table tblEmployee
add manager int
go

update tblEmployee
set manager=((EmployeeNumber-123)/10)+123
where EmployeeNumber >123
--select EmployeeNumber,EmployeeFirstName,EmployeeLastName,manager  from tblEmployee


select  E.EmployeeNumber,E.EmployeeFirstName,E.manager ,
M.EmployeeNumber,M.EmployeeFirstName,M.manager
from tblEmployee E
left join  tblEmployee M
on E.Manager=M.EmployeeNumber
 

rollback tran


---17. Self Joins
begin tran
alter table tblEmployee
add Manager int
go
update tblEmployee
set Manager = ((EmployeeNumber-123)/10)+123
where EmployeeNumber>123
select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName,
       M.EmployeeNumber as ManagerNumber, M.EmployeeFirstName as ManagerFirstName, 
	   M.EmployeeLastName as ManagerLastName
from tblEmployee as E
left JOIN tblEmployee as M
on E.Manager = M.EmployeeNumber

rollback tran

