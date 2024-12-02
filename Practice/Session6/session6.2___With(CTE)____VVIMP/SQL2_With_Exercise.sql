--12. Exercise 1


-- select the emplooyee numbers who are not attempted any tranasaction from tblEmployee 
select EmployeeNumber from tblEmployee 
where EmployeeNumber not in(select EmployeeNumber from tblTransaction) order by EmployeeNumber


-- same can also performed as following this is trainers solution 
select E.EmployeeNumber from tblEmployee as E 
left join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber IS NULL
order by E.EmployeeNumber

select max(EmployeeNumber) from tblTransaction;

with Numbers as (
select top(select max(EmployeeNumber) from tblTransaction) row_Number() over(order by (select null)) as RowNumber
from tblTransaction as U)

select U.RowNumber from Numbers as U
left join tblTransaction as T
on U.RowNumber = T.EmployeeNumber
where T.EmployeeNumber is null
order by U.RowNumber

select row_number() over(order by(select null)) from sys.objects O cross join sys.objects P

-- select the emplooyee numbers who are  attemptedtranasaction but not found in  tblEmployee 

select  distinct T.EmployeeNumber ,ROW_NUMBER() over( order by T.EmployeeNumber ) as Rownum from tblTransaction T
   where T.EmployeeNumber not in (Select EmployeeNumber from tblEmployee) order by T.EmployeeNumber

select  * from tblTransaction order by EmployeeNumber

