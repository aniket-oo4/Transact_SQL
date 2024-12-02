-- What happens if lock doesnt Exists??
/*
   Results of NO Concurrency Control

1.Lost updates   -- it losts the changes of one if two trans tries to update same row 
2.Uncommitted Dependency (Dirty read)
3.Inconsitent analysis (nonRepeatable Read)  -- it results if one update but other one still read old on 
4.Phantom reads   -- it results if one deletes the rows or adds then rowcount is changed
5.Missing And double Reads caused by Row Updates 
6.Missing One or more Rows That were not target of update 