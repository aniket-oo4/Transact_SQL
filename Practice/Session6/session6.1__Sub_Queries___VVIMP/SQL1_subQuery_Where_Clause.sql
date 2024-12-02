--4. Subquery – WHERE
select * from tblTransaction;
select * from tblEmployee;


select T.* 
from tblTransaction as T
inner join tblEmployee as E   -- inner join only gives common values 
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeLastName like 'y%'
order by T.EmployeeNumber
 

--- we can do that using sub queries with where clause and in operator 
select * 
from tblTransaction as T
Where EmployeeNumber in
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber