--7. Subqueries in the FROM clause
-- subquery in the from clause is also called as Derived table
-- the alias is mandatory  for subqueries in from clause 
select * 
from tblTransaction as T
left join (select * from tblEmployee  -- do with inner,right also
where EmployeeLastName like 'y%') as E  -- it is must to create alias for derived table
on E.EmployeeNumber = T.EmployeeNumber
order by T.EmployeeNumber

select * 
from tblTransaction as T
left join tblEmployee as E
on E.EmployeeNumber = T.EmployeeNumber
Where E.EmployeeLastName like 'y%'
order by T.EmployeeNumber


-- and can be also used in join section 
select * 
from tblTransaction as T
left join tblEmployee as E
on E.EmployeeNumber = T.EmployeeNumber  and E.EmployeeLastName like 'y%'  --we can also add the condition while join on  
order by T.EmployeeNumber

