IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'TechStoreDB')
    BEGIN
        CREATE DATABASE TechStoreDB
    END
    GO
    USE TechStoreDB
GO
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AspNetRoleClaims_AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetRoleClaims]'))
    ALTER TABLE [dbo].[AspNetRoleClaims] DROP CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AspNetUserClaims_AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AspNetUserLogins_AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AspNetUserTokens_AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserTokens]'))
    ALTER TABLE [dbo].[AspNetUserTokens] DROP CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perdoruesi_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Perdoruesi]'))
    ALTER TABLE [dbo].[Perdoruesi] DROP CONSTRAINT [FK_Perdoruesi_AspNetUsers];

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Produkti_Kategoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[Produkti]'))
    ALTER TABLE [dbo].[Produkti] DROP CONSTRAINT [FK_Produkti_Kategoria];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Produkti_Kompania]') AND parent_object_id = OBJECT_ID(N'[dbo].[Produkti]'))
    ALTER TABLE [dbo].[Produkti] DROP CONSTRAINT [FK_Produkti_Kompania];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContactForm_Perdoruesi]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContactForm]'))
    ALTER TABLE [dbo].[ContactForm] DROP CONSTRAINT [FK_ContactForm_Perdoruesi];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Porosit_Klienti]') AND parent_object_id = OBJECT_ID(N'[dbo].[Porosit]'))
    ALTER TABLE [dbo].[Porosit] DROP CONSTRAINT [FK_Porosit_Klienti];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Regjistrimi_Perdoruesi]') AND parent_object_id = OBJECT_ID(N'[dbo].[RegjistrimiStokut]'))
    ALTER TABLE [dbo].[RegjistrimiStokut] DROP CONSTRAINT [FK_Regjistrimi_Perdoruesi];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perdoruesi_TeDhenat]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeDhenatPerdoruesit]'))
    ALTER TABLE [dbo].[TeDhenatPerdoruesit] DROP CONSTRAINT [FK_Perdoruesi_TeDhenat];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeDhenatPorosis_Porosia]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeDhenatEPorosis]'))
    ALTER TABLE [dbo].[TeDhenatEPorosis] DROP CONSTRAINT [FK_TeDhenatPorosis_Porosia];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KodiZbritjes_Produkti]') AND parent_object_id = OBJECT_ID(N'[dbo].[KodiZbritjes]'))
    ALTER TABLE [dbo].[KodiZbritjes] DROP CONSTRAINT [FK_KodiZbritjes_Produkti];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StokuQmimiProduktit_Produkti_produktiID]') AND parent_object_id = OBJECT_ID(N'[dbo].[StokuQmimiProduktit]'))
    ALTER TABLE [dbo].[StokuQmimiProduktit] DROP CONSTRAINT [FK_StokuQmimiProduktit_Produkti_produktiID];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeDhenatPorosis_Produkti]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeDhenatEPorosis]'))
    ALTER TABLE [dbo].[TeDhenatEPorosis] DROP CONSTRAINT [FK_TeDhenatPorosis_Produkti];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Produkti_TeDhenatRegjistrimit]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeDhenatRegjistrimit]'))
    ALTER TABLE [dbo].[TeDhenatRegjistrimit] DROP CONSTRAINT [FK_Produkti_TeDhenatRegjistrimit];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ZbritjaQmimitProduktit_Produkti_produktiID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ZbritjaQmimitProduktit]'))
    ALTER TABLE [dbo].[ZbritjaQmimitProduktit] DROP CONSTRAINT [FK_ZbritjaQmimitProduktit_Produkti_produktiID];
    
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RegjistrimiStokut_TeDhenatRegjistrimit]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeDhenatRegjistrimit]'))
    ALTER TABLE [dbo].[TeDhenatRegjistrimit] DROP CONSTRAINT [FK_RegjistrimiStokut_TeDhenatRegjistrimit];
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoleClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoleClaims];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserTokens]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserTokens];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers];
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
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StokuQmimiProduktit]') AND type in (N'U'))
DROP TABLE [dbo].[StokuQmimiProduktit];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeDhenatBiznesit]') AND type in (N'U'))
DROP TABLE [dbo].[TeDhenatBiznesit];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeDhenatEPorosis]') AND type in (N'U'))
DROP TABLE [dbo].[TeDhenatEPorosis];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeDhenatPerdoruesit]') AND type in (N'U'))
DROP TABLE [dbo].[TeDhenatPerdoruesit];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeDhenatRegjistrimit]') AND type in (N'U'))
DROP TABLE [dbo].[TeDhenatRegjistrimit];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZbritjaQmimitProduktit]') AND type in (N'U'))
DROP TABLE [dbo].[ZbritjaQmimitProduktit];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__EFMigrationsHistory];
CREATE TABLE [dbo].[AspNetRoleClaims] ( 
  [Id] INT IDENTITY NOT NULL,
  [RoleId] NVARCHAR(450) NOT NULL,
  [ClaimType] NVARCHAR(MAX) NULL,
  [ClaimValue] NVARCHAR(MAX) NULL,
  CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id])
);
CREATE TABLE [dbo].[AspNetRoles] ( 
  [Id] NVARCHAR(450) NOT NULL,
  [Name] NVARCHAR(256) NULL,
  [NormalizedName] NVARCHAR(256) NULL,
  [ConcurrencyStamp] NVARCHAR(MAX) NULL,
  CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
);
CREATE TABLE [dbo].[AspNetUserClaims] ( 
  [Id] INT IDENTITY NOT NULL,
  [UserId] NVARCHAR(450) NOT NULL,
  [ClaimType] NVARCHAR(MAX) NULL,
  [ClaimValue] NVARCHAR(MAX) NULL,
  CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id])
);
CREATE TABLE [dbo].[AspNetUserLogins] ( 
  [LoginProvider] NVARCHAR(450) NOT NULL,
  [ProviderKey] NVARCHAR(450) NOT NULL,
  [ProviderDisplayName] NVARCHAR(MAX) NULL,
  [UserId] NVARCHAR(450) NOT NULL,
  CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey], [UserId])
);
CREATE TABLE [dbo].[AspNetUserRoles] ( 
  [UserId] NVARCHAR(450) NOT NULL,
  [RoleId] NVARCHAR(450) NOT NULL,
  CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([RoleId], [UserId])
);
CREATE TABLE [dbo].[AspNetUserTokens] ( 
  [UserId] NVARCHAR(450) NOT NULL,
  [LoginProvider] NVARCHAR(450) NOT NULL,
  [Name] NVARCHAR(450) NOT NULL,
  [Value] NVARCHAR(MAX) NULL,
  CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([LoginProvider], [Name], [UserId])
);
CREATE TABLE [dbo].[AspNetUsers] ( 
  [Id] NVARCHAR(450) NOT NULL,
  [UserName] NVARCHAR(256) NULL,
  [NormalizedUserName] NVARCHAR(256) NULL,
  [Email] NVARCHAR(256) NULL,
  [NormalizedEmail] NVARCHAR(256) NULL,
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
  CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
);
CREATE TABLE [dbo].[ContactForm] ( 
  [mesazhiID] INT IDENTITY NOT NULL,
  [userID] INT NULL,
  [mesazhi] TEXT NULL,
  [dataDergeses] DATE NULL CONSTRAINT [DF__ContactFo__dataD__7B113988] DEFAULT (getdate()) ,
  [statusi] VARCHAR(60) NULL CONSTRAINT [DF__ContactFo__statu__7C055DC1] DEFAULT ('Mesazhi juaj eshte derguar tek Stafi') ,
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
  [dataKrijimit] DATETIME NULL CONSTRAINT [DF__KodiZbrit__dataK__086B34A6] DEFAULT (getdate()) ,
  [qmimiZbritjes] DECIMAL(18,2) NULL,
  [idProdukti] INT NULL,
  CONSTRAINT [PK__KodiZbri__25A8748FB3E013A8] PRIMARY KEY ([kodi])
);
CREATE TABLE [dbo].[Kompania] ( 
  [kompaniaID] INT IDENTITY NOT NULL,
  [emriKompanis] TEXT NULL,
  [logo] VARCHAR(40) NULL CONSTRAINT [DF__Kompania__logo__5F691F13] DEFAULT ('kompaniPaFoto.png') ,
  [adresa] VARCHAR(40) NULL,
  CONSTRAINT [PK__Kompania__2026D74DCB37AA9A] PRIMARY KEY ([kompaniaID])
);
CREATE TABLE [dbo].[Perdoruesi] ( 
  [userID] INT IDENTITY NOT NULL,
  [emri] VARCHAR(30) NULL,
  [mbiemri] VARCHAR(30) NULL,
  [email] VARCHAR(30) NULL,
  [username] VARCHAR(20) NULL,
  [AspNetUserID] NVARCHAR(450) NOT NULL,
  CONSTRAINT [PK__Perdorue__CB9A1CDFC4C4A0AA] PRIMARY KEY ([userID])
);
CREATE TABLE [dbo].[Porosit] ( 
  [idPorosia] INT IDENTITY NOT NULL,
  [totaliPorosis] DECIMAL(18,2) NULL,
  [dataPorosis] DATE NULL CONSTRAINT [DF__Porosit__dataPor__7FD5EEA5] DEFAULT (getdate()) ,
  [statusiPorosis] VARCHAR(30) NULL CONSTRAINT [DF__Porosit__statusi__00CA12DE] DEFAULT ('Ne Procesim') ,
  [idKlienti] INT NULL,
  [zbritja] DECIMAL(18,2) NULL,
  [totaliProdukteve] INT NULL CONSTRAINT [DF__Porosit__totaliP__654CE0F2] DEFAULT ((0)) ,
  CONSTRAINT [PK__Porosit__A9F27D2AB271ADFC] PRIMARY KEY ([idPorosia])
);
CREATE TABLE [dbo].[Produkti] ( 
  [produktiID] INT IDENTITY NOT NULL,
  [emriProduktit] TEXT NULL,
  [pershkrimi] TEXT NULL,
  [fotoProduktit] VARCHAR(40) NULL CONSTRAINT [DF__Produkti__fotoPr__764C846B] DEFAULT ('produktPaFoto.png') ,
  [kompaniaID] INT NULL,
  [kategoriaID] INT NULL,
  [zbritja] DECIMAL(10,2) NULL,
  CONSTRAINT [PK__Produkti__76A3DFCF91A50347] PRIMARY KEY ([produktiID])
);
CREATE TABLE [dbo].[RegjistrimiStokut] ( 
  [idRegjistrimit] INT IDENTITY NOT NULL,
  [dataRegjistrimit] DATETIME NULL CONSTRAINT [DF__Regjistri__dataR__049AA3C2] DEFAULT (getdate()) ,
  [stafiID] INT NULL,
  [totaliProdukteveRegjistruara] INT NULL,
  [shumaTotaleRegjistrimit] DECIMAL(18,2) NULL,
  [shumaTotaleBlerese] DECIMAL(18,2) NULL,
  CONSTRAINT [PK_RegjistrimiStokut] PRIMARY KEY ([idRegjistrimit])
);
CREATE TABLE [dbo].[StokuQmimiProduktit] ( 
  [produktiID] INT NOT NULL,
  [sasiaNeStok] INT NULL CONSTRAINT [DF__StokuQmim__sasia__0C3BC58A] DEFAULT ((0)) ,
  [qmimiBleres] DECIMAL(18,2) NULL CONSTRAINT [DF__StokuQmim__qmimi__0D2FE9C3] DEFAULT ((0)) ,
  [qmimiProduktit] DECIMAL(18,2) NULL CONSTRAINT [DF__StokuQmim__qmimi__0E240DFC] DEFAULT ((0)) ,
  [dataKrijimit] DATETIME NULL CONSTRAINT [DF__StokuQmim__dataK__0F183235] DEFAULT (getdate()) ,
  [dataPerditsimit] DATETIME NULL CONSTRAINT [DF__StokuQmim__dataP__100C566E] DEFAULT (getdate()) ,
  CONSTRAINT [PK_StokuProduktit] PRIMARY KEY ([produktiID])
);
CREATE TABLE [dbo].[TeDhenatBiznesit] ( 
  [IDTeDhenatBiznesit] INT NOT NULL,
  [EmriIBiznesit] NVARCHAR(250) NULL,
  [ShkurtesaEmritBiznesit] VARCHAR(7) NULL,
  [NUI] INT NULL,
  [NF] INT NULL,
  [NRTVSH] INT NULL,
  [Adresa] NVARCHAR(250) NULL,
  [NrKontaktit] NVARCHAR(20) NULL,
  [Email] NVARCHAR(250) NULL,
  [Logo] VARCHAR(40) NULL,
  CONSTRAINT [PK_TeDhenatBiznesit] PRIMARY KEY ([IDTeDhenatBiznesit])
);
CREATE TABLE [dbo].[TeDhenatEPorosis] ( 
  [idDetajet] INT IDENTITY NOT NULL,
  [qmimiTotal] DECIMAL(18,2) NULL,
  [sasiaPorositur] INT NULL,
  [idPorosia] INT NULL,
  [idProdukti] INT NULL,
  [qmimiProduktit] DECIMAL(18,2) NULL,
  CONSTRAINT [PK__TeDhenat__494F491F84D65D51] PRIMARY KEY ([idDetajet])
);
CREATE TABLE [dbo].[TeDhenatPerdoruesit] ( 
  [userID] INT NOT NULL,
  [nrKontaktit] VARCHAR(15) NULL,
  [qyteti] VARCHAR(20) NULL,
  [zipKodi] INT NULL,
  [adresa] VARCHAR(40) NULL,
  [shteti] VARCHAR(30) NULL
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
CREATE TABLE [dbo].[ZbritjaQmimitProduktit] ( 
  [produktiID] INT NOT NULL,
  [qmimiPaZbritjeProduktit] DECIMAL(18,2) NULL CONSTRAINT [DF__ZbritjaQm__qmimi__13DCE752] DEFAULT ((0)) ,
  [qmimiMeZbritjeProduktit] DECIMAL(18,2) NULL CONSTRAINT [DF__ZbritjaQm__qmimi__14D10B8B] DEFAULT ((0)) ,
  [dataZbritjes] DATETIME NULL CONSTRAINT [DF__ZbritjaQm__dataZ__15C52FC4] DEFAULT (getdate()) ,
  [dataSkadimit] DATETIME NULL CONSTRAINT [DF__ZbritjaQm__dataS__16B953FD] DEFAULT (getdate()) ,
  CONSTRAINT [PK_ZbritjaQmimitProduktit] PRIMARY KEY ([produktiID])
);
CREATE TABLE [dbo].[__EFMigrationsHistory] ( 
  [MigrationId] NVARCHAR(150) NOT NULL,
  [ProductVersion] NVARCHAR(32) NOT NULL,
  CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
);
CREATE INDEX [IX_AspNetRoleClaims_RoleId] 
ON [dbo].[AspNetRoleClaims] (
  [RoleId] ASC
);
CREATE UNIQUE INDEX [RoleNameIndex] 
ON [dbo].[AspNetRoles] (
  [NormalizedName] ASC
);
CREATE INDEX [IX_AspNetUserClaims_UserId] 
ON [dbo].[AspNetUserClaims] (
  [UserId] ASC
);
CREATE INDEX [IX_AspNetUserLogins_UserId] 
ON [dbo].[AspNetUserLogins] (
  [UserId] ASC
);
CREATE INDEX [IX_AspNetUserRoles_RoleId] 
ON [dbo].[AspNetUserRoles] (
  [RoleId] ASC
);
CREATE INDEX [EmailIndex] 
ON [dbo].[AspNetUsers] (
  [NormalizedEmail] ASC
);
CREATE UNIQUE INDEX [UserNameIndex] 
ON [dbo].[AspNetUsers] (
  [NormalizedUserName] ASC
);
CREATE INDEX [IX_ContactForm_userID] 
ON [dbo].[ContactForm] (
  [userID] ASC
);
CREATE INDEX [IX_KodiZbritjes_idProdukti] 
ON [dbo].[KodiZbritjes] (
  [idProdukti] ASC
);
CREATE UNIQUE INDEX [UQ__Perdorue__F3DBC5728A6B6DAE] 
ON [dbo].[Perdoruesi] (
  [username] ASC
);
CREATE INDEX [IX_Porosit_idKlienti] 
ON [dbo].[Porosit] (
  [idKlienti] ASC
);
CREATE INDEX [IX_Produkti_kategoriaID] 
ON [dbo].[Produkti] (
  [kategoriaID] ASC
);
CREATE INDEX [IX_Produkti_kompaniaID] 
ON [dbo].[Produkti] (
  [kompaniaID] ASC
);
CREATE INDEX [IX_RegjistrimiStokut_stafiID] 
ON [dbo].[RegjistrimiStokut] (
  [stafiID] ASC
);
CREATE INDEX [IX_TeDhenatEPorosis_idPorosia] 
ON [dbo].[TeDhenatEPorosis] (
  [idPorosia] ASC
);
CREATE INDEX [IX_TeDhenatEPorosis_idProdukti] 
ON [dbo].[TeDhenatEPorosis] (
  [idProdukti] ASC
);
CREATE INDEX [IX_TeDhenatRegjistrimit_idProduktit] 
ON [dbo].[TeDhenatRegjistrimit] (
  [idProduktit] ASC
);
CREATE INDEX [IX_TeDhenatRegjistrimit_idRegjistrimit] 
ON [dbo].[TeDhenatRegjistrimit] (
  [idRegjistrimit] ASC
);
TRUNCATE TABLE [dbo].[AspNetRoleClaims];
TRUNCATE TABLE [dbo].[AspNetRoles];
TRUNCATE TABLE [dbo].[AspNetUserClaims];
TRUNCATE TABLE [dbo].[AspNetUserLogins];
TRUNCATE TABLE [dbo].[AspNetUserRoles];
TRUNCATE TABLE [dbo].[AspNetUserTokens];
TRUNCATE TABLE [dbo].[AspNetUsers];
TRUNCATE TABLE [dbo].[ContactForm];
TRUNCATE TABLE [dbo].[KategoriaProduktit];
TRUNCATE TABLE [dbo].[KodiZbritjes];
TRUNCATE TABLE [dbo].[Kompania];
TRUNCATE TABLE [dbo].[Perdoruesi];
TRUNCATE TABLE [dbo].[Porosit];
TRUNCATE TABLE [dbo].[Produkti];
TRUNCATE TABLE [dbo].[RegjistrimiStokut];
TRUNCATE TABLE [dbo].[StokuQmimiProduktit];
TRUNCATE TABLE [dbo].[TeDhenatBiznesit];
TRUNCATE TABLE [dbo].[TeDhenatEPorosis];
TRUNCATE TABLE [dbo].[TeDhenatPerdoruesit];
TRUNCATE TABLE [dbo].[TeDhenatRegjistrimit];
TRUNCATE TABLE [dbo].[ZbritjaQmimitProduktit];
TRUNCATE TABLE [dbo].[__EFMigrationsHistory];
SET IDENTITY_INSERT [dbo].[AspNetRoleClaims] ON;
SET IDENTITY_INSERT [dbo].[AspNetRoleClaims] OFF;
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES ('0267d4fd-5bac-4552-9930-8e528b2fec1b', 'Admin', 'ADMIN', 'bcb0a7f8-41b2-48ce-bf39-fbc24516012e');
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES ('be4b8ef8-abf0-454c-852c-676cdab20e3b', 'User', 'USER', '264000ea-9d66-4686-b48b-e06165a906fc');
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES ('db3dd60d-a159-4f85-a9a5-d1444ee1013d', 'Menaxher', 'MENAXHER', '3e215a86-6eeb-48a6-90d9-fe12a7a70f28');
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON;
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF;
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('36da09a1-a245-46b2-9a29-08c75ca1b769', '0267d4fd-5bac-4552-9930-8e528b2fec1b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('5d42072c-fcb5-4c9b-9c25-a0066c7ff1d9', '0267d4fd-5bac-4552-9930-8e528b2fec1b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('82345d9d-a4d0-4076-8d43-f61d63604472', '0267d4fd-5bac-4552-9930-8e528b2fec1b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('a6ded093-cf79-42e0-b500-58a004892b15', '0267d4fd-5bac-4552-9930-8e528b2fec1b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('beea69a5-cb0f-41a4-85c2-50fd5e1dad11', '0267d4fd-5bac-4552-9930-8e528b2fec1b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('ed78a52a-167d-4d20-852e-257dc41408ea', '0267d4fd-5bac-4552-9930-8e528b2fec1b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('09e7e384-1597-4b58-be8d-e500983b7e6a', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('0fe2c1c8-6086-454f-83e8-fadee72336ad', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('141ee1b9-f205-4cdb-bf60-1923366fdba8', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('18c53e36-75a8-42bb-b78a-ea7bec040f86', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('22bfef71-8cab-4d15-af26-ab4bc6110222', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('288577bc-9274-4223-b579-b490ee1f38e2', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('3043b855-1536-4325-8e23-223355983231', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('36da09a1-a245-46b2-9a29-08c75ca1b769', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('38008392-4173-4525-91f6-1ca31417776c', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('487b813e-11a9-4ab6-9b10-ead71266c288', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('4fcd6f29-950e-43ac-a8ac-936ccc92cabc', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('524411b2-2789-4c02-9c0b-c227b742d6ed', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('531575ac-afd3-4b81-a981-8cc0b579c28f', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('5d42072c-fcb5-4c9b-9c25-a0066c7ff1d9', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('606a59d6-8424-438f-a210-2b360b84fb49', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('68346e99-7a27-434b-b15b-4e2a1d8146d8', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('687204c7-2a82-46cc-95d6-fcdeaee48e18', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('6c25088f-7e41-4b73-9380-549d31b14934', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('6d965852-5dc8-4bd1-b3ed-32f810133da6', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('7ab40b8b-a135-48c8-97ac-f1870de525c4', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('81d433b8-1f64-40ef-9511-6d9dbd56f0cf', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('82345d9d-a4d0-4076-8d43-f61d63604472', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('851fb44f-4776-4efa-9005-6334cd0ce0b2', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('873a3d0f-e72c-48c1-8a38-d06bff07c737', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('922df69c-2db5-4ce7-a63c-c373e2899678', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('96f706ca-2d28-4e48-80e9-0d03fad60d1a', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('9922d8bc-e3e9-40cf-82fc-bb096d4f2fe2', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('9fd9b11e-440c-4c4f-bb46-06ea5bdd7e75', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('a6ded093-cf79-42e0-b500-58a004892b15', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('b8461f8d-1c0c-4cfc-8437-5ad1a0c3a42e', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('beea69a5-cb0f-41a4-85c2-50fd5e1dad11', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('cf6b526b-d436-4bae-ba4e-29d5567e9275', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('e0f612cd-e026-4335-95e8-f08c148a0f5c', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('ed78a52a-167d-4d20-852e-257dc41408ea', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('fea15606-dc8f-4b3d-9f6f-5c2ca53aaf9d', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('36da09a1-a245-46b2-9a29-08c75ca1b769', 'db3dd60d-a159-4f85-a9a5-d1444ee1013d');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('524411b2-2789-4c02-9c0b-c227b742d6ed', 'db3dd60d-a159-4f85-a9a5-d1444ee1013d');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('5d42072c-fcb5-4c9b-9c25-a0066c7ff1d9', 'db3dd60d-a159-4f85-a9a5-d1444ee1013d');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('82345d9d-a4d0-4076-8d43-f61d63604472', 'db3dd60d-a159-4f85-a9a5-d1444ee1013d');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('851fb44f-4776-4efa-9005-6334cd0ce0b2', 'db3dd60d-a159-4f85-a9a5-d1444ee1013d');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('a6ded093-cf79-42e0-b500-58a004892b15', 'db3dd60d-a159-4f85-a9a5-d1444ee1013d');
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('09e7e384-1597-4b58-be8d-e500983b7e6a', 'lbasha', 'LBASHA', 'lindita.basha@gmail.com', 'LINDITA.BASHA@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEN/RLQjxPsjvzf7kaln7KvYFVpSIzONOl6O6QAKhYtPQIWkE9S9Pn0ZIWJLreep+vQ==', 'LCEBNQEQ2ISGXLFDORWPRVOTYORJJZQ6', '3a8bfc74-18a2-4c9d-9fb4-8ae778d8dd07', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('0fe2c1c8-6086-454f-83e8-fadee72336ad', 'vkrasniqi', 'VKRASNIQI', 'valbona.krasniqi@gmail.com', 'VALBONA.KRASNIQI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEJcUOEZXjBcLyTmPtnTVzn7qRhNDKR8t71Ow+XsjXursR75fjpPnsW6AZ6lyedwTjg==', 'SA7YBQSAWX4FA6E2TDZ2VY2WPJ2FUNSP', '9d01e957-f394-446f-b721-2a5912468215', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('141ee1b9-f205-4cdb-bf60-1923366fdba8', 'vberisha', 'VBERISHA', 'valdrin.berisha@gmail.com', 'VALDRIN.BERISHA@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEO4G2xxImNyIiWYE2dYqDqdX81cBoCPDY9dbwoMD2LYuQ/JLAtIRT3bQnw4fqEg+0g==', '75FA4YTSRWERZDVOK2WIHOBSBWBPDIXS', '38472544-a835-4ca1-872b-f0c69b57ea33', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('18c53e36-75a8-42bb-b78a-ea7bec040f86', 'gsalihi', 'GSALIHI', 'gent.salihi@gmail.com', 'GENT.SALIHI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEM7cR9WSuMlWzy4AqgSOxmWp+YLvZuKDd/xSrCnMVfMDPT5DoLibijFkaPiXgRVKyA==', '6PLNWA3P4HQNCCYGNYLU4QK7UVNJ6B7A', 'eaf02981-82a0-4e38-a8bf-dcadc8735566', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('22bfef71-8cab-4d15-af26-ab4bc6110222', 'alleshi', 'ALLESHI', 'afrim.lleshi@gmail.com', 'AFRIM.LLESHI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEOJ3lr+V9KB2lwngAQPcjtqm+HKoQjWOwqYx9A63jYMquKlB7B5snaPMpgzT1RvKNw==', 'WQEJJCHIMAT6CE7ORINRVZW2UJ2TDMNG', '2910b44e-1064-4c8a-91a2-25c6814f068a', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('288577bc-9274-4223-b579-b490ee1f38e2', 'fkrasniqi', 'FKRASNIQI', 'florin.krasniqi@gmail.com', 'FLORIN.KRASNIQI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEBPsnBmASC8wkNOpnPtvVtRJ1zyOmnLthWWXOEjT6RREz/3jMHazqMFQZMRvkTXFKA==', 'CIOFJW3BRBZR7HAFSJYDJI2LS6APRGPC', '69d185fb-4b4c-4466-adbb-39ddc1cb6e37', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('3043b855-1536-4325-8e23-223355983231', 'rhajdari', 'RHAJDARI', 'rron.hajdari@gmail.com', 'RRON.HAJDARI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAECaaawyNxhxDOw0sVhzPu/Jt90SYqKRHWPRVyEpTqA0aosWT17gOOCXAudBeMIiSaw==', '3QOQ4C6RMXIBGRNB7MIVJPO7QZ2B2HGR', '21586ef9-f591-4c7c-a810-fd048ff25ee1', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('36da09a1-a245-46b2-9a29-08c75ca1b769', 'ijezerci', 'IJEZERCI', 'ilire.jezerci@gmail.com', 'ILIRE.JEZERCI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEB345i2LmCHA8cwQWLccNzSL7/d/oxUDfQe1bSm+2WdkOW1MMXu7OzoJB4IO2k4+1g==', 'EFMGXYN3XWNJCT3ZSJHFCEWXOTM2REOW', '4cfa1040-d240-4766-9ac0-26dec33b0be0', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('38008392-4173-4525-91f6-1ca31417776c', 'ejashari', 'EJASHARI', 'enver.jashari@gmail.com', 'ENVER.JASHARI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEA/2yooqoygDjru5YWwagVJYszCXWXPW3dXRRygZmKRFKzuX0BXWR4ghGSYZQHtS1Q==', 'OASBMFPH2LAQ4UT3H4HES2YFNQB4AYUM', '9413bc77-6c0e-4c4c-8792-f863b597a41e', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('487b813e-11a9-4ab6-9b10-ead71266c288', 'fmurtezi', 'FMURTEZI', 'fatlum.murtezi@gmail.com', 'FATLUM.MURTEZI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEPIqe5Oq64U8ami67vEwyMEpQ8tG5xkJYGkVTva2LE5YH8HQNb+SDu0JybeuAeHndQ==', 'WSXFQDATUVA6RZ47MXQ5NPAAHVBO4ALP', '8b7435cb-84e0-4dea-ba1b-9bfc03a885e8', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('4fcd6f29-950e-43ac-a8ac-936ccc92cabc', 'librahimi', 'LIBRAHIMI', 'luljeta.ibrahimi@gmail.com', 'LULJETA.IBRAHIMI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEFo8JGLMGJFIgMnoEeUNnp1IpkgM2mlmIWf1Ig4nHn6M3sfL1eXrWGb0G1Y6JSVFiA==', 'HQGHQOZIYIJZJ6HIZLC2FABZSYPOV6VK', '9a47a945-ac33-4c16-b024-3206552f5f25', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('524411b2-2789-4c02-9c0b-c227b742d6ed', 'dshala', 'DSHALA', 'drita.shala@gmail.com', 'DRITA.SHALA@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEPvz9h56Iuw6OSbwCQw5loRaa+QWc6nyvpcMJcQzzgnHs/XFtvmiUL6cIdhAK/SyYQ==', 'I3U6H5F5MCGWF4RRKAQK6NGZM4R5PB2S', '4a80cc73-ba8c-4084-a5b4-e8576c20948a', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('531575ac-afd3-4b81-a981-8cc0b579c28f', 'amustafa', 'AMUSTAFA', 'adelina.mustafa@gmail.com', 'ADELINA.MUSTAFA@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEGYZwP7BvsxcgjG76Au6Xnr7PvuUAIOxTf7PcK5FZYtD/vqS4nlTAi7XHcBK4577gA==', 'SNFJCCBSQWM4EZEU4DMGA3DU6UBSFCBW', '64b8ebf3-2395-42fe-87a2-daad8af0fdf8', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('5d42072c-fcb5-4c9b-9c25-a0066c7ff1d9', 'pdardhishta', 'PDARDHISHTA', 'perparim.dardhishta@email.com', 'PERPARIM.DARDHISHTA@EMAIL.COM', 0, 'AQAAAAEAACcQAAAAEDQ2sitm08b5F1rA/hnliJwF8eF+6JpndhWF8RgkzgisQCwayn8iTLjKtG7tiPR6sw==', '32FANKBWKUQQEPXSIKVCCVT473VWHDBH', '942a7679-c8b7-450e-aefb-5365288f9a4f', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('606a59d6-8424-438f-a210-2b360b84fb49', 'vgashi', 'VGASHI', 'vlora.gashi@gmail.com', 'VLORA.GASHI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAELkWtXiyg3k3j7YNJ9YEXKtOH2A8Rh4OShhlzhYS9tq+uouCbeyd2ccKCqwwfhsEyA==', 'JW76SZQBVOK6Z2JS6QCH2UPMDARYPQVB', '6f5e6029-2e76-4265-b1e4-3760cc653609', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('68346e99-7a27-434b-b15b-4e2a1d8146d8', 'bkrasniqi', 'BKRASNIQI', 'blerta.krasniqi@gmail.com', 'BLERTA.KRASNIQI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEDsKEmfdIaMQpMXvFI48YsxvZnsp8MibT9kWAkitCDS6Jt0YBTNqTUmbMBZ/nWEmrw==', 'SI2NKVDD43PDQOLJ3Z7SYDTHBRFAJLUI', 'c901c00f-9a0d-476d-a061-5c9cfb9d8b20', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('687204c7-2a82-46cc-95d6-fcdeaee48e18', 'emustafa', 'EMUSTAFA', 'emina.mustafa@gmail.com', 'EMINA.MUSTAFA@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEByL44c+QCz3rq1izn2UxUS9hj2qDgGpkUY0/IPdq2G3fIqK5Dhr/lRlkZNfsjNV0A==', 'LYG7GUFNNUQZDECFAYHJG7DSFHWCFBN7', '9475095b-5e7a-4553-9e29-40ff5d94eb80', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('6c25088f-7e41-4b73-9380-549d31b14934', 'zkadriu', 'ZKADRIU', 'zejnullah.kadriu@gmail.com', 'ZEJNULLAH.KADRIU@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEH4FjhsMTWBbmRhBgaPfnf3gAtBR8AP4fXQ2D4vmoaMykc6mc8c6Xpw+x4zmxMUjeg==', 'O4QMOCTPCKBM2DCJDC4ZU6P6ZWNS24VK', '08d9514a-014d-4ad5-9632-82dd4654fe0f', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('6d965852-5dc8-4bd1-b3ed-32f810133da6', 'shoxha', 'SHOXHA', 'shpresa.hoxha@gmail.com', 'SHPRESA.HOXHA@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEBW2WJ8HqtNo92o8QXTKk6GpwJdkPfb41TesRe6cTPd+MB7vy9vkJN7YZ5i3H4Nn5Q==', 'CERKFNLAYA3WLPZE35DBA5ZSUXZMEKBK', '0a4747a0-d83a-41b4-98fa-6fdcfbf5e9aa', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('7ab40b8b-a135-48c8-97ac-f1870de525c4', 'azeqiri', 'AZEQIRI', 'anila.zeqiri@gmail.com', 'ANILA.ZEQIRI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEPRbOsqdyfcw5tcRX2Mw+UsxOFZVoPl/5L84OJjSEOoqk3mW4c+YRT9G0v5Aqstpvw==', '4FF4LOVBMMZPWL52MQN7S5UJ46VQZMPH', 'e025e752-046d-4e6e-a089-9a81641e772a', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('81d433b8-1f64-40ef-9511-6d9dbd56f0cf', 'dismaili', 'DISMAILI', 'dardan.ismaili@gmail.com', 'DARDAN.ISMAILI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEE9STZMW55BVwBpFbjREBTlpYyFeWaRW7+hoqzEpgMHDeMTb/5APXc2AUZJT38LJ3Q==', 'A6URJGV2AOB3BYNDAWZJ33DLROCS3VH3', 'cd19b54b-4fea-4124-b458-a8643a31e339', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('82345d9d-a4d0-4076-8d43-f61d63604472', 'rkycyku', 'RKYCYKU', 'rilind.kycyku@gmail.com', 'RILIND.KYCYKU@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEAfN1eX33Xg2J7U52krF4/VJKD8GkDASRAS6GXUiqJAUykuOBpQmOw1V7PSWpgBmTA==', 'WFJWZBDATZYH7J5X34CTOGBXMXGXI67I', '0e78e6b9-0832-4894-b875-191deb983b6d', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('851fb44f-4776-4efa-9005-6334cd0ce0b2', 'lhajdari', 'LHAJDARI', 'liridona.hajdari@gmail.com', 'LIRIDONA.HAJDARI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEAxzvhL1TaduFqzAkpEpl6B+CDiSp1oUEv8vCDoVTT2EzLqKoCAC/t1cHHd6snv8iQ==', 'MOFFU6NCY7IN7WGCJIWUEOTWIIX454X7', 'b9aaae9d-aed1-4fc2-93df-1eb0b91a2da4', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('873a3d0f-e72c-48c1-8a38-d06bff07c737', 'dberisha', 'DBERISHA', 'drenusha.berisha@gmail.com', 'DRENUSHA.BERISHA@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEE+ZotRW8K1qwaEZSG9X4g0EaFsiMECMjc0FVRicDapDuAJ26vI2iU8PNkYK4sS4jg==', '7JW2ZAJ2LAQLSRNHB3UPCNZ4A4MXE7YP', '47263741-bad7-4d4b-bd5f-67fe4f2f3582', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('922df69c-2db5-4ce7-a63c-c373e2899678', 'ehajdari', 'EHAJDARI', 'erza.hajdari@gmail.com', 'ERZA.HAJDARI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEEZDPa3qLDkoO5/I63QWXKy2pCoT4PnOAr/U/iVTwl/An+nXmuQXLGNaIvPvQgIe9Q==', 'ABB7V466KKLNJMQL2MVN7BRW3SRBFCMT', '02251ee3-7cad-42c9-be6c-d7b5394566a1', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('96f706ca-2d28-4e48-80e9-0d03fad60d1a', 'ndervishi', 'NDERVISHI', 'naim.dervishi@gmail.com', 'NAIM.DERVISHI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEDp/Drq68Woj98MGNOFE2Udm3g429r+CXK/S2ma65oGh92XA/yu4EX/lRUylAKY3Vg==', 'QC7476NNLZNSXNS4CA5TMTA6HHVPWBL4', '44b975ad-7c09-4173-ae86-b968f480d57e', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('9922d8bc-e3e9-40cf-82fc-bb096d4f2fe2', 'fkadriu', 'FKADRIU', 'fidan.kadriu@gmail.com', 'FIDAN.KADRIU@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEBIp+NZO/QNVPa5HR8IRVBF61h7xvq9svMkLGvFPr2Gti9EeNwidbQhWkaU3rOyAjg==', 'Z2RNPPSSXAC5CLJC5LM4ZVI6CJ4TWRYL', 'a47c0ffb-bd33-40a4-923a-15481b1f1188', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('9fd9b11e-440c-4c4f-bb46-06ea5bdd7e75', 'fbajrami', 'FBAJRAMI', 'fitore.bajrami@gmail.com', 'FITORE.BAJRAMI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEO4p/O5SCqqA4zSmjMW4AwRiQYoV3OqLoJrnR1avgNrynrtyQfYSGE7L/FXi5n99BA==', 'H6R5PRASSV6N3NQWF3W2PWJN7R4GXKI7', 'cc4b0c91-c3fd-44f2-a52b-80b5221a75dc', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('a6ded093-cf79-42e0-b500-58a004892b15', 'akrasniqi', 'AKRASNIQI', 'albiona.krasniqi@gmail.com', 'ALBIONA.KRASNIQI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEB5UEOsF2TQbluH4Zcvd0yttyUoGKlP/ngz7WU9mrt95ZD56xS32GTjjtrzzVmAixg==', 'JFBZHRKQXOP4L5QKQDVB4LEXH3ARKT3O', '8ef701f2-3df6-4555-8eae-7d8097e3f199', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('b8461f8d-1c0c-4cfc-8437-5ad1a0c3a42e', 'kramadani', 'KRAMADANI', 'kushtrim.ramadani@gmail.com', 'KUSHTRIM.RAMADANI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAECpcz0Cw6s2JwtDaVJOEeRFtpDC6ZXUW6ZE6L9mLKCxz3igzlW814ob0ACdSTpYu8g==', 'PCWEKINN7MBBWRRMX6I2ZIUJVGXT5ZVR', 'b9a4da73-8e28-4725-9936-3d1d09cf3a7e', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('beea69a5-cb0f-41a4-85c2-50fd5e1dad11', 'vbajrami', 'VBAJRAMI', 'vlera.bajrami@gmail.com', 'VLERA.BAJRAMI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEEeWDiakDAmQ/O95fsblRs5yWU5Oeq47PnzIv6ig+yC7ZMsPtFcnRG4PZDGGZK//Iw==', '7MD4RYBETZOKMYU7OWUEB6WJEWZ6DKMI', '5949c304-75de-4dfb-a667-8c457b3d56ff', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('cf6b526b-d436-4bae-ba4e-29d5567e9275', 'bbajrami', 'BBAJRAMI', 'besa.bajrami@gmail.com', 'BESA.BAJRAMI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEH7wKPF2FfYyHbqJsRakwKwXw2uBtC9BAtWQ7/JvhqHY4HqHFa8cDo/3OD1m13P04A==', 'ZFJLPEQU4X26ELML36C2QZANJGIJLAUR', '7112b0d7-8d15-41c4-865c-ae48f303391f', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('e0f612cd-e026-4335-95e8-f08c148a0f5c', 'bhajdari', 'BHAJDARI', 'besiana.hajdari@gmail.com', 'BESIANA.HAJDARI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEJHQ5QStZYZoExMRHncYSddU6WDS8vT1BOZNXealPooWg+9JHHqO0M2TjZDe4/KjAA==', 'XTU4HFLA2LKDMJKCS6E7XTQVX4YMYDBL', '117ddfaf-80b0-4b65-ace6-dfb9585a6764', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('ed78a52a-167d-4d20-852e-257dc41408ea', 'arexhepi', 'AREXHEPI', 'ardit.rexhepi@gmail.com', 'ARDIT.REXHEPI@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAECF5HG2TMqfJvyTcHwxRcUKOdnlh5YnXgiLihsygIfzNOkyRMuXTdoGskmvw4tAd0w==', 'WZ23V7VNUWZR3YVVUTWC7R5M27ZVKNC6', '4aaa29b2-d46e-477c-ae4b-a60f1d2e4406', NULL, 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('fea15606-dc8f-4b3d-9f6f-5c2ca53aaf9d', 'ahoxha', 'AHOXHA', 'arben.hoxha@gmail.com', 'ARBEN.HOXHA@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEJ4VwC59DKBqSPdP/5BLWypvgTVqx4Ce9JxYUyZRdGIgFhWiguk9F1VfSfQ9k6Wszg==', 'MPO2QBZKX3CII5R64CXZG6ZSFFSM32AG', 'a5f83a21-661a-4388-b58e-9d8d3572fc99', NULL, 0, 0, NULL, 1, 0);
SET IDENTITY_INSERT [dbo].[ContactForm] ON;
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (1, 6, 'Unë kam pranuar një porosi dhe kam qenë shumë i kënaqur me produktin dhe shërbimin e klientit.', '2022-07-09T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Fatlum Murtezi', 'fatlum.murtezi@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (2, 9, 'Produkti ishte i dërguar shpejt dhe në një paketim të sigurtë, gjë që e bëri përvojën time të blerjes shumë të këndshme.', '2022-07-20T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Shpresa Hoxha', 'shpresa.hoxha@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (3, 12, 'Stafi i shërbimit në klientë ishte shumë i kujdesshëm dhe ndihmës, duke më ndihmuar të zgjidhja shqetësimet e mia.', '2022-08-13T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Enver Jashari', 'enver.jashari@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (4, 29, 'Produkti ishte saktësisht siç u shfaq në faqen e internetit dhe ishte i lartë cilësisht.', '2022-08-18T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Fidan Kadriu', 'fidan.kadriu@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (5, 32, 'Kostoja e produktit ishte shumë e arsyeshme dhe unë ndjeva se kisha bërë një blerje të mirë.', '2022-09-05T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Florin Krasniqi', 'florin.krasniqi@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (6, 18, 'Porosia ishte e lehtë për tu ndjekur dhe unë isha në gjendje të dija gjithmonë ku ndodhej porosia ime.', '2022-09-28T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Anila Zeqiri', 'anila.zeqiri@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (7, 7, 'Në përgjithësi, unë kam qenë shumë i kënaqur me porosinë dhe do ta rekomandoja këtë biznes të tjerëve.', '2022-10-11T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Luljeta Ibrahimi', 'luljeta.ibrahimi@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (8, 15, 'Blerja ishte shumë e thjeshtë dhe e lehtë për tu bërë.', '2022-10-29T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Fitore Bajrami', 'fitore.bajrami@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (9, 20, 'Transporti ishte shumë i shpejtë dhe produkti mbërriti në kohën e duhur.', '2022-11-03T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Besiana Hajdari', 'besiana.hajdari@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (10, 10, 'Gjithçka ishte e përsosur dhe unë nuk mund të kisha kërkuar një përvojë të blerjes më të mirë.', '2022-11-14T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Naim Dervishi', 'naim.dervishi@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (11, 5, 'Dyqani ofron produkte teknologjike të shkëlqyera dhe stafi është shumë ndihmësor.', '2022-11-23T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Valbona Krasniqi', 'valbona.krasniqi@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (12, 9, 'Gama e produkteve është e madhe dhe çmimet janë të arsyeshme', '2022-12-15T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Shpresa Hoxha', 'shpresa.hoxha@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (13, 11, 'Blerja ime e fundit ishte një TV, dhe cilësia është jashtëzakonisht e mirë.', '2023-01-16T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Zejnullah Kadriu', 'zejnullah.kadriu@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (14, 16, 'Kompjuteri që blera punon pa asnjë problem, jam i kënaqur plotësisht.', '2023-03-26T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Dardan Ismaili', 'dardan.ismaili@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (15, 16, 'Personeli është i shkathët dhe jep këshilla të mira për zgjedhjen e produkteve', '2023-04-02T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Dardan Isamili', 'dardan.ismaili@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (16, 20, 'Kam blerë një telefon dhe funksionon mjaft mirë, kam bërë një zgjedhje të shkëlqyeshme.', '2023-05-09T00:00:00.000Z', 'Mesazhi eshte Pranuar dhe eshte Pergjigjur ne email', 'Besiana Hajdari', 'besiana.hajdari@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (17, 32, 'Transporti ishte i shpejtë dhe produktet arritën në gjendje të shkëlqyeshme.', '2023-06-10T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'Florin Krasniqi', 'florin.krasniqi@gmail.com');
INSERT INTO [dbo].[ContactForm] ([mesazhiID], [userID], [mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES (18, 34, 'Dyqani ofron zgjidhje tërheqëse për gaming, kam gjetur çdo gjë që më duhej.', '2023-06-11T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'Besa Bajrami', 'besa.bajrami@gmail.com');
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
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (10, 'Pjesë për kompjuter', 'Pjese te ndryshme per kompjuter, si: Ram, Procesor, GPU etj.');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (11, 'Wireless Charger', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (12, 'Tablet dhe Aksesore', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (13, 'Paisje Gaming', 'Fanella, Karrige dhe te tjera');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (14, 'Printer dhe Paisje per Printer', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (15, 'Kabllo te ndryshme & Adapter', '');
INSERT INTO [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (16, 'Monitor', '');
SET IDENTITY_INSERT [dbo].[KategoriaProduktit] OFF;
INSERT INTO [dbo].[KodiZbritjes] ([kodi], [dataKrijimit], [qmimiZbritjes], [idProdukti]) VALUES ('36OG3S', '2023-06-07T16:05:34.653Z', 15.99, NULL);
INSERT INTO [dbo].[KodiZbritjes] ([kodi], [dataKrijimit], [qmimiZbritjes], [idProdukti]) VALUES ('3PBUDC', '2023-05-07T20:35:45.640Z', 34.99, NULL);
INSERT INTO [dbo].[KodiZbritjes] ([kodi], [dataKrijimit], [qmimiZbritjes], [idProdukti]) VALUES ('BX3KNL', '2023-06-07T16:05:50.347Z', 59.99, NULL);
INSERT INTO [dbo].[KodiZbritjes] ([kodi], [dataKrijimit], [qmimiZbritjes], [idProdukti]) VALUES ('S00TQQ', '2023-05-07T20:35:52.027Z', 149.99, NULL);
SET IDENTITY_INSERT [dbo].[Kompania] ON;
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (1, 'Apple', 'AppleLogo.png', '');
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (2, 'Amd', 'AMDLogo.png', NULL);
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (3, 'Asus', 'AsusLogo.png', NULL);
INSERT INTO [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (4, 'JBL', 'JBL.png', NULL);
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
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (1, 'Rilind', 'Kyçyku', 'rilind.kycyku@gmail.com', 'rkycyku', '82345d9d-a4d0-4076-8d43-f61d63604472');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (2, 'Ilire', 'Jezerci', 'ilire.jezerci@gmail.com', 'ijezerci', '36da09a1-a245-46b2-9a29-08c75ca1b769');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (3, 'Përparim', 'Dardhishta', 'perparim.dardhishta@email.com', 'pdardhishta', '5d42072c-fcb5-4c9b-9c25-a0066c7ff1d9');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (4, 'Arben', 'Hoxha', 'arben.hoxha@gmail.com', 'ahoxha', 'fea15606-dc8f-4b3d-9f6f-5c2ca53aaf9d');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (5, 'Valbona', 'Krasniqi', 'valbona.krasniqi@gmail.com', 'vkrasniqi', '0fe2c1c8-6086-454f-83e8-fadee72336ad');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (6, 'Fatlum', 'Murtezi', 'fatlum.murtezi@gmail.com', 'fmurtezi', '487b813e-11a9-4ab6-9b10-ead71266c288');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (7, 'Luljeta', 'Ibrahimi', 'luljeta.ibrahimi@gmail.com', 'librahimi', '4fcd6f29-950e-43ac-a8ac-936ccc92cabc');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (8, 'Gent', 'Salihi', 'gent.salihi@gmail.com', 'gsalihi', '18c53e36-75a8-42bb-b78a-ea7bec040f86');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (9, 'Shpresa', 'Hoxha', 'shpresa.hoxha@gmail.com', 'shoxha', '6d965852-5dc8-4bd1-b3ed-32f810133da6');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (10, 'Naim', 'Dervishi', 'naim.dervishi@gmail.com', 'ndervishi', '96f706ca-2d28-4e48-80e9-0d03fad60d1a');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (11, 'Zejnullah', 'Kadriu', 'zejnullah.kadriu@gmail.com', 'zkadriu', '6c25088f-7e41-4b73-9380-549d31b14934');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (12, 'Enver', 'Jashari', 'enver.jashari@gmail.com', 'ejashari', '38008392-4173-4525-91f6-1ca31417776c');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (13, 'Adelina', 'Mustafa', 'adelina.mustafa@gmail.com', 'amustafa', '531575ac-afd3-4b81-a981-8cc0b579c28f');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (14, 'Albiona', 'Krasniqi', 'albiona.krasniqi@gmail.com', 'akrasniqi', 'a6ded093-cf79-42e0-b500-58a004892b15');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (15, 'Fitore', 'Bajrami', 'fitore.bajrami@gmail.com', 'fbajrami', '9fd9b11e-440c-4c4f-bb46-06ea5bdd7e75');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (16, 'Dardan', 'Ismaili', 'dardan.ismaili@gmail.com', 'dismaili', '81d433b8-1f64-40ef-9511-6d9dbd56f0cf');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (17, 'Kushtrim', 'Ramadani', 'kushtrim.ramadani@gmail.com', 'kramadani', 'b8461f8d-1c0c-4cfc-8437-5ad1a0c3a42e');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (18, 'Anila', 'Zeqiri', 'anila.zeqiri@gmail.com', 'azeqiri', '7ab40b8b-a135-48c8-97ac-f1870de525c4');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (19, 'Vlora', 'Gashi', 'vlora.gashi@gmail.com', 'vgashi', '606a59d6-8424-438f-a210-2b360b84fb49');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (20, 'Besiana', 'Hajdari', 'besiana.hajdari@gmail.com', 'bhajdari', 'e0f612cd-e026-4335-95e8-f08c148a0f5c');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (21, 'Drenusha', 'Berisha', 'drenusha.berisha@gmail.com', 'dberisha', '873a3d0f-e72c-48c1-8a38-d06bff07c737');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (22, 'Afrim', 'Lleshi', 'afrim.lleshi@gmail.com', 'alleshi', '22bfef71-8cab-4d15-af26-ab4bc6110222');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (23, 'Drita', 'Shala', 'drita.shala@gmail.com', 'dshala', '524411b2-2789-4c02-9c0b-c227b742d6ed');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (24, 'Vlera', 'Bajrami', 'vlera.bajrami@gmail.com', 'vbajrami', 'beea69a5-cb0f-41a4-85c2-50fd5e1dad11');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (25, 'Valdrin', 'Berisha', 'valdrin.berisha@gmail.com', 'vberisha', '141ee1b9-f205-4cdb-bf60-1923366fdba8');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (26, 'Emina', 'Mustafa', 'emina.mustafa@gmail.com', 'emustafa', '687204c7-2a82-46cc-95d6-fcdeaee48e18');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (27, 'Rron', 'Hajdari', 'rron.hajdari@gmail.com', 'rhajdari', '3043b855-1536-4325-8e23-223355983231');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (28, 'Blerta', 'Krasniqi', 'blerta.krasniqi@gmail.com', 'bkrasniqi', '68346e99-7a27-434b-b15b-4e2a1d8146d8');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (29, 'Fidan', 'Kadriu', 'fidan.kadriu@gmail.com', 'fkadriu', '9922d8bc-e3e9-40cf-82fc-bb096d4f2fe2');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (30, 'Ardit', 'Rexhepi', 'ardit.rexhepi@gmail.com', 'arexhepi', 'ed78a52a-167d-4d20-852e-257dc41408ea');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (31, 'Lindita', 'Basha', 'lindita.basha@gmail.com', 'lbasha', '09e7e384-1597-4b58-be8d-e500983b7e6a');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (32, 'Florin', 'Krasniqi', 'florin.krasniqi@gmail.com', 'fkrasniqi', '288577bc-9274-4223-b579-b490ee1f38e2');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (33, 'Erza', 'Hajdari', 'erza.hajdari@gmail.com', 'ehajdari', '922df69c-2db5-4ce7-a63c-c373e2899678');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (34, 'Besa', 'Bajrami', 'besa.bajrami@gmail.com', 'bbajrami', 'cf6b526b-d436-4bae-ba4e-29d5567e9275');
INSERT INTO [dbo].[Perdoruesi] ([userID], [emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES (35, 'Liridona', 'Hajdari', 'liridona.hajdari@gmail.com', 'lhajdari', '851fb44f-4776-4efa-9005-6334cd0ce0b2');
SET IDENTITY_INSERT [dbo].[Perdoruesi] OFF;
SET IDENTITY_INSERT [dbo].[Porosit] ON;
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (1, 505.49, '2021-08-23T00:00:00.000Z', 'E Pranuar nga Klienti', 35, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (2, 505.49, '2021-09-07T00:00:00.000Z', 'E Pranuar nga Klienti', 3, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (3, 1318.5, '2021-10-14T00:00:00.000Z', 'E Pranuar nga Klienti', 21, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (4, 396, '2021-10-22T00:00:00.000Z', 'E Pranuar nga Klienti', 20, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (5, 279.49, '2021-11-11T00:00:00.000Z', 'E Pranuar nga Klienti', 20, 123, 6);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (6, 489.5, '2021-11-16T00:00:00.000Z', 'E Pranuar nga Klienti', 8, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (7, 218.5, '2021-12-04T00:00:00.000Z', 'E Pranuar nga Klienti', 27, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (8, 1287, '2021-12-26T00:00:00.000Z', 'E Pranuar nga Klienti', 9, 0, 4);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (9, 465, '2022-01-05T00:00:00.000Z', 'E Pranuar nga Klienti', 24, 150, 5);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (10, 813.5, '2022-02-02T00:00:00.000Z', 'E Pranuar nga Klienti', 25, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (11, 1986.99, '2022-02-05T00:00:00.000Z', 'E Pranuar nga Klienti', 11, 150, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (12, 228.5, '2022-03-01T00:00:00.000Z', 'E Pranuar nga Klienti', 30, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (13, 428.5, '2022-03-12T00:00:00.000Z', 'E Pranuar nga Klienti', 33, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (14, 3368.5, '2022-03-19T00:00:00.000Z', 'E Pranuar nga Klienti', 2, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (15, 488.5, '2022-03-26T00:00:00.000Z', 'E Pranuar nga Klienti', 33, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (16, 3902.99, '2022-04-18T00:00:00.000Z', 'E Pranuar nga Klienti', 5, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (17, 424, '2022-04-24T00:00:00.000Z', 'E Pranuar nga Klienti', 19, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (18, 495.15, '2022-05-01T00:00:00.000Z', 'E Pranuar nga Klienti', 2, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (19, 196.99, '2022-05-12T00:00:00.000Z', 'E Pranuar nga Klienti', 32, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (20, 3348.5, '2022-06-04T00:00:00.000Z', 'E Pranuar nga Klienti', 25, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (21, 3502.99, '2022-06-07T00:00:00.000Z', 'E Pranuar nga Klienti', 4, 0, 4);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (22, 4868.48, '2022-06-20T00:00:00.000Z', 'E Pranuar nga Klienti', 34, 0, 4);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (23, 246.49, '2022-07-05T00:00:00.000Z', 'E Pranuar nga Klienti', 28, 0, 4);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (24, 228.49, '2022-07-09T00:00:00.000Z', 'E Pranuar nga Klienti', 6, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (25, 196.5, '2022-07-20T00:00:00.000Z', 'E Pranuar nga Klienti', 6, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (26, 396, '2022-08-13T00:00:00.000Z', 'E Pranuar nga Klienti', 32, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (27, 34, '2022-08-18T00:00:00.000Z', 'E Pranuar nga Klienti', 7, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (28, 19.99, '2022-09-05T00:00:00.000Z', 'E Pranuar nga Klienti', 20, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (29, 49.5, '2022-09-24T00:00:00.000Z', 'E Pranuar nga Klienti', 25, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (30, 354.99, '2022-09-28T00:00:00.000Z', 'E Pranuar nga Klienti', 9, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (31, 478.5, '2022-10-11T00:00:00.000Z', 'E Pranuar nga Klienti', 7, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (32, 1098.99, '2022-10-29T00:00:00.000Z', 'E Pranuar nga Klienti', 20, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (33, 148, '2022-11-03T00:00:00.000Z', 'E Pranuar nga Klienti', 11, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (34, 1758, '2022-11-14T00:00:00.000Z', 'E Pranuar nga Klienti', 11, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (35, 418.5, '2022-11-23T00:00:00.000Z', 'E Pranuar nga Klienti', 32, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (36, 419, '2022-12-15T00:00:00.000Z', 'E Pranuar nga Klienti', 14, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (37, 49.5, '2022-12-23T00:00:00.000Z', 'E Pranuar nga Klienti', 9, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (38, 653.99, '2023-01-05T00:00:00.000Z', 'E Pranuar nga Klienti', 23, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (39, 478.5, '2023-01-12T00:00:00.000Z', 'E Pranuar nga Klienti', 16, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (40, 279.05, '2023-01-16T00:00:00.000Z', 'E Pranuar nga Klienti', 3, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (41, 1719.46, '2023-01-25T00:00:00.000Z', 'E Pranuar nga Klienti', 11, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (42, 1797.99, '2023-02-01T00:00:00.000Z', 'E Pranuar nga Klienti', 12, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (43, 113.9, '2023-02-17T00:00:00.000Z', 'E Pranuar nga Klienti', 24, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (44, 648.5, '2023-02-22T00:00:00.000Z', 'E Pranuar nga Klienti', 22, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (45, 344.5, '2023-02-26T00:00:00.000Z', 'E Pranuar nga Klienti', 12, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (46, 59.99, '2023-03-08T00:00:00.000Z', 'E Pranuar nga Klienti', 26, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (47, 439.5, '2023-03-13T00:00:00.000Z', 'E Pranuar nga Klienti', 22, 34.99, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (48, 1312.57, '2023-03-19T00:00:00.000Z', 'E Pranuar nga Klienti', 25, 34.99, 6);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (49, 3098.41, '2023-03-26T00:00:00.000Z', 'E Pranuar nga Klienti', 23, 149.99, 7);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (50, 4251.49, '2023-04-02T00:00:00.000Z', 'E Pranuar nga Klienti', 11, 0, 6);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (51, 119.5, '2023-04-23T00:00:00.000Z', 'E Pranuar nga Klienti', 27, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (52, 255.09, '2023-04-29T00:00:00.000Z', 'E Pranuar nga Klienti', 17, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (53, 78, '2023-05-04T00:00:00.000Z', 'E Pranuar nga Klienti', 13, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (54, 149.5, '2023-05-09T00:00:00.000Z', 'E Pranuar nga Klienti', 17, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (55, 383.01, '2023-05-22T00:00:00.000Z', 'E Pranuar nga Klienti', 21, 15.99, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (56, 1047.99, '2023-05-28T00:00:00.000Z', 'E Pranuar nga Klienti', 22, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (57, 199, '2023-05-31T00:00:00.000Z', 'E Pranuar nga Klienti', 2, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (58, 9.5, '2023-06-03T00:00:00.000Z', 'E Dorezuar Tek Postieri', 30, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (59, 99.49, '2023-06-04T00:00:00.000Z', 'E Pergaditur', 23, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (60, 338, '2023-06-05T00:00:00.000Z', 'E Pergaditur', 3, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (61, 1299, '2023-06-07T00:00:00.000Z', 'E Verifikuar', 32, 0, 1);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (62, 99.8, '2023-06-07T00:00:00.000Z', 'E Verifikuar', 16, 0, 3);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (63, 898.5, '2023-06-07T00:00:00.000Z', 'E Verifikuar', 24, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (64, 383, '2023-06-08T00:00:00.000Z', 'Ne Procesim', 17, 0, 2);
INSERT INTO [dbo].[Porosit] ([idPorosia], [totaliPorosis], [dataPorosis], [statusiPorosis], [idKlienti], [zbritja], [totaliProdukteve]) VALUES (65, 559, '2023-06-09T00:00:00.000Z', 'Ne Procesim', 13, 0, 1);
SET IDENTITY_INSERT [dbo].[Porosit] OFF;
SET IDENTITY_INSERT [dbo].[Produkti] ON;
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (1, 'Laptop ASUS TUF Gaming F15 (2021), 15.6"', 'Ky laptop është i pajisur me karakteristika të shkëlqyeshme. Ai mundësohet nga një procesor 6-core Intel Core i5 11400H që funksionon me një frekuencë 2.7 GHz deri në 4.5 GHz. Procesori plotësohet me 16 GB DDR4 SODIMM (slot). Hard disku 512 GB SSD M.2 PCIe NVMe shërben për të dhënat. Disku optik mungon. Të dhënat e figurës për ekranin 15.6 " IPS me rezolucion 1920 x 1080 (Full HD) piksel janë siguruar nga kartela grafike NVIDIA GeForce RTX 3050Ti. Prej ndërfaqeve përfshin HDMI 2.0, mbështetje DisplayPort, RJ-45, 3 porte USB 3.0/3.1/3.2 Gen 1 Type-A dhe 1x Thunderbolt 4/USB4. Poashtu, laptopi mbështet standardet Wi-Fi a / b / g / n / ac / ax dhe Bluetooth v5.2. Lloji i kartës së rrjetit GLAN, WLAN. Ndër karakteristikat e tjera laptopi ka një tastierë me ndriçim dhe me taste numerike. Poashtu, përfshihen 2 altoparlantë 2W. Bateria ka kapacitet 3-cell, 48Wh. Fuqia maksimale e furnizimit me energji 180 W. Laptopi vjen me sistemin operativ Windows 11 Home.', '63e90dd68362c0.14152620.webp', 3, 2, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (2, 'Laptop Razer Blade 15 Advanced Model', '', '63d055e0c57d81.05756611.webp', 9, 2, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (3, 'Celular Samsung Galaxy S22 Ultra, 6.8", 12GB RAM, 512GB, i zi', 'Dizajni i hollë dhe elegant i Galaxy S22 Ultra fsheh fotografi të pafundme ditën dhe natën, një studio pune profesionale dhe veçori novatore që ju mbajnë larg duarve. Çipi grafik përdor arkitekturën e avancuar RDNA 2 të AMD dhe teknologjinë Ray Tracing për të ofruar një përvojë vizuale të nivelit të lartë me ndriçim realist të skenës. Me një maksimum verbues prej 1750 nits, Galaxy S22 Ultra është një nga telefonat më të ndritshëm nga Samsung ndonjëherë dhe ekran Dynamic AMOLED 2X me Vision Booster, bllokon në mënyrë efektive shkëlqimin e bezdisshëm në ekran. Kamera e pasme ka një rezolucion prej 108 + 12 + 10 + 10 Mpx, kurse kamera e përparme 40 Mpx.', '63d055e915be98.37912983.webp', 10, 1, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (4, 'Lenovo NB IdeaPad 3 15ALC6', '', '63d055f15d73c8.42300026.webp', 5, 2, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (5, 'Lenovo ThinkPad P14s Gen 3 (AMD), 14", AMD Ryzen 7 Pro, 32GB RAM, 1TB SSD, AMD Radeon 680M, i zi', '', '63d055feb6ffa9.20196181.webp', 5, 2, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (6, 'Maus pad SteelSeries QcK Heavy M', '', '63d05608dd9912.15133010.webp', 11, 8, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (7, 'Maus pad SteelSeries QcK Edge XL', '', '63d0561088af36.99850110.webp', 11, 8, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (8, 'Dron DJI Ryze Tello ED', '', '63d0561af0d506.97064987.webp', 13, 9, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (9, 'Dron Overmax X-Bee, 600 m, i zi', '', '63d056224fcfd5.12230564.webp', 14, 9, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (10, 'Dron DJI Mavic 3 Classic (DJI RC)(EU)', 'Mavic 3 Classic me performancë të lartë fluturimi dhe një kamerë Hasselblad përfaqëson cilësinë më të lartë të imazhit. Për të kapur ngjyrat natyrale të Mavic 3 Classic si kamerat e tjera Hasselblad, lentja L2D-20c përdor të njëjtat standarde kërkuese dhe ka kalibruar çdo piksel sensori me HNCS të integruar. Modaliteti video Night Images optimizon fotot në dritë të ulët, të tilla si perëndimet dhe lindjet e diellit, dhe redukton zhurmën për shkrepje më të pastra. Kjo jo vetëm që e bën më të lehtë fluturimin në distanca të gjata, por gjithashtu ndihmon në reduktimin e lëkundjeve manuale dhe siguron lëvizje më të qetë të kamerës. Mavic 3 Classic mund të fluturojë në një lartësi të caktuar dhe më pas të gjejë një rrugë të sigurt dhe efikase të kthimit në pikën e tij fillestare, duke kombinuar avantazhet e RTH të avancuar dhe RTH tradicionale dhe duke i lejuar përdoruesit të zgjedhin opsionin më të mirë sipas mjedisit.', '63d0562b618d48.16102205.webp', 13, 9, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (11, 'Kasë Thermaltake Core P3, e bardhë', 'Core P3 TG është një kasë me kornizë të hapur me aftësi të jashtëzakonshme shikimi. Paneli i përparmë i xhamit të kalbur me trashësi 5 mm garanton qëndrueshmërinë e dritares dhe e shfaq ndërtimin tuaj me qartësi të qartë. Përdoruesit mund të shikojnë plotësisht çdo komponent të sistemit dhe të tregojnë përkushtimin dhe grupin e aftësive të tyre. Kasa është e përshtatshme me pllakat amë ATX, Micro ATX (uATX), Mini ITX. Mund të instaloni kartë grafike me gjatësi maksimale 45cm. Në panelin e përparmë kasa ka 2x USB 2.0, 2x USB 3.0, lidhës për kufje dhe mikrofon.', '63d056323276c7.81542918.webp', 12, 10, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (12, 'Flutur ftohëse Arctic P14 PWM - 140 mm', '', '63d0563b7f0dd0.69298527.webp', 23, 10, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (13, 'Memorie G. Skill DDR4, 8 GB, 2400 MHz, CL17', 'Memoria e tillë G.Skill RAM prej 8 GB do të garantojë komoditet të lartë përdorimi për shumë aplikacione. Njerëzit që presin performancë maksimale dhe kursime të larta të energjisë duhet të arrijnë te memoria DDR4. Një memorie e tillë do tju lejojë të argëtoheni me performancë të shkëlqyer të operimit. Nëse kompjuteri ngadalësohet pas njëfarë kohe, do të jetë e mundur të zgjerohet memoria RAM. Vonesa CL17 do tju lejojë të punoni rehat me programet e zyrës, si dhe me shumë lojëra kërkuese. Tensioni prej 1.2 V fuqizon çipat e memories DDR4, që do të thotë 20% konsum më të ulët të energjisë në krahasim me DDR3 dhe gjerësi bande më të lartë. Ky variant do të jetë një zgjidhje perfekte për përdoruesit që presin punë të rehatshme dhe, në të njëjtën kohë, kursime të larta të energjisë.', '63d056492e89d5.21517717.webp', 15, 10, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (14, 'SSD Transcend MTE220S, M.2 - 256GB', '', '63d0567a1432f3.30627468.webp', 24, 10, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (15, 'Ftohës Akasa DDR, aRGB LED, pasiv (AK-MX248)', '', '63d05689da6022.83633684.webp', 16, 10, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (16, 'Përshtatës i brendshëm Akasa AK-CBUB37-50BK', '', '63d056a353ba19.29349886.webp', 16, 15, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (17, 'Ftohës Corsair ML120 PRO RGB, 120mm', '', '63d056ab22eb80.78302695.webp', 17, 10, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (18, 'Pastë Arctic MX-4 2019 (4g)', '', '63d056b3c3cc68.15404951.webp', 23, 10, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (19, 'Hard disk SSD WD Green SATA III - 240GB 3D NAND', 'WD Green është hard disk SSD për kompjuter apo laptop që ju sjell performancë të shpejtë të transferimit të të dhënave dhe ruajtjes së tyre me siguri të plotë. Luajtja e videolojërave, qasja në internet apo ndezja e sistemit operativ arrihen disa herë më shpejtë sesa hard disqet HDD. Aksesori vjen me kapacitet prej 240GB, mund të lidhet me kompjuter nëpërmjet platformës SATA III 6 Gb / s dhe është ndërtuar për konsumim të ulët të energjisë dhe operim afatgjatë. Formati i produktit është 2.5" dhe mund të arrijë deri në 545 MB / s shpejtësi.', '63d056bd110280.38041391.webp', 23, 10, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (20, 'Kompjuter AIO Acer Veriton Essential Z (EZ2740G),23.8", Intel Core i5-1135G7, 8 GB DDR4, 512GB SSD, Intel UHD Graphics, i argjendtë', '', '63d056c7197425.11040451.webp', 20, 6, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (21, 'Kompjuter Dell Inspiron 24 (5415), 23.8 ", AMD Ryzen 5, 16GB RAM, 256GB SSD, 1TB HDD, AMD Radeon Graphics, i bardhë', '', '63d056d11496d3.86492053.webp', 25, 6, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (22, 'Kompjuter HP ENVY 34-c1001nc, 34", Intel Core i7, 32GB RAM, 1TB SSD, NVIDIA GeForce RTX 3060, i argjendtë', '', '63d056dd5bc157.84233223.webp', 19, 6, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (23, 'Apple iMac 24", M1 8-core, 8GB, 256GB, 8-core GPU, Green', 'IMac i ri është një hap i madh përpara në ekosistemin e ri të Apple me përdorimin e platformës së fuqishme M1, i cili ka një performancë të shkëlqyeshme në një dizajn të ri me teknologji të lehtë për tu përdorur. Pikërisht atë që prisni nga një iMac i ri.rnrnPoashtu, ky kompjuter posedon një ekran Apple iMac 24 4.5K Retina AiO me diagonale 24" dhe një rezolucion 4.5K prej 4480 × 2520 pikselë. Performanca e tij është e ndërtuar në një procesor 8-bërthamor Apple M1 me GPU 8-bërthamë dhe 16-core Neural Engine dhe gjithashtu përfshin 8 GB RAM. Ndërsa, për sistemin, të dhënat dhe aplikacionin janë të dizajnuara 256 GB SSD, kamera të integruar FaceTime HD 1080p dhe WiFi për komunikim wireless Gigabit Ethernet, duke përfshirë Bluetooth 5.0 2x Thunderbolt 4 / Type-C. Përveç kësaj, Apple iMac 24 "4.5K Retina M1 posedon 2 porte USB Type-C 3.1 / 3.2 Gen 2 dhe 3.5 mm për kufje, si dhe operon me sistemin operativ Big Sur.', '63d056e8dc0484.98868210.webp', 1, 6, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (24, 'Projektor Acer C202i', 'The Acer C202i projector offers high-quality visual performance with 300 lumens and 5000:1 contrast ratio using DLP technology for 3D viewing, smooth video, and high color contrast. It has an HDMI port for quick and convenient connection to various high-resolution sources, a built-in USB port for external media players, and can project at a short distance of 0.73 meters with a WVGA resolution of 854x480 and a 16:9 aspect ratio. The projector has a lamp life of up to 30,000 hours in Eco mode, with a 1x2W internal speaker and an integrated battery for up to 5 hours of operation. It also features USB, HDMI, and 3.5mm Jack interfaces.', '63d056f36c8ac5.29677040.webp', 20, 7, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (25, 'Maus ZOWIE by BenQ S1,i zi', '', '63d056fddef055.63527829.webp', 21, 8, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (26, 'Maus Marvo M720W, i zi', '', '63d057056d4e38.57263102.webp', 22, 8, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (27, 'Apple MacBook Pro 16", M2 Max 12-Core, 32GB, 1TB, 38-Core GPU, Silver', 'Performanca e përshtatur për profesionistët. MacBook Pro 16 M2 Max i ri vjen me një ekran 16" dhe performanca e tij i shtyn kufijtë imagjinarë në një nivel të ri. Arkitektura e përmirësuar ndjeshëm e M2 Max thjesht ka fuqi brutale për të gjitha idetë tuaja krijuese. Dhe ajo që vëreni në shikim të parë është dizajn elegant me theks në cilësinë e përpunimit.', '63d05c06aa8757.25439961.webp', 1, 2, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (28, 'Kufje Logitech G432, të zeza', 'Kufje të fuqishme por shumë të rehatshme 50mm. X 2.0 mbështetja e zërit shtesë e gjeneratës së ardhshme. Dizajnuar për përdorim me të gjitha platformat e lojërave dhe pajisjet mobile, USB DAC dhe lidhës 3.5mm. Ata janë në përputhje me PC, Mac, PS4, Xbox One, Nintendo Switch dhe gjithashtu me pajisje të lëvizshme. Mikrofoni 6mm me funksionin "mute". 107 dB ndjeshmëri SPL / MW. Përgjigjja frekuencore 20 - 20,000 Hz. Impedancë 39 Ohm (pasive), 5 kiloohm (aktive). Gjatësia e kabllit 2 m. Të lehta me peshë prej 303 g (me kabllo). Përmasat 172 x 81.7 x 182 mm.', '5d583b48ac254c35a0fe6116884eb14f.webp', 6, 5, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (29, 'Hard disk Samsung SSD 970 EVO PLUS, M.2 - 250GB', '', '63eab84858c8d7.45002641.webp', 10, 10, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (30, 'Disk portativ WD Elements, 2TB, i zi', 'WD Elements ofron një hard disk portativ dhe modern. Me kapacitet 2 TB dhe peshë të lehtë (vetëm 230 gram), ofron shumë hapësirë për një sërë të dhënash. Pjesa e tij përbërëse është një mbulesë e fortë, duke e bërë diskun më rezistent ndaj dëmtimit. Ruajtja mbështet pa probleme pajisjet e fundit USB 3.0 dhe gjithashtu është i pajtueshëm me kompjuterët USB 2.0. Pajisja në modalitetin USB 3.0 transferon deri në 5 Gb / s, nëse e lidhni atë me një kompjuter që mbështet USB 2.0, do të duhet të jeni më i ngadaltë, por gjithsesi i mjaftueshëm i shpejtë maksimal teorik deri në 480 Mb / s. Disku është i formatuar nga fabrika me NTFS dhe është në përputhje me Windows 8, Windows 7, Windows Vista dhe Windows XP. Ato mund të riformatohen pa vështirësi për sistemet Mac. Kjo bën të mundur që pronarët e kompjuterave me sisteme të ndryshme operative të përdorin diskun. Dimensionet e tij janë 21 x 111 x 82mm.', '63eab88a9bae20.95606749.webp', 18, 10, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (31, 'Disk i jashtëm Transcend Jet 25H3B, 1 TB, i zi / kaltër', '', '63eab963cfcf35.02921447.webp', 24, 10, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (32, 'Apple MacBook Pro 16.2", M1 Max 10-core, 32GB, 1TB, 32-core GPU, Silver', '', '63eab99c203254.93655263.webp', 1, 2, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (33, 'Apple iPhone 11, 64GB, Black', '', '63eab9e5b821b1.87284331.webp', 1, 1, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (34, 'Apple Magic Mouse (2022), Black Multi - Touch Surface', '', '63eab9ff27af71.66828407.webp', 1, 8, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (35, 'Celular Samsung Galaxy A23 5G, 6.6" FHD+, 4GB RAM, 128GB, i kaltër', 'This is a mobile phone with a 6.6" Full HD+ display and a 120 Hz refresh rate. It has a 50 MPx camera, an ultra-wide-angle lens, macro and depth sensors, and an 8 MPx front camera. It is powered by a Qualcomm Snapdragon 695 processor with 8 cores and 4 GB RAM, and has 128 GB of storage with the option to add up to 1 TB with a micro SD card. It supports LTE, Wi-Fi, Bluetooth v5.1, 5G, NF, GPS, BeiDou, QZSS, GLONASS, and Galileo. It runs on Android OS, has a 5000 mAh battery with Super Fast Charging 25W, and weighs 197 g with dimensions of 165.4 x 76.9 x 8.4 mm.', '63eaba204edb24.98379543.webp', 10, 1, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (36, 'Apple Watch SE2 GPS 44mm, Midnight Aluminium Case me Midnight Sport Band, Regular', '', '63eaba4ebf5fb1.84174295.webp', 1, 3, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (37, 'Fotoaparat momental Fujifilm Instax Mini 90, i zi', '', '63eabd7f7f4296.27491084.webp', 26, 4, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (38, 'Printer Canon PIXMA TS3150, i zi', 'Printeri CANON PIXMA TS3150 është zgjidhja ideale për printim dhe skanim në zyrën apo shtëpinë tuaj. Pjesët përbërëse të printerit përfshijnë printimin me rezolucion 4800 x 1200 dpi, portin USB 2.0, teknologjinë Wi-Fi dhe ka madhësi 435 × 316 × 145 mm. Falë lidhjes me WI-FI ju mund të printoni edhe nga telefonët tuaj qoftë ai Android apo IOS. Në pako përfshihet : PG-545 (i zi ) CL-546 (me ngjyrë ) PG-545XL (i zi ) - opsional CL-546XL (me ngjyrë ) - opsional', '63eabdbea539b0.78235909.webp', 27, 14, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (39, 'Kufje Sony MDR-RF895RK, të zeza, III', '', '63eabdd87c2561.68876767.webp', 28, 5, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (40, 'Kontroller Sony Playstation 5 DualSense', '', '63eabe14e6ab51.91700813.webp', 28, 13, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (41, 'Karrige SENSE7 Knight, e zezë', '', '63eabe31db73d8.09365222.webp', 29, 13, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (42, 'Maus Preyon Owl Wireless (POW35B)', 'Mouse Preyon Owl është mouse gaming pa kabllo, mirëpo asgjë nuk pengon lidhjen e tij me një kabllo. Nëse bateria harxhohet, vetëm lidheni dhe mund të vazhdoni përdorimin e tij. Me 50milion klikime në përdorimin e këtij mausi që tregon për sigurinë që jepet kualitetit të këtij mausi. Me butona shtesë shumë lehtë kontrolloni vlerat DPI dhe frekuencën e përdorur. Me LED që tregojnë vlerën e selektuar lehtë.', '63eabe5a5852e1.52076563.webp', 30, 8, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (43, 'Apple 10.9-inch iPad (10th) Wi-Fi, 64GB, Silver', '', '63eabe72174975.16788497.webp', 1, 12, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (44, 'Apple MagSafe Duo Charger', '', '63eabe936e0523.11456101.webp', 1, 11, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (45, 'Apple AirPods (3rd generation) with Lightning Charging Case', N'AirPods janë të lehta dhe ofrojnë një dizajn të konturuar. Mikrofonat me pamje nga brenda zbulojnë atë që po dëgjoni, më pas rregullojnë frekuencat e rangut të ulët dhe të mesëm për të ofruar detaje të pasura në çdo këngë.rnrnAirPods kanë një jetëgjatësi shtesë të baterisë në krahasim me AirPods (gjenerata e dytë) deri në 6 orë kohë dëgjimi dhe deri në 4 orë kohë bisede. Dhe me kutinë e karikimit Lightning, mund të shijoni deri në 30 orë kohë totale të dëgjimit. Si AirPods ashtu edhe kasa e karikimit të Rrufesë janë vlerësuar me IPX4 rezistente ndaj ujit – kështu që do të përballojnë çdo gjë, nga shiu deri tek stërvitjet e rënda.', '63eabeae767761.75083362.webp', 1, 5, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (46, 'Karrige SENSE7 Spellcaster, e zezë/e kaltër', 'Karrigia SENSE7 Spellcaster ka një formë që i përshtatet lakimit natyror të shtyllës kurrizore dhe, si rezultat, siguron pozicionin e duhur përpara kompjuterit kur jeni duke luajtur ose duke punuar. Ajo plotësohet nga një mbushje sfungjer me dendësi optimale, e cila përshtatet me trupin dhe siguron rehati. Është projektuar për njerëzit me peshë maksimale 150 kg. Karrigia peshon 17.5kg.', '63f23b534f5c52.87433500.webp', 29, 13, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (47, 'Kamerë Logitech StreamCam C980, e hirtë', 'Kjo është një kamerë transmetimi me cilësi të lartë. Ajo ofron një cilësi maksimale të regjistrimit prej 1080p në 60 korniza për sekondë. Ajo përdor ndërfaqen USB 3.2 Gen 1 lloji C për tu lidhur me pajisjen. Është e pajisur me një lente f / 2.0 me një gjatësi fokale prej 3.7 mm dhe një fushë shikimi prej 78 ° (diagonale). Ofron autofokus në një distancë prej 10 cm deri në pafundësi. Ka një mikrofon të dyfishtë gjithëpërfshirës të integruar me funksion të zvogëlimit të zhurmës. Gjatësia e kabllos është 1.5 m. Paketa përfshin një mbajtës për vendosjen e saj në monitor dhe një mbajtës statik.', '63f5de70338ea0.03180620.webp', 6, 4, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (48, 'Altoparlant JBL CLIP 4, i kaltër i hapur', 'Altoparlant unik portativ me fuqi dalëse 5 W RMS, përgjigje frekuence prej 100 Hz deri 20 kHz, raport sinjal-zhurmë > 85 dB, teknologji Bluetooth 5.1. Bateria e tij polimer litium-jon karikohet për 3 orë dhe zgjat deri në 10 orë. Përmasat e altoparlantit janë: 86.3 x 134.5 x 46 mm, pesha 239 g.', '63f5deb8055346.05332264.webp', 4, 5, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (49, 'Ngjyrë për printer Canon PGI-571, e kaltërt', 'Ngjyra e kaltër Canon CLI-571 është në përputhje me printera Canon PIXMA MG5750, MG5751, MG5752, MG5753, MG6850, MG6851, MG6852, MG6853, MG7750, MG7751, MG7752, MG7753. Kjo ngjyrë ka një vëllim prej 7 ml.', '63f5df0fe61cf8.49070509.webp', 27, 14, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (50, 'Maus Razer Pro Click, i bardhë', 'Ky është një maus wireless i krijuar për përdoruesit e djathtë. Mausi ka lidhës USB, 8 butona dhe një rrotë mekanike. Ai ka teknologji wireless Bluetooth, sensor optik dhe ndjeshmëri maksimale 16,000 DPI.', '63f5e0272928f8.99239124.webp', 9, 8, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (51, 'Karikues Samsung EP-TA12 për Samsung micro USB, i zi', '', '63f5e741d05b48.11483682.webp', 10, 15, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (52, 'Apple 20W USB-C Power Adapter', 'Ky është një karikues i fuqishëm 20W, i cili përdoret për karikim të shpejtë dhe efikas në shtëpi, në zyrë dhe gjatë lëvizjes. Është i pajtueshëm me çdo pajisje USB-C, por për një performancë optimale të karikimit, Apple rekomandon përdorimin e tij me iPad Pro 11'' ose iPad Pro 12,9'' (gjenerata e tretë). Ai gjithashtu mbështet karikimin e shpejtë të iPhone 8.', '63f5e7a904efe1.07954376.webp', 1, 15, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (53, 'Gjirafa50 Bad News Eagles Jersey (Rio Edition) - XXL', 'Ndjeni emocionin e kualifikimit të dytë në Major me fanellën e Rio Edition të Bad News Eagles.rnrnKjo fanellë e cilësisë së lartë me dizajn modern, e krijuar posaçërisht për lojtarët pasionantë të sporteve elektronike, është krijuar me krenari krahas Gjirafa50.rnrnNgjyra e saj kryesore është e gjelbër, e njohur si ngjyra dominuese e flamurit kombëtar të Brazilit.rnrnFanella ka logon e personalizuar të ekipit BNE dhe është prej 100% poliestër.', '63f5ec27d0f672.76058981.webp', 31, 13, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (54, 'Gjirafa50 Bad News Eagles Jersey Legends Edition - L', 'Ndjeni emocionet e lojës me këtë fanellë të Legends Stage të Bad News Eagles të krijuar posaçërisht për lojtarët e apasionuar pas sporteve elektronike. Ngjyra kryesore e saj është e kuqja e kombinuar me detaje bardh e zi dhe ka logon e personalizuar të ekipit BNE. Fanella është prej 100% poliestër. Dimensionet janë 71 x 57 x 25.5 cm.rnrnKjo fanellë e cilësisë së lartë me dizajn modern është krijuar me krenari përkrah Gjirafa50.', '63f5ec4e91ff92.01429806.webp', 31, 13, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (55, 'Rrip metalik FIXED për Apple Watch 38/40/41mm, i argjendtë', 'Rrip metalik zëvendësues që është i pajtueshëm me Apple Watch 38/40 / 41mm. Ky rrip e kthen orën në një aksesor elegant që mund ta kombinoni lehtësisht me çdo veshje.', '63f5ec798adb88.56368457.webp', 35, 3, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (56, 'Mbrojtëse Lenuo Leshield për iPhone 13, e kuqe', 'Mbrojtëse për pjesën e pasme dhe anësore të celularit iPhone 13. Mbrojtësja është prej plastike të qëndrueshme dhe do të sigurojë mbrojtje të besueshme të celularit nga gërvishtjet dhe papastërtitë. Natyrisht, mbrojtësja ka prerje për kamerën, butonat dhe portin e karikimit. Ajo është e këndshme në prekje dhe e ruajtur mirë.', '63f5ec9fb0aa89.27408325.webp', 32, 1, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (57, 'Procesor Intel Core i7-12700F', 'Ky është një procesor i gjeneratës së 12-të Alder Lake i krijuar për prizën LGA 1700. Ofron 8+4 bërthama fizike (8 performancë + 4 efektive, 20 threads). Frekuenca e tyre është 1.6/2.1 GHz dhe deri në 3.6/4.8 GHz në modalitetin Turbo (bërthama efikase/performancë). Frekuenca maksimale Turbo Boost është deri në 4.9 GHz. Ai ofron një memorie buffer 25 MB SmartCache dhe një proces prodhimi 10 nm është përdorur për krijimin e tij. Mbështet memorie deri në DDR5 4800 MHz dhe DDR4 3200 MHz. Mbështet ndërfaqen PCI-Express 5.0/4.0. TDP e deklaruar nga prodhuesi është 65 W (maksimumi 180 W).', '63f5ecdb56b5d2.54488204.webp', 33, 10, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (58, 'Monitor Dell U3223QE - LED 31.5", 4K UHD, i zi / argjendtë', 'Dell U3223QE është një monitor 31.5" me rezolucion të lartë që do tju rrëmbejë me ngjyrën dhe elegancën e tij. Rezolucioni 4K (3840 x 2160) me më shumë se 8 milionë piksele ka një rezolucion 4 herë më të lartë se një monitor klasik Full HD. Ngjyrat janë të qarta dhe të qëndrueshme përgjatë këndit të shikimit. Dell UltraSharp P3222QE është një monitor që mendon gjithashtu për shëndetin tuaj. Falë funksionit ComfortView Plus, i cili garanton emetimin vazhdimisht të ulët të dritës blu, ju do të shijoni ngjyra të shkëlqyera.rnrnKarakteristikat e tjera të monitorit përfshijnë raporti i pamjes 16: 9, kontrasti 2000: 1, shpejtësia e rifreskimit 60 Hz, ndriçimi 400 cd / m2, koha e përgjigjes 8 ms në modalitetin normal ose 5 ms në modalitetin e shpejtë. Lidhësit: 1x DP, 1x HDMI, USB-C, 6x USB, 1x RJ-45, pivot. Dimensionet 71.26 cm x 61.88 cm x 23.32 cm, pesha 10.36 k', '63f5ecf98f3534.93172253.webp', 25, 16, NULL);
INSERT INTO [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [kompaniaID], [kategoriaID], [zbritja]) VALUES (59, 'Kabllo AXAGON USB-A - micro USB 3.2 Gen 1 SPEED, 3A, 1m, e zezë', 'Kablloja AXAGON është e përshtatshme për laptopë, telefont, tabletë dhe pajisje e tjera celulare. Mbështet shpejtësinë e transferimit të të dhënave deri në 5 Gb / s dhe karikimin deri në 3A.', '63f5ed187916e2.65869096.webp', 34, 15, NULL);
SET IDENTITY_INSERT [dbo].[Produkti] OFF;
SET IDENTITY_INSERT [dbo].[RegjistrimiStokut] ON;
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (1, '2022-04-24T17:20:44.417Z', 3, 2, 16030, 12326);
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (2, '2022-12-23T10:09:59.923Z', 1, 2, 29750, 15000);
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (3, '2023-02-01T10:15:05.620Z', 1, 2, 29750, 15000);
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (4, '2023-02-26T12:25:51.490Z', 1, 3, 68995, 62068);
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (5, '2023-04-23T12:27:39.360Z', 3, 5, 53789.31, 40897);
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (6, '2023-05-04T12:39:00.017Z', 1, 4, 201488.4, 140878.1);
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (7, '2023-05-22T12:39:50.197Z', 1, 3, 34956, 32376);
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (8, '2023-05-28T12:41:11.173Z', 2, 5, 121859.75, 110419.14);
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (9, '2023-05-31T12:42:11.737Z', 2, 5, 121320.5, 102164.75);
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (10, '2023-06-02T16:00:12.847Z', 1, 8, 47472.84, 40300);
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (11, '2023-06-03T16:00:37.863Z', 3, 2, 3789.7, 2680);
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (12, '2023-06-06T16:02:14.643Z', 1, 2, 33886.2, 25519.2);
INSERT INTO [dbo].[RegjistrimiStokut] ([idRegjistrimit], [dataRegjistrimit], [stafiID], [totaliProdukteveRegjistruara], [shumaTotaleRegjistrimit], [shumaTotaleBlerese]) VALUES (13, '2023-06-07T16:27:00.547Z', 2, 1, 215.94, 179.94);
SET IDENTITY_INSERT [dbo].[RegjistrimiStokut] OFF;
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (1, 20, 12, 759, '2023-05-08T19:09:28.633Z', '2023-06-07T16:08:00.010Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (2, 1, 1, 2710.49, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (3, 29, 1, 999.99, '2023-05-08T19:10:10.413Z', '2023-06-07T16:03:47.583Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (4, 1, 1, 459.5, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (5, 1, 1, 2469.5, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (6, 6, 29.99, 35.99, '2023-05-08T19:10:10.413Z', '2023-06-07T16:27:00.703Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (7, 1, 1, 52.5, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (8, 350, 1, 354.99, '2023-05-08T19:10:10.413Z', '2023-06-07T16:09:04.127Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (9, 192, 1, 299, '2023-05-08T19:10:10.413Z', '2023-06-07T16:12:49.190Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (10, 1, 1, 2489.99, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (11, 28, 1, 236, '2023-05-08T19:10:10.413Z', '2023-06-07T16:08:00.003Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (12, 1, 1, 18.45, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (13, 1, 1, 18.99, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (14, 1, 1, 29.99, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (15, 1, 1, 30, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (16, 1, 1, 9.99, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (17, 184, 1, 39, '2023-05-08T19:10:10.413Z', '2023-06-07T16:12:49.190Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (18, 1, 1, 12.99, '2023-05-08T19:10:10.413Z', '2023-05-08T19:10:10.413Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (19, 32, 1, 69, '2023-05-08T19:10:10.413Z', '2023-06-07T12:41:11.207Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (20, 15, 1, 999, '2023-05-08T19:10:10.413Z', '2023-06-07T12:45:22.537Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (21, 12, 1, 1649, '2023-05-08T19:11:55.617Z', '2023-06-07T12:39:50.230Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (22, 25, 1, 3499.99, '2023-05-08T19:11:55.617Z', '2023-06-07T12:41:11.220Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (23, 15, 1, 1799, '2023-05-08T19:11:55.617Z', '2023-06-07T12:41:11.237Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (24, 19, 1, 399, '2023-05-08T19:11:55.617Z', '2023-06-07T16:10:03.323Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (25, 1, 1, 97.5, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (26, 1, 1, 45.59, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (27, 1, 1, 4149, '2023-05-08T19:11:55.617Z', '2023-05-08T19:11:55.617Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (28, 25, 1, 84.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:08:00.003Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (29, 60, 1, 49.5, '2023-05-08T19:11:55.617Z', '2023-06-07T12:41:11.263Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (30, 30, 1, 129.55, '2023-05-08T19:11:55.617Z', '2023-06-07T16:03:06.987Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (31, 29, 1, 59.99, '2023-05-08T19:11:55.617Z', '2023-06-07T16:05:07.730Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (32, 16, 1, 3299, '2023-05-08T19:11:55.617Z', '2023-06-07T16:09:04.127Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (33, 11, 1, 599, '2023-05-08T19:11:55.617Z', '2023-06-07T16:14:15.610Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (34, 15, 1, 119, '2023-05-08T19:11:55.617Z', '2023-06-07T12:42:11.763Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (35, 293, 1, 299.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:14:15.610Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (36, 28, 1, 349, '2023-05-08T19:11:55.617Z', '2023-06-07T16:14:25.710Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (37, 143, 1, 119.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:09:13.787Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (38, 18, 1, 79.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:12:36.943Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (39, 18, 1, 99.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:09:04.127Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (40, 29, 1, 95.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:09:24.337Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (41, 29, 1, 189.99, '2023-05-08T19:11:55.617Z', '2023-06-07T16:10:14.697Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (42, 23, 1, 49.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:09:35.073Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (43, 27, 1, 559, '2023-05-08T19:11:55.617Z', '2023-06-07T16:14:53.400Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (44, 28, 1, 199, '2023-05-08T19:11:55.617Z', '2023-06-07T16:10:25.177Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (45, 29, 1, 245, '2023-05-08T19:11:55.617Z', '2023-06-07T16:04:52.457Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (46, 44, 1, 159.59, '2023-05-08T19:11:55.617Z', '2023-06-07T16:09:24.337Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (47, 38, 1, 149.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:09:46.003Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (48, 245, 1, 59.99, '2023-05-08T19:11:55.617Z', '2023-06-07T16:07:17.150Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (49, 16, 1, 19.99, '2023-05-08T19:11:55.617Z', '2023-06-07T16:12:36.957Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (50, 9, 1, 127.5, '2023-05-08T19:11:55.617Z', '2023-06-07T12:42:42.360Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (51, 2, 1, 18.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:14:03.023Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (52, 26, 1, 35.9, '2023-05-08T19:11:55.617Z', '2023-06-07T16:14:03.023Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (53, 241, 1, 59.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:07:17.157Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (54, 242, 1, 59.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:07:17.150Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (55, 11, 1, 34, '2023-05-08T19:11:55.617Z', '2023-06-07T16:14:25.710Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (56, 20, 1, 19.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:00:13.003Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (57, 7, 1, 396, '2023-05-08T19:11:55.617Z', '2023-06-07T12:42:52.597Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (58, 20, 1, 1299, '2023-05-08T19:11:55.617Z', '2023-06-07T16:12:59.257Z');
INSERT INTO [dbo].[StokuQmimiProduktit] ([produktiID], [sasiaNeStok], [qmimiBleres], [qmimiProduktit], [dataKrijimit], [dataPerditsimit]) VALUES (59, 5, 1, 9.5, '2023-05-08T19:11:55.617Z', '2023-06-07T16:14:03.023Z');
INSERT INTO [dbo].[TeDhenatBiznesit] ([IDTeDhenatBiznesit], [EmriIBiznesit], [ShkurtesaEmritBiznesit], [NUI], [NF], [NRTVSH], [Adresa], [NrKontaktit], [Email], [Logo]) VALUES (1, 'TechStore SH.P.K.', 'TCHSTR', 810300575, 600043674, 330034372, 'Agim Bajrami - Supermarketi Besa, Kaçanik', '+38343123123', 'info@techstore.com', '618357555dbe4899b6e87b89be61c819.png');
SET IDENTITY_INSERT [dbo].[TeDhenatEPorosis] ON;
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (1, 396, 1, 1, 57, 396);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (2, 59.5, 1, 1, 53, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (3, 49.99, 1, 1, 54, 49.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (4, 59.5, 1, 2, 53, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (5, 49.99, 1, 2, 54, 49.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (6, 396, 1, 2, 57, 396);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (7, 1299, 1, 3, 58, 1299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (8, 19.5, 1, 3, 56, 19.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (9, 396, 1, 4, 57, 396);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (10, 59.5, 1, 5, 48, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (11, 59.5, 1, 5, 54, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (12, 59.5, 1, 5, 53, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (13, 24.99, 1, 5, 52, 24.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (14, 149.5, 1, 5, 46, 149.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (15, 49.5, 1, 5, 42, 49.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (16, 59.5, 1, 6, 53, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (17, 396, 1, 6, 57, 396);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (18, 34, 1, 6, 55, 34);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (19, 59.5, 1, 7, 53, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (20, 9.5, 1, 7, 59, 9.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (21, 149.5, 1, 7, 47, 149.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (22, 19.5, 1, 8, 49, 19.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (23, 579, 1, 8, 33, 579);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (24, 569, 1, 8, 43, 569);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (25, 119.5, 1, 8, 37, 119.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (26, 18.5, 1, 9, 51, 18.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (27, 240, 1, 9, 45, 240);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (28, 127.5, 1, 9, 50, 127.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (29, 59.5, 1, 9, 54, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (30, 169.5, 1, 9, 41, 169.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (31, 55, 1, 10, 19, 55);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (32, 758.5, 1, 10, 1, 758.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (33, 357.99, 1, 11, 8, 357.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (34, 1779, 1, 11, 23, 1779);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (35, 59.5, 1, 12, 54, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (36, 169, 1, 12, 44, 169);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (37, 349, 1, 13, 36, 349);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (38, 79.5, 1, 13, 38, 79.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (39, 69.5, 1, 14, 31, 69.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (40, 3299, 1, 14, 32, 3299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (41, 99.5, 1, 15, 39, 99.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (42, 299.5, 1, 15, 35, 299.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (43, 89.5, 1, 15, 40, 89.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (44, 3499.99, 1, 16, 22, 3499.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (45, 359.5, 1, 16, 24, 359.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (46, 43.5, 1, 16, 17, 43.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (47, 9.5, 1, 17, 59, 9.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (48, 396, 1, 17, 57, 396);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (49, 18.5, 1, 17, 51, 18.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (50, 210.66, 1, 18, 11, 210.66);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (51, 284.49, 1, 18, 9, 284.49);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (52, 59.99, 1, 19, 48, 59.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (53, 9.5, 1, 19, 59, 9.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (54, 127.5, 1, 19, 50, 127.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (55, 3299, 1, 20, 32, 3299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (56, 49.5, 1, 20, 42, 49.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (57, 59.99, 1, 21, 48, 59.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (58, 59.5, 1, 21, 53, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (59, 3299, 1, 21, 32, 3299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (60, 84.5, 1, 21, 28, 84.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (61, 3299, 1, 22, 32, 3299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (62, 1499.99, 1, 22, 21, 1499.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (63, 19.99, 1, 22, 49, 19.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (64, 49.5, 1, 22, 29, 49.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (65, 49.5, 1, 23, 42, 49.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (66, 127.5, 1, 23, 50, 127.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (67, 9.5, 1, 23, 59, 9.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (68, 59.99, 1, 23, 48, 59.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (69, 119, 1, 24, 34, 119);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (70, 59.99, 1, 24, 48, 59.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (71, 49.5, 1, 24, 42, 49.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (72, 127.5, 1, 25, 50, 127.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (73, 9.5, 1, 25, 59, 9.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (74, 59.5, 1, 25, 53, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (75, 396, 1, 26, 57, 396);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (76, 34, 1, 27, 55, 34);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (77, 19.99, 1, 28, 49, 19.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (78, 49.5, 1, 29, 42, 49.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (79, 354.99, 1, 30, 8, 354.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (80, 119.5, 1, 31, 37, 119.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (81, 299.5, 1, 31, 35, 299.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (82, 59.5, 1, 31, 54, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (83, 199, 1, 32, 44, 199);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (84, 899.99, 1, 32, 3, 899.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (85, 59.5, 1, 33, 53, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (86, 39, 1, 33, 17, 39);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (87, 49.5, 1, 33, 42, 49.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (88, 759, 1, 34, 1, 759);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (89, 999, 1, 34, 20, 999);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (90, 119.5, 1, 35, 37, 119.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (91, 299, 1, 35, 9, 299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (92, 299.5, 1, 36, 35, 299.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (93, 119.5, 1, 36, 37, 119.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (94, 49.5, 1, 37, 42, 49.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (95, 354.99, 1, 38, 8, 354.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (96, 299, 1, 38, 9, 299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (97, 59.5, 1, 39, 54, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (98, 299.5, 1, 39, 35, 299.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (99, 119.5, 1, 39, 37, 119.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (100, 149.5, 1, 40, 47, 149.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (101, 129.55, 1, 40, 30, 129.55);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (102, 1419.96, 4, 41, 8, 354.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (103, 299.5, 1, 41, 35, 299.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (104, 759, 1, 42, 1, 759);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (105, 39, 1, 42, 17, 39);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (106, 999.99, 1, 42, 3, 999.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (107, 35.9, 1, 43, 52, 35.9);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (108, 78, 2, 43, 17, 39);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (109, 349, 1, 44, 36, 349);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (110, 299.5, 1, 44, 35, 299.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (111, 245, 1, 45, 45, 245);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (112, 99.5, 1, 45, 39, 99.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (113, 59.99, 1, 46, 31, 59.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (114, 354.99, 1, 47, 8, 354.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (115, 119.5, 1, 47, 37, 119.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (116, 709.98, 2, 48, 8, 354.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (117, 299, 1, 48, 9, 299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (118, 159.59, 1, 48, 46, 159.59);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (119, 59.5, 1, 48, 54, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (120, 59.99, 1, 48, 48, 59.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (121, 59.5, 1, 48, 53, 59.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (122, 84.5, 1, 49, 28, 84.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (123, 35.9, 1, 49, 52, 35.9);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (124, 559, 1, 49, 43, 559);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (125, 472, 2, 49, 11, 236);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (126, 39, 1, 49, 17, 39);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (127, 759, 1, 49, 1, 759);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (128, 1299, 1, 49, 58, 1299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (129, 119.5, 1, 50, 37, 119.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (130, 354.99, 1, 50, 8, 354.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (131, 99.5, 1, 50, 39, 99.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (132, 299, 1, 50, 9, 299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (133, 79.5, 1, 50, 38, 79.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (134, 3299, 1, 50, 32, 3299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (135, 119.5, 1, 51, 37, 119.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (136, 95.5, 1, 52, 40, 95.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (137, 159.59, 1, 52, 46, 159.59);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (138, 49.5, 1, 53, 42, 49.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (139, 28.5, 1, 53, 6, 28.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (140, 149.5, 1, 54, 47, 149.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (141, 399, 1, 55, 24, 399);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (142, 299, 1, 56, 9, 299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (143, 189.99, 1, 56, 41, 189.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (144, 559, 1, 56, 43, 559);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (145, 199, 1, 57, 44, 199);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (146, 9.5, 1, 58, 59, 9.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (147, 79.5, 1, 59, 38, 79.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (148, 19.99, 1, 59, 49, 19.99);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (149, 39, 1, 60, 17, 39);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (150, 299, 1, 60, 9, 299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (151, 1299, 1, 61, 58, 1299);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (152, 71.8, 2, 62, 52, 35.9);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (153, 9.5, 1, 62, 59, 9.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (154, 18.5, 1, 62, 51, 18.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (155, 599, 1, 63, 33, 599);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (156, 299.5, 1, 63, 35, 299.5);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (157, 34, 1, 64, 55, 34);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (158, 349, 1, 64, 36, 349);
INSERT INTO [dbo].[TeDhenatEPorosis] ([idDetajet], [qmimiTotal], [sasiaPorositur], [idPorosia], [idProdukti], [qmimiProduktit]) VALUES (159, 559, 1, 65, 43, 559);
SET IDENTITY_INSERT [dbo].[TeDhenatEPorosis] OFF;
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (1, '+38343710410', 'Kaçanik', 71000, 'Komandant Zefi 69', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (2, '+38344123123', 'Kaçanik', 71000, 'Ramadan Agushi', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (3, '+38346123456', 'Kaçanik', 71000, 'Ramadan Agushi', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (4, '+355691234567', 'Tiranë', 1001, 'Rruga e Durresit 25', 'Shqipëri');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (5, '+38349123456', 'Gjilan', 60000, 'Rruga Rexhep Luci 10', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (6, '+38349123456', 'Prishtinë', 10000, 'Bulevardi Bill Klinton', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (7, '+355691234567', 'Tiranë', 1001, 'Rruga e Kavajës', 'Shqipëri');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (8, '+355691234567', 'Tiranë', 1001, 'Bulevardi 6 Shkurti', 'Shqipëri');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (9, '+38349123456', 'Ferizaj', 70000, 'Rruga Shemsi Syla', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (10, '+38349123456', 'Prishtinë', 10000, 'Rruga Prishtinë - Fushë Kosovë', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (11, '+38349123456', 'Prishtinë', 10000, 'Rruga Fehmi Agani', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (12, '+38349123456', 'Prizren', 20000, 'Rruga Ali Pashë Gucia', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (13, '+38349123456', 'Prishtinë', 10000, 'Rruga Bajram Curri', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (14, '+355691234567', 'Tiranë', 1001, 'Rruga e Kavajës', 'Shqipëri');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (15, '+355691234567', 'Tiranë', 1001, 'Bulevardi Dëshmorët e Kombit', 'Shqipëri');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (16, '+38971123456', 'Gostivar', 1230, 'Rruga Nëntori', 'Maqedoni e Veriut');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (17, '+38349123456', 'Prishtinë', 10000, 'Bulevardi Iliria', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (18, '+355691234567', 'Vlorë', 9401, 'Rruga Eqrem Çabej', 'Shqipëri');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (19, '+38349123456', 'Prishtinë', 10000, 'Rruga Bajram Curri', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (20, '+355691234567', 'Durrës', 2001, 'Rruga Tirana', 'Shqipëri');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (21, '+38349123456', 'Ferizaj', 70000, 'Rruga UÇK', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (22, '+355691234567', 'Tiranë', 1001, 'Rruga Hoxha Tahsim', 'Shqipëri');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (23, '+38349123456', 'Gjilan', 60000, 'Rruga Haxhi Zeka', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (24, '+38349123456', 'Prishtinë', 10000, 'Rruga 28 Nëntori', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (25, '+38349123456', 'Gjilan', 60000, 'Rruga Tahir Sinani', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (26, '+38349123456', 'Prishtinë', 10000, 'Rruga Fazli Grajqevci', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (27, '+38349123456', 'Gjilan', 60000, 'Rruga Tahir Sinani', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (28, '+38349123456', 'Prishtinë', 10000, 'Rruga 28 Nëntori', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (29, '+38349123456', 'Prishtinë', 10000, 'Rruga Ahmet Krasniqi', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (30, '+38349123456', 'Prishtinë', 10000, 'Rruga Bajram Curri', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (31, '+355691234567', 'Tiranë', 1001, 'Rruga Murat Toptani', 'Shqipëri');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (32, '+38349123456', 'Gjilan', 60000, 'Rruga Tahir Sinani', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (33, '+38349123456', 'Prishtinë', 10000, 'Rruga Luan Haradinaj', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (34, '+38349123456', 'Prishtinë', 10000, 'Rruga Adem Jashari', 'Kosovë');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (35, '+38349123456', 'Prishtinë', 10000, 'Rruga Fazli Grajqevci', 'Kosovë');
SET IDENTITY_INSERT [dbo].[TeDhenatRegjistrimit] ON;
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (1, 1, 58, 12, 999, 1299);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (2, 1, 55, 13, 26, 34);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (3, 2, 54, 250, 30, 59.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (4, 3, 54, 250, 30, 59.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (5, 3, 53, 250, 30, 59.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (6, 4, 50, 12, 99, 127.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (7, 4, 42, 30, 30, 49.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (8, 4, 32, 20, 2999, 3299);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (9, 5, 20, 15, 800, 999);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (10, 5, 1, 23, 600, 759);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (11, 5, 44, 30, 170, 199);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (12, 5, 49, 19, 13, 19.99);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (13, 5, 48, 250, 39, 59.99);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (14, 6, 11, 30, 198, 236);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (15, 6, 8, 360, 249, 354.99);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (16, 6, 9, 198, 200, 299);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (17, 6, 17, 190, 29.99, 39);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (18, 7, 21, 12, 1599, 1649);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (19, 7, 24, 20, 360, 399);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (20, 7, 33, 12, 499, 599);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (21, 8, 19, 32, 30, 69);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (22, 8, 22, 25, 3299, 3499.99);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (23, 8, 23, 15, 1599, 1799);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (24, 8, 28, 26, 59.99, 84.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (25, 8, 29, 60, 23.99, 49.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (26, 9, 34, 15, 89.65, 119);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (27, 9, 35, 299, 250, 299.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (28, 9, 36, 30, 329, 349);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (29, 9, 37, 150, 100, 119.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (30, 9, 38, 20, 60, 79.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (31, 10, 56, 20, 14, 19.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (32, 10, 52, 30, 27, 35.9);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (33, 10, 47, 40, 129, 149.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (34, 10, 46, 46, 135, 159.59);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (35, 10, 45, 30, 200, 245);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (36, 10, 43, 30, 499, 559);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (37, 10, 41, 30, 150, 189.99);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (38, 10, 40, 30, 79, 95.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (39, 11, 39, 20, 59, 99.5);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (40, 11, 31, 30, 50, 59.99);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (41, 12, 3, 30, 756.64, 999.99);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (42, 12, 30, 30, 94, 129.55);
INSERT INTO [dbo].[TeDhenatRegjistrimit] ([id], [idRegjistrimit], [idProduktit], [sasiaStokut], [qmimiBleres], [qmimiShites]) VALUES (43, 13, 6, 6, 29.99, 35.99);
SET IDENTITY_INSERT [dbo].[TeDhenatRegjistrimit] OFF;
INSERT INTO [dbo].[ZbritjaQmimitProduktit] ([produktiID], [qmimiPaZbritjeProduktit], [qmimiMeZbritjeProduktit], [dataZbritjes], [dataSkadimit]) VALUES (7, 52.5, 49.99, '2023-06-07T16:27:52.990Z', '2023-06-24T00:00:00.000Z');
INSERT INTO [dbo].[ZbritjaQmimitProduktit] ([produktiID], [qmimiPaZbritjeProduktit], [qmimiMeZbritjeProduktit], [dataZbritjes], [dataSkadimit]) VALUES (17, 39, 35.99, '2023-06-07T16:23:58.620Z', '2023-06-25T00:00:00.000Z');
INSERT INTO [dbo].[ZbritjaQmimitProduktit] ([produktiID], [qmimiPaZbritjeProduktit], [qmimiMeZbritjeProduktit], [dataZbritjes], [dataSkadimit]) VALUES (44, 199, 189.99, '2023-06-07T16:24:26.723Z', '2023-07-08T00:00:00.000Z');
INSERT INTO [dbo].[ZbritjaQmimitProduktit] ([produktiID], [qmimiPaZbritjeProduktit], [qmimiMeZbritjeProduktit], [dataZbritjes], [dataSkadimit]) VALUES (52, 35.9, 26.99, '2023-06-07T16:24:10.893Z', '2023-06-21T00:00:00.000Z');
INSERT INTO [dbo].[ZbritjaQmimitProduktit] ([produktiID], [qmimiPaZbritjeProduktit], [qmimiMeZbritjeProduktit], [dataZbritjes], [dataSkadimit]) VALUES (54, 59.5, 49.99, '2023-06-07T16:23:43.027Z', '2023-06-30T00:00:00.000Z');
INSERT INTO [dbo].[ZbritjaQmimitProduktit] ([produktiID], [qmimiPaZbritjeProduktit], [qmimiMeZbritjeProduktit], [dataZbritjes], [dataSkadimit]) VALUES (55, 34, 29.99, '2023-06-07T16:23:15.147Z', '2023-06-23T00:00:00.000Z');
INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES ('20230519193547_initial', '7.0.5');
INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES ('20230519202124_test', '7.0.5');
INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES ('20230521134726_vendosjaRoleve', '7.0.5');
ALTER TABLE [dbo].[AspNetRoleClaims] ADD CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE [dbo].[AspNetUserClaims] ADD CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE [dbo].[AspNetUserLogins] ADD CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE [dbo].[AspNetUserTokens] ADD CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE [dbo].[ContactForm] ADD CONSTRAINT [FK_ContactForm_Perdoruesi] FOREIGN KEY ([userID]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE [dbo].[KodiZbritjes] ADD CONSTRAINT [FK_KodiZbritjes_Produkti] FOREIGN KEY ([idProdukti]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE [dbo].[Perdoruesi] ADD CONSTRAINT [FK_Perdoruesi_AspNetUsers] FOREIGN KEY ([AspNetUserID]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE [dbo].[Porosit] ADD CONSTRAINT [FK_Porosit_Klienti] FOREIGN KEY ([idKlienti]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE [dbo].[Produkti] ADD CONSTRAINT [FK_Produkti_Kategoria] FOREIGN KEY ([kategoriaID]) REFERENCES [dbo].[KategoriaProduktit] ([kategoriaID]) ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE [dbo].[Produkti] ADD CONSTRAINT [FK_Produkti_Kompania] FOREIGN KEY ([kompaniaID]) REFERENCES [dbo].[Kompania] ([kompaniaID]) ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE [dbo].[RegjistrimiStokut] ADD CONSTRAINT [FK_Regjistrimi_Perdoruesi] FOREIGN KEY ([stafiID]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE [dbo].[StokuQmimiProduktit] ADD CONSTRAINT [FK_StokuQmimiProduktit_Produkti_produktiID] FOREIGN KEY ([produktiID]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE [dbo].[TeDhenatEPorosis] ADD CONSTRAINT [FK_TeDhenatPorosis_Porosia] FOREIGN KEY ([idPorosia]) REFERENCES [dbo].[Porosit] ([idPorosia]) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE [dbo].[TeDhenatEPorosis] ADD CONSTRAINT [FK_TeDhenatPorosis_Produkti] FOREIGN KEY ([idProdukti]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE [dbo].[TeDhenatPerdoruesit] ADD CONSTRAINT [FK_Perdoruesi_TeDhenat] FOREIGN KEY ([userID]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE [dbo].[TeDhenatRegjistrimit] ADD CONSTRAINT [FK_Produkti_TeDhenatRegjistrimit] FOREIGN KEY ([idProduktit]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE [dbo].[TeDhenatRegjistrimit] ADD CONSTRAINT [FK_RegjistrimiStokut_TeDhenatRegjistrimit] FOREIGN KEY ([idRegjistrimit]) REFERENCES [dbo].[RegjistrimiStokut] ([idRegjistrimit]) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE [dbo].[ZbritjaQmimitProduktit] ADD CONSTRAINT [FK_ZbritjaQmimitProduktit_Produkti_produktiID] FOREIGN KEY ([produktiID]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE CASCADE ON UPDATE NO ACTION;
