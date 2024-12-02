

/*  syntac of Case   it is just like switch case 
	Case When condition 1
	Then  return values  if conditon 1 is true 
	when conditon 2
	then  return values  if conditon 1 is true 
	else  default value to return 
	End 
	*/
	   
declare @myOption as varchar(10) = 'Option C'  -- declared variable of varchar type with value 

select case   --  always starts with Case keyword
			when @myOption = 'Option A' then 'First option'
            when @myOption = 'Option B' then 'Second option'
			--else 'No Option'    -- else case is optional if there is not else case then it automatically set as null 
			END  -- always end with End  keyword 
  as MyOptions
go
declare @myOption as varchar(10) = 'Option A'

select case @myOption when 'Option A' then 'First option'
                   when 'Option B' then 'Second option' 
				   else 'No Option' END as MyOptions
go

select 
	  case when left(EmployeeGovernmentID,1)='A' then 'Letter A'  
	       when EmployeeNumber<200 then 'Less than 200'
		   else 'Neither letter' END + '.' as myColResult  -- else section is optonal 
  FROM tblEmployee
  go 

  select Top (1000) EmployeeNumber,EmployeeGovernmentID,
				case --when  not right(EmployeeGovernmentID,1)='H' then 'hello D'
				 when  EmployeeNumber%2=0 then  'even '
				else 'hi hi hi '
				End +'.' as neTbl				
	 from tblEmployee

