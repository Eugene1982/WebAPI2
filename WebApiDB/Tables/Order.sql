CREATE TABLE [dbo].[Order]
(
	[OrderId] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, 
    [Date] DATETIME NOT NULL, 
    [ts] ROWVERSION NOT NULL, 
    [SelectedItemId] INT NOT NULL, 
    CONSTRAINT [FK_Order_ToTask] FOREIGN KEY ([SelectedItemId]) REFERENCES [Item]([ItemId])
);
