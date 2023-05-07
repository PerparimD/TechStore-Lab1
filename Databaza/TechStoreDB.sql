IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'TechStoreDB')
    BEGIN
        CREATE DATABASE TechStoreDB
    END
    GO
    USE TechStoreDB
GO
ALTER TABLE [dbo].[Produkti] DROP CONSTRAINT IF EXISTS[FK_Produkti_Kategoria];
ALTER TABLE [dbo].[TeDhenatEPorosis] DROP CONSTRAINT IF EXISTS[FK_TeDhenatPorosis_KodiZbritjes];
ALTER TABLE [dbo].[Produkti] DROP CONSTRAINT IF EXISTS[FK_Produkti_Kompania];
ALTER TABLE [dbo].[ContactForm] DROP CONSTRAINT IF EXISTS[FK_ContactForm_Perdoruesi];
ALTER TABLE [dbo].[Porosit] DROP CONSTRAINT IF EXISTS[FK_Porosit_Klienti];
ALTER TABLE [dbo].[TeDhenatPerdoruesit] DROP CONSTRAINT IF EXISTS[FK_TeDhenatPerdorues_Perdoruesi];
ALTER TABLE [dbo].[TeDhenatEPorosis] DROP CONSTRAINT IF EXISTS[FK_TeDhenatPorosis_Porosia];
ALTER TABLE [dbo].[KodiZbritjes] DROP CONSTRAINT IF EXISTS[FK_KodiZbritjes_Produkti];
ALTER TABLE [dbo].[TeDhenatEPorosis] DROP CONSTRAINT IF EXISTS[FK_TeDhenatPorosis_Produkti];
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
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeDhenatEPorosis]') AND type in (N'U'))
DROP TABLE [dbo].[TeDhenatEPorosis];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeDhenatPerdoruesit]') AND type in (N'U'))
DROP TABLE [dbo].[TeDhenatPerdoruesit];
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
  [qmimiProduktit] DECIMAL(18,2) NULL,
  [kompaniaID] INT NULL,
  [kategoriaID] INT NULL,
  CONSTRAINT [PK__Produkti__76A3DFCF91A50347] PRIMARY KEY ([produktiID])
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
TRUNCATE TABLE [dbo].[ContactForm];
TRUNCATE TABLE [dbo].[KategoriaProduktit];
TRUNCATE TABLE [dbo].[KodiZbritjes];
TRUNCATE TABLE [dbo].[Kompania];
TRUNCATE TABLE [dbo].[Perdoruesi];
TRUNCATE TABLE [dbo].[Porosit];
TRUNCATE TABLE [dbo].[Produkti];
TRUNCATE TABLE [dbo].[TeDhenatEPorosis];
TRUNCATE TABLE [dbo].[TeDhenatPerdoruesit];
INSERT INTO [dbo].[ContactForm] ([userID], [mesazhi], [dataDergeses], [statusi]) VALUES (1, 'string', '2023-04-02T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi');
INSERT INTO [dbo].[ContactForm] ([userID], [mesazhi], [dataDergeses], [statusi]) VALUES (1, 'Twst', '2023-04-02T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi');
INSERT INTO [dbo].[ContactForm] ([userID], [mesazhi], [dataDergeses], [statusi]) VALUES (2, '53eddfgfh', '2023-04-02T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi');
INSERT INTO [dbo].[ContactForm] ([mesazhi], [dataDergeses], [statusi]) VALUES ('53eddfgfh', '2023-04-03T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi');
INSERT INTO [dbo].[ContactForm] ([mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES ('asfasf', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'asda', 'test@email.com');
INSERT INTO [dbo].[ContactForm] ([mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES ('asfasf', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'asda', 'test@email.com');
INSERT INTO [dbo].[ContactForm] ([mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES ('asfasf', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'asda', 'test@email.com');
INSERT INTO [dbo].[ContactForm] ([mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES ('asdad', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'asda', 'asdasd');
INSERT INTO [dbo].[ContactForm] ([mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES ('afasf', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'asda', 'asdad');
INSERT INTO [dbo].[ContactForm] ([mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES ('afasf', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'asda', 'asdad');
INSERT INTO [dbo].[ContactForm] ([mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES ('', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', '', 'asd');
INSERT INTO [dbo].[ContactForm] ([mesazhi], [dataDergeses], [statusi], [emri], [email]) VALUES ('asda', '2023-04-09T00:00:00.000Z', 'Mesazhi juaj eshte derguar tek Stafi', 'r.kycyku.12@gmail.com', 'r.kycyku.12@gmail.com');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Smartphone dhe Aksesore', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Laptope', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Smart Watch dhe Aksesore', 'Ore te menqura te markave te ndryshme');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Foto & Video', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Audio dhe Kufje', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('All in One (AiO) PC', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('TV & Projektor', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Maus & Aksesore', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Lodra smart & Dron', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Pjesë për kompjuter', 'Pjese te ndryshme per kompjuter, si: Ram, Procesor, GPU etj.');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Wireless Charger', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Tablet dhe Aksesore', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Paisje Gaming', 'Fanella, Karrige dhe te tjera');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Printer dhe Paisje per Printer', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Kabllo te ndryshme & Adapter', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris]) VALUES ('Monitor', '');
INSERT INTO [dbo].[KodiZbritjes] ([kodi], [dataKrijimit], [qmimiZbritjes]) VALUES ('3PBUDC', '2023-05-07T20:35:45.640Z', 123666);
INSERT INTO [dbo].[KodiZbritjes] ([kodi], [dataKrijimit], [qmimiZbritjes], [idProdukti]) VALUES ('4YUNOE', '2023-05-07T20:36:01.233Z', 123, 51);
INSERT INTO [dbo].[KodiZbritjes] ([kodi], [dataKrijimit], [qmimiZbritjes], [idProdukti]) VALUES ('S00TQQ', '2023-05-07T20:35:52.027Z', 123, 55);
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Apple', 'AppleLogo.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo]) VALUES ('Amd', 'AMDLogo.png');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo]) VALUES ('Asus', 'AsusLogo.png');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo]) VALUES ('JBL', 'JBL.png');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Lenovo', 'Lenovo.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Logitech', 'Logitech.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('MSI', 'MSI.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Nvidia', 'Nvidia.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Razer', 'Razer.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Samsung', 'SamsungLogo.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('SteelSeries', '63cc8f01dacf35.52923644.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Thermaltake', '63cc904665b4c8.92639137.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('DJI', '63cc90567d1235.30779652.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Overmax', '63cc90641f4676.38918423.jpg', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('G.Skill', '63cc9106dcdca0.15849659.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Akasa', '63cc916f505f64.49149237.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Corsair', '63cc919875a410.74994322.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('WD - Western Digital', '63cc923d6652a6.82761403.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('HP', '63cc929ca61d21.63137864.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Acer', '63cc92dd919978.62580492.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('ZOWIE - BenQ', '63cc933025a1f3.70979396.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Marvo', '63cc93503bc070.76804317.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Arctic', '63cc945c98f987.79971283.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Transcend', '63cc94dc60f873.30313171.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Dell', '63cc95f0a30e93.21744349.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Instax', '63eabba55fbfc7.49583109.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Canon', '63eabbd2c18639.05511269.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Sony', '63eabc0946e731.30555181.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('SENSE7', '63eabcbde6e353.90404410.jpeg', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Preyon', '63eabd4a55ae01.00211971.svg', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Gjirafa50', '63f5ea779c6482.16567878.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Lenuo', '63f5ea98f28fb2.30089124.jpg', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('Intel', '63f5eaa81a4847.00442944.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('AXAGON', '63f5eab4b1f247.31552576.jpg', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa]) VALUES ('FIXED', '63f5ebb63fe7d9.83256153.png', '');
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Llogaria', 'User', 'test@rmail.com', 'user', '$2y$10$juI.BOzWW1giyHJ1D9.Hje.mOPSGAFDgB..C9ACJkSZ1cKZchCTPa', 0);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Llogaria', 'Adminit', 'admin@gmail.com', 'admin', '$2y$10$bWkaCvfxf/k4bZMSbP2rbOHEk7NTOx9UmBjSrpOYnyMACCEq99rNa', 2);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Llogaria', 'Menagjimit', 'menagjim@gmail.com', 'menagjim', '$2y$10$eepxMAnYPktEBl0dWRhOU.oC7S2FO2GrlxTOJuTk8YhUFNcIIRYcy', 1);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Filan', 'Fisteku', 'filan@gmail.com', 'filani', '$2y$10$fdiuTd/R7hN.oKAaZHycoeVd.cIgIJiNriOjMlyvOhnO6xFKwGAn.', 0);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Perparim', 'Dardhishta', 'perparim.dardhishta@gmail.com', 'perparimd', '$2y$10$X/IwYW7TA.iSqgOKNDEoaejZUUn1Qv7.Xt4.ZnWYFPYDyrrNQPClC', 2);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Rilind', 'Kyçyku', 'r.kycyku.12@gmail.com', 'rkycyku', '$2y$10$RU7djgxAPPVNRR1A0uIOZuELNOsTGryD37nm4u3Mcc/5nWAfkp3m2', 2);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Filane', 'Fisteku', 'filane.fistekuu@hotmail.com', 'filane', '$2y$10$cCLaFjhVB84TiwYrbPsuFObh3VN/r62GstzGcMcuW3InIQIEeu3cK', 0);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Arber', 'Krasniqi', 'arberk@gmail.com', 'arberk', '$2y$10$cPSrPpH.gX/F/YuhkUbzveGNPYCPFLT.ZvVLhqxSYhSWsXy462vYC', 0);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Drita', 'Gashi', 'dritag@hotmail.com', 'dritag', '$2y$10$BcFj6o3kdwyaQUNSU6zxdOqpFwcS291SzyA8weEj8cWJA465qvByK', 0);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Lirim', 'Shala', 'lirimsh@yahoo.com', 'lirimsh', '$2y$10$MQq.GzmgUpIc04m6qRL2fuCG6Pbr9v.DvAe82p3bRt2GWWooRnU6S', 0);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Elona', 'Qorraj', 'elonaq@outlook.com', 'elonaq', '$2y$10$xrOGFueQq4xM3SMYPmaM7eXy5zNgZUu70alQJUEOsdLfaBgU6kkB2', 0);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Besmir', 'Sula', 'besmirs@protonmail.com', 'besmirs', '$2y$10$jW9nYJ5bLVXQRVonUAWEdeS8GH2BApaYgpnwbHKFxXsnh9uArFkya', 0);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Flaka', 'Krasniqi', 'flakak@icloud.com', 'flakak', '$2y$10$AOpIj4UlUcaX46NVrKNl5OFjryUxyczzlk0rz6NuDTuu3nFOP2jlC', 0);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Labinot', 'Gashi', 'labig@live.com', 'labinotg', '$2y$10$005CoHNvo74QkunTxvbMieBpksoA3XI80YHyk/UAnJ/N3P/z5HYZi', 0);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Vesa', 'Shala', 'vesas@ymail.com', 'vesash', '$2y$10$lgJP5oGdRLFVCevycDXTk.RrJTENht9AD2UC9p2fIz2nHml/WgC7.', 1);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Ardian', 'Qorraj', 'ardianq@aol.com', 'ardianq', '$2y$10$aX0hjrVGqnmabaoIIG17pOJeiSrBqxa3Rak6LuJX6gpZkrEMAtR.C', 0);
INSERT INTO [dbo].[Perdoruesi] ([emri], [mbiemri], [email], [username], [userPW], [aksesi]) VALUES ('Edona', 'Sula', 'edonas@rocketmail.com', 'edonas', '$2y$10$ttnZDkeekdeFQbz/YcV3BO5FpYwsDn24QTlI3LR6.0CHzWkC4ydui', 1);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Laptop ASUS TUF Gaming F15 (2021), 15.6"', 'Ky laptop është i pajisur me karakteristika të shkëlqyeshme. Ai mundësohet nga një procesor 6-core Intel Core i5 11400H që funksionon me një frekuencë 2.7 GHz deri në 4.5 GHz. Procesori plotësohet me 16 GB DDR4 SODIMM (slot). Hard disku 512 GB SSD M.2 PCIe NVMe shërben për të dhënat. Disku optik mungon. Të dhënat e figurës për ekranin 15.6 " IPS me rezolucion 1920 x 1080 (Full HD) piksel janë siguruar nga kartela grafike NVIDIA GeForce RTX 3050Ti. Prej ndërfaqeve përfshin HDMI 2.0, mbështetje DisplayPort, RJ-45, 3 porte USB 3.0/3.1/3.2 Gen 1 Type-A dhe 1x Thunderbolt 4/USB4. Poashtu, laptopi mbështet standardet Wi-Fi a / b / g / n / ac / ax dhe Bluetooth v5.2. Lloji i kartës së rrjetit GLAN, WLAN. Ndër karakteristikat e tjera laptopi ka një tastierë me ndriçim dhe me taste numerike. Poashtu, përfshihen 2 altoparlantë 2W. Bateria ka kapacitet 3-cell, 48Wh. Fuqia maksimale e furnizimit me energji 180 W. Laptopi vjen me sistemin operativ Windows 11 Home.', '63e90dd68362c0.14152620.webp', 758.5, 3, 2);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Laptop Razer Blade 15 Advanced Model', '', '63d055e0c57d81.05756611.webp', 2710.49, 9, 2);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Celular Samsung Galaxy S22 Ultra, 6.8", 12GB RAM, 512GB, i zi', 'Dizajni i hollë dhe elegant i Galaxy S22 Ultra fsheh fotografi të pafundme ditën dhe natën, një studio pune profesionale dhe veçori novatore që ju mbajnë larg duarve. Çipi grafik përdor arkitekturën e avancuar RDNA 2 të AMD dhe teknologjinë Ray Tracing për të ofruar një përvojë vizuale të nivelit të lartë me ndriçim realist të skenës. Me një maksimum verbues prej 1750 nits, Galaxy S22 Ultra është një nga telefonat më të ndritshëm nga Samsung ndonjëherë dhe ekran Dynamic AMOLED 2X me Vision Booster, bllokon në mënyrë efektive shkëlqimin e bezdisshëm në ekran. Kamera e pasme ka një rezolucion prej 108 + 12 + 10 + 10 Mpx, kurse kamera e përparme 40 Mpx.', '63d055e915be98.37912983.webp', 899.99, 10, 1);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Lenovo NB IdeaPad 3 15ALC6', '', '63d055f15d73c8.42300026.webp', 459.5, 5, 2);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Lenovo ThinkPad P14s Gen 3 (AMD), 14", AMD Ryzen 7 Pro, 32GB RAM, 1TB SSD, AMD Radeon 680M, i zi', '', '63d055feb6ffa9.20196181.webp', 2469.5, 5, 2);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Maus pad SteelSeries QcK Heavy M', '', '63d05608dd9912.15133010.webp', 28.5, 11, 8);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Maus pad SteelSeries QcK Edge XL', '', '63d0561088af36.99850110.webp', 52.5, 11, 8);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Dron DJI Ryze Tello ED', '', '63d0561af0d506.97064987.webp', 357.99, 13, 9);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Dron Overmax X-Bee, 600 m, i zi', '', '63d056224fcfd5.12230564.webp', 284.49, 14, 9);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Dron DJI Mavic 3 Classic (DJI RC)(EU)', 'Mavic 3 Classic me performancë të lartë fluturimi dhe një kamerë Hasselblad përfaqëson cilësinë më të lartë të imazhit. Për të kapur ngjyrat natyrale të Mavic 3 Classic si kamerat e tjera Hasselblad, lentja L2D-20c përdor të njëjtat standarde kërkuese dhe ka kalibruar çdo piksel sensori me HNCS të integruar. Modaliteti video Night Images optimizon fotot në dritë të ulët, të tilla si perëndimet dhe lindjet e diellit, dhe redukton zhurmën për shkrepje më të pastra. Kjo jo vetëm që e bën më të lehtë fluturimin në distanca të gjata, por gjithashtu ndihmon në reduktimin e lëkundjeve manuale dhe siguron lëvizje më të qetë të kamerës. Mavic 3 Classic mund të fluturojë në një lartësi të caktuar dhe më pas të gjejë një rrugë të sigurt dhe efikase të kthimit në pikën e tij fillestare, duke kombinuar avantazhet e RTH të avancuar dhe RTH tradicionale dhe duke i lejuar përdoruesit të zgjedhin opsionin më të mirë sipas mjedisit.', '63d0562b618d48.16102205.webp', 2489.99, 13, 9);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Kasë Thermaltake Core P3, e bardhë', 'Core P3 TG është një kasë me kornizë të hapur me aftësi të jashtëzakonshme shikimi. Paneli i përparmë i xhamit të kalbur me trashësi 5 mm garanton qëndrueshmërinë e dritares dhe e shfaq ndërtimin tuaj me qartësi të qartë. Përdoruesit mund të shikojnë plotësisht çdo komponent të sistemit dhe të tregojnë përkushtimin dhe grupin e aftësive të tyre. Kasa është e përshtatshme me pllakat amë ATX, Micro ATX (uATX), Mini ITX. Mund të instaloni kartë grafike me gjatësi maksimale 45cm. Në panelin e përparmë kasa ka 2x USB 2.0, 2x USB 3.0, lidhës për kufje dhe mikrofon.', '63d056323276c7.81542918.webp', 210.66, 12, 10);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Flutur ftohëse Arctic P14 PWM - 140 mm', '', '63d0563b7f0dd0.69298527.webp', 18.45, 23, 10);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Memorie G. Skill DDR4, 8 GB, 2400 MHz, CL17', 'Memoria e tillë G.Skill RAM prej 8 GB do të garantojë komoditet të lartë përdorimi për shumë aplikacione. Njerëzit që presin performancë maksimale dhe kursime të larta të energjisë duhet të arrijnë te memoria DDR4. Një memorie e tillë do tju lejojë të argëtoheni me performancë të shkëlqyer të operimit. Nëse kompjuteri ngadalësohet pas njëfarë kohe, do të jetë e mundur të zgjerohet memoria RAM. Vonesa CL17 do tju lejojë të punoni rehat me programet e zyrës, si dhe me shumë lojëra kërkuese. Tensioni prej 1.2 V fuqizon çipat e memories DDR4, që do të thotë 20% konsum më të ulët të energjisë në krahasim me DDR3 dhe gjerësi bande më të lartë. Ky variant do të jetë një zgjidhje perfekte për përdoruesit që presin punë të rehatshme dhe, në të njëjtën kohë, kursime të larta të energjisë.', '63d056492e89d5.21517717.webp', 18.99, 15, 10);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('SSD Transcend MTE220S, M.2 - 256GB', '', '63d0567a1432f3.30627468.webp', 29.99, 24, 10);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Ftohës Akasa DDR, aRGB LED, pasiv (AK-MX248)', '', '63d05689da6022.83633684.webp', 30, 16, 10);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Përshtatës i brendshëm Akasa AK-CBUB37-50BK', '', '63d056a353ba19.29349886.webp', 9.99, 16, 15);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Ftohës Corsair ML120 PRO RGB, 120mm', '', '63d056ab22eb80.78302695.webp', 43.5, 17, 10);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Pastë Arctic MX-4 2019 (4g)', '', '63d056b3c3cc68.15404951.webp', 12.99, 23, 10);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Hard disk SSD WD Green SATA III - 240GB 3D NAND', 'WD Green është hard disk SSD për kompjuter apo laptop që ju sjell performancë të shpejtë të transferimit të të dhënave dhe ruajtjes së tyre me siguri të plotë. Luajtja e videolojërave, qasja në internet apo ndezja e sistemit operativ arrihen disa herë më shpejtë sesa hard disqet HDD. Aksesori vjen me kapacitet prej 240GB, mund të lidhet me kompjuter nëpërmjet platformës SATA III 6 Gb / s dhe është ndërtuar për konsumim të ulët të energjisë dhe operim afatgjatë. Formati i produktit është 2.5" dhe mund të arrijë deri në 545 MB / s shpejtësi.', '63d056bd110280.38041391.webp', 55, 23, 10);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Kompjuter AIO Acer Veriton Essential Z (EZ2740G),23.8", Intel Core i5-1135G7, 8 GB DDR4, 512GB SSD, Intel UHD Graphics, i argjendtë', '', '63d056c7197425.11040451.webp', 975.5, 20, 6);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Kompjuter Dell Inspiron 24 (5415), 23.8 ", AMD Ryzen 5, 16GB RAM, 256GB SSD, 1TB HDD, AMD Radeon Graphics, i bardhë', '', '63d056d11496d3.86492053.webp', 1499.99, 25, 6);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Kompjuter HP ENVY 34-c1001nc, 34", Intel Core i7, 32GB RAM, 1TB SSD, NVIDIA GeForce RTX 3060, i argjendtë', '', '63d056dd5bc157.84233223.webp', 3499.99, 19, 6);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Apple iMac 24", M1 8-core, 8GB, 256GB, 8-core GPU, Green', 'IMac i ri është një hap i madh përpara në ekosistemin e ri të Apple me përdorimin e platformës së fuqishme M1, i cili ka një performancë të shkëlqyeshme në një dizajn të ri me teknologji të lehtë për tu përdorur. Pikërisht atë që prisni nga një iMac i ri.rnrnPoashtu, ky kompjuter posedon një ekran Apple iMac 24 4.5K Retina AiO me diagonale 24" dhe një rezolucion 4.5K prej 4480 × 2520 pikselë. Performanca e tij është e ndërtuar në një procesor 8-bërthamor Apple M1 me GPU 8-bërthamë dhe 16-core Neural Engine dhe gjithashtu përfshin 8 GB RAM. Ndërsa, për sistemin, të dhënat dhe aplikacionin janë të dizajnuara 256 GB SSD, kamera të integruar FaceTime HD 1080p dhe WiFi për komunikim wireless Gigabit Ethernet, duke përfshirë Bluetooth 5.0 2x Thunderbolt 4 / Type-C. Përveç kësaj, Apple iMac 24 "4.5K Retina M1 posedon 2 porte USB Type-C 3.1 / 3.2 Gen 2 dhe 3.5 mm për kufje, si dhe operon me sistemin operativ Big Sur.', '63d056e8dc0484.98868210.webp', 1779, 1, 6);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Projektor Acer C202i', 'The Acer C202i projector offers high-quality visual performance with 300 lumens and 5000:1 contrast ratio using DLP technology for 3D viewing, smooth video, and high color contrast. It has an HDMI port for quick and convenient connection to various high-resolution sources, a built-in USB port for external media players, and can project at a short distance of 0.73 meters with a WVGA resolution of 854x480 and a 16:9 aspect ratio. The projector has a lamp life of up to 30,000 hours in Eco mode, with a 1x2W internal speaker and an integrated battery for up to 5 hours of operation. It also features USB, HDMI, and 3.5mm Jack interfaces.', '63d056f36c8ac5.29677040.webp', 359.5, 20, 7);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Maus ZOWIE by BenQ S1,i zi', '', '63d056fddef055.63527829.webp', 97.5, 21, 8);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Maus Marvo M720W, i zi', '', '63d057056d4e38.57263102.webp', 45.59, 22, 8);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Apple MacBook Pro 16", M2 Max 12-Core, 32GB, 1TB, 38-Core GPU, Silver', 'Performanca e përshtatur për profesionistët. MacBook Pro 16 M2 Max i ri vjen me një ekran 16" dhe performanca e tij i shtyn kufijtë imagjinarë në një nivel të ri. Arkitektura e përmirësuar ndjeshëm e M2 Max thjesht ka fuqi brutale për të gjitha idetë tuaja krijuese. Dhe ajo që vëreni në shikim të parë është dizajn elegant me theks në cilësinë e përpunimit.', '63d05c06aa8757.25439961.webp', 4149, 1, 2);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Kufje Logitech G432, të zeza', 'Kufje të fuqishme por shumë të rehatshme 50mm. X 2.0 mbështetja e zërit shtesë e gjeneratës së ardhshme. Dizajnuar për përdorim me të gjitha platformat e lojërave dhe pajisjet mobile, USB DAC dhe lidhës 3.5mm. Ata janë në përputhje me PC, Mac, PS4, Xbox One, Nintendo Switch dhe gjithashtu me pajisje të lëvizshme. Mikrofoni 6mm me funksionin "mute". 107 dB ndjeshmëri SPL / MW. Përgjigjja frekuencore 20 - 20,000 Hz. Impedancë 39 Ohm (pasive), 5 kiloohm (aktive). Gjatësia e kabllit 2 m. Të lehta me peshë prej 303 g (me kabllo). Përmasat 172 x 81.7 x 182 mm.', '63eab827ba77c4.71044525.webp', 84.5, 6, 15);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Hard disk Samsung SSD 970 EVO PLUS, M.2 - 250GB', '', '63eab84858c8d7.45002641.webp', 49.5, 10, 10);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Disk portativ WD Elements, 2TB, i zi', 'WD Elements ofron një hard disk portativ dhe modern. Me kapacitet 2 TB dhe peshë të lehtë (vetëm 230 gram), ofron shumë hapësirë për një sërë të dhënash. Pjesa e tij përbërëse është një mbulesë e fortë, duke e bërë diskun më rezistent ndaj dëmtimit. Ruajtja mbështet pa probleme pajisjet e fundit USB 3.0 dhe gjithashtu është i pajtueshëm me kompjuterët USB 2.0. Pajisja në modalitetin USB 3.0 transferon deri në 5 Gb / s, nëse e lidhni atë me një kompjuter që mbështet USB 2.0, do të duhet të jeni më i ngadaltë, por gjithsesi i mjaftueshëm i shpejtë maksimal teorik deri në 480 Mb / s. Disku është i formatuar nga fabrika me NTFS dhe është në përputhje me Windows 8, Windows 7, Windows Vista dhe Windows XP. Ato mund të riformatohen pa vështirësi për sistemet Mac. Kjo bën të mundur që pronarët e kompjuterave me sisteme të ndryshme operative të përdorin diskun. Dimensionet e tij janë 21 x 111 x 82mm.', '63eab88a9bae20.95606749.webp', 84.5, 18, 10);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Disk i jashtëm Transcend Jet 25H3B, 1 TB, i zi / kaltër', '', '63eab963cfcf35.02921447.webp', 69.5, 24, 10);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Apple MacBook Pro 16.2", M1 Max 10-core, 32GB, 1TB, 32-core GPU, Silver', '', '63eab99c203254.93655263.webp', 3299, 1, 2);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Apple iPhone 11, 64GB, Black', '', '63eab9e5b821b1.87284331.webp', 579, 1, 1);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Apple Magic Mouse (2022), Black Multi - Touch Surface', '', '63eab9ff27af71.66828407.webp', 119, 1, 8);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Celular Samsung Galaxy A23 5G, 6.6" FHD+, 4GB RAM, 128GB, i kaltër', 'This is a mobile phone with a 6.6" Full HD+ display and a 120 Hz refresh rate. It has a 50 MPx camera, an ultra-wide-angle lens, macro and depth sensors, and an 8 MPx front camera. It is powered by a Qualcomm Snapdragon 695 processor with 8 cores and 4 GB RAM, and has 128 GB of storage with the option to add up to 1 TB with a micro SD card. It supports LTE, Wi-Fi, Bluetooth v5.1, 5G, NF, GPS, BeiDou, QZSS, GLONASS, and Galileo. It runs on Android OS, has a 5000 mAh battery with Super Fast Charging 25W, and weighs 197 g with dimensions of 165.4 x 76.9 x 8.4 mm.', '63eaba204edb24.98379543.webp', 299.5, 10, 1);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Apple Watch SE2 GPS 44mm, Midnight Aluminium Case me Midnight Sport Band, Regular', '', '63eaba4ebf5fb1.84174295.webp', 349, 1, 3);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Fotoaparat momental Fujifilm Instax Mini 90, i zi', '', '63eabd7f7f4296.27491084.webp', 119.5, 26, 4);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Printer Canon PIXMA TS3150, i zi', 'Printeri CANON PIXMA TS3150 është zgjidhja ideale për printim dhe skanim në zyrën apo shtëpinë tuaj. Pjesët përbërëse të printerit përfshijnë printimin me rezolucion 4800 x 1200 dpi, portin USB 2.0, teknologjinë Wi-Fi dhe ka madhësi 435 × 316 × 145 mm. Falë lidhjes me WI-FI ju mund të printoni edhe nga telefonët tuaj qoftë ai Android apo IOS. Në pako përfshihet : PG-545 (i zi ) CL-546 (me ngjyrë ) PG-545XL (i zi ) - opsional CL-546XL (me ngjyrë ) - opsional', '63eabdbea539b0.78235909.webp', 79.5, 27, 14);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Kufje Sony MDR-RF895RK, të zeza, III', '', '63eabdd87c2561.68876767.webp', 99.5, 28, 5);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Kontroller Sony Playstation 5 DualSense', '', '63eabe14e6ab51.91700813.webp', 89.5, 28, 13);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Karrige SENSE7 Knight, e zezë', '', '63eabe31db73d8.09365222.webp', 169.5, 29, 13);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Maus Preyon Owl Wireless (POW35B)', 'Mouse Preyon Owl është mouse gaming pa kabllo, mirëpo asgjë nuk pengon lidhjen e tij me një kabllo. Nëse bateria harxhohet, vetëm lidheni dhe mund të vazhdoni përdorimin e tij. Me 50milion klikime në përdorimin e këtij mausi që tregon për sigurinë që jepet kualitetit të këtij mausi. Me butona shtesë shumë lehtë kontrolloni vlerat DPI dhe frekuencën e përdorur. Me LED që tregojnë vlerën e selektuar lehtë.', '63eabe5a5852e1.52076563.webp', 49.5, 30, 8);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Apple 10.9-inch iPad (10th) Wi-Fi, 64GB, Silver', '', '63eabe72174975.16788497.webp', 569, 1, 12);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Apple MagSafe Duo Charger', '', '63eabe936e0523.11456101.webp', 169, 1, 11);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Apple AirPods (3rd generation) with Lightning Charging Case', N'AirPods janë të lehta dhe ofrojnë një dizajn të konturuar. Mikrofonat me pamje nga brenda zbulojnë atë që po dëgjoni, më pas rregullojnë frekuencat e rangut të ulët dhe të mesëm për të ofruar detaje të pasura në çdo këngë.rnrnAirPods kanë një jetëgjatësi shtesë të baterisë në krahasim me AirPods (gjenerata e dytë) deri në 6 orë kohë dëgjimi dhe deri në 4 orë kohë bisede. Dhe me kutinë e karikimit Lightning, mund të shijoni deri në 30 orë kohë totale të dëgjimit. Si AirPods ashtu edhe kasa e karikimit të Rrufesë janë vlerësuar me IPX4 rezistente ndaj ujit – kështu që do të përballojnë çdo gjë, nga shiu deri tek stërvitjet e rënda.', '63eabeae767761.75083362.webp', 240, 1, 5);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Karrige SENSE7 Spellcaster, e zezë/e kaltër', 'Karrigia SENSE7 Spellcaster ka një formë që i përshtatet lakimit natyror të shtyllës kurrizore dhe, si rezultat, siguron pozicionin e duhur përpara kompjuterit kur jeni duke luajtur ose duke punuar. Ajo plotësohet nga një mbushje sfungjer me dendësi optimale, e cila përshtatet me trupin dhe siguron rehati. Është projektuar për njerëzit me peshë maksimale 150 kg. Karrigia peshon 17.5kg.', '63f23b534f5c52.87433500.webp', 149.5, 29, 13);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Kamerë Logitech StreamCam C980, e hirtë', 'Kjo është një kamerë transmetimi me cilësi të lartë. Ajo ofron një cilësi maksimale të regjistrimit prej 1080p në 60 korniza për sekondë. Ajo përdor ndërfaqen USB 3.2 Gen 1 lloji C për tu lidhur me pajisjen. Është e pajisur me një lente f / 2.0 me një gjatësi fokale prej 3.7 mm dhe një fushë shikimi prej 78 ° (diagonale). Ofron autofokus në një distancë prej 10 cm deri në pafundësi. Ka një mikrofon të dyfishtë gjithëpërfshirës të integruar me funksion të zvogëlimit të zhurmës. Gjatësia e kabllos është 1.5 m. Paketa përfshin një mbajtës për vendosjen e saj në monitor dhe një mbajtës statik.', '63f5de70338ea0.03180620.webp', 149.5, 6, 4);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Altoparlant JBL CLIP 4, i kaltër i hapur', 'Altoparlant unik portativ me fuqi dalëse 5 W RMS, përgjigje frekuence prej 100 Hz deri 20 kHz, raport sinjal-zhurmë > 85 dB, teknologji Bluetooth 5.1. Bateria e tij polimer litium-jon karikohet për 3 orë dhe zgjat deri në 10 orë. Përmasat e altoparlantit janë: 86.3 x 134.5 x 46 mm, pesha 239 g.', '63f5deb8055346.05332264.webp', 59.5, 4, 5);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Ngjyrë për printer Canon PGI-571, e kaltërt', 'Ngjyra e kaltër Canon CLI-571 është në përputhje me printera Canon PIXMA MG5750, MG5751, MG5752, MG5753, MG6850, MG6851, MG6852, MG6853, MG7750, MG7751, MG7752, MG7753. Kjo ngjyrë ka një vëllim prej 7 ml.', '63f5df0fe61cf8.49070509.webp', 19.5, 27, 14);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Maus Razer Pro Click, i bardhë', 'Ky është një maus wireless i krijuar për përdoruesit e djathtë. Mausi ka lidhës USB, 8 butona dhe një rrotë mekanike. Ai ka teknologji wireless Bluetooth, sensor optik dhe ndjeshmëri maksimale 16,000 DPI.', '63f5e0272928f8.99239124.webp', 127.5, 9, 8);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Karikues Samsung EP-TA12 për Samsung micro USB, i zi', '', '63f5e741d05b48.11483682.webp', 18.5, 10, 15);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Apple 20W USB-C Power Adapter', 'Ky është një karikues i fuqishëm 20W, i cili përdoret për karikim të shpejtë dhe efikas në shtëpi, në zyrë dhe gjatë lëvizjes. Është i pajtueshëm me çdo pajisje USB-C, por për një performancë optimale të karikimit, Apple rekomandon përdorimin e tij me iPad Pro 11'' ose iPad Pro 12,9'' (gjenerata e tretë). Ai gjithashtu mbështet karikimin e shpejtë të iPhone 8.', '63f5e7a904efe1.07954376.webp', 30, 1, 15);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Gjirafa50 Bad News Eagles Jersey (Rio Edition) - XXL', 'Ndjeni emocionin e kualifikimit të dytë në Major me fanellën e Rio Edition të Bad News Eagles.rnrnKjo fanellë e cilësisë së lartë me dizajn modern, e krijuar posaçërisht për lojtarët pasionantë të sporteve elektronike, është krijuar me krenari krahas Gjirafa50.rnrnNgjyra e saj kryesore është e gjelbër, e njohur si ngjyra dominuese e flamurit kombëtar të Brazilit.rnrnFanella ka logon e personalizuar të ekipit BNE dhe është prej 100% poliestër.', '63f5ec27d0f672.76058981.webp', 49.5, 31, 13);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Gjirafa50 Bad News Eagles Jersey Legends Edition - L', 'Ndjeni emocionet e lojës me këtë fanellë të Legends Stage të Bad News Eagles të krijuar posaçërisht për lojtarët e apasionuar pas sporteve elektronike. Ngjyra kryesore e saj është e kuqja e kombinuar me detaje bardh e zi dhe ka logon e personalizuar të ekipit BNE. Fanella është prej 100% poliestër. Dimensionet janë 71 x 57 x 25.5 cm.rnrnKjo fanellë e cilësisë së lartë me dizajn modern është krijuar me krenari përkrah Gjirafa50.', '63f5ec4e91ff92.01429806.webp', 59.5, 31, 13);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Rrip metalik FIXED për Apple Watch 38/40/41mm, i argjendtë', 'Rrip metalik zëvendësues që është i pajtueshëm me Apple Watch 38/40 / 41mm. Ky rrip e kthen orën në një aksesor elegant që mund ta kombinoni lehtësisht me çdo veshje.', '63f5ec798adb88.56368457.webp', 32.5, 35, 3);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Mbrojtëse Lenuo Leshield për iPhone 13, e kuqe', 'Mbrojtëse për pjesën e pasme dhe anësore të celularit iPhone 13. Mbrojtësja është prej plastike të qëndrueshme dhe do të sigurojë mbrojtje të besueshme të celularit nga gërvishtjet dhe papastërtitë. Natyrisht, mbrojtësja ka prerje për kamerën, butonat dhe portin e karikimit. Ajo është e këndshme në prekje dhe e ruajtur mirë.', '63f5ec9fb0aa89.27408325.webp', 19.5, 32, 1);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Procesor Intel Core i7-12700F', 'Ky është një procesor i gjeneratës së 12-të Alder Lake i krijuar për prizën LGA 1700. Ofron 8+4 bërthama fizike (8 performancë + 4 efektive, 20 threads). Frekuenca e tyre është 1.6/2.1 GHz dhe deri në 3.6/4.8 GHz në modalitetin Turbo (bërthama efikase/performancë). Frekuenca maksimale Turbo Boost është deri në 4.9 GHz. Ai ofron një memorie buffer 25 MB SmartCache dhe një proces prodhimi 10 nm është përdorur për krijimin e tij. Mbështet memorie deri në DDR5 4800 MHz dhe DDR4 3200 MHz. Mbështet ndërfaqen PCI-Express 5.0/4.0. TDP e deklaruar nga prodhuesi është 65 W (maksimumi 180 W).', '63f5ecdb56b5d2.54488204.webp', 396.5, 33, 10);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Monitor Dell U3223QE - LED 31.5", 4K UHD, i zi / argjendtë', 'Dell U3223QE është një monitor 31.5" me rezolucion të lartë që do tju rrëmbejë me ngjyrën dhe elegancën e tij. Rezolucioni 4K (3840 x 2160) me më shumë se 8 milionë piksele ka një rezolucion 4 herë më të lartë se një monitor klasik Full HD. Ngjyrat janë të qarta dhe të qëndrueshme përgjatë këndit të shikimit. Dell UltraSharp P3222QE është një monitor që mendon gjithashtu për shëndetin tuaj. Falë funksionit ComfortView Plus, i cili garanton emetimin vazhdimisht të ulët të dritës blu, ju do të shijoni ngjyra të shkëlqyera.rnrnKarakteristikat e tjera të monitorit përfshijnë raporti i pamjes 16: 9, kontrasti 2000: 1, shpejtësia e rifreskimit 60 Hz, ndriçimi 400 cd / m2, koha e përgjigjes 8 ms në modalitetin normal ose 5 ms në modalitetin e shpejtë. Lidhësit: 1x DP, 1x HDMI, USB-C, 6x USB, 1x RJ-45, pivot. Dimensionet 71.26 cm x 61.88 cm x 23.32 cm, pesha 10.36 k', '63f5ecf98f3534.93172253.webp', 1199.5, 25, 16);
INSERT INTO [dbo].[Produkti] ([emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES ('Kabllo AXAGON USB-A - micro USB 3.2 Gen 1 SPEED, 3A, 1m, e zezë', 'Kablloja AXAGON është e përshtatshme për laptopë, telefont, tabletë dhe pajisje e tjera celulare. Mbështet shpejtësinë e transferimit të të dhënave deri në 5 Gb / s dhe karikimin deri në 3A.', '63f5ed187916e2.65869096.webp', 9.5, 34, 15);
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (1, '045234567', 'Peja', 30000, 'Xhemajl Kada 3');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (2, '044123456', 'Prishtina', 10000, 'Kadri Zeka 6');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (3, '045987654', 'Gjilan ', 60000, 'Rexhep Luci 12');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (4, '045234567', 'Prizren ', 20000, 'Bedri Pejani 5');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (5, '049876543', 'Kaçanik', 71000, 'Bedri Pejani 7');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (6, '044123456', 'Kaçanik', 71000, 'Rexhep Luci 6');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (7, '049234567', 'Ferizaj', 70000, 'Naim Frasheri 14');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (8, '044765432', 'Prizren ', 20000, 'Perparim Krasniqi 7');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (9, '045876543', 'Gjilan ', 60000, 'Rruga e Kavajes 36');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (10, '045234567', 'Gjakova ', 50000, 'Bajram Kelmendi 33');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (11, '044987654', 'Peja ', 30000, 'Hivzi Sulejmani 8');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (12, '049876543', 'Ferizaj ', 70000, '29 Nentori 19');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (13, '043345678', 'Prizren ', 20000, 'Skenderbeu 2');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (14, '046234567', 'Mitrovica ', 40000, 'Adem Jashari 11');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (15, '045987654', 'Gjilan ', 60000, 'Rruga e Kavajes 24');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (16, '044123456', 'Prishtina ', 10000, 'Rruga e Dibres 3');
INSERT INTO [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (17, '045876543', 'Prizren ', 20000, 'Shaban Shala 9');
ALTER TABLE [dbo].[ContactForm] ADD CONSTRAINT [FK_ContactForm_Perdoruesi] FOREIGN KEY ([userID]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[KodiZbritjes] ADD CONSTRAINT [FK_KodiZbritjes_Produkti] FOREIGN KEY ([idProdukti]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[Porosit] ADD CONSTRAINT [FK_Porosit_Klienti] FOREIGN KEY ([idKlienti]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[Produkti] ADD CONSTRAINT [FK_Produkti_Kategoria] FOREIGN KEY ([kategoriaID]) REFERENCES [dbo].[KategoriaProduktit] ([kategoriaID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[Produkti] ADD CONSTRAINT [FK_Produkti_Kompania] FOREIGN KEY ([kompaniaID]) REFERENCES [dbo].[Kompania] ([kompaniaID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[TeDhenatEPorosis] ADD CONSTRAINT [FK_TeDhenatPorosis_KodiZbritjes] FOREIGN KEY ([kodiZbritjes]) REFERENCES [dbo].[KodiZbritjes] ([kodi]) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE [dbo].[TeDhenatEPorosis] ADD CONSTRAINT [FK_TeDhenatPorosis_Porosia] FOREIGN KEY ([idPorosia]) REFERENCES [dbo].[Porosit] ([idPorosia]) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE [dbo].[TeDhenatEPorosis] ADD CONSTRAINT [FK_TeDhenatPorosis_Produkti] FOREIGN KEY ([idProdukti]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[TeDhenatPerdoruesit] ADD CONSTRAINT [FK_TeDhenatPerdorues_Perdoruesi] FOREIGN KEY ([userID]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE CASCADE ON UPDATE CASCADE;
