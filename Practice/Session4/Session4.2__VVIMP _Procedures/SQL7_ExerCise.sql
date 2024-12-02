select count(*) as count1 , sum(Amount)as  total ,sum(Amount)/count(*) as Average from tblTransaction 
where Amount is not null

select count(distinct  EmployeeNumber) from tblTransaction
where EmployeeNumber between 3 and 11
go 

if object_ID('NameEmployees','P') IS NOT NULL
drop proc AverageBalance
go
create Proc AverageBalance @empnumber int as 
	begin 
	select  top (3) sum(amount)/count(EmployeeNumber) as average from tblTransaction where EmployeeNumber=@empnumber
	end
Exec AverageBalance 3 
select top (3) * from tblTransaction where EmployeeNumber=3;