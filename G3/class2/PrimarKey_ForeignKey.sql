CREATE TABLE TEST
(
	Id int identity(1,1) Primary Key
)

ALTER TABLE TEST
ADD [Name] nvarchar(10)

INSERT INTO TEST
VALUES('asd');

Create table Test2 
(
	Id int identity Primary Key,
	TestId int not null Foreign Key references Test(Id)
)

Alter table Test2
ADD CONSTRAINT FK_TestId
Foreign Key(TestId) references Test(Id)



Insert into Test2(TestId)
Values(1)

--ALTER TABLE Test
--ADD CONSTRAINT PK_Test
--Primary key(Id)

select * from Test
select * from Test2

ALTER TABLE ORDERS
ADD CONSTRAINT FK_Customers
Foreign key (CustomerId) references Customers(Id)

select * from Orders

SELECT * FROM Customers
WHERE ID = 4

--da se napravi tabela blog(post nvarchar(max)) i 
-- blogComments(comment nvarchar(max))

CREATE TABLE BLOG
(
 Id int identity(1,1) Primary Key,
 Post nvarchar(MAX)
)

CREATE TABLE COMMENT
(
	Id int identity(1,1) Primary Key,
	Comment nvarchar(MAX),
	BlogId int Foreign Key references Blog(Id)
)
SELECT * FROM BLOG
Insert into COMMENT(Comment, BlogId)
VALUES('asdasdsadsadsadsad', 2)

insert into Blog
Values
('Prv post'),
('vtor post')

