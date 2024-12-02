-- Find the top 3 departments with the highest average salaries and list all employees in those departments

select * from myDemoEmployee 
select distinct myDemoEmployee.GroupID from myDemoEmployee   order by GroupID
select  distinct GroupID , count(empno) over ( partition by groupid order by groupId) from myDemoEmployee order by GroupID

select empno from  tbl emp
where  groupID in (
   select  top (3) GroupID,AVG(Salutation)  as Average from myDemoEmployee
      group by GroupId  
    order by average  desc )