select  emp.Department,count( *) as noOfEmployees,dpt.DepartmentHead as DptHead
from tblEmployee emp
join [tblDepartment] dpt
on emp.Department =dpt.Department
group by emp.Department ,dpt.DepartmentHead;


--joining three tables 
select * from 
tblDepartment
join 
tblEmployee
on tblDepartment.Department =tblEmployee.Department
join
tblTransaction 
on tblEmployee.EmployeeNumber=tblTransaction.EmployeeNumber
order by tblEmployee.EmployeeNumber
;

-- getting data of how many employees the department have and how much the total amount they made a transactions 

select tblDepartment.Department,DepartmentHead,COUNT(*) as noOfEmployees,sum(amount) as totalAmountOfDepartment from 
tblDepartment
join 
tblEmployee
on tblDepartment.Department =tblEmployee.Department
join
tblTransaction 
on tblEmployee.EmployeeNumber=tblTransaction.EmployeeNumber
group by tblDepartment.Department ,DepartmentHead
Go

-- selecting deparment whose having highest amount of transaction 

select top 1 tblDepartment.Department,DepartmentHead,COUNT(*) as noOfEmployees,sum(amount) as totalAmountOfDepartment from 
tblDepartment
join 
tblEmployee
on tblDepartment.Department =tblEmployee.Department
join
tblTransaction 
on tblEmployee.EmployeeNumber=tblTransaction.EmployeeNumber
group by tblDepartment.Department ,DepartmentHead
order by totalAmountOfDepartment desc
Go

-- only using two of table other one used as link  left joins 
select tblDepartment.Department ,DepartmentHead,sum(amount) as totalAmountOfDepartment 
from  tblDepartment
left join 
tblEmployee
on tblDepartment.Department =tblEmployee.Department
left join    -- one of the department does not have emloyees those also included 
tblTransaction 
on tblEmployee.EmployeeNumber=tblTransaction.EmployeeNumber
group by tblDepartment.Department ,DepartmentHead
order by Department

-- inserting new values into department 
Alter table tblDepartment 
Alter column DepartmentHead varchar(50) ;

insert into tblDepartment(Department,DepartmentHead)
values ('Accounts','james')
Go


-- selecting total  transaction amt of specific Department Head  left joins 
select DepartmentHead,sum(amount) as TotalAmount
from tblDepartment
left  join tblEmployee
on tblDepartment.Department = tblEmployee.Department
left join tblTransaction
on tblEmployee.EmployeeNumber=tblTransaction.EmployeeNumber
group by DepartmentHead  -- groups the employee details whose department head was etc etc 
order by DepartmentHead

-- selecting total  transaction  right joins 
select DepartmentHead,sum(amount) as TotalAmount
from tblDepartment
left  join tblEmployee
on tblDepartment.Department = tblEmployee.Department
right join tblTransaction  -- shows all transactions but not shows the dpt head whose does not having any transaction   
on tblEmployee.EmployeeNumber=tblTransaction.EmployeeNumber
group by DepartmentHead  -- groups the employee details whose department head was etc etc 
order by DepartmentHead

--use alias 
select DepartmentHead,sum(amount) as totalAmt  from 
tblDepartment As d
left  join tblEmployee E
on d.Department=E.Department
left join tblTransaction T
on E.EmployeeNumber=T.EmployeeNumber
group by DepartmentHead
order by DepartmentHead
