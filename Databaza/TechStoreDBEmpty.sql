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
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES ('0267d4fd-5bac-4552-9930-8e528b2fec1b', 'Admin', 'ADMIN', 'bcb0a7f8-41b2-48ce-bf39-fbc24516012e');
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES ('be4b8ef8-abf0-454c-852c-676cdab20e3b', 'User', 'USER', '264000ea-9d66-4686-b48b-e06165a906fc');
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES ('db3dd60d-a159-4f85-a9a5-d1444ee1013d', 'Menaxher', 'MENAXHER', '3e215a86-6eeb-48a6-90d9-fe12a7a70f28');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('9d6b2651-641d-4c85-9154-99761863fc65', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('d2a7088f-a25e-4f3f-8488-b616eeaff928', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('f2bb7622-23ac-4c5f-8d71-00032b281e37', 'be4b8ef8-abf0-454c-852c-676cdab20e3b');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('d2a7088f-a25e-4f3f-8488-b616eeaff928', 'db3dd60d-a159-4f85-a9a5-d1444ee1013d');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('f2bb7622-23ac-4c5f-8d71-00032b281e37', 'db3dd60d-a159-4f85-a9a5-d1444ee1013d');
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES ('f2bb7622-23ac-4c5f-8d71-00032b281e37', '0267d4fd-5bac-4552-9930-8e528b2fec1b');
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('9d6b2651-641d-4c85-9154-99761863fc65', 'user', 'USER', 'user@techstore.com', 'USER@TECHSTORE.COM', 0, 'AQAAAAEAACcQAAAAEFvlpjPerR25vlxvKiV9GnWzzfQGEk9LCpEfnHG/yUyyaYXsRp/sN52ZWgKNbsq1JA==', '3VINW7OQ6CJ7CZE3737G4L6WGMKBHWPT', '241f5600-e4e1-4e08-b789-9b0fc9367502', '', 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('d2a7088f-a25e-4f3f-8488-b616eeaff928', 'menagjer', 'MENAGJER', 'menagjer@techstore.com', 'MENAGJER@TECHSTORE.COM', 0, 'AQAAAAEAACcQAAAAEP60Y+OpxVc3CPWS9NZu79pNu/KAAsxbrm8qTWpL9+ILK+Sd/3Pw4yLEas1N2TXL+g==', '2TO7IOMEDSKTLMHBALX52ICRC3HX3FNQ', '297b4ee1-133a-4ad2-8242-201592f7a43d', '', 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES ('f2bb7622-23ac-4c5f-8d71-00032b281e37', 'admin', 'ADMIN', 'admin@techstore.com', 'ADMIN@TECHSTORE.COM', 0, 'AQAAAAEAACcQAAAAEAy6t6f1jILbKXRyqzSZGrR4zq/Wl8G525tgzrBsqYIG4ksRH5HySRRlJrMtzvfTug==', 'RHCE5BDZYCGBDPAZQ74P3IWVFBNDWMEX', '5dd7b4ea-994f-43c2-bdfd-1bef310ebf29', '', 0, 0, NULL, 1, 0);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES ('Administrator', 'Administrator', 'admin@techstore.com', 'admin', 'f2bb7622-23ac-4c5f-8d71-00032b281e37');
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES ('User', 'User', 'user@techstore.com', 'user', '9d6b2651-641d-4c85-9154-99761863fc65');
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [AspNetUserID]) VALUES ('Menagjer', 'Menagjer', 'menagjer@techstore.com', 'menagjer', 'd2a7088f-a25e-4f3f-8488-b616eeaff928');
INSERT INTO [dbo].[TeDhenatBiznesit] ([IDTeDhenatBiznesit], [EmriIBiznesit], [ShkurtesaEmritBiznesit], [NUI], [NF], [NRTVSH], [Adresa], [NrKontaktit], [Email], [Logo]) VALUES (1, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 'PaLogo.png');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (1, NULL, NULL, 0, NULL, NULL);
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (2, NULL, NULL, 0, NULL, NULL);
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa], [shteti]) VALUES (3, NULL, NULL, 0, NULL, NULL);
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
