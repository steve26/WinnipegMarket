USE dbWinnipegMarket
go

create proc spCheckOut(
@OrderID int)
as begin
select tbOrder.OrderID,ProductID,Price,Quantity,tbOrderDetail.OrderID
from tbOrder left outer join tbOrderDetail on tbOrder.OrderID=tbOrderDetail.OrderID where tbOrderDetail.OrderID = NULL
delete from tbOrder where tbOrder.OrderID=@OrderID
end
go