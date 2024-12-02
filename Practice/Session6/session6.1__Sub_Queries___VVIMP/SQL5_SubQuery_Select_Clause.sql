--8. Subquery – Select Clause
-- subquery in  Select Clause is also called as Correlated ssubquery 


Select *, (select count(EmployeeNumber)
           from tblTransaction as T
		   where T.EmployeeNumber = E.EmployeeNumber) as NumTransactions,   --itd a inner query dependent on outer because of Comparison in where clause it takes the Employeenumber from Outer query 
		  --- we cannot return the two columns when subquery used  in select statement
		  (Select sum(Amount)
		   from tblTransaction as T
		   where T.EmployeeNumber = E.EmployeeNumber) as TotalAmount
from tblEmployee as E
Where E.EmployeeLastName like 'y%' --correlated subquery


Select *, (select T.DateOfTransaction   -- subquery only returns single value it gives error  ::that why use subquery in select statement only for aggregate functions such as : count ,sum, average ,min ,max, etc 
--Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
           from tblTransaction as T
		   where T.EmployeeNumber = E.EmployeeNumber) as NumTransactions,   --itd a inner query dependent on outer because of Comparison in where clause it takes the Employeenumber from Outer query 
		  (Select sum(Amount)
		   from tblTransaction as T
		   where T.EmployeeNumber = E.EmployeeNumber) as TotalAmount
from tblEmployee as E
Where E.EmployeeLastName like 'y%' --correlated subquery





--Remainder
select * 
from tblTransaction as T
Where exists          -- where   is just like the inner join it checks the second tbl that match with its condition or not 
    (Select EmployeeNumber from tblEmployee as E where EmployeeLastName like 'y%' and T.EmployeeNumber = E.EmployeeNumber)
order by EmployeeNumber

select * 
from tblTransaction as T
Where not exists    -- it just like outer join which gives all the  unmatched ones 
    (Select EmployeeNumber from tblEmployee as E where EmployeeLastName like 'y%'
	and T.EmployeeNumber = E.EmployeeNumber)  -- here and works as a join to outer query
order by EmployeeNumber