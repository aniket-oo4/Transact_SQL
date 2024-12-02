select * from tblEmployee
	where DateOfBirth between '19760101' and '19880101'   --selects the employees whose having birth dates between these dates 
Go

select * from tblEmployee
	where DateOfBirth >='19760101' and DateOfBirth< '19880101'   --selects the employees whose having birth dates between these dates 
Go


---

-- group by 

select year(DateOfBirth) as yearOfbirth from tblEmployee  -- selects only years 
Go

select year(DateOfBirth) as yearOfbirth ,count(*) As numberof_emp_Borned -- count(*) counts all the number ofemployees iit aggregate function
 from tblEmployee 
 Group by year(DateofBirth)    --this groups all the employees having same year of birth into this specific group of year then returns count of each year 
Go

select count(*) from tblEmployee 
where year(DateOfBirth) =1990 ;  -- to confirm the result of previous query number of emp born in 1990 is 41 

select year(DateOfBirth) as yearOfbirth ,count(*) As numberof_emp_Borned -- count(*) counts all the number ofemployees iit aggregate function
 from tblEmployee 
 where EmployeeFirstName Like '%a'
 Group by year(DateofBirth)   
Go   -- non deterministic because it gives different order in case of large data base 


select year(DateOfBirth) as yearOfbirth ,count(*) As numberof_emp_Borned -- count(*) counts all the number ofemployees iit aggregate function
 from tblEmployee 
 Group by year(DateofBirth)    
 order by  year(DateofBirth)  
 Go   -- deterministic  because we ordered it ascending y using order by clause 


 select year(DateOfBirth) as yearOfbirth ,count(*) As numberof_emp_Borned 
 from tblEmployee 
 Group by year(DateofBirth)    
 order by  year(DateofBirth)   desc
 Go   -- deterministic  because we ordered it descending y using order by clause 

 select EmployeeFirstName,count(*) from tblEmployee   -- selecting employee names and the number of employees having this name
 group by EmployeeFirstName;   
Go


-- order by 
select employeeFirstname,EmployeeNumber from tblEmployee
order by EmployeeFirstName asc,EmployeeNumber desc
Go

select EmployeeFirstname,count(*) as numOfEmp from tblEmployee
group by EmployeeFirstName
order by numOfEmp asc  ,EmployeeFirstName desc
Go