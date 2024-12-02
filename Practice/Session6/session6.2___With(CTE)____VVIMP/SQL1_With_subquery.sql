--11. With Statement
-- whenever we use the derived table in from clause then we can use it only  there in a whole query 
-- whenever we want to use derived table we cannot use it with its alias only 
-- every time we need to create new derived table there
--With statement gives ability to reuse the select statement multiple times within the outr select query 

with tblWithRanking as  -- it creates the alias for the sub query it must be executed all the select statements in once 
(select D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
       rank() over(partition by D.Department order by E.EmployeeNumber) as TheRank
 from tblDepartment as D 
 join tblEmployee as E on D.Department = E.Department )
 ---- first
select * from tblWithRanking 
where TheRank <= 5
order by Department, EmployeeNumber

with tblWithRanking as -- creating multiple aliases for multiple subqueires 
(select D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
       rank() over(partition by D.Department order by E.EmployeeNumber) as TheRank
 from tblDepartment as D 
 join tblEmployee as E on D.Department = E.Department),
Transaction2014 as
(select * from tblTransaction where DateOfTransaction < '2015-01-01')

select * from tblWithRanking 
left join Transaction2014 on tblWithRanking.EmployeeNumber = Transaction2014.EmployeeNumber
where TheRank <= 5
order by Department, tblWithRanking.EmployeeNumber
