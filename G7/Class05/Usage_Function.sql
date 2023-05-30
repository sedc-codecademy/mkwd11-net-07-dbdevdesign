Select dbo.fn_PrintBill(5)

--This behaves same as the foreach cycle. We get the Id for each order, and we call the function with the Id
Select o.Id, dbo.fn_PrintBill(o.Id) as Bill From Orders o