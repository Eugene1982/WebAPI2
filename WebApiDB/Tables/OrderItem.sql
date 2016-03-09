CREATE TABLE [dbo].[OrderItem]
(
	[OrderId] INT NOT NULL , 
    [ItemId] INT NOT NULL, 
    [ts] ROWVERSION NOT NULL, 
    PRIMARY KEY ([ItemId], [OrderId]), 
    CONSTRAINT [FK_OrderItem_ToOrder] FOREIGN KEY ([OrderId]) REFERENCES [Order]([OrderId]), 
    CONSTRAINT [FK_OrderItem_ToItem] FOREIGN KEY ([ItemId]) REFERENCES [Item]([ItemId])
);
