
/*learning transactions*/
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

