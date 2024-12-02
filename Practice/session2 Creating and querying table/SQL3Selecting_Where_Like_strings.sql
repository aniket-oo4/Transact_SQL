Select * from tblEmployee
where EmployeeLastName='word'

Select * from tblEmployee
where EmployeeLastName >'word' -- check fro = ,<>,<=

--like
select * from tblEmployee 
where EmployeeLastName like 'w%'; -- starts with 
select * from tblEmployee 
where EmployeeLastName like '%w';
select * from tblEmployee 
where EmployeeLastName like '%w%';   -- anywhere / contains  --> maxwell weldone, bow etc

select * from tblEmployee 
where EmployeeLastName like '__w';

-- % = 0-infinity characters  %w end with | w% start with | %w% contains anywhere 
-- _ = 1 character __ 2 charcter ___
-- [A-G] = in the range A-G  [A-G]% start with character in the  range of a-g  
-- [AGQ]= A,G or Q  --[AGQ]% starts with a/g/Q any ofthese following 
--[^A-G] = not in range A-G  [^a-g]% not starts with a-g range characters 

select * from tblEmployee 
where [EmployeeLastName] like '[r-t]%';  -- starts with r/s/t 
select * from tblEmployee 
where [EmployeeLastName] like '[^r-t]%';  -- not starts with r/s/t 

select * from tblEmployee 
where [EmployeeLastName] like '%[r-t]';  -- ends with r/s/t range r to t 
select * from tblEmployee 
where [EmployeeLastName] like '%[^kon][^r-t]';  -- Not second last characters with k/o/n and last  r/s/t range r to t 


select * from tblEmployee 
where [EmployeeLastName] like '[agq]%';  -- ends with a/g/q  its not range its specified characters 
select * from tblEmployee 
where [EmployeeLastName] like '[^aeiou]%';  -- not  starts with vowels  
select * from tblEmployee 
where [EmployeeLastName] like '%[aeiou]%';  --  contains vowels

select * from tblEmployee 
where [EmployeeLastName] like '%[agq]';  -- ends with a/g/q  its not range its specified characters 
select * from tblEmployee 
where [EmployeeLastName] like '%[^aeiou]';  -- not  ends with vowels  

select * from tblEmployee 
where [EmployeeLastName] like '[^a-y]%';  -- not  start with a-y   any character only select  data having z at start
