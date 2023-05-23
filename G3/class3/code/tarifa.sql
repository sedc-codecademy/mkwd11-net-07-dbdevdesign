
create table Customer(
	Id int identity(1,1) Primary key,
	[Name] nvarchar(50)
)

Create table Tarifa (
 Id int identity(1,1) Primary key,
 CustomerId int Foreign key references Customer(Id),
 Name nvarchar(50)
)

INSERT INTO CUSTOMER VALUES ('Jovan Gjorgjiev');
select * from Customer

INSERT INTO Tarifa 
Values
	(1, 'Mageda 1'),
	(1, 'Magenda 2')

SELECT * FROM Tarifa
