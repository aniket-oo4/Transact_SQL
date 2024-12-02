--22. Apply
SELECT * 
from dbo.TransList(123)
GO
 -- count the number of transactions per employee
select *, (select count(*) from dbo.TransList(E.EmployeeNumber)) as NumTransactions
from tblEmployee as E


-- you
select *
from tblEmployee as E
left join TransList(E.EmployeeNumber) as T
on E.EmployeeNumber=T.EmployeeNumber  -- you cannot join a table with the result of the function 

-- thats why the concepte intrduced apply 
-- there are two types -- outer apply | cross apply
select *
from tblEmployee as E
outer apply TransList(E.EmployeeNumber) as T   --its like left joinn return all that does not have match 

select *
from tblEmployee as E
cross apply TransList(E.EmployeeNumber) as T  --only return matched one means that have inner join

--123 left join TransList(123)
--124 left join TransList(124)

--outer apply all of tblEmployee, UDF 0+ rows
--cross apply UDF 1+ rows

--outer apply = LEFT JOIN
--cross apply = INNER JOIN

select *
from tblEmployee as E
where  (select count(*) from dbo.TransList(E.EmployeeNumber)) >3
-- the employees who did more than 3 transactions 