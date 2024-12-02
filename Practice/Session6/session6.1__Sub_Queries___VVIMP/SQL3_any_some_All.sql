select * from tblTransaction
where EmployeeNumber in (select EmployeeNumber from tblEmployee where  EmployeeLastName like'y%')


---any  
-- any of the following 
select * from tblTransaction
where EmployeeNumber =any   -- equal to any of the following 
(select EmployeeNumber from tblEmployee where  EmployeeLastName like'y%')


--
--some  
--some of the following 
select * from tblTransaction
where EmployeeNumber =some       -- some of tbltransaction equal to 
(select EmployeeNumber from tblEmployee where  EmployeeLastName like'y%')


--all  
-- all of the following  must be match with this 
select * from tblTransaction
where EmployeeNumber =all      -- all of tbltransaction equal to 
(select EmployeeNumber from tblEmployee where  EmployeeLastName like'y%')

-- all of the following  must be match with this 
select * from tblTransaction
where EmployeeNumber <>all      -- not all of tbltransaction equal to 
(select EmployeeNumber from tblEmployee where  EmployeeLastName like'y%')
-- it skips those 8 rows wich matches 
 
---------------------------------------------------------------------------------------------
--  6. Subquery – WHERE and ANY, SOME and ALL   they are just like logical operators in c#
--Any /Some  = Or   opearator 
-- All =  And operator
select * 
from tblTransaction as T
Where EmployeeNumber = some -- or "some is synonyme for any "
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

select * 
from tblTransaction as T
Where EmployeeNumber <> any -- does not work properly
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

select * 
from tblTransaction as T
Where EmployeeNumber <> all 
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

select * 
from tblTransaction as T
Where EmployeeNumber <= all
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

-- anything up to 126 AND
-- anything up to 127 AND
-- anything up to 128 AND
-- anything up to 129

-- ANY = anything up to 129
-- ALL = anything up to 126

-- any/some = OR
-- all = AND

-- 126 <> all(126,127,128,129)
-- 126<>126 AND 126<>127 AND 126<>128 AND 126<>129
-- FALSE    AND TRUE = FALSE

-- 126 <> any(126,127,128,129)
-- 126<>126 OR 126<>127 OR 126<>128 OR 126<>129
-- FALSE    OR TRUE = TRUE



