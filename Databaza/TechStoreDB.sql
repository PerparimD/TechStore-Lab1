IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'TechStoreDB')
    BEGIN
        CREATE DATABASE TechStoreDB
    END
    GO
    USE TechStoreDB
GO
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Produkti' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
    ALTER TABLE [dbo].[Produkti]
    DROP CONSTRAINT IF EXISTS [FK_Produkti_Kategoria]
   ALTER TABLE [dbo].[Produkti] DROP CONSTRAINT IF EXISTS [FK_Produkti_Kompania]
END

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'TeDhenatEPorosis' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
    ALTER TABLE [dbo].[TeDhenatEPorosis]
    DROP CONSTRAINT IF EXISTS [FK_TeDhenatPorosis_KodiZbritjes]
     ALTER TABLE [dbo].[TeDhenatEPorosis] DROP CONSTRAINT IF EXISTS [FK_TeDhenatPorosis_Produkti]
END

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'TeDhenatPerdoruesit' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
    ALTER TABLE [dbo].[TeDhenatPerdoruesit]
    DROP CONSTRAINT IF EXISTS [FK_TeDhenatPerdorues_Perdoruesi]
END

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'KodiZbritjes' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
    ALTER TABLE [dbo].[KodiZbritjes]
    DROP CONSTRAINT IF EXISTS [FK_KodiZbritjes_Produkti]
END

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'RegjistrimiStokut' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
    ALTER TABLE [dbo].[RegjistrimiStokut]
    DROP CONSTRAINT IF EXISTS [FK_Regjistrimi_Perdoruesi]
END

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Porosit' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
    ALTER TABLE [dbo].[Porosit]
    DROP CONSTRAINT IF EXISTS [FK_Porosit_Klienti]
END

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'ContactForm' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
    ALTER TABLE [dbo].[ContactForm]
    DROP CONSTRAINT IF EXISTS [FK_ContactForm_Perdoruesi]
END

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'TeDhenatRegjistrimit' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
    ALTER TABLE [dbo].[TeDhenatRegjistrimit]
    DROP CONSTRAINT IF EXISTS [FK_Produkti_TeDhenatRegjistrimit]
    ALTER TABLE [dbo].[TeDhenatRegjistrimit] DROP CONSTRAINT IF EXISTS [FK_RegjistrimiStokut_TeDhenatRegjistrimit]
END

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'StokuQmimiProduktit' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
    ALTER TABLE [dbo].[StokuQmimiProduktit]
    DROP CONSTRAINT IF EXISTS [FK_Stoku_Produkti]
END

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'ZbritjaQmimitProduktit' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
    ALTER TABLE [dbo].[ZbritjaQmimitProduktit]
    DROP CONSTRAINT IF EXISTS [FK_ZbritjaQmimitProduktit]
