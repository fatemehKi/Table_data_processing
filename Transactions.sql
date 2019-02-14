
/*learning transactions*/
/*PROPERTY OF TRANSACTION*/
/*1. ATOMIC --- ROLLBACK UNDO THE CHANGES. 
 Atomicity guarantees that each transaction is treated as a single "unit", which either succeeds completely, or fails completely:
  if any of the statements constituting a transaction fails to complete, the entire transaction fails and the database is left unchanged. 
  An atomic system must guarantee atomicity in each and every situation, including power failures, errors and crashes.
2. CONSISTENT --  SHOULD BE LOGICAL. Consistency ensures that a transaction can only bring the database from one valid state to another,
 maintaining database invariants: any data written to the database must be valid according to all defined rules, including constraints, 
 cascades, triggers, and any combination thereof. This prevents database corruption by an illegal transaction, but does not guarantee 
 that a transaction is correct.
3. ISOLATED -- Transactions are often executed concurrently (e.g., reading and writing to multiple tables at the same time)
 Isolation ensures that concurrent execution of transactions leaves the database in the same state that would have been
 obtained if the transactions were executed sequentially. 
4. DURABLE -- Durability guarantees that once a transaction has been committed, it will remain committed even in the case 
of a system failure (e.g., power outage or crash).
 This usually means that completed transactions (or their effects) are recorded in non-volatile memory. */



select * from product_details
select * from Product_Sales

update product_details
set QntyAvail = (
case
   when id = 1 then 300
   when id = 2 then 500
   when id = 3 then 200
end
)

/* create a procedure to remove item from product detail and add to the sold product)*/
/*proc == procedure */
create proc spsold (@prodID int, @prodQnty int, @unitprice decimal(7,2))
as
begin
insert into Product_Sales(ProductID, Unitprice, Qty) -- we arte inserting into the product sale and we are updating the  
values (@prodID, @unitprice, @prodQnty)
update productDetails
set QntyAvail = QntyAvail -@prodQnty
where ID= @prodID
end
/*new method of executing*/
spMakeSale 1, 10, 800

/*in order to avoid getting to the negative value */
/* in transaction if one statment is not successful the others will not exceuted..
we are wrapping the statments and we call them "ATOMIC" meaning one unique*/
create proc spsold (@prodID int, @prodQnty int, @unitprice decimal(7,2))
as
begin
   begin transaction
   insert into Product_Sales(ProductID, Unitprice, Qty) -- we arte inserting into the product sale and we are updating the  
      values (@prodID, @unitprice, @prodQnty)
   update productDetails
         set QntyAvail = ( 
		                  case
		                     when qntyAvail>@prodID then QntyAvail -@prodQnty
                             else
		                      QntyAvail
		                    end
		 )
   end transaction

   where ID = @prodID
end

