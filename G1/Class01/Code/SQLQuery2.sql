USE [master]
GO

DROP DATABASE IF EXISTS [SEDC]
GO

CREATE DATABASE [SEDC]
GO

USE [SEDC]
GO

CREATE TABLE [Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NULL,
	CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED([Id] ASC)
);
GO

INSERT INTO [Customer] ([Name], [City])
VALUES ('Vero Skopje', 'Skopje');
GO

INSERT INTO [Customer] ([Name], [City])
VALUES ('ABC Corporation', 'New York');
GO

INSERT INTO [Customer] ([Name], [City])
VALUES ('XYZ Industries', 'London');
GO

INSERT INTO [Customer] ([Name], [City])
VALUES ('123 Corporation', 'Tokyo');
GO

INSERT INTO [Customer] ([Name], [City])
VALUES ('Acme Corporation', 'San Francisco');
GO

INSERT INTO [Customer] ([Name], [City])
VALUES ('Global Enterprises', 'Sydney');
GO

SELECT * FROM [Customer];
GO

SELECT [Name] FROM [Customer];
GO

SELECT [City], [Name]
FROM [Customer]
WHERE City = 'New York'
GO

UPDATE [Customer] SET Name = 'Vero Bitola', City = 'Bitola'
WHERE Name = 'Vero Skopje'
GO

DELETE
FROM [Customer]
WHERE Name = 'Acme Corporation'
GO

DROP TABLE [Customer]