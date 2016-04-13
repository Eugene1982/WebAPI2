﻿/*
Deployment script for WebApiDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "WebApiDB"
:setvar DefaultFilePrefix "WebApiDB"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key a2fab41a-8f9b-46cb-b3c0-5dd7c528125b is skipped, element [dbo].[Item].[Id] (SqlSimpleColumn) will not be renamed to ItemId';


GO
PRINT N'Rename refactoring operation with key 369af693-8345-4359-a835-3c593e13ed20 is skipped, element [dbo].[Order].[Id] (SqlSimpleColumn) will not be renamed to OrderId';


GO
PRINT N'Rename refactoring operation with key 13026a58-5c5d-44c7-a541-7c2ab1f8249d is skipped, element [dbo].[Order].[t] (SqlSimpleColumn) will not be renamed to ts';


GO
PRINT N'Rename refactoring operation with key 0ed2db55-1bfb-4716-a8fc-a10e3bc26f2c is skipped, element [dbo].[OrderItem].[Id] (SqlSimpleColumn) will not be renamed to OrderId';


GO
PRINT N'Rename refactoring operation with key 90c2bfdf-1983-4fbd-ae8a-80ba2ee8b8b1 is skipped, element [dbo].[FK_OrderItem_ToTable] (SqlForeignKeyConstraint) will not be renamed to [FK_OrderItem_ToOrder]';


GO
PRINT N'Rename refactoring operation with key 2d71bfd7-4a1f-4f97-b316-73e787abd225 is skipped, element [dbo].[OrderItem].[TaskId] (SqlSimpleColumn) will not be renamed to ItemId';


GO
PRINT N'Rename refactoring operation with key e6623b7d-aed0-4cc7-a631-c54ea4878470 is skipped, element [dbo].[Order].[SelesteItemId] (SqlSimpleColumn) will not be renamed to SelectedItemId';


GO
PRINT N'Creating [dbo].[Item]...';


GO
CREATE TABLE [dbo].[Item] (
    [ItemId]   INT           IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (50) NOT NULL,
    [Price]    MONEY         NOT NULL,
    [Quantity] INT           NOT NULL,
    [ts]       ROWVERSION    NOT NULL,
    PRIMARY KEY CLUSTERED ([ItemId] ASC)
);


GO
PRINT N'Creating [dbo].[Order]...';


GO
CREATE TABLE [dbo].[Order] (
    [OrderId]        INT        IDENTITY (1, 1) NOT NULL,
    [Date]           DATETIME   NOT NULL,
    [ts]             ROWVERSION NOT NULL,
    [SelectedItemId] INT        NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderId] ASC)
);


GO
PRINT N'Creating [dbo].[OrderItem]...';


GO
CREATE TABLE [dbo].[OrderItem] (
    [OrderId] INT        NOT NULL,
    [ItemId]  INT        NOT NULL,
    [ts]      ROWVERSION NOT NULL,
    PRIMARY KEY CLUSTERED ([ItemId] ASC, [OrderId] ASC)
);


GO
PRINT N'Creating [dbo].[FK_Order_ToTask]...';


GO
ALTER TABLE [dbo].[Order] WITH NOCHECK
    ADD CONSTRAINT [FK_Order_ToTask] FOREIGN KEY ([SelectedItemId]) REFERENCES [dbo].[Item] ([ItemId]);


GO
PRINT N'Creating [dbo].[FK_OrderItem_ToOrder]...';


GO
ALTER TABLE [dbo].[OrderItem] WITH NOCHECK
    ADD CONSTRAINT [FK_OrderItem_ToOrder] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order] ([OrderId]);


GO
PRINT N'Creating [dbo].[FK_OrderItem_ToItem]...';


GO
ALTER TABLE [dbo].[OrderItem] WITH NOCHECK
    ADD CONSTRAINT [FK_OrderItem_ToItem] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([ItemId]);


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a2fab41a-8f9b-46cb-b3c0-5dd7c528125b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a2fab41a-8f9b-46cb-b3c0-5dd7c528125b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '369af693-8345-4359-a835-3c593e13ed20')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('369af693-8345-4359-a835-3c593e13ed20')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '13026a58-5c5d-44c7-a541-7c2ab1f8249d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('13026a58-5c5d-44c7-a541-7c2ab1f8249d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0ed2db55-1bfb-4716-a8fc-a10e3bc26f2c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0ed2db55-1bfb-4716-a8fc-a10e3bc26f2c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '90c2bfdf-1983-4fbd-ae8a-80ba2ee8b8b1')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('90c2bfdf-1983-4fbd-ae8a-80ba2ee8b8b1')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2d71bfd7-4a1f-4f97-b316-73e787abd225')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2d71bfd7-4a1f-4f97-b316-73e787abd225')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e6623b7d-aed0-4cc7-a631-c54ea4878470')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e6623b7d-aed0-4cc7-a631-c54ea4878470')

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Order] WITH CHECK CHECK CONSTRAINT [FK_Order_ToTask];

ALTER TABLE [dbo].[OrderItem] WITH CHECK CHECK CONSTRAINT [FK_OrderItem_ToOrder];

ALTER TABLE [dbo].[OrderItem] WITH CHECK CHECK CONSTRAINT [FK_OrderItem_ToItem];


GO
PRINT N'Update complete.';


GO
