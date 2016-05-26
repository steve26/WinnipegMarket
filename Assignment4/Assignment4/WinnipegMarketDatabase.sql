USE dbWinnipegMarket
go

create proc recoverPassword (
@name varchar(max))
as begin
select * from tbUsers where Email = @name
end
go
