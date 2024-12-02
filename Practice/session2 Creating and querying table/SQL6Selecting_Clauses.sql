select left(EmployeeLastName,1)  as InitialChar from
tblEmployee
Go

select employeeFirstname from tblEmployee
where left(EmployeeFirstName,2)='ad';  -- starts with 'ad'
select employeeFirstname from tblEmployee
where right(EmployeeFirstName,2)='ad';  -- ends  with 'ad'


select left(EmployeeLastName,1)  as InitialChar ,count(*) as noOfEmp_startswith from
tblEmployee
group by left(EmployeeLastName,1) 
order by left(EmployeeLastName,1) 
Go

select left(EmployeeLastName,1)  as InitialChar ,count(*) as noOfEmp_startswith from
tblEmployee
group by left(EmployeeLastName,1) 
order by count(*) desc
Go

select top(5) left(EmployeeLastName,1)  as InitialChar ,count(*) as noOfEmp_atartswith from
tblEmployee
group by left(EmployeeLastName,1) 
order by count(*) desc
Go

-- having clause

select left(EmployeeLastName,1)  as InitialChar ,count(*) as noOfEmp_atartswith from
tblEmployee
group by left(EmployeeLastName,1)
having COUNT(*) <50 --- having clase applies the condition on groupby data aka summarised data 
order by count(*) desc
Go

select left(EmployeeLastName,1)  as InitialChar ,count(*) as noOfEmp_atartswith from
tblEmployee
where DateOfBirth >'19860101'
group by left(EmployeeLastName,1)
having COUNT(*) >=20
order by count(*) desc
Go
--
select left(EmployeeLastName,1)  as InitialChar ,count(*) as noOfEmp_startswith from
tblEmployee
where left(EmployeeLastName,1) ='a'
group by left(EmployeeLastName,1)
--having COUNT(*) >=20
--order by count(*) desc
Go

/*
Update tblEmployee
Set EmployeeMiddleName = NULL
Where EmployeeMiddleName = ''

*/
