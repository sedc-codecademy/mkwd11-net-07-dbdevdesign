ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders]([Id])
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_Order_BusinessEntity] FOREIGN KEY ([BusinessEntityId]) REFERENCES [dbo].[BusinessEntities]([Id])
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_Order_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employees]([Id])
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_Order_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers]([Id])
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products]([Id])

