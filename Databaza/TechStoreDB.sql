CREATE DATABASE TechStoreDB
GO USE TechStoreDB
GO
ALTER TABLE [dbo].[Produkti] DROP CONSTRAINT [FK_Produkti_Kategoria];
ALTER TABLE [dbo].[TeDhenatEPorosis] DROP CONSTRAINT [FK_TeDhenatPorosis_KodiZbritjes];
ALTER TABLE [dbo].[Produkti] DROP CONSTRAINT [FK_Produkti_Kompania];
ALTER TABLE [dbo].[ContactForm] DROP CONSTRAINT [FK_ContactForm_Perdoruesi];
ALTER TABLE [dbo].[Porosit] DROP CONSTRAINT [FK_Porosit_Klienti];
ALTER TABLE [dbo].[TeDhenatPerdoruesit] DROP CONSTRAINT [FK_TeDhenatPerdorues_Perdoruesi];
ALTER TABLE [dbo].[TeDhenatEPorosis] DROP CONSTRAINT [FK_TeDhenatPorosis_Porosia];
ALTER TABLE [dbo].[KodiZbritjes] DROP CONSTRAINT [FK_KodiZbritjes_Produkti];
ALTER TABLE [dbo].[TeDhenatEPorosis] DROP CONSTRAINT [FK_TeDhenatPorosis_Produkti];
IF EXISTS (
  SELECT *
  FROM sys.objects
  WHERE object_id = OBJECT_ID(N'[dbo].[ContactForm]')
    AND type in (N'U')
) DROP TABLE [dbo].[ContactForm];
IF EXISTS (
  SELECT *
  FROM sys.objects
  WHERE object_id = OBJECT_ID(N'[dbo].[KategoriaProduktit]')
    AND type in (N'U')
) DROP TABLE [dbo].[KategoriaProduktit];
IF EXISTS (
  SELECT *
  FROM sys.objects
  WHERE object_id = OBJECT_ID(N'[dbo].[KodiZbritjes]')
    AND type in (N'U')
) DROP TABLE [dbo].[KodiZbritjes];
IF EXISTS (
  SELECT *
  FROM sys.objects
  WHERE object_id = OBJECT_ID(N'[dbo].[Kompania]')
    AND type in (N'U')
) DROP TABLE [dbo].[Kompania];
IF EXISTS (
  SELECT *
  FROM sys.objects
  WHERE object_id = OBJECT_ID(N'[dbo].[Perdoruesi]')
    AND type in (N'U')
) DROP TABLE [dbo].[Perdoruesi];
IF EXISTS (
  SELECT *
  FROM sys.objects
  WHERE object_id = OBJECT_ID(N'[dbo].[Porosit]')
    AND type in (N'U')
) DROP TABLE [dbo].[Porosit];
IF EXISTS (
  SELECT *
  FROM sys.objects
  WHERE object_id = OBJECT_ID(N'[dbo].[Produkti]')
    AND type in (N'U')
) DROP TABLE [dbo].[Produkti];
IF EXISTS (
  SELECT *
  FROM sys.objects
  WHERE object_id = OBJECT_ID(N'[dbo].[TeDhenatEPorosis]')
    AND type in (N'U')
) DROP TABLE [dbo].[TeDhenatEPorosis];
IF EXISTS (
  SELECT *
  FROM sys.objects
  WHERE object_id = OBJECT_ID(N'[dbo].[TeDhenatPerdoruesit]')
    AND type in (N'U')
) DROP TABLE [dbo].[TeDhenatPerdoruesit];
CREATE TABLE [dbo].[ContactForm] (
  [mesazhiID] INT IDENTITY NOT NULL,
  [userID] INT NULL,
  [mesazhi] TEXT NOT NULL,
  [dataDergeses] DATE NULL CONSTRAINT [DF__ContactFo__dataD__34C8D9D1] DEFAULT (getdate()),
  [statusi] VARCHAR(50) NULL CONSTRAINT [DF__ContactFo__statu__35BCFE0A] DEFAULT ('Mesazhi juaj eshte derguar tek Stafi'),
  CONSTRAINT [PK__ContactF__0E3F7CF3731C8CDE] PRIMARY KEY ([mesazhiID])
);
CREATE TABLE [dbo].[KategoriaProduktit] (
  [kategoriaID] INT IDENTITY NOT NULL,
  [llojiKategoris] TEXT NOT NULL,
  [pershkrimiKategoris] TEXT NULL,
  CONSTRAINT [PK__Kategori__AC39DE2ACE8BCA8A] PRIMARY KEY ([kategoriaID])
);
CREATE TABLE [dbo].[KodiZbritjes] (
  [kodi] CHAR(6) NOT NULL,
  [dataKrijimit] DATE NULL CONSTRAINT [DF__KodiZbrit__dataK__36B12243] DEFAULT (getdate()),
  [qmimiZbritjes] DECIMAL(18, 2) NOT NULL,
  [idProdukti] INT NULL,
  CONSTRAINT [PK__KodiZbri__25A8748FB3E013A8] PRIMARY KEY ([kodi])
);
CREATE TABLE [dbo].[Kompania] (
  [kompaniaID] INT IDENTITY NOT NULL,
  [emriKompanis] TEXT NOT NULL,
  [logo] VARCHAR(40) NULL CONSTRAINT [DF__Kompania__logo__37A5467C] DEFAULT ('kompaniPaFoto.png'),
  [adresa] VARCHAR(40) NULL,
  CONSTRAINT [PK__Kompania__2026D74DCB37AA9A] PRIMARY KEY ([kompaniaID])
);
CREATE TABLE [dbo].[Perdoruesi] (
  [userID] INT IDENTITY NOT NULL,
  [emri] VARCHAR(30) NOT NULL,
  [mbimeri] VARCHAR(30) NULL,
  [email] VARCHAR(30) NULL,
  [username] VARCHAR(20) NOT NULL,
  [userPW] VARCHAR(70) NOT NULL,
  [aksesi] INT NULL CONSTRAINT [DF__Perdorues__akses__38996AB5] DEFAULT ((0)),
  CONSTRAINT [PK__Perdorue__CB9A1CDFC4C4A0AA] PRIMARY KEY ([userID]),
  CONSTRAINT [UQ__Perdorue__F3DBC5728A6B6DAE] UNIQUE ([username])
);
CREATE TABLE [dbo].[Porosit] (
  [idPorosia] INT IDENTITY NOT NULL,
  [totaliPorosis] DECIMAL(18, 2) NOT NULL,
  [dataPorosis] DATE NULL CONSTRAINT [DF__Porosit__dataPor__398D8EEE] DEFAULT (getdate()),
  [statusiPorosis] VARCHAR(30) NULL CONSTRAINT [DF__Porosit__statusi__3A81B327] DEFAULT ('Ne Procesim'),
  [idKlienti] INT NULL,
  CONSTRAINT [PK__Porosit__A9F27D2AB271ADFC] PRIMARY KEY ([idPorosia])
);
CREATE TABLE [dbo].[Produkti] (
  [produktiID] INT IDENTITY NOT NULL,
  [emriProduktit] TEXT NOT NULL,
  [pershkrimi] TEXT NULL,
  [fotoProduktit] VARCHAR(40) NULL CONSTRAINT [DF__Produkti__fotoPr__3B75D760] DEFAULT ('produktPaFoto.png'),
  [qmimiProduktit] DECIMAL(18, 2) NOT NULL,
  [kompaniaID] INT NULL,
  [kategoriaID] INT NULL,
  CONSTRAINT [PK__Produkti__76A3DFCF91A50347] PRIMARY KEY ([produktiID])
);
CREATE TABLE [dbo].[TeDhenatEPorosis] (
  [idDetajet] INT IDENTITY NOT NULL,
  [qmimiTotal] DECIMAL(18, 2) NOT NULL,
  [sasiaPorositur] INT NOT NULL,
  [idPorosia] INT NOT NULL,
  [idProdukti] INT NULL,
  [kodiZbritjes] CHAR(6) NULL,
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
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('Smartphone dhe Aksesore', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('Laptope', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES (
    'Smart Watch dhe Aksesore',
    'Ore te menqura te markave te ndryshme'
  );
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('Foto & Video', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('Audio dhe Kufje', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('All in One (AiO) PC', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('TV & Projektor', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('Maus & Aksesore', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('Lodra smart & Dron', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES (
    'Pjesë për kompjuter',
    'Pjese te ndryshme per kompjuter, si: Ram, Procesor, GPU etj.'
  );
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('Wireless Charger', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('Tablet dhe Aksesore', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('Paisje Gaming', 'Fanella, Karrige dhe te tjera');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('Printer dhe Paisje per Printer', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('Kabllo te ndryshme & Adapter', '');
INSERT INTO [dbo].[KategoriaProduktit] ([llojiKategoris], [pershkrimiKategoris])
VALUES ('Monitor', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Apple', 'AppleLogo.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo])
VALUES ('Amd', 'AMDLogo.png');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo])
VALUES ('Asus', 'AsusLogo.png');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo])
VALUES ('JBL', 'JBL.png');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Lenovo', 'Lenovo.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Logitech', 'Logitech.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('MSI', 'MSI.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Nvidia', 'Nvidia.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Razer', 'Razer.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Samsung', 'SamsungLogo.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('SteelSeries', '63cc8f01dacf35.52923644.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Thermaltake', '63cc904665b4c8.92639137.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('DJI', '63cc90567d1235.30779652.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Overmax', '63cc90641f4676.38918423.jpg', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('G.Skill', '63cc9106dcdca0.15849659.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Akasa', '63cc916f505f64.49149237.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Corsair', '63cc919875a410.74994322.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES (
    'WD - Western Digital',
    '63cc923d6652a6.82761403.png',
    ''
  );
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('HP', '63cc929ca61d21.63137864.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Acer', '63cc92dd919978.62580492.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES (
    'ZOWIE - BenQ',
    '63cc933025a1f3.70979396.png',
    ''
  );
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Marvo', '63cc93503bc070.76804317.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Arctic', '63cc945c98f987.79971283.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Transcend', '63cc94dc60f873.30313171.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Dell', '63cc95f0a30e93.21744349.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Instax', '63eabba55fbfc7.49583109.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Canon', '63eabbd2c18639.05511269.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Sony', '63eabc0946e731.30555181.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('SENSE7', '63eabcbde6e353.90404410.jpeg', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Preyon', '63eabd4a55ae01.00211971.svg', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Gjirafa50', '63f5ea779c6482.16567878.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Lenuo', '63f5ea98f28fb2.30089124.jpg', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('Intel', '63f5eaa81a4847.00442944.png', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('AXAGON', '63f5eab4b1f247.31552576.jpg', '');
INSERT INTO [dbo].[Kompania] ([emriKompanis], [logo], [adresa])
VALUES ('FIXED', '63f5ebb63fe7d9.83256153.png', '');
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Llogaria',
    'User',
    'test@rmail.com',
    'user',
    '$2y$10$juI.BOzWW1giyHJ1D9.Hje.mOPSGAFDgB..C9ACJkSZ1cKZchCTPa',
    0
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Llogaria',
    'Adminit',
    'admin@gmail.com',
    'admin',
    '$2y$10$bWkaCvfxf/k4bZMSbP2rbOHEk7NTOx9UmBjSrpOYnyMACCEq99rNa',
    2
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Llogaria',
    'Menagjimit',
    'menagjim@gmail.com',
    'menagjim',
    '$2y$10$eepxMAnYPktEBl0dWRhOU.oC7S2FO2GrlxTOJuTk8YhUFNcIIRYcy',
    1
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Filan',
    'Fisteku',
    'filan@gmail.com',
    'filani',
    '$2y$10$fdiuTd/R7hN.oKAaZHycoeVd.cIgIJiNriOjMlyvOhnO6xFKwGAn.',
    0
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Perparim',
    'Dardhishta',
    'perparim.dardhishta@gmail.com',
    'perparimd',
    '$2y$10$X/IwYW7TA.iSqgOKNDEoaejZUUn1Qv7.Xt4.ZnWYFPYDyrrNQPClC',
    2
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Rilind',
    'Kyçyku',
    'r.kycyku.12@gmail.com',
    'rkycyku',
    '$2y$10$RU7djgxAPPVNRR1A0uIOZuELNOsTGryD37nm4u3Mcc/5nWAfkp3m2',
    2
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Filane',
    'Fisteku',
    'filane.fistekuu@hotmail.com',
    'filane',
    '$2y$10$cCLaFjhVB84TiwYrbPsuFObh3VN/r62GstzGcMcuW3InIQIEeu3cK',
    0
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Arber',
    'Krasniqi',
    'arberk@gmail.com',
    'arberk',
    '$2y$10$cPSrPpH.gX/F/YuhkUbzveGNPYCPFLT.ZvVLhqxSYhSWsXy462vYC',
    0
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Drita',
    'Gashi',
    'dritag@hotmail.com',
    'dritag',
    '$2y$10$BcFj6o3kdwyaQUNSU6zxdOqpFwcS291SzyA8weEj8cWJA465qvByK',
    0
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Lirim',
    'Shala',
    'lirimsh@yahoo.com',
    'lirimsh',
    '$2y$10$MQq.GzmgUpIc04m6qRL2fuCG6Pbr9v.DvAe82p3bRt2GWWooRnU6S',
    0
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Elona',
    'Qorraj',
    'elonaq@outlook.com',
    'elonaq',
    '$2y$10$xrOGFueQq4xM3SMYPmaM7eXy5zNgZUu70alQJUEOsdLfaBgU6kkB2',
    0
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Besmir',
    'Sula',
    'besmirs@protonmail.com',
    'besmirs',
    '$2y$10$jW9nYJ5bLVXQRVonUAWEdeS8GH2BApaYgpnwbHKFxXsnh9uArFkya',
    0
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Flaka',
    'Krasniqi',
    'flakak@icloud.com',
    'flakak',
    '$2y$10$AOpIj4UlUcaX46NVrKNl5OFjryUxyczzlk0rz6NuDTuu3nFOP2jlC',
    0
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Labinot',
    'Gashi',
    'labig@live.com',
    'labinotg',
    '$2y$10$005CoHNvo74QkunTxvbMieBpksoA3XI80YHyk/UAnJ/N3P/z5HYZi',
    0
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Vesa',
    'Shala',
    'vesas@ymail.com',
    'vesash',
    '$2y$10$lgJP5oGdRLFVCevycDXTk.RrJTENht9AD2UC9p2fIz2nHml/WgC7.',
    1
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Ardian',
    'Qorraj',
    'ardianq@aol.com',
    'ardianq',
    '$2y$10$aX0hjrVGqnmabaoIIG17pOJeiSrBqxa3Rak6LuJX6gpZkrEMAtR.C',
    0
  );
INSERT INTO [dbo].[Perdoruesi] (
    [emri],
    [mbimeri],
    [email],
    [username],
    [userPW],
    [aksesi]
  )
VALUES (
    'Edona',
    'Sula',
    'edonas@rocketmail.com',
    'edonas',
    '$2y$10$ttnZDkeekdeFQbz/YcV3BO5FpYwsDn24QTlI3LR6.0CHzWkC4ydui',
    1
  );
ALTER TABLE [dbo].[ContactForm]
ADD CONSTRAINT [FK_ContactForm_Perdoruesi] FOREIGN KEY ([userID]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE
SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[KodiZbritjes]
ADD CONSTRAINT [FK_KodiZbritjes_Produkti] FOREIGN KEY ([idProdukti]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE
SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[Porosit]
ADD CONSTRAINT [FK_Porosit_Klienti] FOREIGN KEY ([idKlienti]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE
SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[Produkti]
ADD CONSTRAINT [FK_Produkti_Kategoria] FOREIGN KEY ([kategoriaID]) REFERENCES [dbo].[KategoriaProduktit] ([kategoriaID]) ON DELETE
SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[Produkti]
ADD CONSTRAINT [FK_Produkti_Kompania] FOREIGN KEY ([kompaniaID]) REFERENCES [dbo].[Kompania] ([kompaniaID]) ON DELETE
SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[TeDhenatEPorosis]
ADD CONSTRAINT [FK_TeDhenatPorosis_KodiZbritjes] FOREIGN KEY ([kodiZbritjes]) REFERENCES [dbo].[KodiZbritjes] ([kodi]) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE [dbo].[TeDhenatEPorosis]
ADD CONSTRAINT [FK_TeDhenatPorosis_Porosia] FOREIGN KEY ([idPorosia]) REFERENCES [dbo].[Porosit] ([idPorosia]) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE [dbo].[TeDhenatEPorosis]
ADD CONSTRAINT [FK_TeDhenatPorosis_Produkti] FOREIGN KEY ([idProdukti]) REFERENCES [dbo].[Produkti] ([produktiID]) ON DELETE
SET NULL ON UPDATE CASCADE;
ALTER TABLE [dbo].[TeDhenatPerdoruesit]
ADD CONSTRAINT [FK_TeDhenatPerdorues_Perdoruesi] FOREIGN KEY ([userID]) REFERENCES [dbo].[Perdoruesi] ([userID]) ON DELETE CASCADE ON UPDATE CASCADE;