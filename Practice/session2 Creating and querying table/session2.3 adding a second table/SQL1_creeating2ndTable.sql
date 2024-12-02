create table tblTransaction 
(Amount smallmoney not null,
DateOfTransaction smalldatetime null,
EmployeeNumber int not null )
Go

	select min(EmployeeNumber) from [tblEmployee];  -- it gives min
	select max(EmployeeNumber) from tblEmployee;  -- it gives maxi

	select year(DateOfBirth), max(EmployeeNumber) ,min(EmployeeNumber)from tblEmployee
	group by year(DateOfBirth);

/*
	select * from tblEmployee where EmployeeNumber between 121 and 125;
	update tblEmployee set EmployeeNumber=121
	where EmployeeGovernmentID like '%d6';

	*