select E.EmployeeNumber ,E.EmployeeFirstName,E.EmployeeLastName,T.EmployeeNumber Tnum,
sum(T.amount) as TotalAmount
from tblEmployee E
left join
tblTransaction T
on E.EmployeeNumber=T.EmployeeNumber
group by 
E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName,T.EmployeeNumber
order by
E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName,T.EmployeeNumber

-- finding the employees whose dont having any transaction 
-- by using where clause
select E.EmployeeNumber ,E.EmployeeFirstName,E.EmployeeLastName,T.EmployeeNumber Tnum,
sum(T.amount) as TotalAmount
from tblEmployee E
left join
tblTransaction T
on E.EmployeeNumber=T.EmployeeNumber
where T.EmployeeNumber Is Null 
group by 
E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName,T.EmployeeNumber
order by
E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName,T.EmployeeNumber



--  getting  derived table  of all those employees who does not have any transaction yet 

select * from 

( select E.EmployeeNumber as ENumber,E.EmployeeFirstName,E.EmployeeLastName ,
T.EmployeeNumber as TNumber,sum(t.Amount) as TotalAmount
from tblEmployee as E
left join tblTransaction T 
on T.EmployeeNumber=E.EmployeeNumber
group by E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName ,T.EmployeeNumber 
) As newTable

where TNumber Is Null 
order by TNumber,EmployeeFirstName,EmployeeLastName


-- getting all the transactions whose does not have any employee  they are misclenious transactions 
select * from
( select E.EmployeeNumber as ENumber,E.EmployeeFirstName,E.EmployeeLastName ,
T.EmployeeNumber as TNumber,sum(t.Amount) as TotalAmount
from tblEmployee as E
right join tblTransaction T 
on T.EmployeeNumber=E.EmployeeNumber
group by E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName ,T.EmployeeNumber 
) As newTable
where ENumber Is Null 
order by TNumber,EmployeeFirstName,EmployeeLastName

begin tran
--- using into forcreating new table 
select distinct D.Department,D.DepartmentHead ,count(*) as totalEmp
into tblNew
from 
(
tblEmployee E
left join 
tblDepartment D
on E.Department=D.Department
) 
group by D.Department,DepartmentHead

select * from tblNew

rollback tran   -- emove begin and remove transaction block to create directly new table 


