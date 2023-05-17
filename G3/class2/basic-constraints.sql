ALTER TABLE BusinessEntities
ADD constraint DF_Region
default 'Skopski' FOR Region

insert into BusinessEntities([Name],Region,Size,Zipcode)
values ('asdasd','Skopski', 'Small', 'asdadsa')
select * from BusinessEntities

ALTER TABLE BusinessEntities
ADD CONSTRAINT CK_ZipCode 
CHECK(IsNumeric(ZipCode) = 1)

ALTER TABLE Products
ADD CONSTRAINT CK_Price
CHECK(Price > 0)

DELETE FROM BusinessEntities
WHERE ISNUMERIC(Zipcode) = 0


ALTER TABLE PRODUCTs
ADD CONSTRAINT UQ_Code
UNIQUE(Code)

SELECT * FROM Orders


