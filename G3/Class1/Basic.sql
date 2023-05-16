create database EShop;

use EShop

create table Korisnik(
 Id int not null,
 [Name] nvarchar(255) not null,
 IsActive  bit  not null, -- 0 if false; 1 if true
 Balance decimal(10,2), --12345678,99
)
-- product (id, ime, kolicina, cena, proizveduvac

create table product
(
	Id int not null,
	[Name] nvarchar(255) not null,
	[Quantity] int not null,
	Price decimal(18,2),
	Maker nvarchar(255) not null
)

create table [Order](
	CustomerId int not null,
	ProductId int not null,
	Quantity int not null default 1,
	Ordered datetime2 not null
);

Insert into Korisnik([Name],Id, IsActive, Balance, Age)
Values ('Jovan', 3, 1,50, 35);

Insert into Korisnik
Values(2,'Bojane',0,50,25);

select [Id], [Name], [Age], Created from Korisnik

Alter table Korisnik
drop column Created --add dodava kolona drop brise

Update Korisnik
set Age = 25
where Id = 3

create table Comments
(
	Id int identity(1,1),
	[Text] nvarchar not null,
	CustomerId int not null,
	Created datetime2 not null default GetDate(),
)

Alter table Comments
drop column [Text];

Alter table Comments
add [Text] nvarchar(MAX);


insert into Comments(CustomerId, Created,[Text])
Values(2,GETDATE(), 'Vtor product')

select * from Comments


Alter table Comments
add Likes int not null default 0

delete Comments

delete Korisnik
where Id = 3
