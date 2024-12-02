/*
Scope and Type Of Lock 
1.Inted shared (IS)
2. Shared (S)
3. Update (U)
4.Intendt Exclusive(IX)
5.Shared With intent Exclusive (SIX).
6. Exclusive (X)


-- Shared LOCK :  --these are for Select statements 
	1. Allows Concurrent transactions to read (SELECT)
	2.No other Transaction can modify the data 
	3.Released as soon as the read Operation is completed 

--UPDATE LOCKS:  --these are for update
	1. Used to prevent deadlock
	2.Transactions reading data -shared Lock 
	3.To  update data ,must Convert To exclusive 
	4.Cannot convert To exclusive  if there is a shared lock
	5. Solution - use Update Lock; then convert to Exclusive Lock 

--Exclusive Lock :: -- it does not allow any other transaction to modify data before ending current tran
	1.Prevents Access by concurrent tranasction 
	2.Used by INSERT ,UPDATE,DELETE

-- Intent Locks 
	1.Signal initent to place locks at a lower level 
	2.prevent other transactions from modifying  higher level resoruces
	3.Detecting Lock conflicts