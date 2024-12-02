select * from tblEmployee
select * from tblTransaction
select * from tblDepartment

-- Transaction is as Set of statements 
-- they are either commited if successful 
-- ortherwise it is rollback 
/*  Transactions (characterisitcs ) Properties are 
`1.A-Atomic  :-
   It is a single  unit of work 
`2.C-COnsistent :-
		it must leave your data in consistent state 
`3.I-Isolated  :-
		Modification made by more than one transaction  happening at the same time must be isolated each individual transaction  -- its like  (serializability )scheduling processes with resource one tran wait for another to complete 
`4.D-Durable   ::  
			the effects made to data in a transaction are permanent 
ACID
- Transaction begins 
-- Transaction succeed (committed )Or Fails (Rolled back )
