
USE [crudDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_OrderProductTb_OrdersTb]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderProductTb] DROP CONSTRAINT [FK_OrderProductTb_OrdersTb];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderProductTb_ProductTb]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderProductTb] DROP CONSTRAINT [FK_OrderProductTb_ProductTb];
GO
IF OBJECT_ID(N'[dbo].[FK_OrdersTb_CustomerTb]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrdersTb] DROP CONSTRAINT [FK_OrdersTb_CustomerTb];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[CustomerTb]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomerTb];
GO
IF OBJECT_ID(N'[dbo].[OrderProductTb]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderProductTb];
GO
IF OBJECT_ID(N'[dbo].[OrdersTb]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrdersTb];
GO
IF OBJECT_ID(N'[dbo].[ProductTb]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductTb];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CustomerTb'
CREATE TABLE [dbo].[CustomerTb] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [Firstname] varchar(50)  NOT NULL,
    [Lastname] varchar(50)  NULL,
    [Email] varchar(100)  NOT NULL,
    [Address] varchar(150)  NOT NULL,
    [City] varchar(50)  NULL,
    [Phone] nchar(10)  NULL
);
GO

-- Creating table 'OrderProductTb'
CREATE TABLE [dbo].[OrderProductTb] (
    [OrderProductID] int  NOT NULL,
    [ProductID] int  NOT NULL,
    [OrderID] int  NOT NULL
);
GO

-- Creating table 'OrdersTb'
CREATE TABLE [dbo].[OrdersTb] (
    [OrderID] int IDENTITY(1,1) NOT NULL,
    [CustomerID] int  NOT NULL,
    [Date] datetime  NULL
);
GO

-- Creating table 'ProductTb'
CREATE TABLE [dbo].[ProductTb] (
    [ProductID] int  NOT NULL,
    [ProductName] varchar(50)  NOT NULL,
    [Brand] varchar(50)  NULL,
    [Category] varchar(50)  NULL,
    [Price] decimal(10,2)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[userTb] (
    [Username] varchar(50)  NOT NULL,
    [Password] varchar(50) NOT NULL,
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CustomerID] in table 'CustomerTb'
ALTER TABLE [dbo].[CustomerTb]
ADD CONSTRAINT [PK_CustomerTb]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [OrderProductID] in table 'OrderProductTb'
ALTER TABLE [dbo].[OrderProductTb]
ADD CONSTRAINT [PK_OrderProductTb]
    PRIMARY KEY CLUSTERED ([OrderProductID] ASC);
GO

-- Creating primary key on [OrderID] in table 'OrdersTb'
ALTER TABLE [dbo].[OrdersTb]
ADD CONSTRAINT [PK_OrdersTb]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [ProductID] in table 'ProductTb'
ALTER TABLE [dbo].[ProductTb]
ADD CONSTRAINT [PK_ProductTb]
    PRIMARY KEY CLUSTERED ([ProductID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerID] in table 'OrdersTb'
ALTER TABLE [dbo].[OrdersTb]
ADD CONSTRAINT [FK_OrdersTb_CustomerTb]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[CustomerTb]
        ([CustomerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrdersTb_CustomerTb'
CREATE INDEX [IX_FK_OrdersTb_CustomerTb]
ON [dbo].[OrdersTb]
    ([CustomerID]);
GO

-- Creating foreign key on [OrderID] in table 'OrderProductTb'
ALTER TABLE [dbo].[OrderProductTb]
ADD CONSTRAINT [FK_OrderProductTb_OrdersTb]
    FOREIGN KEY ([OrderID])
    REFERENCES [dbo].[OrdersTb]
        ([OrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderProductTb_OrdersTb'
CREATE INDEX [IX_FK_OrderProductTb_OrdersTb]
ON [dbo].[OrderProductTb]
    ([OrderID]);
GO

-- Creating foreign key on [ProductID] in table 'OrderProductTb'
ALTER TABLE [dbo].[OrderProductTb]
ADD CONSTRAINT [FK_OrderProductTb_ProductTb]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[ProductTb]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderProductTb_ProductTb'
CREATE INDEX [IX_FK_OrderProductTb_ProductTb]
ON [dbo].[OrderProductTb]
    ([ProductID]);
GO

-- --------------------------------------------------
-- Dodawanie wartoœci do tabeli
-- --------------------------------------------------

-- Dodawanie rekordów do tabeli CustomerTb
INSERT INTO CustomerTb (Firstname, Lastname, Email, Address, City, Phone)
VALUES ('John', 'Doe', 'john.doe@example.com', '123 Main St', 'New York', '1234567890'),
       ('Jane', 'Smith', 'jane.smith@example.com', '456 Elm St', 'Los Angeles', '9876543210'),
       ('David', 'Johnson', 'david.johnson@example.com', '789 Oak St', 'Chicago', '5551234567');
GO

-- Dodawanie rekordów do tabeli ProductTb
INSERT INTO ProductTb (ProductID, ProductName, Brand, Category, Price)
VALUES (101, 'mas³o', 'Lurpak', 'spo¿ywcze', 5),
       (102, 'klocki', 'Lego', 'zabawki', 199),
       (103, 'wiertarka', 'Makita', 'narzêdzia', 29.99);
GO

-- Dodawanie rekordów do tabeli OrdersTb
INSERT INTO OrdersTb (CustomerID, Date)
VALUES (1, '2023-06-01'),
       (2, '2023-06-02'),
       (3, '2023-06-03');
GO

-- Dodawanie rekordów do tabeli OrderProductTb
INSERT INTO OrderProductTb (OrderProductID, ProductID, OrderID)
VALUES (1, 101, 1),
       (2, 102, 2),
       (3, 103, 3);
GO

-- Dodawanie rekordu do tabeli userTb
INSERT INTO userTb (Username, Password)
VALUES ('admin', 'admin');
GO
-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------