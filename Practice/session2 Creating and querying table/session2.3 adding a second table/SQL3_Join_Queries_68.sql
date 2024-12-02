use [Practice]

select  EmployeeNumber ,sum(amount) as TotalAmount
from tblTransaction
group by EmployeeNumber


-- writing our first join query 
select * from
tblEmployee emp
join tblTransaction tcn
on emp.EmployeeNumber =tcn.EmployeeNumber
--inner join bydefault

select  (EmployeeFirstName+ EmployeeMiddleName+EmployeeLastName) as name1,
 tblTransaction.EmployeeNumber,
sum(amount) as totalAmt -- sum(amount) is aggregate function that works n summarised data and it return only one value it works on group by clause on specific groups
from tblEmployee
join tblTransaction 
on tblEmployee.EmployeeNumber=tblTransaction.EmployeeNumber
group by tblTransaction.EmployeeNumber ,(EmployeeFirstName+EmployeeMiddleName+EmployeeLastName)
order by tblTransaction.EmployeeNumber

---
--Left join 
select    tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeMiddleName,EmployeeLastName ,
sum(amount) as totalAmt
from tblEmployee
 left join tblTransaction 
on tblEmployee.EmployeeNumber=tblTransaction.EmployeeNumber
group by tblEmployee.EmployeeNumber ,EmployeeFirstName, EmployeeMiddleName, EmployeeLastName
order by EmployeeNumber

-- right join 
select    tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeMiddleName,EmployeeLastName ,
sum(amount) as totalAmt,count(amount) as NoOfTransactions
from tblEmployee
 right  join tblTransaction 
on tblEmployee.EmployeeNumber=tblTransaction.EmployeeNumber
group by tblEmployee.EmployeeNumber ,EmployeeFirstName, EmployeeMiddleName, EmployeeLastName
order by NoOfTransactions desc


select * from tblEmployee;

-- cross join   each employee * each transaction
select    tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeMiddleName,EmployeeLastName ,
sum(amount) as totalAmt,count(Amount) as noOfTransactions  -- each employee having same transactions 2500
from tblEmployee
 cross  join tblTransaction 
 group by tblEmployee.EmployeeNumber ,EmployeeFirstName, EmployeeMiddleName, EmployeeLastName
order by EmployeeNumber