END

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContactForm]') AND type in (N'U'))
DROP TABLE [dbo].[ContactForm];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KategoriaProduktit]') AND type in (N'U'))
DROP TABLE [dbo].[KategoriaProduktit];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KodiZbritjes]') AND type in (N'U'))
DROP TABLE [dbo].[KodiZbritjes];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Kompania]') AND type in (N'U'))
DROP TABLE [dbo].[Kompania];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perdoruesi]') AND type in (N'U'))
DROP TABLE [dbo].[Perdoruesi];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Porosit]') AND type in (N'U'))
DROP TABLE [dbo].[Porosit];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Produkti]') AND type in (N'U'))
DROP TABLE [dbo].[Produkti];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RegjistrimiStokut]') AND type in (N'U'))
DROP TABLE [dbo].[RegjistrimiStokut];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleClaims]') AND type in (N'U'))
DROP TABLE [dbo].[RoleClaims];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StokuQmimiProduktit]') AND type in (N'U'))
DROP TABLE [dbo].[StokuQmimiProduktit];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeDhenatEPorosis]') AND type in (N'U'))
DROP TABLE [dbo].[TeDhenatEPorosis];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeDhenatPerdoruesit]') AND type in (N'U'))
DROP TABLE [dbo].[TeDhenatPerdoruesit];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeDhenatRegjistrimit]') AND type in (N'U'))
DROP TABLE [dbo].[TeDhenatRegjistrimit];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[UserClaims];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[UserLogins];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[UserRoles];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserTokens]') AND type in (N'U'))
DROP TABLE [dbo].[UserTokens];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZbritjaQmimitProduktit]') AND type in (N'U'))
DROP TABLE [dbo].[ZbritjaQmimitProduktit];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__EFMigrationsHistory];
CREATE TABLE [dbo].[ContactForm] ( 
  [mesazhiID] INT IDENTITY NOT NULL,
  [userID] INT NULL,
  [mesazhi] TEXT NULL,
  [dataDergeses] DATE NULL CONSTRAINT [DF__ContactFo__dataD__34C8D9D1] DEFAULT (getdate()) ,
  [statusi] VARCHAR(60) NULL CONSTRAINT [DF__ContactFo__statu__35BCFE0A] DEFAULT ('Mesazhi juaj eshte derguar tek Stafi') ,
  [emri] VARCHAR(250) NULL,
  [email] VARCHAR(250) NULL,
  CONSTRAINT [PK__ContactF__0E3F7CF3731C8CDE] PRIMARY KEY ([mesazhiID])
);
CREATE TABLE [dbo].[KategoriaProduktit] ( 
  [kategoriaID] INT IDENTITY NOT NULL,
  [llojiKategoris] TEXT NULL,
  [pershkrimiKategoris] TEXT NULL,
  CONSTRAINT [PK__Kategori__AC39DE2ACE8BCA8A] PRIMARY KEY ([kategoriaID])
);
CREATE TABLE [dbo].[KodiZbritjes] ( 
  [kodi] VARCHAR(12) NOT NULL,
  [dataKrijimit] DATETIME NULL CONSTRAINT [DF__KodiZbrit__dataK__36B12243] DEFAULT (getdate()) ,
  [qmimiZbritjes] DECIMAL(18,2) NULL,
  [idProdukti] INT NULL,
  CONSTRAINT [PK__KodiZbri__25A8748FB3E013A8] PRIMARY KEY ([kodi])
);
CREATE TABLE [dbo].[Kompania] ( 
  [kompaniaID] INT IDENTITY NOT NULL,
  [emriKompanis] TEXT NULL,
  [logo] VARCHAR(40) NULL CONSTRAINT [DF__Kompania__logo__37A5467C] DEFAULT ('kompaniPaFoto.png') ,
  [adresa] VARCHAR(40) NULL,
  CONSTRAINT [PK__Kompania__2026D74DCB37AA9A] PRIMARY KEY ([kompaniaID])
);
CREATE TABLE [dbo].[Perdoruesi] ( 
  [userID] INT IDENTITY NOT NULL,
  [emri] VARCHAR(30) NULL,
  [mbiemri] VARCHAR(30) NULL,
  [email] VARCHAR(30) NULL,
  [username] VARCHAR(20) NULL,
  [userPW] VARCHAR(70) NULL,
  [aksesi] INT NULL CONSTRAINT [DF__Perdorues__akses__38996AB5] DEFAULT ((0)) ,
  CONSTRAINT [PK__Perdorue__CB9A1CDFC4C4A0AA] PRIMARY KEY ([userID]),
  CONSTRAINT [UQ__Perdorue__F3DBC5728A6B6DAE] UNIQUE ([username])
);
CREATE TABLE [dbo].[Porosit] ( 
  [idPorosia] INT IDENTITY NOT NULL,
  [totaliPorosis] DECIMAL(18,2) NULL,
  [dataPorosis] DATE NULL CONSTRAINT [DF__Porosit__dataPor__398D8EEE] DEFAULT (getdate()) ,
  [statusiPorosis] VARCHAR(30) NULL CONSTRAINT [DF__Porosit__statusi__3A81B327] DEFAULT ('Ne Procesim') ,
  [idKlienti] INT NULL,
  CONSTRAINT [PK__Porosit__A9F27D2AB271ADFC] PRIMARY KEY ([idPorosia])
);
CREATE TABLE [dbo].[Produkti] ( 
  [produktiID] INT IDENTITY NOT NULL,
  [emriProduktit] TEXT NULL,
  [pershkrimi] TEXT NULL,
  [fotoProduktit] VARCHAR(40) NULL CONSTRAINT [DF__Produkti__fotoPr__3B75D760] DEFAULT ('produktPaFoto.png') ,
  [kompaniaID] INT NULL,
  [kategoriaID] INT NULL,
  CONSTRAINT [PK__Produkti__76A3DFCF91A50347] PRIMARY KEY ([produktiID])
);
CREATE TABLE [dbo].[RegjistrimiStokut] ( 
  [idRegjistrimit] INT IDENTITY NOT NULL,
  [dataRegjistrimit] DATETIME NULL CONSTRAINT [DF__Regjistri__dataR__753864A1] DEFAULT (getdate()) ,
  [stafiID] INT NULL,
  [totaliProdukteveRegjistruara] INT NULL,
  [shumaTotaleRegjistrimit] DECIMAL(18,2) NULL,
  [shumaTotaleBlerese] DECIMAL(18,2) NULL,
  CONSTRAINT [PK_RegjistrimiStokut] PRIMARY KEY ([idRegjistrimit])
);
CREATE TABLE [dbo].[RoleClaims] ( 
  [Id] INT IDENTITY NOT NULL,
  [RoleId] NVARCHAR(MAX) NULL,
  [ClaimType] NVARCHAR(MAX) NULL,
  [ClaimValue] NVARCHAR(MAX) NULL,
  CONSTRAINT [PK_RoleClaims] PRIMARY KEY ([Id])
);
CREATE TABLE [dbo].[Roles] ( 
  [Id] NVARCHAR(450) NOT NULL,
  [Name] NVARCHAR(MAX) NULL,
  [NormalizedName] NVARCHAR(MAX) NULL,
  [ConcurrencyStamp] NVARCHAR(MAX) NULL,
  CONSTRAINT [PK_Roles] PRIMARY KEY ([Id])
);
CREATE TABLE [dbo].[StokuQmimiProduktit] ( 
  [produktiID] INT NOT NULL,
  [sasiaNeStok] INT NULL CONSTRAINT [DF__StokuProd__sasia__6F7F8B4B] DEFAULT ((0)) ,
  [qmimiBleres] DECIMAL(18,2) NULL CONSTRAINT [DF__StokuQmim__qmimi__595B4002] DEFAULT ((0)) ,
  [qmimiProduktit] DECIMAL(18,2) NULL CONSTRAINT [DF__StokuQmim__qmimi__595B3222] DEFAULT ((0)) ,
  [dataKrijimit] DATETIME NULL CONSTRAINT [DF__StokuProd__dataK__7073AF84] DEFAULT (getdate()) ,
  [dataPerditsimit] DATETIME NULL CONSTRAINT [DF__StokuProd__dataP__7167D3BD] DEFAULT (getdate()) ,
  CONSTRAINT [PK_StokuProduktit] PRIMARY KEY ([produktiID])
);
CREATE TABLE [dbo].[TeDhenatEPorosis] ( 
  [idDetajet] INT IDENTITY NOT NULL,
  [qmimiTotal] DECIMAL(18,2) NULL,
  [sasiaPorositur] INT NULL,
  [idPorosia] INT NULL,
  [idProdukti] INT NULL,
  [kodiZbritjes] VARCHAR(12) NULL,
  CONSTRAINT [PK__TeDhenat__494F491F84D65D51] PRIMARY KEY ([idDetajet])
);
CREATE TABLE [dbo].[TeDhenatPerdoruesit] ( 
  [userID] INT NOT NULL,
  [nrKontaktit] VARCHAR(15) NULL,
  [qyteti] VARCHAR(20) NULL,
  [zipKodi] INT NULL,
  [adresa] VARCHAR(40) NULL,
  CONSTRAINT [PK_TeDhenatPerdoruesit] PRIMARY KEY ([userID])
);
CREATE TABLE [dbo].[TeDhenatRegjistrimit] ( 
  [id] INT IDENTITY NOT NULL,
  [idRegjistrimit] INT NULL,
  [idProduktit] INT NULL,
  [sasiaStokut] INT NULL,
  [qmimiBleres] DECIMAL(18,2) NULL,
  [qmimiShites] DECIMAL(18,2) NULL,
  CONSTRAINT [PK_TeDhenatRegjistrimit] PRIMARY KEY ([id])
);
CREATE TABLE [dbo].[UserClaims] ( 
  [Id] INT IDENTITY NOT NULL,
  [UserId] NVARCHAR(MAX) NULL,
  [ClaimType] NVARCHAR(MAX) NULL,
  [ClaimValue] NVARCHAR(MAX) NULL,
  CONSTRAINT [PK_UserClaims] PRIMARY KEY ([Id])
);
CREATE TABLE [dbo].[UserLogins] ( 
  [UserId] NVARCHAR(450) NOT NULL,
  [LoginProvider] NVARCHAR(MAX) NULL,
  [ProviderKey] NVARCHAR(MAX) NULL,
  [ProviderDisplayName] NVARCHAR(MAX) NULL,
  CONSTRAINT [PK_UserLogins] PRIMARY KEY ([UserId])
);
CREATE TABLE [dbo].[UserRoles] ( 
  [RoleId] NVARCHAR(450) NOT NULL,
  [UserId] NVARCHAR(MAX) NULL,
  CONSTRAINT [PK_UserRoles] PRIMARY KEY ([RoleId])
);
CREATE TABLE [dbo].[UserTokens] ( 
  [Value] NVARCHAR(450) NOT NULL,
  [UserId] NVARCHAR(MAX) NULL,
  [LoginProvider] NVARCHAR(MAX) NULL,
  [Name] NVARCHAR(MAX) NULL,
  CONSTRAINT [PK_UserTokens] PRIMARY KEY ([Value])
);
CREATE TABLE [dbo].[Users] ( 
  [Id] NVARCHAR(450) NOT NULL,
  [UserName] NVARCHAR(MAX) NULL,
  [NormalizedUserName] NVARCHAR(MAX) NULL,
  [Email] NVARCHAR(MAX) NULL,
  [NormalizedEmail] NVARCHAR(MAX) NULL,
  [EmailConfirmed] BIT NOT NULL,
  [PasswordHash] NVARCHAR(MAX) NULL,
  [SecurityStamp] NVARCHAR(MAX) NULL,
  [ConcurrencyStamp] NVARCHAR(MAX) NULL,
  [PhoneNumber] NVARCHAR(MAX) NULL,
  [PhoneNumberConfirmed] BIT NOT NULL,
  [TwoFactorEnabled] BIT NOT NULL,
  [LockoutEnd] DATETIMEOFFSET NULL,
  [LockoutEnabled] BIT NOT NULL,
  [AccessFailedCount] INT NOT NULL,
  CONSTRAINT [PK_Users] PRIMARY KEY ([Id])
);
CREATE TABLE [dbo].[ZbritjaQmimitProduktit] ( 
  [produktiID] INT NOT NULL,
  [qmimiPaZbritjeProduktit] DECIMAL(18,2) NULL CONSTRAINT [DF__StokuQmim__qmimi__595B1234] DEFAULT ((0)) ,
  [qmimiMeZbritjeProduktit] DECIMAL(18,2) NULL CONSTRAINT [DF__StokuQmim__qmimi__595B1123] DEFAULT ((0)) ,
  [dataZbritjes] DATETIME NULL CONSTRAINT [DF__StokuProd__dataK__7073AF11] DEFAULT (getdate()) ,
  [dataSkadimit] DATETIME NULL CONSTRAINT [DF__ZbritjaQm__dataS__070CFC19] DEFAULT (getdate()) ,
  CONSTRAINT [PK_ZbritjaQmimitProduktit] PRIMARY KEY ([produktiID])
);
CREATE TABLE [dbo].[__EFMigrationsHistory] ( 
  [MigrationId] NVARCHAR(150) NOT NULL,
  [ProductVersion] NVARCHAR(32) NOT NULL,
  CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
);
TRUNCATE TABLE [dbo].[ContactForm];
TRUNCATE TABLE [dbo].[KategoriaProduktit];
TRUNCATE TABLE [dbo].[KodiZbritjes];
TRUNCATE TABLE [dbo].[Kompania];
TRUNCATE TABLE [dbo].[Perdoruesi];
TRUNCATE TABLE [dbo].[Porosit];
TRUNCATE TABLE [dbo].[Produkti];
TRUNCATE TABLE [dbo].[RegjistrimiStokut];
TRUNCATE TABLE [dbo].[RoleClaims];
TRUNCATE TABLE [dbo].[Roles];
TRUNCATE TABLE [dbo].[StokuQmimiProduktit];
TRUNCATE TABLE [dbo].[TeDhenatEPorosis];
TRUNCATE TABLE [dbo].[TeDhenatPerdoruesit];
TRUNCATE TABLE [dbo].[TeDhenatRegjistrimit];
TRUNCATE TABLE [dbo].[UserClaims];
TRUNCATE TABLE [dbo].[UserLogins];
TRUNCATE TABLE [dbo].[UserRoles];
TRUNCATE TABLE [dbo].[UserTokens];
TRUNCATE TABLE [dbo].[Users];
TRUNCATE TABLE [dbo].[ZbritjaQmimitProduktit];
TRUNCATE TABLE [dbo].[__EFMigrationsHistory];
SET IDENTITY_INSERT [dbo].[ContactForm] ON;
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi]) VALUES (1, 1, 'string', '2023-04-02T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi]) VALUES (2, 1, 'Twst', '2023-04-02T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi]) VALUES (3, 2, '53eddfgfh', '2023-04-02T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [mesazhi], [dataDergeses], [statusi]) VALUES (4, '53eddfgfh', '2023-04-03T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (5, 'asfasf', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'asda', 'test@email.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (6, 'asfasf', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'asda', 'test@email.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (7, 'asfasf', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'asda', 'test@email.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (8, 'asdad', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'asda', 'asdasd');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (9, 'afasf', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'asda', 'asdad');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (10, 'afasf', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'asda', 'asdad');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (11, '', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', '', 'asd');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (12, 'asda', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'r.kycyku.12@gmail.com', 'r.kycyku.12@gmail.com');
SET IDENTITY_INSERT [dbo].[ContactForm] OFF;
SET IDENTITY_INSERT [dbo].[KategoriaProduktit] ON;
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (1, 'Smartphone dhe Aksesore', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (2, 'Laptope', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (3, 'Smart Watch dhe Aksesore', 'Ore te menqura te markave te ndryshme');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (4, 'Foto & Video', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (5, 'Audio dhe Kufje', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (6, 'All in One (AiO) PC', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (7, 'TV & Projektor', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (8, 'Maus & Aksesore', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (9, 'Lodra smart & Dron', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (10, 'Pjes� p�r kompjuter', 'Pjese te ndryshme per kompjuter, si: Ram, Procesor, GPU etj.');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (11, 'Wireless Charger', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (12, 'Tablet dhe Aksesore', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (13, 'Paisje Gaming', 'Fanella, Karrige dhe te tjera');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (14, 'Printer dhe Paisje per Printer', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (15, 'Kabllo te ndryshme & Adapter', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (16, 'Monitor', '');
SET IDENTITY_INSERT [dbo].[KategoriaProduktit] OFF;
INSERT INTO [dbo].[KodiZbritjes] ([kodi], [dataKrijimit], [qmimiZbritjes]) VALUES ('3PBUDC', '2023-05-07T20:35:45.640Z', 123666);
INSERT INTO [dbo].[KodiZbritjes] ([kodi], [dataKrijimit], [qmimiZbritjes], [idProdukti]) VALUES ('4YUNOE', '2023-05-07T20:36:01.233Z', 123, 51);
INSERT INTO [dbo].[KodiZbritjes] ([kodi], [dataKrijimit], [qmimiZbritjes]) VALUES ('S00TQQ', '2023-05-07T20:35:52.027Z', 123);
SET IDENTITY_INSERT [dbo].[Kompania] ON;
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (1, 'Apple', 'AppleLogo.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo]) VALUES (2, 'Amd', 'AMDLogo.png');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo]) VALUES (3, 'Asus', 'AsusLogo.png');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo]) VALUES (4, 'JBL', 'JBL.png');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (5, 'Lenovo', 'Lenovo.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (6, 'Logitech', 'Logitech.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (7, 'MSI', 'MSI.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (8, 'Nvidia', 'Nvidia.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (9, 'Razer', 'Razer.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (10, 'Samsung', 'SamsungLogo.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (11, 'SteelSeries', '63cc8f01dacf35.52923644.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (12, 'Thermaltake', '63cc904665b4c8.92639137.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (13, 'DJI', '63cc90567d1235.30779652.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (14, 'Overmax', '63cc90641f4676.38918423.jpg', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (15, 'G.Skill', '63cc9106dcdca0.15849659.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (16, 'Akasa', '63cc916f505f64.49149237.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (17, 'Corsair', '63cc919875a410.74994322.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (18, 'WD - Western Digital', '63cc923d6652a6.82761403.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (19, 'HP', '63cc929ca61d21.63137864.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (20, 'Acer', '63cc92dd919978.62580492.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (21, 'ZOWIE - BenQ', '63cc933025a1f3.70979396.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (22, 'Marvo', '63cc93503bc070.76804317.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (23, 'Arctic', '63cc945c98f987.79971283.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (24, 'Transcend', '63cc94dc60f873.30313171.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (25, 'Dell', '63cc95f0a30e93.21744349.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (26, 'Instax', '63eabba55fbfc7.49583109.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (27, 'Canon', '63eabbd2c18639.05511269.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (28, 'Sony', '63eabc0946e731.30555181.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (29, 'SENSE7', '63eabcbde6e353.90404410.jpeg', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (30, 'Preyon', '63eabd4a55ae01.00211971.svg', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (31, 'Gjirafa50', '63f5ea779c6482.16567878.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (32, 'Lenuo', '63f5ea98f28fb2.30089124.jpg', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (33, 'Intel', '63f5eaa81a4847.00442944.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (34, 'AXAGON', '63f5eab4b1f247.31552576.jpg', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (35, 'FIXED', '63f5ebb63fe7d9.83256153.png', '');
SET IDENTITY_INSERT [dbo].[Kompania] OFF;
SET IDENTITY_INSERT [dbo].[Perdoruesi] ON;
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (1, 'Llogaria', 'User', 'test@rmail.com', 'user', '$2y$10$juI.BOzWW1giyHJ1D9.Hje.mOPSGAFDgB..C9ACJkSZ1cKZchCTPa', 0);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (2, 'Llogaria', 'Adminit', 'admin@gmail.com', 'admin', '$2y$10$bWkaCvfxf/k4bZMSbP2rbOHEk7NTOx9UmBjSrpOYnyMACCEq99rNa', 2);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (3, 'Llogaria', 'Menagjimit', 'menagjim@gmail.com', 'menagjim', '$2y$10$eepxMAnYPktEBl0dWRhOU.oC7S2FO2GrlxTOJuTk8YhUFNcIIRYcy', 1);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (4, 'Filan', 'Fisteku', 'filan@gmail.com', 'filani', '$2y$10$fdiuTd/R7hN.oKAaZHycoeVd.cIgIJiNriOjMlyvOhnO6xFKwGAn.', 0);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (5, 'Perparim', 'Dardhishta', 'perparim.dardhishta@gmail.com', 'perparimd', '$2y$10$X/IwYW7TA.iSqgOKNDEoaejZUUn1Qv7.Xt4.ZnWYFPYDyrrNQPClC', 2);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (6, 'Rilind', 'Ky�yku', 'r.kycyku.12@gmail.com', 'rkycyku', '$2y$10$RU7djgxAPPVNRR1A0uIOZuELNOsTGryD37nm4u3Mcc/5nWAfkp3m2', 2);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (7, 'Filane', 'Fisteku', 'filane.fistekuu@hotmail.com', 'filane', '$2y$10$cCLaFjhVB84TiwYrbPsuFObh3VN/r62GstzGcMcuW3InIQIEeu3cK', 0);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (8, 'Arber', 'Krasniqi', 'arberk@gmail.com', 'arberk', '$2y$10$cPSrPpH.gX/F/YuhkUbzveGNPYCPFLT.ZvVLhqxSYhSWsXy462vYC', 0);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (9, 'Drita', 'Gashi', 'dritag@hotmail.com', 'dritag', '$2y$10$BcFj6o3kdwyaQUNSU6zxdOqpFwcS291SzyA8weEj8cWJA465qvByK', 0);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (10, 'Lirim', 'Shala', 'lirimsh@yahoo.com', 'lirimsh', '$2y$10$MQq.GzmgUpIc04m6qRL2fuCG6Pbr9v.DvAe82p3bRt2GWWooRnU6S', 0);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (11, 'Elona', 'Qorraj', 'elonaq@outlook.com', 'elonaq', '$2y$10$xrOGFueQq4xM3SMYPmaM7eXy5zNgZUu70alQJUEOsdLfaBgU6kkB2', 0);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (12, 'Besmir', 'Sula', 'besmirs@protonmail.com', 'besmirs', '$2y$10$jW9nYJ5bLVXQRVonUAWEdeS8GH2BApaYgpnwbHKFxXsnh9uArFkya', 0);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (13, 'Flaka', 'Krasniqi', 'flakak@icloud.com', 'flakak', '$2y$10$AOpIj4UlUcaX46NVrKNl5OFjryUxyczzlk0rz6NuDTuu3nFOP2jlC', 0);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (14, 'Labinot', 'Gashi', 'labig@live.com', 'labinotg', '$2y$10$005CoHNvo74QkunTxvbMieBpksoA3XI80YHyk/UAnJ/N3P/z5HYZi', 0);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (15, 'Vesa', 'Shala', 'vesas@ymail.com', 'vesash', '$2y$10$lgJP5oGdRLFVCevycDXTk.RrJTENht9AD2UC9p2fIz2nHml/WgC7.', 1);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (16, 'Ardian', 'Qorraj', 'ardianq@aol.com', 'ardianq', '$2y$10$aX0hjrVGqnmabaoIIG17pOJeiSrBqxa3Rak6LuJX6gpZkrEMAtR.C', 0);
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES (17, 'Edona', 'Sula', 'edonas@rocketmail.com', 'edonas', '$2y$10$ttnZDkeekdeFQbz/YcV3BO5FpYwsDn24QTlI3LR6.0CHzWkC4ydui', 1);
SET IDENTITY_INSERT [dbo].[Perdoruesi] OFF;
SET IDENTITY_INSERT [dbo].[Porosit] ON;
SET IDENTITY_INSERT [dbo].[Porosit] OFF;
SET IDENTITY_INSERT [dbo].[Produkti] ON;
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (1, 'Laptop ASUS TUF Gaming F15 (2021), 15.6"', 'Ky laptop �sht� i pajisur me karakteristika t� shk�lqyeshme. Ai mund�sohet nga nj� procesor 6-core Intel Core i5 11400H q� funksionon me nj� frekuenc� 2.7 GHz deri n� 4.5 GHz. Procesori plot�sohet me 16 GB DDR4 SODIMM (slot). Hard disku 512 GB SSD M.2 PCIe NVMe sh�rben p�r t� dh�nat. Disku optik mungon. T� dh�nat e figur�s p�r ekranin 15.6 " IPS me rezolucion 1920 x 1080 (Full HD) piksel jan� siguruar nga kartela grafike NVIDIA GeForce RTX 3050Ti. Prej nd�rfaqeve p�rfshin HDMI 2.0, mb�shtetje DisplayPort, RJ-45, 3 porte USB 3.0/3.1/3.2 Gen 1 Type-A dhe 1x Thunderbolt 4/USB4. Poashtu, laptopi mb�shtet standardet Wi-Fi a / b / g / n / ac / ax dhe Bluetooth v5.2. Lloji i kart�s s� rrjetit GLAN, WLAN. Nd�r karakteristikat e tjera laptopi ka nj� tastier� me ndri�im dhe me taste numerike. Poashtu, p�rfshihen 2 altoparlant� 2W. Bateria ka kapacitet 3-cell, 48Wh. Fuqia maksimale e furnizimit me energji 180 W. Laptopi vjen me sistemin operativ Windows 11 Home.', '63e90dd68362c0.14152620.webp', 3, 2);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (2, 'Laptop Razer Blade 15 Advanced Model', '', '63d055e0c57d81.05756611.webp', 9, 2);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (3, 'Celular Samsung Galaxy S22 Ultra, 6.8", 12GB RAM, 512GB, i zi', 'Dizajni i holl� dhe elegant i Galaxy S22 Ultra fsheh fotografi t� pafundme dit�n dhe nat�n, nj� studio pune profesionale dhe ve�ori novatore q� ju mbajn� larg duarve. �ipi grafik p�rdor arkitektur�n e avancuar RDNA 2 t� AMD dhe teknologjin� Ray Tracing p�r t� ofruar nj� p�rvoj� vizuale t� nivelit t� lart� me ndri�im realist t� sken�s. Me nj� maksimum verbues prej 1750 nits, Galaxy S22 Ultra �sht� nj� nga telefonat m� t� ndritsh�m nga Samsung ndonj�her� dhe ekran Dynamic AMOLED 2X me Vision Booster, bllokon n� m�nyr� efektive shk�lqimin e bezdissh�m n� ekran. Kamera e pasme ka nj� rezolucion prej 108 + 12 + 10 + 10 Mpx, kurse kamera e p�rparme 40 Mpx.', '63d055e915be98.37912983.webp', 10, 1);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (4, 'Lenovo NB IdeaPad 3 15ALC6', '', '63d055f15d73c8.42300026.webp', 5, 2);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (5, 'Lenovo ThinkPad P14s Gen 3 (AMD), 14", AMD Ryzen 7 Pro, 32GB RAM, 1TB SSD, AMD Radeon 680M, i zi', '', '63d055feb6ffa9.20196181.webp', 5, 2);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (6, 'Maus pad SteelSeries QcK Heavy M', '', '63d05608dd9912.15133010.webp', 11, 8);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (7, 'Maus pad SteelSeries QcK Edge XL', '', '63d0561088af36.99850110.webp', 11, 8);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (8, 'Dron DJI Ryze Tello ED', '', '63d0561af0d506.97064987.webp', 13, 9);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (9, 'Dron Overmax X-Bee, 600 m, i zi', '', '63d056224fcfd5.12230564.webp', 14, 9);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (10, 'Dron DJI Mavic 3 Classic (DJI RC)(EU)', 'Mavic 3 Classic me performanc� t� lart� fluturimi dhe nj� kamer� Hasselblad p�rfaq�son cil�sin� m� t� lart� t� imazhit. P�r t� kapur ngjyrat natyrale t� Mavic 3 Classic si kamerat e tjera Hasselblad, lentja L2D-20c p�rdor t� nj�jtat standarde k�rkuese dhe ka kalibruar �do piksel sensori me HNCS t� integruar. Modaliteti video Night Images optimizon fotot n� drit� t� ul�t, t� tilla si per�ndimet dhe lindjet e diellit, dhe redukton zhurm�n p�r shkrepje m� t� pastra. Kjo jo vet�m q� e b�n m� t� leht� fluturimin n� distanca t� gjata, por gjithashtu ndihmon n� reduktimin e l�kundjeve manuale dhe siguron l�vizje m� t� qet� t� kamer�s. Mavic 3 Classic mund t� fluturoj� n� nj� lart�si t� caktuar dhe m� pas t� gjej� nj� rrug� t� sigurt dhe efikase t� kthimit n� pik�n e tij fillestare, duke kombinuar avantazhet e RTH t� avancuar dhe RTH tradicionale dhe duke i lejuar p�rdoruesit t� zgjedhin opsionin m� t� mir� sipas mjedisit.', '63d0562b618d48.16102205.webp', 13, 9);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (11, 'Kas� Thermaltake Core P3, e bardh�', 'Core P3 TG �sht� nj� kas� me korniz� t� hapur me aft�si t� jasht�zakonshme shikimi. Paneli i p�rparm� i xhamit t� kalbur me trash�si 5 mm garanton q�ndrueshm�rin� e dritares dhe e shfaq nd�rtimin tuaj me qart�si t� qart�. P�rdoruesit mund t� shikojn� plot�sisht �do komponent t� sistemit dhe t� tregojn� p�rkushtimin dhe grupin e aft�sive t� tyre. Kasa �sht� e p�rshtatshme me pllakat am� ATX, Micro ATX (uATX), Mini ITX. Mund t� instaloni kart� grafike me gjat�si maksimale 45cm. N� panelin e p�rparm� kasa ka 2x USB 2.0, 2x USB 3.0, lidh�s p�r kufje dhe mikrofon.', '63d056323276c7.81542918.webp', 12, 10);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (12, 'Flutur ftoh�se Arctic P14 PWM - 140 mm', '', '63d0563b7f0dd0.69298527.webp', 23, 10);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (13, 'Memorie G. Skill DDR4, 8 GB, 2400 MHz, CL17', 'Memoria e till� G.Skill RAM prej 8 GB do t� garantoj� komoditet t� lart� p�rdorimi p�r shum� aplikacione. Njer�zit q� presin performanc� maksimale dhe kursime t� larta t� energjis� duhet t� arrijn� te memoria DDR4. Nj� memorie e till� do tju lejoj� t� arg�toheni me performanc� t� shk�lqyer t� operimit. N�se kompjuteri ngadal�sohet pas nj�far� kohe, do t� jet� e mundur t� zgjerohet memoria RAM. Vonesa CL17 do tju lejoj� t� punoni rehat me programet e zyr�s, si dhe me shum� loj�ra k�rkuese. Tensioni prej 1.2 V fuqizon �ipat e memories DDR4, q� do t� thot� 20% konsum m� t� ul�t t� energjis� n� krahasim me DDR3 dhe gjer�si bande m� t� lart�. Ky variant do t� jet� nj� zgjidhje perfekte p�r p�rdoruesit q� presin pun� t� rehatshme dhe, n� t� nj�jt�n koh�, kursime t� larta t� energjis�.', '63d056492e89d5.21517717.webp', 15, 10);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (14, 'SSD Transcend MTE220S, M.2 - 256GB', '', '63d0567a1432f3.30627468.webp', 24, 10);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (15, 'Ftoh�s Akasa DDR, aRGB LED, pasiv (AK-MX248)', '', '63d05689da6022.83633684.webp', 16, 10);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (16, 'P�rshtat�s i brendsh�m Akasa AK-CBUB37-50BK', '', '63d056a353ba19.29349886.webp', 16, 15);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (17, 'Ftoh�s Corsair ML120 PRO RGB, 120mm', '', '63d056ab22eb80.78302695.webp', 17, 10);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (18, 'Past� Arctic MX-4 2019 (4g)', '', '63d056b3c3cc68.15404951.webp', 23, 10);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (19, 'Hard disk SSD WD Green SATA III - 240GB 3D NAND', 'WD Green �sht� hard disk SSD p�r kompjuter apo laptop q� ju sjell performanc� t� shpejt� t� transferimit t� t� dh�nave dhe ruajtjes s� tyre me siguri t� plot�. Luajtja e videoloj�rave, qasja n� internet apo ndezja e sistemit operativ arrihen disa her� m� shpejt� sesa hard disqet HDD. Aksesori vjen me kapacitet prej 240GB, mund t� lidhet me kompjuter n�p�rmjet platform�s SATA III 6 Gb / s dhe �sht� nd�rtuar p�r konsumim t� ul�t t� energjis� dhe operim afatgjat�. Formati i produktit �sht� 2.5" dhe mund t� arrij� deri n� 545 MB / s shpejt�si.', '63d056bd110280.38041391.webp', 23, 10);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (20, 'Kompjuter AIO Acer Veriton Essential Z (EZ2740G),23.8", Intel Core i5-1135G7, 8 GB DDR4, 512GB SSD, Intel UHD Graphics, i argjendt�', '', '63d056c7197425.11040451.webp', 20, 6);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (21, 'Kompjuter Dell Inspiron 24 (5415), 23.8 ", AMD Ryzen 5, 16GB RAM, 256GB SSD, 1TB HDD, AMD Radeon Graphics, i bardh�', '', '63d056d11496d3.86492053.webp', 25, 6);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (22, 'Kompjuter HP ENVY 34-c1001nc, 34", Intel Core i7, 32GB RAM, 1TB SSD, NVIDIA GeForce RTX 3060, i argjendt�', '', '63d056dd5bc157.84233223.webp', 19, 6);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (23, 'Apple iMac 24", M1 8-core, 8GB, 256GB, 8-core GPU, Green', 'IMac i ri �sht� nj� hap i madh p�rpara n� ekosistemin e ri t� Apple me p�rdorimin e platform�s s� fuqishme M1, i cili ka nj� performanc� t� shk�lqyeshme n� nj� dizajn t� ri me teknologji t� leht� p�r tu p�rdorur. Pik�risht at� q� prisni nga nj� iMac i ri.rnrnPoashtu, ky kompjuter posedon nj� ekran Apple iMac 24 4.5K Retina AiO me diagonale 24" dhe nj� rezolucion 4.5K prej 4480 � 2520 piksel�. Performanca e tij �sht� e nd�rtuar n� nj� procesor 8-b�rthamor Apple M1 me GPU 8-b�rtham� dhe 16-core Neural Engine dhe gjithashtu p�rfshin 8 GB RAM. Nd�rsa, p�r sistemin, t� dh�nat dhe aplikacionin jan� t� dizajnuara 256 GB SSD, kamera t� integruar FaceTime HD 1080p dhe WiFi p�r komunikim wireless Gigabit Ethernet, duke p�rfshir� Bluetooth 5.0 2x Thunderbolt 4 / Type-C. P�rve� k�saj, Apple iMac 24 "4.5K Retina M1 posedon 2 porte USB Type-C 3.1 / 3.2 Gen 2 dhe 3.5 mm p�r kufje, si dhe operon me sistemin operativ Big Sur.', '63d056e8dc0484.98868210.webp', 1, 6);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (24, 'Projektor Acer C202i', 'The Acer C202i projector offers high-quality visual performance with 300 lumens and 5000:1 contrast ratio using DLP technology for 3D viewing, smooth video, and high color contrast. It has an HDMI port for quick and convenient connection to various high-resolution sources, a built-in USB port for external media players, and can project at a short distance of 0.73 meters with a WVGA resolution of 854x480 and a 16:9 aspect ratio. The projector has a lamp life of up to 30,000 hours in Eco mode, with a 1x2W internal speaker and an integrated battery for up to 5 hours of operation. It also features USB, HDMI, and 3.5mm Jack interfaces.', '63d056f36c8ac5.29677040.webp', 20, 7);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (25, 'Maus ZOWIE by BenQ S1,i zi', '', '63d056fddef055.63527829.webp', 21, 8);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (26, 'Maus Marvo M720W, i zi', '', '63d057056d4e38.57263102.webp', 22, 8);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (27, 'Apple MacBook Pro 16", M2 Max 12-Core, 32GB, 1TB, 38-Core GPU, Silver', 'Performanca e p�rshtatur p�r profesionist�t. MacBook Pro 16 M2 Max i ri vjen me nj� ekran 16" dhe performanca e tij i shtyn kufijt� imagjinar� n� nj� nivel t� ri. Arkitektura e p�rmir�suar ndjesh�m e M2 Max thjesht ka fuqi brutale p�r t� gjitha idet� tuaja krijuese. Dhe ajo q� v�reni n� shikim t� par� �sht� dizajn elegant me theks n� cil�sin� e p�rpunimit.', '63d05c06aa8757.25439961.webp', 1, 2);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (28, 'Kufje Logitech G432, t� zeza', 'Kufje t� fuqishme por shum� t� rehatshme 50mm. X 2.0 mb�shtetja e z�rit shtes� e gjenerat�s s� ardhshme. Dizajnuar p�r p�rdorim me t� gjitha platformat e loj�rave dhe pajisjet mobile, USB DAC dhe lidh�s 3.5mm. Ata jan� n� p�rputhje me PC, Mac, PS4, Xbox One, Nintendo Switch dhe gjithashtu me pajisje t� l�vizshme. Mikrofoni 6mm me funksionin "mute". 107 dB ndjeshm�ri SPL / MW. P�rgjigjja frekuencore 20 - 20,000 Hz. Impedanc� 39 Ohm (pasive), 5 kiloohm (aktive). Gjat�sia e kabllit 2 m. T� lehta me pesh� prej 303 g (me kabllo). P�rmasat 172 x 81.7 x 182 mm.', '63eab827ba77c4.71044525.webp', 6, 15);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (29, 'Hard disk Samsung SSD 970 EVO PLUS, M.2 - 250GB', '', '63eab84858c8d7.45002641.webp', 10, 10);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (30, 'Disk portativ WD Elements, 2TB, i zi', 'WD Elements ofron nj� hard disk portativ dhe modern. Me kapacitet 2 TB dhe pesh� t� leht� (vet�m 230 gram), ofron shum� hap�sir� p�r nj� s�r� t� dh�nash. Pjesa e tij p�rb�r�se �sht� nj� mbules� e fort�, duke e b�r� diskun m� rezistent ndaj d�mtimit. Ruajtja mb�shtet pa probleme pajisjet e fundit USB 3.0 dhe gjithashtu �sht� i pajtuesh�m me kompjuter�t USB 2.0. Pajisja n� modalitetin USB 3.0 transferon deri n� 5 Gb / s, n�se e lidhni at� me nj� kompjuter q� mb�shtet USB 2.0, do t� duhet t� jeni m� i ngadalt�, por gjithsesi i mjaftuesh�m i shpejt� maksimal teorik deri n� 480 Mb / s. Disku �sht� i formatuar nga fabrika me NTFS dhe �sht� n� p�rputhje me Windows 8, Windows 7, Windows Vista dhe Windows XP. Ato mund t� riformatohen pa v�shtir�si p�r sistemet Mac. Kjo b�n t� mundur q� pronar�t e kompjuterave me sisteme t� ndryshme operative t� p�rdorin diskun. Dimensionet e tij jan� 21 x 111 x 82mm.', '63eab88a9bae20.95606749.webp', 18, 10);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (31, 'Disk i jasht�m Transcend Jet 25H3B, 1 TB, i zi / kalt�r', '', '63eab963cfcf35.02921447.webp', 24, 10);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (32, 'Apple MacBook Pro 16.2", M1 Max 10-core, 32GB, 1TB, 32-core GPU, Silver', '', '63eab99c203254.93655263.webp', 1, 2);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (33, 'Apple iPhone 11, 64GB, Black', '', '63eab9e5b821b1.87284331.webp', 1, 1);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (34, 'Apple Magic Mouse (2022), Black Multi - Touch Surface', '', '63eab9ff27af71.66828407.webp', 1, 8);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (35, 'Celular Samsung Galaxy A23 5G, 6.6" FHD+, 4GB RAM, 128GB, i kalt�r', 'This is a mobile phone with a 6.6" Full HD+ display and a 120 Hz refresh rate. It has a 50 MPx camera, an ultra-wide-angle lens, macro and depth sensors, and an 8 MPx front camera. It is powered by a Qualcomm Snapdragon 695 processor with 8 cores and 4 GB RAM, and has 128 GB of storage with the option to add up to 1 TB with a micro SD card. It supports LTE, Wi-Fi, Bluetooth v5.1, 5G, NF, GPS, BeiDou, QZSS, GLONASS, and Galileo. It runs on Android OS, has a 5000 mAh battery with Super Fast Charging 25W, and weighs 197 g with dimensions of 165.4 x 76.9 x 8.4 mm.', '63eaba204edb24.98379543.webp', 10, 1);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (36, 'Apple Watch SE2 GPS 44mm, Midnight Aluminium Case me Midnight Sport Band, Regular', '', '63eaba4ebf5fb1.84174295.webp', 1, 3);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (37, 'Fotoaparat momental Fujifilm Instax Mini 90, i zi', '', '63eabd7f7f4296.27491084.webp', 26, 4);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (38, 'Printer Canon PIXMA TS3150, i zi', 'Printeri CANON PIXMA TS3150 �sht� zgjidhja ideale p�r printim dhe skanim n� zyr�n apo sht�pin� tuaj. Pjes�t p�rb�r�se t� printerit p�rfshijn� printimin me rezolucion 4800 x 1200 dpi, portin USB 2.0, teknologjin� Wi-Fi dhe ka madh�si 435 � 316 � 145 mm. Fal� lidhjes me WI-FI ju mund t� printoni edhe nga telefon�t tuaj qoft� ai Android apo IOS. N� pako p�rfshihet : PG-545 (i zi ) CL-546 (me ngjyr� ) PG-545XL (i zi ) - opsional CL-546XL (me ngjyr� ) - opsional', '63eabdbea539b0.78235909.webp', 27, 14);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (39, 'Kufje Sony MDR-RF895RK, t� zeza, III', '', '63eabdd87c2561.68876767.webp', 28, 5);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (40, 'Kontroller Sony Playstation 5 DualSense', '', '63eabe14e6ab51.91700813.webp', 28, 13);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (41, 'Karrige SENSE7 Knight, e zez�', '', '63eabe31db73d8.09365222.webp', 29, 13);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (42, 'Maus Preyon Owl Wireless (POW35B)', 'Mouse Preyon Owl �sht� mouse gaming pa kabllo, mir�po asgj� nuk pengon lidhjen e tij me nj� kabllo. N�se bateria harxhohet, vet�m lidheni dhe mund t� vazhdoni p�rdorimin e tij. Me 50milion klikime n� p�rdorimin e k�tij mausi q� tregon p�r sigurin� q� jepet kualitetit t� k�tij mausi. Me butona shtes� shum� leht� kontrolloni vlerat DPI dhe frekuenc�n e p�rdorur. Me LED q� tregojn� vler�n e selektuar leht�.', '63eabe5a5852e1.52076563.webp', 30, 8);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (43, 'Apple 10.9-inch iPad (10th) Wi-Fi, 64GB, Silver', '', '63eabe72174975.16788497.webp', 1, 12);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (44, 'Apple MagSafe Duo Charger', '', '63eabe936e0523.11456101.webp', 1, 11);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (45, 'Apple AirPods (3rd generation) with Lightning Charging Case', N'AirPods jan� t� lehta dhe ofrojn� nj� dizajn t� konturuar. Mikrofonat me pamje nga brenda zbulojn� at� q� po d�gjoni, m� pas rregullojn� frekuencat e rangut t� ul�t dhe t� mes�m p�r t� ofruar detaje t� pasura n� �do k�ng�.rnrnAirPods kan� nj� jet�gjat�si shtes� t� bateris� n� krahasim me AirPods (gjenerata e dyt�) deri n� 6 or� koh� d�gjimi dhe deri n� 4 or� koh� bisede. Dhe me kutin� e karikimit Lightning, mund t� shijoni deri n� 30 or� koh� totale t� d�gjimit. Si AirPods ashtu edhe kasa e karikimit t� Rrufes� jan� vler�suar me IPX4 rezistente ndaj ujit � k�shtu q� do t� p�rballojn� �do gj�, nga shiu deri tek st�rvitjet e r�nda.', '63eabeae767761.75083362.webp', 1, 5);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (46, 'Karrige SENSE7 Spellcaster, e zez�/e kalt�r', 'Karrigia SENSE7 Spellcaster ka nj� form� q� i p�rshtatet lakimit natyror t� shtyll�s kurrizore dhe, si rezultat, siguron pozicionin e duhur p�rpara kompjuterit kur jeni duke luajtur ose duke punuar. Ajo plot�sohet nga nj� mbushje sfungjer me dend�si optimale, e cila p�rshtatet me trupin dhe siguron rehati. �sht� projektuar p�r njer�zit me pesh� maksimale 150 kg. Karrigia peshon 17.5kg.', '63f23b534f5c52.87433500.webp', 29, 13);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (47, 'Kamer� Logitech StreamCam C980, e hirt�', 'Kjo �sht� nj� kamer� transmetimi me cil�si t� lart�. Ajo ofron nj� cil�si maksimale t� regjistrimit prej 1080p n� 60 korniza p�r sekond�. Ajo p�rdor nd�rfaqen USB 3.2 Gen 1 lloji C p�r tu lidhur me pajisjen. �sht� e pajisur me nj� lente f / 2.0 me nj� gjat�si fokale prej 3.7 mm dhe nj� fush� shikimi prej 78 � (diagonale). Ofron autofokus n� nj� distanc� prej 10 cm deri n� pafund�si. Ka nj� mikrofon t� dyfisht� gjith�p�rfshir�s t� integruar me funksion t� zvog�limit t� zhurm�s. Gjat�sia e kabllos �sht� 1.5 m. Paketa p�rfshin nj� mbajt�s p�r vendosjen e saj n� monitor dhe nj� mbajt�s statik.', '63f5de70338ea0.03180620.webp', 6, 4);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (48, 'Altoparlant JBL CLIP 4, i kalt�r i hapur', 'Altoparlant unik portativ me fuqi dal�se 5 W RMS, p�rgjigje frekuence prej 100 Hz deri 20 kHz, raport sinjal-zhurm� > 85 dB, teknologji Bluetooth 5.1. Bateria e tij polimer litium-jon karikohet p�r 3 or� dhe zgjat deri n� 10 or�. P�rmasat e altoparlantit jan�: 86.3 x 134.5 x 46 mm, pesha 239 g.', '63f5deb8055346.05332264.webp', 4, 5);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (49, 'Ngjyr� p�r printer Canon PGI-571, e kalt�rt', 'Ngjyra e kalt�r Canon CLI-571 �sht� n� p�rputhje me printera Canon PIXMA MG5750, MG5751, MG5752, MG5753, MG6850, MG6851, MG6852, MG6853, MG7750, MG7751, MG7752, MG7753. Kjo ngjyr� ka nj� v�llim prej 7 ml.', '63f5df0fe61cf8.49070509.webp', 27, 14);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (50, 'Maus Razer Pro Click, i bardh�', 'Ky �sht� nj� maus wireless i krijuar p�r p�rdoruesit e djatht�. Mausi ka lidh�s USB, 8 butona dhe nj� rrot� mekanike. Ai ka teknologji wireless Bluetooth, sensor optik dhe ndjeshm�ri maksimale 16,000 DPI.', '63f5e0272928f8.99239124.webp', 9, 8);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (51, 'Karikues Samsung EP-TA12 p�r Samsung micro USB, i zi', '', '63f5e741d05b48.11483682.webp', 10, 15);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (52, 'Apple 20W USB-C Power Adapter', 'Ky �sht� nj� karikues i fuqish�m 20W, i cili p�rdoret p�r karikim t� shpejt� dhe efikas n� sht�pi, n� zyr� dhe gjat� l�vizjes. �sht� i pajtuesh�m me �do pajisje USB-C, por p�r nj� performanc� optimale t� karikimit, Apple rekomandon p�rdorimin e tij me iPad Pro 11'' ose iPad Pro 12,9'' (gjenerata e tret�). Ai gjithashtu mb�shtet karikimin e shpejt� t� iPhone 8.', '63f5e7a904efe1.07954376.webp', 1, 15);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (53, 'Gjirafa50 Bad News Eagles Jersey (Rio Edition) - XXL', 'Ndjeni emocionin e kualifikimit t� dyt� n� Major me fanell�n e Rio Edition t� Bad News Eagles.rnrnKjo fanell� e cil�sis� s� lart� me dizajn modern, e krijuar posa��risht p�r lojtar�t pasionant� t� sporteve elektronike, �sht� krijuar me krenari krahas Gjirafa50.rnrnNgjyra e saj kryesore �sht� e gjelb�r, e njohur si ngjyra dominuese e flamurit komb�tar t� Brazilit.rnrnFanella ka logon e personalizuar t� ekipit BNE dhe �sht� prej 100% poliest�r.', '63f5ec27d0f672.76058981.webp', 31, 13);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (54, 'Gjirafa50 Bad News Eagles Jersey Legends Edition - L', 'Ndjeni emocionet e loj�s me k�t� fanell� t� Legends Stage t� Bad News Eagles t� krijuar posa��risht p�r lojtar�t e apasionuar pas sporteve elektronike. Ngjyra kryesore e saj �sht� e kuqja e kombinuar me detaje bardh e zi dhe ka logon e personalizuar t� ekipit BNE. Fanella �sht� prej 100% poliest�r. Dimensionet jan� 71 x 57 x 25.5 cm.rnrnKjo fanell� e cil�sis� s� lart� me dizajn modern �sht� krijuar me krenari p�rkrah Gjirafa50.', '63f5ec4e91ff92.01429806.webp', 31, 13);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (55, 'Rrip metalik FIXED p�r Apple Watch 38/40/41mm, i argjendt�', 'Rrip metalik z�vend�sues q� �sht� i pajtuesh�m me Apple Watch 38/40 / 41mm. Ky rrip e kthen or�n n� nj� aksesor elegant q� mund ta kombinoni leht�sisht me �do veshje.', '63f5ec798adb88.56368457.webp', 35, 3);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (56, 'Mbrojt�se Lenuo Leshield p�r iPhone 13, e kuqe', 'Mbrojt�se p�r pjes�n e pasme dhe an�sore t� celularit iPhone 13. Mbrojt�sja �sht� prej plastike t� q�ndrueshme dhe do t� siguroj� mbrojtje t� besueshme t� celularit nga g�rvishtjet dhe papast�rtit�. Natyrisht, mbrojt�sja ka prerje p�r kamer�n, butonat dhe portin e karikimit. Ajo �sht� e k�ndshme n� prekje dhe e ruajtur mir�.', '63f5ec9fb0aa89.27408325.webp', 32, 1);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (57, 'Procesor Intel Core i7-12700F', 'Ky �sht� nj� procesor i gjenerat�s s� 12-t� Alder Lake i krijuar p�r priz�n LGA 1700. Ofron 8+4 b�rthama fizike (8 performanc� + 4 efektive, 20 threads). Frekuenca e tyre �sht� 1.6/2.1 GHz dhe deri n� 3.6/4.8 GHz n� modalitetin Turbo (b�rthama efikase/performanc�). Frekuenca maksimale Turbo Boost �sht� deri n� 4.9 GHz. Ai ofron nj� memorie buffer 25 MB SmartCache dhe nj� proces prodhimi 10 nm �sht� p�rdorur p�r krijimin e tij. Mb�shtet memorie deri n� DDR5 4800 MHz dhe DDR4 3200 MHz. Mb�shtet nd�rfaqen PCI-Express 5.0/4.0. TDP e deklaruar nga prodhuesi �sht� 65 W (maksimumi 180 W).', '63f5ecdb56b5d2.54488204.webp', 33, 10);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (58, 'Monitor Dell U3223QE - LED 31.5", 4K UHD, i zi / argjendt�', 'Dell U3223QE �sht� nj� monitor 31.5" me rezolucion t� lart� q� do tju rr�mbej� me ngjyr�n dhe eleganc�n e tij. Rezolucioni 4K (3840 x 2160) me m� shum� se 8 milion� piksele ka nj� rezolucion 4 her� m� t� lart� se nj� monitor klasik Full HD. Ngjyrat jan� t� qarta dhe t� q�ndrueshme p�rgjat� k�ndit t� shikimit. Dell UltraSharp P3222QE �sht� nj� monitor q� mendon gjithashtu p�r sh�ndetin tuaj. Fal� funksionit ComfortView Plus, i cili garanton emetimin vazhdimisht t� ul�t t� drit�s blu, ju do t� shijoni ngjyra t� shk�lqyera.rnrnKarakteristikat e tjera t� monitorit p�rfshijn� raporti i pamjes 16: 9, kontrasti 2000: 1, shpejt�sia e rifreskimit 60 Hz, ndri�imi 400 cd / m2, koha e p�rgjigjes 8 ms n� modalitetin normal ose 5 ms n� modalitetin e shpejt�. Lidh�sit: 1x DP, 1x HDMI, USB-C, 6x USB, 1x RJ-45, pivot. Dimensionet 71.26 cm x 61.88 cm x 23.32 cm, pesha 10.36 k', '63f5ecf98f3534.93172253.webp', 25, 16);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID]) VALUES (59, 'Kabllo AXAGON USB-A - micro USB 3.2 Gen 1 SPEED, 3A, 1m, e zez�', 'Kablloja AXAGON �sht� e p�rshtatshme p�r laptop�, telefont, tablet� dhe pajisje e tjera celulare. Mb�shtet shpejt�sin� e transferimit t� t� dh�nave deri n� 5 Gb / s dhe karikimin deri n� 3A.', '63f5ed187916e2.65869096.webp', 34, 15);
SET IDENTITY_INSERT [dbo].[Produkti] OFF;
SET IDENTITY_INSERT [dbo].[RegjistrimiStokut] ON;
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (1, '2023-05-13T17:20:44.417Z', 2, 2, 16030, 12326);
SET IDENTITY_INSERT [dbo].[RegjistrimiStokut] OFF;
SET IDENTITY_INSERT [dbo].[RoleClaims] ON;
SET IDENTITY_INSERT [dbo].[RoleClaims] OFF;
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (1, 1, 12, 758.5, '2023-05-08T19:09:28.633Z', '2023-05-08T19:09:28.633Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (2, 1, 1, 2710.49, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (3, 1, 1, 899.99, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (4, 1, 1, 459.5, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (5, 1, 1, 2469.5, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (6, 1, 1, 28.5, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (7, 1, 1, 52.5, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (8, 1, 1, 357.99, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (9, 1, 1, 284.49, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (10, 1, 1, 2489.99, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (11, 1, 1, 210.66, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (12, 1, 1, 18.45, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (13, 1, 1, 18.99, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (14, 1, 1, 29.99, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (15, 1, 1, 30, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (16, 1, 1, 9.99, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (17, 1, 1, 43.5, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (18, 1, 1, 12.99, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (19, 1, 1, 55, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (20, 1, 1, 975.5, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (21, 1, 1, 1499.99, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (22, 1, 1, 3499.99, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (23, 1, 1, 1779, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (24, 1, 1, 359.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (25, 1, 1, 97.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (26, 1, 1, 45.59, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (27, 1, 1, 4149, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (28, 1, 1, 84.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (29, 1, 1, 49.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (30, 1, 1, 84.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (31, 1, 1, 69.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (32, 1, 1, 3299, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (33, 1, 1, 579, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (34, 1, 1, 119, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (35, 1, 1, 299.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (36, 1, 1, 349, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (37, 1, 1, 119.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (38, 1, 1, 79.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (39, 1, 1, 99.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (40, 1, 1, 89.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (41, 1, 1, 169.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (42, 1, 1, 49.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (43, 1, 1, 569, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (44, 1, 1, 169, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (45, 1, 1, 240, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (46, 1, 1, 149.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (47, 1, 1, 149.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (48, 1, 1, 59.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (49, 1, 1, 19.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (50, 1, 1, 127.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (51, 5, 1, 18.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (52, 1, 1, 30, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (53, 1, 1, 49.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (54, 1, 1, 59.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (55, 14, 1, 34, '2023-05-08T19:11:55.617Z', '2023-05-13T17:20:44.890Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (56, 1, 1, 19.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (57, 13, 1, 396, '2023-05-08T19:11:55.617Z', '2023-05-13T17:09:14.637Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (58, 23, 1, 1299, '2023-05-08T19:11:55.617Z', '2023-05-13T17:20:44.867Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (59, 12, 1, 9.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
SET IDENTITY_INSERT [dbo].[TeDhenatEPorosis] ON;
SET IDENTITY_INSERT [dbo].[TeDhenatEPorosis] OFF;
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (1, '045234567', 'Peja', 30000, 'Xhemajl Kada 3');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (2, '044123456', 'Prishtina', 10000, 'Kadri Zeka 6');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (3, '045987654', 'Gjilan', 60000, 'Rexhep Luci 12');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (4, '045234567', 'Prizren', 20000, 'Bedri Pejani 5');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (5, '049876543', 'Ka�anik', 71000, 'Bedri Pejani 7');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (6, '044123456', 'Ka�anik', 71000, 'Rexhep Luci 6');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (7, '049234567', 'Ferizaj', 70000, 'Naim Frasheri 14');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (8, '044765432', 'Prizren', 20000, 'Perparim Krasniqi 7');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (9, '045876543', 'Gjilan', 60000, 'Rruga e Kavajes 36');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (10, '045234567', 'Gjakova', 50000, 'Bajram Kelmendi 33');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (11, '044987654', 'Peja', 30000, 'Hivzi Sulejmani 8');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (12, '049876543', 'Ferizaj', 70000, '29 Nentori 19');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (13, '043345678', 'Prizren', 20000, 'Skenderbeu 2');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (14, '046234567', 'Mitrovica', 40000, 'Adem Jashari 11');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (15, '045987654', 'Gjilan', 60000, 'Rruga e Kavajes 24');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (16, '044123456', 'Prishtina', 10000, 'Rruga e Dibres 3');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (17, '045876543', 'Prizren', 20000, 'Shaban Shala 9');
SET IDENTITY_INSERT [dbo].[TeDhenatRegjistrimit] ON;
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (1, 1, 58, 12, 999, 1299);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (2, 1, 55, 13, 26, 34);
SET IDENTITY_INSERT [dbo].[TeDhenatRegjistrimit] OFF;
SET IDENTITY_INSERT [dbo].[UserClaims] ON;
SET IDENTITY_INSERT [dbo].[UserClaims] OFF;
INSERT INTO [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnabled], [AccessFailedCount]) VALUES ('13b14235-6af3-402c-9f9c-275a1b952726', 'admin@techstore.com', 'ADMIN@TECHSTORE.COM', 'admin@techstore.com', 'ADMIN@TECHSTORE.COM', 0, 'AQAAAAEAACcQAAAAECkbRT0qLBXIuAzl02xgT1Htbq/BXDRpbYK8meOJqImdhBf52EHMKba3Aw2xI/FzGA==', 'OZ6DHCYTKCBDV3SKIL6A63M26NKL42GF', 'd1a84bd9-7e80-48f9-8657-4802cf14e92b', 0, 0, 1, 0);
INSERT INTO [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnabled], [AccessFailedCount]) VALUES ('7fc2db59-707c-47b6-acd5-f52dc6d4fdf1', 'r.kycyku.12@gmail.com', 'R.KYCYKU.12@GMAIL.COM', 'r.kycyku.12@gmail.com', 'R.KYCYKU.12@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEFfNInm0w62a6h+qq/0ur0PdbImd3cBh+BlxL88AWezCqs7htOmw6qWPnYNtPuwMpg==', 'V2BHPKQ7VDROLHCUT6CSOIY5UUETYWID', '3270fabd-58ce-46d3-b40c-347da2794870', 0, 0, 1, 0);
INSERT INTO [dbo].[ZbritjaQmimitProduktit] ([produktiID], [qmimiPaZbritjeProduktit], [qmimiMeZbritjeProduktit], [dataZbritjes], [dataSkadimit]) VALUES (21, 1499.99, 1299.99, '2023-05-14T17:19:21.847Z', '2023-05-25T00:00:00.000Z');
INSERT INTO [dbo].[ZbritjaQmimitProduktit] ([produktiID], [qmimiPaZbritjeProduktit], [qmimiMeZbritjeProduktit], [dataZbritjes], [dataSkadimit]) VALUES (27, 4149, 3999.99, '2023-05-14T17:19:06.407Z', '2023-05-23T00:00:00.000Z');
INSERT INTO [dbo].[ZbritjaQmimitProduktit] ([produktiID], [qmimiPaZbritjeProduktit], [qmimiMeZbritjeProduktit], [dataZbritjes], [dataSkadimit]) VALUES (52, 30, 24.99, '2023-05-14T17:18:26.493Z', '2023-05-30T00:00:00.000Z');
INSERT INTO [dbo].[ZbritjaQmimitProduktit] ([produktiID], [qmimiPaZbritjeProduktit], [qmimiMeZbritjeProduktit], [dataZbritjes], [dataSkadimit]) VALUES (53, 49.5, 44.99, '2023-05-14T17:18:09.660Z', '2023-05-17T00:00:00.000Z');
INSERT INTO [dbo].[ZbritjaQmimitProduktit] ([produktiID], [qmimiPaZbritjeProduktit], [qmimiMeZbritjeProduktit], [dataZbritjes], [dataSkadimit]) VALUES (54, 59.5, 49.99, '2023-05-14T17:17:35.490Z', '2023-05-26T00:00:00.000Z');
INSERT INTO [dbo].[ZbritjaQmimitProduktit] ([produktiID], [qmimiPaZbritjeProduktit], [qmimiMeZbritjeProduktit], [dataZbritjes], [dataSkadimit]) VALUES (59, 9.5, 7.49, '2023-05-14T17:18:50.650Z', '2023-05-18T00:00:00.000Z');
INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES ('20230518110858_initial', '7.0.5');
ALTER TABLE [dbo].[ContactForm] ADD CONSTRAINT [FK_ContactForm_Perdoruesi] FOREIGN KEY ([userID]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[KodiZbritjes] ADD CONSTRAINT [FK_KodiZbritjes_Produkti] FOREIGN KEY ([idProdukti]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[Porosit] ADD CONSTRAINT [FK_Porosit_Klienti] FOREIGN KEY ([idKlienti]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[Produkti] ADD CONSTRAINT [FK_Produkti_Kategoria] FOREIGN KEY ([kategoriaID]) REFERENCES [dbo].[KategoriaProduktit] ([kategoriaID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[Produkti] ADD CONSTRAINT [FK_Produkti_Kompania] FOREIGN KEY ([kompaniaID]) REFERENCES [dbo].[Kompania] ([kompaniaID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[RegjistrimiStokut] ADD CONSTRAINT [FK_Regjistrimi_Perdoruesi] FOREIGN KEY ([stafiID]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[StokuQmimiProduktit] ADD CONSTRAINT [FK_Stoku_Produkti] FOREIGN KEY ([produktiID]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE [dbo].[TeDhenatEPorosis] ADD CONSTRAINT [FK_TeDhenatPorosis_KodiZbritjes] FOREIGN KEY ([kodiZbritjes]) REFERENCES [dbo].[KodiZbritjes] ([kodi]) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE [dbo].[TeDhenatEPorosis] ADD CONSTRAINT [FK_TeDhenatPorosis_Porosia] FOREIGN KEY ([idPorosia]) REFERENCES [dbo].[Porosit] ([idPorosia]) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE [dbo].[TeDhenatEPorosis] ADD CONSTRAINT [FK_TeDhenatPorosis_Produkti] FOREIGN KEY ([idProdukti]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[TeDhenatPerdoruesit] ADD CONSTRAINT [FK_TeDhenatPerdorues_Perdoruesi] FOREIGN KEY ([userID]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE [dbo].[TeDhenatRegjistrimit] ADD CONSTRAINT [FK_RegjistrimiStokut_TeDhenatRegjistrimit] FOREIGN KEY ([idRegjistrimit]) REFERENCES [dbo].[RegjistrimiStokut] ([idRegjistrimit]) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE [dbo].[TeDhenatRegjistrimit] ADD CONSTRAINT [FK_Produkti_TeDhenatRegjistrimit] FOREIGN KEY ([idProduktit]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[ZbritjaQmimitProduktit] ADD CONSTRAINT [FK_ZbritjaQmimitProduktit] FOREIGN KEY ([produktiID]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE CASCADE ON UPDATE CASCADE;