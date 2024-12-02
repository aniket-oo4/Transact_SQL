
--


-- count of employees of specific deparment 

select department ,count(*) as noOfEmployees
from tblEmployee
group by Department

-- using derived table 
select department from 
(
select department ,count(*) as noOfEmployees
from tblEmployee 
group by Department)  as newTable -- derived table as  newTblename was compulsary for creatig derived table  

select count( department) as numOfDPT from 
(
select department ,count(*) as noOfEmployess
from tblEmployee 
group by Department)  as newTable -- derived table 



            -- we can get this also as s
  select distinct department from tblEmployee;
    select  count(distinct department) as numOfDpt from tblEmployee;
--

-----------------------------
select distinct department,[EmployeeGovernmentID] from tblEmployee;  --- the row is distinct because government id's are different for each row 

select distinct department ,' ' as dptHead from [tblEmployee];


--- creating new table using into statement   with select 
  --  drop table tblDepartment;  -- delete table is exist 

select distinct Department ,N' ' as DepartmentHead  --added N' ' for  converting datatype from varchar to nvarchar    or use alter table alter column
into tblDepartment    -- into is used for creating new table  
from [tblEmployee];

select * from tblDepartment;




/*  not used we created table by using existing table employee using select and into statement 

create table tblDepartment
(Department varchar(50)  null,
DepartmentHead varchar(50) not null);
*/