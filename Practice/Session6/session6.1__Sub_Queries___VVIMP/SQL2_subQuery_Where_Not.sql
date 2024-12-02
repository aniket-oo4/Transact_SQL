--5. Subquery – WHERE and NOT
select * 
from tblTransaction as T
Where EmployeeNumber in
    (Select EmployeeNumber from tblEmployee where EmployeeLastName  like 'y%')
order by EmployeeNumber -- These are the rows from 126 to 129 


--  the following  queriesonly gives the data which is not like lastname 'y%'
select T.* 
from tblTransaction as T
inner join tblEmployee as E   -- inner join only gives common values 
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeLastName  not like  'y%'
order by T.EmployeeNumber



--   witout join using  sub queires Where  clause and not in   operator 
select * 
from tblTransaction as T
Where EmployeeNumber not in
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber -- must be in tblTransaction, and not 126-129
                        -- LEFT JOIN   left join gives all the values of tbl1 and matching of tbl2

--  above query returns all the employee data except the employees whose last names starts with 'y'


select * 
from tbltransaction where  EmployeeNumber in 
(select EmployeeNumber from tblEmployee where  EmployeeLastName not like 'y%')
order by EmployeeNumber   -- it does inner join  only give matching values