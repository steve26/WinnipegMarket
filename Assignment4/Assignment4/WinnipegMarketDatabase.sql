USE dbWinnipegMarket
go
create proc spGetProductByID (
@ID int)
as begin
select*from tbProducts where Pro_ID=@ID
end
go
