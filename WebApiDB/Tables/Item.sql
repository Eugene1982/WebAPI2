CREATE TABLE [dbo].[Item]
(
	[ItemId] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [Price] MONEY NOT NULL, 
    [Quantity] INT NOT NULL, 
    [ts] ROWVERSION NOT NULL 
);
