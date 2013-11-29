
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/31/2013 07:21:51
-- Generated from EDMX file: C:\Users\NOLSEN\Source\Repos\MSSE682_WebForms\MBSDEVBIDA_WebForms\DAL\AXMbsDevModel.edmx
-- --------------------------------------------------
IF NOT EXISTS(select * from sys.databases where name = 'AXMbsDev')
	CREATE DATABASE AXMbsDev;
SET QUOTED_IDENTIFIER OFF;
GO
USE [AXMbsDev];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[CUSTINVOICEJOUR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CUSTINVOICEJOUR];
GO
IF OBJECT_ID(N'[dbo].[CUSTINVOICETRANS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CUSTINVOICETRANS];
GO
IF OBJECT_ID(N'[dbo].[CUSTTABLE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CUSTTABLE];
GO
IF OBJECT_ID(N'[dbo].[DATAAREA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DATAAREA];
GO
IF OBJECT_ID(N'[dbo].[MBSBDSALESREPTABLE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MBSBDSALESREPTABLE];
GO
IF OBJECT_ID(N'[dbo].[MBSWBWEBUSERCONTACT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MBSWBWEBUSERCONTACT];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CUSTINVOICEJOUR'
CREATE TABLE [dbo].[CUSTINVOICEJOUR] (
    [SALESID] nvarchar(20)  NOT NULL,
    [ORDERACCOUNT] nvarchar(20)  NOT NULL,
    [INVOICEDATE] datetime  NOT NULL,
    [SALESBALANCE] decimal(28,12)  NOT NULL,
    [INVOICEAMOUNT] decimal(28,12)  NOT NULL,
    [INVOICEID] nvarchar(20)  NOT NULL,
    [SUMTAX] decimal(28,12)  NOT NULL,
    [MBSPRIMARYSALESREP] nvarchar(10)  NOT NULL,
    [DATAAREAID] nvarchar(4)  NOT NULL,
    [RECID] bigint IDENTITY(1,1)  NOT NULL
);
GO

-- Creating table 'CUSTINVOICETRANS'
CREATE TABLE [dbo].[CUSTINVOICETRANS] (
    [INVOICEID] nvarchar(20)  NOT NULL,
    [INVOICEDATE] datetime  NOT NULL,
    [INVENTTRANSID] nvarchar(20)  NOT NULL,
    [ITEMID] nvarchar(20)  NOT NULL,
    [NAME] nvarchar(1000)  NOT NULL,
    [QTY] decimal(28,12)  NOT NULL,
    [SALESPRICE] decimal(28,12)  NOT NULL,
    [LINEAMOUNT] decimal(28,12)  NOT NULL,
    [DATAAREAID] nvarchar(4)  NOT NULL,
    [RECID] bigint  IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'CUSTTABLE'
CREATE TABLE [dbo].[CUSTTABLE] (
    [ACCOUNTNUM] nvarchar(20)  NOT NULL,
    [NAME] nvarchar(60)  NOT NULL,
    [PHONE] nvarchar(20)  NOT NULL,
    [ZIPCODE] nvarchar(10)  NOT NULL,
    [STATE] nvarchar(10)  NOT NULL,
    [EMAIL] nvarchar(80)  NOT NULL,
    [CITY] nvarchar(60)  NOT NULL,
    [STREET] nvarchar(250)  NOT NULL,
    [MBSDEPARTMENTCODE] nvarchar(20)  NULL,
    [DATAAREAID] nvarchar(4)  NOT NULL,
    [RECID] bigint IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'DATAAREA'
CREATE TABLE [dbo].[DATAAREA] (
    [ID] nvarchar(4)  NOT NULL,
    [NAME] nvarchar(40)  NOT NULL,
    [RECID] bigint IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'MBSBDSALESREPTABLE'
CREATE TABLE [dbo].[MBSBDSALESREPTABLE] (
    [SALESREPID] nvarchar(10)  NOT NULL,
    [NAME] nvarchar(60)  NOT NULL,
    [DATAAREAID] nvarchar(4)  NOT NULL,
    [RECID] bigint IDENTITY(1,1)  NOT NULL
);
GO

-- Creating table 'MBSWBWEBUSERCONTACT'
CREATE TABLE [dbo].[MBSWBWEBUSERCONTACT] (
    [ACCOUNTNUM] nvarchar(20)  NULL,
    [NAME] nvarchar(60)  NOT NULL,
    [EMAIL] nvarchar(80)  NOT NULL,
    [WEBLOGON] nvarchar(100)  NOT NULL,
    [WEBPASSWORD] nvarchar(20)  NOT NULL,
    [CONTACTPERSONID] nvarchar(20)  NOT NULL,
    [SALESREPID] nvarchar(10)  NULL,
    [DATAAREAID] nvarchar(4)  NOT NULL,
    [RECID] bigint IDENTITY(1,1)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [DATAAREAID], [RECID] in table 'CUSTINVOICEJOURs'
ALTER TABLE [dbo].[CUSTINVOICEJOUR]
ADD CONSTRAINT [PK_CUSTINVOICEJOUR]
    PRIMARY KEY CLUSTERED ([DATAAREAID], [RECID] ASC);
GO

-- Creating primary key on [DATAAREAID], [RECID] in table 'CUSTINVOICETRANS'
ALTER TABLE [dbo].[CUSTINVOICETRANS]
ADD CONSTRAINT [PK_CUSTINVOICETRANS]
    PRIMARY KEY CLUSTERED ([DATAAREAID], [RECID] ASC);
GO

-- Creating primary key on [ACCOUNTNUM], [DATAAREAID] in table 'CUSTTABLEs'
ALTER TABLE [dbo].[CUSTTABLE]
ADD CONSTRAINT [PK_CUSTTABLE]
    PRIMARY KEY CLUSTERED ([ACCOUNTNUM], [DATAAREAID] ASC);
GO

-- Creating primary key on [ID] in table 'DATAAREAs'
ALTER TABLE [dbo].[DATAAREA]
ADD CONSTRAINT [PK_DATAAREA]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [SALESREPID], [DATAAREAID] in table 'MBSBDSALESREPTABLEs'
ALTER TABLE [dbo].[MBSBDSALESREPTABLE]
ADD CONSTRAINT [PK_MBSBDSALESREPTABLE]
    PRIMARY KEY CLUSTERED ([SALESREPID], [DATAAREAID] ASC);
GO

-- Creating primary key on [WEBLOGON], [CONTACTPERSONID], [DATAAREAID] in table 'MBSWBWEBUSERCONTACTs'
ALTER TABLE [dbo].[MBSWBWEBUSERCONTACT]
ADD CONSTRAINT [PK_MBSWBWEBUSERCONTACT]
    PRIMARY KEY CLUSTERED ([WEBLOGON], [CONTACTPERSONID], [DATAAREAID] ASC);
GO


-- --------------------------------------------------
-- Insert Seed Data
-- --------------------------------------------------
USE AXMbsDev;
GO
INSERT INTO [DATAAREA] (ID, NAME)
VALUES (N'MBS', N'MBSDEV, Inc.'),
(N'SAY', N'Sayes'),
(N'COP', N'Cardinal Office, Inc.'),
(N'ANW', N'A&W Office Inc.');
GO

INSERT INTO [CUSTINVOICEJOUR] (SALESID, ORDERACCOUNT, INVOICEDATE, SALESBALANCE, INVOICEAMOUNT, INVOICEID, SUMTAX, MBSPRIMARYSALESREP, DATAAREAID)
VALUES (N'SO-000001', N'C000001', N'10/21/2013', N'100.00', N'110.00', N'IN-000001', N'10.00', N'001', N'COP'),
(N'SO-000002', N'C000001', N'10/20/2013', N'1000.00', N'1100.00', N'IN-000002', N'100.00', N'001', N'COP'),
(N'SO-000002', N'C000001', N'10/21/2013', N'1000.00', N'1100.00', N'IN-000003', N'100.00', N'001', N'COP'),
(N'SO-000003', N'C000002', N'11/21/2013', N'100.00', N'110.00', N'IN-000004', N'10.00', N'002', N'MBS'),
(N'SO-000004', N'C000003', N'9/21/2013', N'100.00', N'110.00', N'IN-000005', N'10.00', N'003', N'SAY'),
(N'SO-000005', N'C000004', N'8/21/2013', N'100.00', N'110.00', N'IN-000006', N'10.00', N'004', N'ANW');
GO

INSERT INTO [CUSTINVOICETRANS] (INVOICEID, INVOICEDATE, INVENTTRANSID, ITEMID, NAME, QTY, SALESPRICE, LINEAMOUNT, DATAAREAID)
VALUES (N'IN-000001', N'10/21/2013', N'IT-000001', N'000001', N'Paper', N'10', N'10.00', N'100.00', N'COP'),
(N'IN-000002', N'10/20/2013', N'IT-000002', N'000001', N'Paper', N'50', N'10.00', N'500.00', N'COP'),
(N'IN-000002', N'10/20/2013', N'IT-000003', N'000001', N'Pens', N'50', N'10.00', N'500.00', N'COP'),
(N'IN-000003', N'10/21/2013', N'IT-000004', N'000001', N'Paper', N'10', N'10.00', N'100.00', N'COP'),
(N'IN-000004', N'11/21/2013', N'IT-000005', N'000001', N'Paper', N'10', N'10.00', N'100.00', N'MBS'),
(N'IN-000005', N'9/21/2013', N'IT-000006', N'000001', N'Paper', N'10', N'10.00', N'100.00', N'SAY'),
(N'IN-000006', N'8/21/2013', N'IT-000007', N'000001', N'Paper', N'10', N'10.00', N'100.00', N'ANW');
GO

INSERT INTO [CUSTTABLE] (ACCOUNTNUM, NAME, PHONE, ZIPCODE, STATE, EMAIL, CITY, STREET, MBSDEPARTMENTCODE, DATAAREAID)
VALUES (N'C000001', N'We Sell Paper', N'3031234567', N'80012', N'CO', N'CustomerService@wesellpaper.com', N'Aurora', N'13008 E. Virginia Pl.', N'1', N'COP'),
(N'C000002', N'Office Supplies Rules', N'1234567890', N'12345', N'PA', N'CustomerSerivce@officesuppliesrules.com', N'Waynesboro', N'123 Who Cares Pl.', N'1', N'MBS'),
(N'C000003', N'Party in the Office', N'2134567890', N'80126', N'CO', N'CustomerService@partyintheoffice.com', N'Highlands Ranch', N'456 Main St.', N'1', N'SAY'),
(N'C000004', N'Penguin Office', N'0987654321', N'80134', N'CO', N'CustomerService@penguinoffice.com', N'Parker', N'789 1st St.', N'1', N'ANW');
GO

INSERT INTO [MBSBDSALESREPTABLE] (SALESREPID, NAME, DATAAREAID)
VALUES (N'001', N'T.J. Juckson', N'COP'),
(N'002', N'Hingle McCringleBerry', N'MBS'),
(N'003', N'Dan Smith', N'SAY'),
(N'004', N'Mike Wallace', N'ANW');
GO

INSERT INTO [MBSWBWEBUSERCONTACT] (ACCOUNTNUM, NAME, EMAIL, WEBLOGON, WEBPASSWORD, CONTACTPERSONID, SALESREPID, DATAAREAID)
VALUES (N'C000001', N'Chris Jones', N'cjones@wesellpaper.com', N'weblogon', N'webpassword', N'C-000001', N'', N'COP'),
(N'C000002', N'Peyton Manning', N'pmanning@officesuppliesrules.com', N'pmanning', N'pmanning', N'C-000002', N'', N'MBS'),
(N'C000003', N'Drew Brees', N'dbrees@partyintheoffice.com', N'dbrees', N'dbrees', N'C-000003', N'', N'SAY'),
(N'C000004', N'Jack Connor', N'jconnor@penguinoffice.com', N'jconnor', N'jconnor', N'C-000004', N'', N'ANW');
GO


-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------