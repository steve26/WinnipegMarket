USE dbWinnipegMarket
go

create table EmailList (
id int primary key identity(1,1),
name varchar(max))

go
create proc AddEmail (
@name varchar(max))
as begin
insert into EmailList (name) values (@name)
end
