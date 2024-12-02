select * from tblEmployee 
	where EmployeeNumber >200
Go

-- not 
select * from tblEmployee 
	where not EmployeeNumber >200  --we can also write it as not (EmployeeNumber >200) 
Go

select * from tblEmployee 
	where EmployeeNumber !>200    -- not greater than 
Go
-----------------------------------------------------------------------------------------
select * from tblEmployee 
	where EmployeeNumber !=200   -- not equal to 
Go


select * from tblEmployee 
	where EmployeeNumber <>200   -- not equal to 
Go 
---------------------------------------------------------------------------------
select * from tblEmployee 
	where EmployeeNumber >200 and EmployeeNumber <220  -- selects only between the range  201 - 219
Go 
select * from tblEmployee 
	where not (EmployeeNumber >200 and EmployeeNumber <220  )-- selects all and skips only  between the range  201 - 219
Go 

select * from tblEmployee 
	where EmployeeNumber <200 or EmployeeNumber >220 -- selects all and skips only  between the range  200 - 220 
Go   -- or operator check for either one  condition in true 

select * from tblEmployee s
	where EmployeeNumber  between 200 and 209 -- selects all  between the range  200 - 209 including both 
Go 

select * from tblEmployee 
	where EmployeeNumber not  between 200 and 209 --skips all  between the range  200 - 209 including both 
Go 

select * from tblEmployee 
	where EmployeeNumber in (200,204,208,133) -- selects those employees whose having empnumbers in the following list 
Go 