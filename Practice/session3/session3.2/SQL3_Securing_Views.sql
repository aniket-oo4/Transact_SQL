--how to get the Script for making view by using command without using  GUI
-- we cannot able to retrieve the scripts of Encrypted columns 
-- they will show only nulls  
select * from sys.syscomments  
select * from sys.views
   -- getting nviews  data 
 select * from sys.syscomments as S
 inner join  sys.views AS V
 on S.id=V.object_id
  -- query is in the text column 

  --or  get create query for sspecific table 
  select OBJECT_DEFINITION (object_id('[dbo].[ViewByDepartment]')) -- Encrypted 

    select OBJECT_DEFINITION (object_id('[dbo].[spt_values]'))  -- not encrypted 