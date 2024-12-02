--10. Top X from various categories
  --rank() is a one of the window function 
  -- use top 70 percent columnname or *  to get the  top that much percent data from tbl 
select * from
(select D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
       rank() over(  partition by D.Department order by E.EmployeeNumber) as TheRank
 from tblDepartment as D 
 join tblEmployee as E on D.Department = E.Department) as MyTable
where TheRank <= 5
order by Department, EmployeeNumber

select  top 100 percent * from
(select D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
       rank() over(  partition by D.Department order by E.EmployeeNumber) as TheRank
 from tblDepartment as D 
 join tblEmployee as E on D.Department = E.Department) as MyTable
where TheRank <= 5
order by Department, EmployeeNumber


--execution path of over ()
 -- rank() over(  partition by D.Department order by E.EmployeeNumber) as TheRank
  -- Over takes total rows to calculate the rank of that current row
 --order by employee number
 --then group it according to departments
 --calculate rank() accorging to this department for each row 
 --like we have separate tables for separate departments then we just order by and rank it 



