USE [master]
GO
/****** Object:  Database [TechStoreDB]    Script Date: 28/03/2023 23:59:18 ******/
CREATE DATABASE [TechStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechStoreDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TechStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TechStoreDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TechStoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TechStoreDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechStoreDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TechStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechStoreDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TechStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechStoreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechStoreDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TechStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [TechStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TechStoreDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TechStoreDB', N'ON'
GO
ALTER DATABASE [TechStoreDB] SET QUERY_STORE = OFF
GO
USE [TechStoreDB]
GO
/****** Object:  Table [dbo].[ContactForm]    Script Date: 28/03/2023 23:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactForm](
	[mesazhiID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[mesazhi] [text] NOT NULL,
	[dataDergeses] [date] NULL,
	[statusi] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[mesazhiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KategoriaProduktit]    Script Date: 28/03/2023 23:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KategoriaProduktit](
	[kategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[llojiKategoris] [text] NOT NULL,
	[pershkrimiKategoris] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[kategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KodiZbritjes]    Script Date: 28/03/2023 23:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KodiZbritjes](
	[kodi] [char](6) NOT NULL,
	[dataKrijimit] [date] NULL,
	[qmimiZbritjes] [decimal](18, 2) NOT NULL,
	[idProdukti] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[kodi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kompania]    Script Date: 28/03/2023 23:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kompania](
	[kompaniaID] [int] IDENTITY(1,1) NOT NULL,
	[emriKompanis] [text] NOT NULL,
	[logo] [varchar](40) NULL,
	[adresa] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[kompaniaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perdoruesi]    Script Date: 28/03/2023 23:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perdoruesi](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[emri] [varchar](30) NOT NULL,
	[mbimeri] [varchar](30) NULL,
	[email] [varchar](30) NULL,
	[username] [varchar](20) NOT NULL,
	[userPW] [varchar](70) NOT NULL,
	[aksesi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Porosit]    Script Date: 28/03/2023 23:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Porosit](
	[idPorosia] [int] IDENTITY(1,1) NOT NULL,
	[totaliPorosis] [decimal](18, 2) NOT NULL,
	[dataPorosis] [date] NULL,
	[statusiPorosis] [varchar](30) NULL,
	[idKlienti] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPorosia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkti]    Script Date: 28/03/2023 23:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkti](
	[produktiID] [int] IDENTITY(1,1) NOT NULL,
	[emriProduktit] [text] NOT NULL,
	[pershkrimi] [text] NULL,
	[fotoProduktit] [varchar](40) NULL,
	[qmimiProduktit] [decimal](18, 2) NOT NULL,
	[kompaniaID] [int] NULL,
	[kategoriaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[produktiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeDhenatEPorosis]    Script Date: 28/03/2023 23:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeDhenatEPorosis](
	[idDetajet] [int] IDENTITY(1,1) NOT NULL,
	[qmimiTotal] [decimal](18, 2) NOT NULL,
	[sasiaPorositur] [int] NOT NULL,
	[idPorosia] [int] NOT NULL,
	[idProdukti] [int] NULL,
	[kodiZbritjes] [char](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetajet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeDhenatPerdoruesit]    Script Date: 28/03/2023 23:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeDhenatPerdoruesit](
	[userID] [int] NOT NULL,
	[nrKontaktit] [varchar](15) NULL,
	[qyteti] [varchar](20) NULL,
	[zipKodi] [int] NULL,
	[adresa] [varchar](40) NULL,
 CONSTRAINT [PK_TeDhenatPerdoruesit] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KategoriaProduktit] ON 

INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (1, N'Smartphone dhe Aksesore', N'')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (2, N'Laptope', N'')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (3, N'Smart Watch dhe Aksesore', N'Ore te menqura te markave te ndryshme')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (4, N'Foto & Video', N'')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (5, N'Audio dhe Kufje', N'')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (6, N'All in One (AiO) PC', N'')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (7, N'TV & Projektor', N'')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (8, N'Maus & Aksesore', N'')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (9, N'Lodra smart & Dron', N'')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (10, N'Pjesë për kompjuter', N'Pjese te ndryshme per kompjuter, si: Ram, Procesor, GPU etj.')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (11, N'Wireless Charger', N'')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (12, N'Tablet dhe Aksesore', N'')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (13, N'Paisje Gaming', N'Fanella, Karrige dhe te tjera')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (14, N'Printer dhe Paisje per Printer', N'')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (15, N'Kabllo te ndryshme & Adapter', N'')
INSERT [dbo].[KategoriaProduktit] ([kategoriaID], [llojiKategoris], [pershkrimiKategoris]) VALUES (16, N'Monitor', N'')
SET IDENTITY_INSERT [dbo].[KategoriaProduktit] OFF
GO
SET IDENTITY_INSERT [dbo].[Kompania] ON 

INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (1, N'Apple', N'AppleLogo.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (2, N'Amd', N'AMDLogo.png', NULL)
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (3, N'Asus', N'AsusLogo.png', NULL)
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (4, N'JBL', N'JBL.png', NULL)
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (5, N'Lenovo', N'Lenovo.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (6, N'Logitech', N'Logitech.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (7, N'MSI', N'MSI.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (8, N'Nvidia', N'Nvidia.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (9, N'Razer', N'Razer.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (10, N'Samsung', N'SamsungLogo.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (11, N'SteelSeries', N'63cc8f01dacf35.52923644.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (12, N'Thermaltake', N'63cc904665b4c8.92639137.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (13, N'DJI', N'63cc90567d1235.30779652.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (14, N'Overmax', N'63cc90641f4676.38918423.jpg', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (15, N'G.Skill', N'63cc9106dcdca0.15849659.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (16, N'Akasa', N'63cc916f505f64.49149237.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (17, N'Corsair', N'63cc919875a410.74994322.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (18, N'WD - Western Digital', N'63cc923d6652a6.82761403.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (19, N'HP', N'63cc929ca61d21.63137864.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (20, N'Acer', N'63cc92dd919978.62580492.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (21, N'ZOWIE - BenQ', N'63cc933025a1f3.70979396.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (22, N'Marvo', N'63cc93503bc070.76804317.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (23, N'Arctic', N'63cc945c98f987.79971283.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (24, N'Transcend', N'63cc94dc60f873.30313171.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (25, N'Dell', N'63cc95f0a30e93.21744349.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (26, N'Instax', N'63eabba55fbfc7.49583109.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (27, N'Canon', N'63eabbd2c18639.05511269.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (28, N'Sony', N'63eabc0946e731.30555181.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (29, N'SENSE7', N'63eabcbde6e353.90404410.jpeg', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (30, N'Preyon', N'63eabd4a55ae01.00211971.svg', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (31, N'Gjirafa50', N'63f5ea779c6482.16567878.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (32, N'Lenuo', N'63f5ea98f28fb2.30089124.jpg', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (33, N'Intel', N'63f5eaa81a4847.00442944.png', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (34, N'AXAGON', N'63f5eab4b1f247.31552576.jpg', N'')
INSERT [dbo].[Kompania] ([kompaniaID], [emriKompanis], [logo], [adresa]) VALUES (35, N'FIXED', N'63f5ebb63fe7d9.83256153.png', N'')
SET IDENTITY_INSERT [dbo].[Kompania] OFF
GO
SET IDENTITY_INSERT [dbo].[Perdoruesi] ON 

INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (1, N'Llogaria', N'User', N'test@rmail.com', N'user', N'$2y$10$juI.BOzWW1giyHJ1D9.Hje.mOPSGAFDgB..C9ACJkSZ1cKZchCTPa', 0)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (2, N'Llogaria', N'Adminit', N'admin@gmail.com', N'admin', N'$2y$10$bWkaCvfxf/k4bZMSbP2rbOHEk7NTOx9UmBjSrpOYnyMACCEq99rNa', 2)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (3, N'Llogaria', N'Menagjimit', N'menagjim@gmail.com', N'menagjim', N'$2y$10$eepxMAnYPktEBl0dWRhOU.oC7S2FO2GrlxTOJuTk8YhUFNcIIRYcy', 1)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (4, N'Filan', N'Fisteku', N'filan@gmail.com', N'filani', N'$2y$10$fdiuTd/R7hN.oKAaZHycoeVd.cIgIJiNriOjMlyvOhnO6xFKwGAn.', 0)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (5, N'Perparim', N'Dardhishta', N'perparim.dardhishta@gmail.com', N'perparimd', N'$2y$10$X/IwYW7TA.iSqgOKNDEoaejZUUn1Qv7.Xt4.ZnWYFPYDyrrNQPClC', 2)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (6, N'Rilind', N'Kyçyku', N'r.kycyku.12@gmail.com', N'rkycyku', N'$2y$10$RU7djgxAPPVNRR1A0uIOZuELNOsTGryD37nm4u3Mcc/5nWAfkp3m2', 2)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (7, N'Filane', N'Fisteku', N'filane.fistekuu@hotmail.com', N'filane', N'$2y$10$cCLaFjhVB84TiwYrbPsuFObh3VN/r62GstzGcMcuW3InIQIEeu3cK', 0)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (8, N'Arber', N'Krasniqi', N'arberk@gmail.com', N'arberk', N'$2y$10$cPSrPpH.gX/F/YuhkUbzveGNPYCPFLT.ZvVLhqxSYhSWsXy462vYC', 0)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (9, N'Drita', N'Gashi', N'dritag@hotmail.com', N'dritag', N'$2y$10$BcFj6o3kdwyaQUNSU6zxdOqpFwcS291SzyA8weEj8cWJA465qvByK', 0)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (10, N'Lirim', N'Shala', N'lirimsh@yahoo.com', N'lirimsh', N'$2y$10$MQq.GzmgUpIc04m6qRL2fuCG6Pbr9v.DvAe82p3bRt2GWWooRnU6S', 0)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (11, N'Elona', N'Qorraj', N'elonaq@outlook.com', N'elonaq', N'$2y$10$xrOGFueQq4xM3SMYPmaM7eXy5zNgZUu70alQJUEOsdLfaBgU6kkB2', 0)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (12, N'Besmir', N'Sula', N'besmirs@protonmail.com', N'besmirs', N'$2y$10$jW9nYJ5bLVXQRVonUAWEdeS8GH2BApaYgpnwbHKFxXsnh9uArFkya', 0)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (13, N'Flaka', N'Krasniqi', N'flakak@icloud.com', N'flakak', N'$2y$10$AOpIj4UlUcaX46NVrKNl5OFjryUxyczzlk0rz6NuDTuu3nFOP2jlC', 0)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (14, N'Labinot', N'Gashi', N'labig@live.com', N'labinotg', N'$2y$10$005CoHNvo74QkunTxvbMieBpksoA3XI80YHyk/UAnJ/N3P/z5HYZi', 0)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (15, N'Vesa', N'Shala', N'vesas@ymail.com', N'vesash', N'$2y$10$lgJP5oGdRLFVCevycDXTk.RrJTENht9AD2UC9p2fIz2nHml/WgC7.', 1)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (16, N'Ardian', N'Qorraj', N'ardianq@aol.com', N'ardianq', N'$2y$10$aX0hjrVGqnmabaoIIG17pOJeiSrBqxa3Rak6LuJX6gpZkrEMAtR.C', 0)
INSERT [dbo].[Perdoruesi] ([userID], [emri], [mbimeri], [email], [username], [userPW], [aksesi]) VALUES (17, N'Edona', N'Sula', N'edonas@rocketmail.com', N'edonas', N'$2y$10$ttnZDkeekdeFQbz/YcV3BO5FpYwsDn24QTlI3LR6.0CHzWkC4ydui', 1)
SET IDENTITY_INSERT [dbo].[Perdoruesi] OFF
GO
SET IDENTITY_INSERT [dbo].[Produkti] ON 

INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (1, N'Laptop ASUS TUF Gaming F15 (2021), 15.6"', N'Ky laptop është i pajisur me karakteristika të shkëlqyeshme. Ai mundësohet nga një procesor 6-core Intel Core i5 11400H që funksionon me një frekuencë 2.7 GHz deri në 4.5 GHz. Procesori plotësohet me 16 GB DDR4 SODIMM (slot). Hard disku 512 GB SSD M.2 PCIe NVMe shërben për të dhënat. Disku optik mungon. Të dhënat e figurës për ekranin 15.6 " IPS me rezolucion 1920 x 1080 (Full HD) piksel janë siguruar nga kartela grafike NVIDIA GeForce RTX 3050Ti. Prej ndërfaqeve përfshin HDMI 2.0, mbështetje DisplayPort, RJ-45, 3 porte USB 3.0/3.1/3.2 Gen 1 Type-A dhe 1x Thunderbolt 4/USB4. Poashtu, laptopi mbështet standardet Wi-Fi a / b / g / n / ac / ax dhe Bluetooth v5.2. Lloji i kartës së rrjetit GLAN, WLAN. Ndër karakteristikat e tjera laptopi ka një tastierë me ndriçim dhe me taste numerike. Poashtu, përfshihen 2 altoparlantë 2W. Bateria ka kapacitet 3-cell, 48Wh. Fuqia maksimale e furnizimit me energji 180 W. Laptopi vjen me sistemin operativ Windows 11 Home.', N'63e90dd68362c0.14152620.webp', CAST(758.50 AS Decimal(18, 2)), 3, 2)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (2, N'Laptop Razer Blade 15 Advanced Model', N'', N'63d055e0c57d81.05756611.webp', CAST(2710.49 AS Decimal(18, 2)), 9, 2)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (3, N'Celular Samsung Galaxy S22 Ultra, 6.8", 12GB RAM, 512GB, i zi', N'Dizajni i hollë dhe elegant i Galaxy S22 Ultra fsheh fotografi të pafundme ditën dhe natën, një studio pune profesionale dhe veçori novatore që ju mbajnë larg duarve. Çipi grafik përdor arkitekturën e avancuar RDNA 2 të AMD dhe teknologjinë Ray Tracing për të ofruar një përvojë vizuale të nivelit të lartë me ndriçim realist të skenës. Me një maksimum verbues prej 1750 nits, Galaxy S22 Ultra është një nga telefonat më të ndritshëm nga Samsung ndonjëherë dhe ekran Dynamic AMOLED 2X me Vision Booster, bllokon në mënyrë efektive shkëlqimin e bezdisshëm në ekran. Kamera e pasme ka një rezolucion prej 108 + 12 + 10 + 10 Mpx, kurse kamera e përparme 40 Mpx.', N'63d055e915be98.37912983.webp', CAST(899.99 AS Decimal(18, 2)), 10, 1)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (4, N'Lenovo NB IdeaPad 3 15ALC6', N'', N'63d055f15d73c8.42300026.webp', CAST(459.50 AS Decimal(18, 2)), 5, 2)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (5, N'Lenovo ThinkPad P14s Gen 3 (AMD), 14", AMD Ryzen 7 Pro, 32GB RAM, 1TB SSD, AMD Radeon 680M, i zi', N'', N'63d055feb6ffa9.20196181.webp', CAST(2469.50 AS Decimal(18, 2)), 5, 2)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (6, N'Maus pad SteelSeries QcK Heavy M', N'', N'63d05608dd9912.15133010.webp', CAST(28.50 AS Decimal(18, 2)), 11, 8)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (7, N'Maus pad SteelSeries QcK Edge XL', N'', N'63d0561088af36.99850110.webp', CAST(52.50 AS Decimal(18, 2)), 11, 8)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (8, N'Dron DJI Ryze Tello ED', N'', N'63d0561af0d506.97064987.webp', CAST(357.99 AS Decimal(18, 2)), 13, 9)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (9, N'Dron Overmax X-Bee, 600 m, i zi', N'', N'63d056224fcfd5.12230564.webp', CAST(284.49 AS Decimal(18, 2)), 14, 9)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (10, N'Dron DJI Mavic 3 Classic (DJI RC)(EU)', N'Mavic 3 Classic me performancë të lartë fluturimi dhe një kamerë Hasselblad përfaqëson cilësinë më të lartë të imazhit. Për të kapur ngjyrat natyrale të Mavic 3 Classic si kamerat e tjera Hasselblad, lentja L2D-20c përdor të njëjtat standarde kërkuese dhe ka kalibruar çdo piksel sensori me HNCS të integruar. Modaliteti video Night Images optimizon fotot në dritë të ulët, të tilla si perëndimet dhe lindjet e diellit, dhe redukton zhurmën për shkrepje më të pastra. Kjo jo vetëm që e bën më të lehtë fluturimin në distanca të gjata, por gjithashtu ndihmon në reduktimin e lëkundjeve manuale dhe siguron lëvizje më të qetë të kamerës. Mavic 3 Classic mund të fluturojë në një lartësi të caktuar dhe më pas të gjejë një rrugë të sigurt dhe efikase të kthimit në pikën e tij fillestare, duke kombinuar avantazhet e RTH të avancuar dhe RTH tradicionale dhe duke i lejuar përdoruesit të zgjedhin opsionin më të mirë sipas mjedisit.', N'63d0562b618d48.16102205.webp', CAST(2489.99 AS Decimal(18, 2)), 13, 9)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (11, N'Kasë Thermaltake Core P3, e bardhë', N'Core P3 TG është një kasë me kornizë të hapur me aftësi të jashtëzakonshme shikimi. Paneli i përparmë i xhamit të kalbur me trashësi 5 mm garanton qëndrueshmërinë e dritares dhe e shfaq ndërtimin tuaj me qartësi të qartë. Përdoruesit mund të shikojnë plotësisht çdo komponent të sistemit dhe të tregojnë përkushtimin dhe grupin e aftësive të tyre. Kasa është e përshtatshme me pllakat amë ATX, Micro ATX (uATX), Mini ITX. Mund të instaloni kartë grafike me gjatësi maksimale 45cm. Në panelin e përparmë kasa ka 2x USB 2.0, 2x USB 3.0, lidhës për kufje dhe mikrofon.', N'63d056323276c7.81542918.webp', CAST(210.66 AS Decimal(18, 2)), 12, 10)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (12, N'Flutur ftohëse Arctic P14 PWM - 140 mm', N'', N'63d0563b7f0dd0.69298527.webp', CAST(18.45 AS Decimal(18, 2)), 23, 10)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (13, N'Memorie G. Skill DDR4, 8 GB, 2400 MHz, CL17', N'Memoria e tillë G.Skill RAM prej 8 GB do të garantojë komoditet të lartë përdorimi për shumë aplikacione. Njerëzit që presin performancë maksimale dhe kursime të larta të energjisë duhet të arrijnë te memoria DDR4. Një memorie e tillë do tju lejojë të argëtoheni me performancë të shkëlqyer të operimit. Nëse kompjuteri ngadalësohet pas njëfarë kohe, do të jetë e mundur të zgjerohet memoria RAM. Vonesa CL17 do tju lejojë të punoni rehat me programet e zyrës, si dhe me shumë lojëra kërkuese. Tensioni prej 1.2 V fuqizon çipat e memories DDR4, që do të thotë 20% konsum më të ulët të energjisë në krahasim me DDR3 dhe gjerësi bande më të lartë. Ky variant do të jetë një zgjidhje perfekte për përdoruesit që presin punë të rehatshme dhe, në të njëjtën kohë, kursime të larta të energjisë.', N'63d056492e89d5.21517717.webp', CAST(18.99 AS Decimal(18, 2)), 15, 10)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (14, N'SSD Transcend MTE220S, M.2 - 256GB', N'', N'63d0567a1432f3.30627468.webp', CAST(29.99 AS Decimal(18, 2)), 24, 10)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (15, N'Ftohës Akasa DDR, aRGB LED, pasiv (AK-MX248)', N'', N'63d05689da6022.83633684.webp', CAST(30.00 AS Decimal(18, 2)), 16, 10)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (16, N'Përshtatës i brendshëm Akasa AK-CBUB37-50BK', N'', N'63d056a353ba19.29349886.webp', CAST(9.99 AS Decimal(18, 2)), 16, 15)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (17, N'Ftohës Corsair ML120 PRO RGB, 120mm', N'', N'63d056ab22eb80.78302695.webp', CAST(43.50 AS Decimal(18, 2)), 17, 10)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (18, N'Pastë Arctic MX-4 2019 (4g)', N'', N'63d056b3c3cc68.15404951.webp', CAST(12.99 AS Decimal(18, 2)), 23, 10)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (19, N'Hard disk SSD WD Green SATA III - 240GB 3D NAND', N'WD Green është hard disk SSD për kompjuter apo laptop që ju sjell performancë të shpejtë të transferimit të të dhënave dhe ruajtjes së tyre me siguri të plotë. Luajtja e videolojërave, qasja në internet apo ndezja e sistemit operativ arrihen disa herë më shpejtë sesa hard disqet HDD. Aksesori vjen me kapacitet prej 240GB, mund të lidhet me kompjuter nëpërmjet platformës SATA III 6 Gb / s dhe është ndërtuar për konsumim të ulët të energjisë dhe operim afatgjatë. Formati i produktit është 2.5" dhe mund të arrijë deri në 545 MB / s shpejtësi.', N'63d056bd110280.38041391.webp', CAST(55.00 AS Decimal(18, 2)), 23, 10)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (20, N'Kompjuter AIO Acer Veriton Essential Z (EZ2740G),23.8", Intel Core i5-1135G7, 8 GB DDR4, 512GB SSD, Intel UHD Graphics, i argjendtë', N'', N'63d056c7197425.11040451.webp', CAST(975.50 AS Decimal(18, 2)), 20, 6)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (21, N'Kompjuter Dell Inspiron 24 (5415), 23.8 ", AMD Ryzen 5, 16GB RAM, 256GB SSD, 1TB HDD, AMD Radeon Graphics, i bardhë', N'', N'63d056d11496d3.86492053.webp', CAST(1499.99 AS Decimal(18, 2)), 25, 6)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (22, N'Kompjuter HP ENVY 34-c1001nc, 34", Intel Core i7, 32GB RAM, 1TB SSD, NVIDIA GeForce RTX 3060, i argjendtë', N'', N'63d056dd5bc157.84233223.webp', CAST(3499.99 AS Decimal(18, 2)), 19, 6)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (23, N'Apple iMac 24", M1 8-core, 8GB, 256GB, 8-core GPU, Green', N'IMac i ri është një hap i madh përpara në ekosistemin e ri të Apple me përdorimin e platformës së fuqishme M1, i cili ka një performancë të shkëlqyeshme në një dizajn të ri me teknologji të lehtë për tu përdorur. Pikërisht atë që prisni nga një iMac i ri.rnrnPoashtu, ky kompjuter posedon një ekran Apple iMac 24 4.5K Retina AiO me diagonale 24" dhe një rezolucion 4.5K prej 4480 × 2520 pikselë. Performanca e tij është e ndërtuar në një procesor 8-bërthamor Apple M1 me GPU 8-bërthamë dhe 16-core Neural Engine dhe gjithashtu përfshin 8 GB RAM. Ndërsa, për sistemin, të dhënat dhe aplikacionin janë të dizajnuara 256 GB SSD, kamera të integruar FaceTime HD 1080p dhe WiFi për komunikim wireless Gigabit Ethernet, duke përfshirë Bluetooth 5.0 2x Thunderbolt 4 / Type-C. Përveç kësaj, Apple iMac 24 "4.5K Retina M1 posedon 2 porte USB Type-C 3.1 / 3.2 Gen 2 dhe 3.5 mm për kufje, si dhe operon me sistemin operativ Big Sur.', N'63d056e8dc0484.98868210.webp', CAST(1779.00 AS Decimal(18, 2)), 1, 6)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (24, N'Projektor Acer C202i', N'The Acer C202i projector offers high-quality visual performance with 300 lumens and 5000:1 contrast ratio using DLP technology for 3D viewing, smooth video, and high color contrast. It has an HDMI port for quick and convenient connection to various high-resolution sources, a built-in USB port for external media players, and can project at a short distance of 0.73 meters with a WVGA resolution of 854x480 and a 16:9 aspect ratio. The projector has a lamp life of up to 30,000 hours in Eco mode, with a 1x2W internal speaker and an integrated battery for up to 5 hours of operation. It also features USB, HDMI, and 3.5mm Jack interfaces.', N'63d056f36c8ac5.29677040.webp', CAST(359.50 AS Decimal(18, 2)), 20, 7)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (25, N'Maus ZOWIE by BenQ S1,i zi', N'', N'63d056fddef055.63527829.webp', CAST(97.50 AS Decimal(18, 2)), 21, 8)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (26, N'Maus Marvo M720W, i zi', N'', N'63d057056d4e38.57263102.webp', CAST(45.59 AS Decimal(18, 2)), 22, 8)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (27, N'Apple MacBook Pro 16", M2 Max 12-Core, 32GB, 1TB, 38-Core GPU, Silver', N'Performanca e përshtatur për profesionistët. MacBook Pro 16 M2 Max i ri vjen me një ekran 16" dhe performanca e tij i shtyn kufijtë imagjinarë në një nivel të ri. Arkitektura e përmirësuar ndjeshëm e M2 Max thjesht ka fuqi brutale për të gjitha idetë tuaja krijuese. Dhe ajo që vëreni në shikim të parë është dizajn elegant me theks në cilësinë e përpunimit.', N'63d05c06aa8757.25439961.webp', CAST(4149.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (28, N'Kufje Logitech G432, të zeza', N'Kufje të fuqishme por shumë të rehatshme 50mm. X 2.0 mbështetja e zërit shtesë e gjeneratës së ardhshme. Dizajnuar për përdorim me të gjitha platformat e lojërave dhe pajisjet mobile, USB DAC dhe lidhës 3.5mm. Ata janë në përputhje me PC, Mac, PS4, Xbox One, Nintendo Switch dhe gjithashtu me pajisje të lëvizshme. Mikrofoni 6mm me funksionin "mute". 107 dB ndjeshmëri SPL / MW. Përgjigjja frekuencore 20 - 20,000 Hz. Impedancë 39 Ohm (pasive), 5 kiloohm (aktive). Gjatësia e kabllit 2 m. Të lehta me peshë prej 303 g (me kabllo). Përmasat 172 x 81.7 x 182 mm.', N'63eab827ba77c4.71044525.webp', CAST(84.50 AS Decimal(18, 2)), 6, 15)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (29, N'Hard disk Samsung SSD 970 EVO PLUS, M.2 - 250GB', N'', N'63eab84858c8d7.45002641.webp', CAST(49.50 AS Decimal(18, 2)), 10, 10)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (30, N'Disk portativ WD Elements, 2TB, i zi', N'WD Elements ofron një hard disk portativ dhe modern. Me kapacitet 2 TB dhe peshë të lehtë (vetëm 230 gram), ofron shumë hapësirë për një sërë të dhënash. Pjesa e tij përbërëse është një mbulesë e fortë, duke e bërë diskun më rezistent ndaj dëmtimit. Ruajtja mbështet pa probleme pajisjet e fundit USB 3.0 dhe gjithashtu është i pajtueshëm me kompjuterët USB 2.0. Pajisja në modalitetin USB 3.0 transferon deri në 5 Gb / s, nëse e lidhni atë me një kompjuter që mbështet USB 2.0, do të duhet të jeni më i ngadaltë, por gjithsesi i mjaftueshëm i shpejtë maksimal teorik deri në 480 Mb / s. Disku është i formatuar nga fabrika me NTFS dhe është në përputhje me Windows 8, Windows 7, Windows Vista dhe Windows XP. Ato mund të riformatohen pa vështirësi për sistemet Mac. Kjo bën të mundur që pronarët e kompjuterave me sisteme të ndryshme operative të përdorin diskun. Dimensionet e tij janë 21 x 111 x 82mm.', N'63eab88a9bae20.95606749.webp', CAST(84.50 AS Decimal(18, 2)), 18, 10)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (31, N'Disk i jashtëm Transcend Jet 25H3B, 1 TB, i zi / kaltër', N'', N'63eab963cfcf35.02921447.webp', CAST(69.50 AS Decimal(18, 2)), 24, 10)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (32, N'Apple MacBook Pro 16.2", M1 Max 10-core, 32GB, 1TB, 32-core GPU, Silver', N'', N'63eab99c203254.93655263.webp', CAST(3299.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (33, N'Apple iPhone 11, 64GB, Black', N'', N'63eab9e5b821b1.87284331.webp', CAST(579.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (34, N'Apple Magic Mouse (2022), Black Multi - Touch Surface', N'', N'63eab9ff27af71.66828407.webp', CAST(119.00 AS Decimal(18, 2)), 1, 8)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (35, N'Celular Samsung Galaxy A23 5G, 6.6" FHD+, 4GB RAM, 128GB, i kaltër', N'This is a mobile phone with a 6.6" Full HD+ display and a 120 Hz refresh rate. It has a 50 MPx camera, an ultra-wide-angle lens, macro and depth sensors, and an 8 MPx front camera. It is powered by a Qualcomm Snapdragon 695 processor with 8 cores and 4 GB RAM, and has 128 GB of storage with the option to add up to 1 TB with a micro SD card. It supports LTE, Wi-Fi, Bluetooth v5.1, 5G, NF, GPS, BeiDou, QZSS, GLONASS, and Galileo. It runs on Android OS, has a 5000 mAh battery with Super Fast Charging 25W, and weighs 197 g with dimensions of 165.4 x 76.9 x 8.4 mm.', N'63eaba204edb24.98379543.webp', CAST(299.50 AS Decimal(18, 2)), 10, 1)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (36, N'Apple Watch SE2 GPS 44mm, Midnight Aluminium Case me Midnight Sport Band, Regular', N'', N'63eaba4ebf5fb1.84174295.webp', CAST(349.00 AS Decimal(18, 2)), 1, 3)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (37, N'Fotoaparat momental Fujifilm Instax Mini 90, i zi', N'', N'63eabd7f7f4296.27491084.webp', CAST(119.50 AS Decimal(18, 2)), 26, 4)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (38, N'Printer Canon PIXMA TS3150, i zi', N'Printeri CANON PIXMA TS3150 është zgjidhja ideale për printim dhe skanim në zyrën apo shtëpinë tuaj. Pjesët përbërëse të printerit përfshijnë printimin me rezolucion 4800 x 1200 dpi, portin USB 2.0, teknologjinë Wi-Fi dhe ka madhësi 435 × 316 × 145 mm. Falë lidhjes me WI-FI ju mund të printoni edhe nga telefonët tuaj qoftë ai Android apo IOS. Në pako përfshihet : PG-545 (i zi ) CL-546 (me ngjyrë ) PG-545XL (i zi ) - opsional CL-546XL (me ngjyrë ) - opsional', N'63eabdbea539b0.78235909.webp', CAST(79.50 AS Decimal(18, 2)), 27, 14)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (39, N'Kufje Sony MDR-RF895RK, të zeza, III', N'', N'63eabdd87c2561.68876767.webp', CAST(99.50 AS Decimal(18, 2)), 28, 5)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (40, N'Kontroller Sony Playstation 5 DualSense', N'', N'63eabe14e6ab51.91700813.webp', CAST(89.50 AS Decimal(18, 2)), 28, 13)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (41, N'Karrige SENSE7 Knight, e zezë', N'', N'63eabe31db73d8.09365222.webp', CAST(169.50 AS Decimal(18, 2)), 29, 13)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (42, N'Maus Preyon Owl Wireless (POW35B)', N'Mouse Preyon Owl është mouse gaming pa kabllo, mirëpo asgjë nuk pengon lidhjen e tij me një kabllo. Nëse bateria harxhohet, vetëm lidheni dhe mund të vazhdoni përdorimin e tij. Me 50milion klikime në përdorimin e këtij mausi që tregon për sigurinë që jepet kualitetit të këtij mausi. Me butona shtesë shumë lehtë kontrolloni vlerat DPI dhe frekuencën e përdorur. Me LED që tregojnë vlerën e selektuar lehtë.', N'63eabe5a5852e1.52076563.webp', CAST(49.50 AS Decimal(18, 2)), 30, 8)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (43, N'Apple 10.9-inch iPad (10th) Wi-Fi, 64GB, Silver', N'', N'63eabe72174975.16788497.webp', CAST(569.00 AS Decimal(18, 2)), 1, 12)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (44, N'Apple MagSafe Duo Charger', N'', N'63eabe936e0523.11456101.webp', CAST(169.00 AS Decimal(18, 2)), 1, 11)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (45, N'Apple AirPods (3rd generation) with Lightning Charging Case', N'AirPods janë të lehta dhe ofrojnë një dizajn të konturuar. Mikrofonat me pamje nga brenda zbulojnë atë që po dëgjoni, më pas rregullojnë frekuencat e rangut të ulët dhe të mesëm për të ofruar detaje të pasura në çdo këngë.rnrnAirPods kanë një jetëgjatësi shtesë të baterisë në krahasim me AirPods (gjenerata e dytë) deri në 6 orë kohë dëgjimi dhe deri në 4 orë kohë bisede. Dhe me kutinë e karikimit Lightning, mund të shijoni deri në 30 orë kohë totale të dëgjimit. Si AirPods ashtu edhe kasa e karikimit të Rrufesë janë vlerësuar me IPX4 rezistente ndaj ujit – kështu që do të përballojnë çdo gjë, nga shiu deri tek stërvitjet e rënda.', N'63eabeae767761.75083362.webp', CAST(240.00 AS Decimal(18, 2)), 1, 5)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (46, N'Karrige SENSE7 Spellcaster, e zezë/e kaltër', N'Karrigia SENSE7 Spellcaster ka një formë që i përshtatet lakimit natyror të shtyllës kurrizore dhe, si rezultat, siguron pozicionin e duhur përpara kompjuterit kur jeni duke luajtur ose duke punuar. Ajo plotësohet nga një mbushje sfungjer me dendësi optimale, e cila përshtatet me trupin dhe siguron rehati. Është projektuar për njerëzit me peshë maksimale 150 kg. Karrigia peshon 17.5kg.', N'63f23b534f5c52.87433500.webp', CAST(149.50 AS Decimal(18, 2)), 29, 13)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (47, N'Kamerë Logitech StreamCam C980, e hirtë', N'Kjo është një kamerë transmetimi me cilësi të lartë. Ajo ofron një cilësi maksimale të regjistrimit prej 1080p në 60 korniza për sekondë. Ajo përdor ndërfaqen USB 3.2 Gen 1 lloji C për tu lidhur me pajisjen. Është e pajisur me një lente f / 2.0 me një gjatësi fokale prej 3.7 mm dhe një fushë shikimi prej 78 ° (diagonale). Ofron autofokus në një distancë prej 10 cm deri në pafundësi. Ka një mikrofon të dyfishtë gjithëpërfshirës të integruar me funksion të zvogëlimit të zhurmës. Gjatësia e kabllos është 1.5 m. Paketa përfshin një mbajtës për vendosjen e saj në monitor dhe një mbajtës statik.', N'63f5de70338ea0.03180620.webp', CAST(149.50 AS Decimal(18, 2)), 6, 4)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (48, N'Altoparlant JBL CLIP 4, i kaltër i hapur', N'Altoparlant unik portativ me fuqi dalëse 5 W RMS, përgjigje frekuence prej 100 Hz deri 20 kHz, raport sinjal-zhurmë > 85 dB, teknologji Bluetooth 5.1. Bateria e tij polimer litium-jon karikohet për 3 orë dhe zgjat deri në 10 orë. Përmasat e altoparlantit janë: 86.3 x 134.5 x 46 mm, pesha 239 g.', N'63f5deb8055346.05332264.webp', CAST(59.50 AS Decimal(18, 2)), 4, 5)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (49, N'Ngjyrë për printer Canon PGI-571, e kaltërt', N'Ngjyra e kaltër Canon CLI-571 është në përputhje me printera Canon PIXMA MG5750, MG5751, MG5752, MG5753, MG6850, MG6851, MG6852, MG6853, MG7750, MG7751, MG7752, MG7753. Kjo ngjyrë ka një vëllim prej 7 ml.', N'63f5df0fe61cf8.49070509.webp', CAST(19.50 AS Decimal(18, 2)), 27, 14)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (50, N'Maus Razer Pro Click, i bardhë', N'Ky është një maus wireless i krijuar për përdoruesit e djathtë. Mausi ka lidhës USB, 8 butona dhe një rrotë mekanike. Ai ka teknologji wireless Bluetooth, sensor optik dhe ndjeshmëri maksimale 16,000 DPI.', N'63f5e0272928f8.99239124.webp', CAST(127.50 AS Decimal(18, 2)), 9, 8)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (51, N'Karikues Samsung EP-TA12 për Samsung micro USB, i zi', N'', N'63f5e741d05b48.11483682.webp', CAST(18.50 AS Decimal(18, 2)), 10, 15)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (52, N'Apple 20W USB-C Power Adapter', N'Ky është një karikues i fuqishëm 20W, i cili përdoret për karikim të shpejtë dhe efikas në shtëpi, në zyrë dhe gjatë lëvizjes. Është i pajtueshëm me çdo pajisje USB-C, por për një performancë optimale të karikimit, Apple rekomandon përdorimin e tij me iPad Pro 11'' ose iPad Pro 12,9'' (gjenerata e tretë). Ai gjithashtu mbështet karikimin e shpejtë të iPhone 8.', N'63f5e7a904efe1.07954376.webp', CAST(30.00 AS Decimal(18, 2)), 1, 15)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (53, N'Gjirafa50 Bad News Eagles Jersey (Rio Edition) - XXL', N'Ndjeni emocionin e kualifikimit të dytë në Major me fanellën e Rio Edition të Bad News Eagles.rnrnKjo fanellë e cilësisë së lartë me dizajn modern, e krijuar posaçërisht për lojtarët pasionantë të sporteve elektronike, është krijuar me krenari krahas Gjirafa50.rnrnNgjyra e saj kryesore është e gjelbër, e njohur si ngjyra dominuese e flamurit kombëtar të Brazilit.rnrnFanella ka logon e personalizuar të ekipit BNE dhe është prej 100% poliestër.', N'63f5ec27d0f672.76058981.webp', CAST(49.50 AS Decimal(18, 2)), 31, 13)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (54, N'Gjirafa50 Bad News Eagles Jersey Legends Edition - L', N'Ndjeni emocionet e lojës me këtë fanellë të Legends Stage të Bad News Eagles të krijuar posaçërisht për lojtarët e apasionuar pas sporteve elektronike. Ngjyra kryesore e saj është e kuqja e kombinuar me detaje bardh e zi dhe ka logon e personalizuar të ekipit BNE. Fanella është prej 100% poliestër. Dimensionet janë 71 x 57 x 25.5 cm.rnrnKjo fanellë e cilësisë së lartë me dizajn modern është krijuar me krenari përkrah Gjirafa50.', N'63f5ec4e91ff92.01429806.webp', CAST(59.50 AS Decimal(18, 2)), 31, 13)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (55, N'Rrip metalik FIXED për Apple Watch 38/40/41mm, i argjendtë', N'Rrip metalik zëvendësues që është i pajtueshëm me Apple Watch 38/40 / 41mm. Ky rrip e kthen orën në një aksesor elegant që mund ta kombinoni lehtësisht me çdo veshje.', N'63f5ec798adb88.56368457.webp', CAST(32.50 AS Decimal(18, 2)), 35, 3)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (56, N'Mbrojtëse Lenuo Leshield për iPhone 13, e kuqe', N'Mbrojtëse për pjesën e pasme dhe anësore të celularit iPhone 13. Mbrojtësja është prej plastike të qëndrueshme dhe do të sigurojë mbrojtje të besueshme të celularit nga gërvishtjet dhe papastërtitë. Natyrisht, mbrojtësja ka prerje për kamerën, butonat dhe portin e karikimit. Ajo është e këndshme në prekje dhe e ruajtur mirë.', N'63f5ec9fb0aa89.27408325.webp', CAST(19.50 AS Decimal(18, 2)), 32, 1)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (57, N'Procesor Intel Core i7-12700F', N'Ky është një procesor i gjeneratës së 12-të Alder Lake i krijuar për prizën LGA 1700. Ofron 8+4 bërthama fizike (8 performancë + 4 efektive, 20 threads). Frekuenca e tyre është 1.6/2.1 GHz dhe deri në 3.6/4.8 GHz në modalitetin Turbo (bërthama efikase/performancë). Frekuenca maksimale Turbo Boost është deri në 4.9 GHz. Ai ofron një memorie buffer 25 MB SmartCache dhe një proces prodhimi 10 nm është përdorur për krijimin e tij. Mbështet memorie deri në DDR5 4800 MHz dhe DDR4 3200 MHz. Mbështet ndërfaqen PCI-Express 5.0/4.0. TDP e deklaruar nga prodhuesi është 65 W (maksimumi 180 W).', N'63f5ecdb56b5d2.54488204.webp', CAST(396.50 AS Decimal(18, 2)), 33, 10)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (58, N'Monitor Dell U3223QE - LED 31.5", 4K UHD, i zi / argjendtë', N'Dell U3223QE është një monitor 31.5" me rezolucion të lartë që do tju rrëmbejë me ngjyrën dhe elegancën e tij. Rezolucioni 4K (3840 x 2160) me më shumë se 8 milionë piksele ka një rezolucion 4 herë më të lartë se një monitor klasik Full HD. Ngjyrat janë të qarta dhe të qëndrueshme përgjatë këndit të shikimit. Dell UltraSharp P3222QE është një monitor që mendon gjithashtu për shëndetin tuaj. Falë funksionit ComfortView Plus, i cili garanton emetimin vazhdimisht të ulët të dritës blu, ju do të shijoni ngjyra të shkëlqyera.rnrnKarakteristikat e tjera të monitorit përfshijnë raporti i pamjes 16: 9, kontrasti 2000: 1, shpejtësia e rifreskimit 60 Hz, ndriçimi 400 cd / m2, koha e përgjigjes 8 ms në modalitetin normal ose 5 ms në modalitetin e shpejtë. Lidhësit: 1x DP, 1x HDMI, USB-C, 6x USB, 1x RJ-45, pivot. Dimensionet 71.26 cm x 61.88 cm x 23.32 cm, pesha 10.36 k', N'63f5ecf98f3534.93172253.webp', CAST(1199.50 AS Decimal(18, 2)), 25, 16)
INSERT [dbo].[Produkti] ([produktiID], [emriProduktit], [pershkrimi], [fotoProduktit], [qmimiProduktit], [kompaniaID], [kategoriaID]) VALUES (59, N'Kabllo AXAGON USB-A - micro USB 3.2 Gen 1 SPEED, 3A, 1m, e zezë', N'Kablloja AXAGON është e përshtatshme për laptopë, telefont, tabletë dhe pajisje e tjera celulare. Mbështet shpejtësinë e transferimit të të dhënave deri në 5 Gb / s dhe karikimin deri në 3A.', N'63f5ed187916e2.65869096.webp', CAST(9.50 AS Decimal(18, 2)), 34, 15)
SET IDENTITY_INSERT [dbo].[Produkti] OFF
GO
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (1, N'045234567', N'Peja', 30000, N'Xhemajl Kada 3')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (2, N'044123456', N'Prishtina', 10000, N'Kadri Zeka 6')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (3, N'045987654', N'Gjilan ', 60000, N'Rexhep Luci 12')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (4, N'045234567', N'Prizren ', 20000, N'Bedri Pejani 5')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (5, N'049876543', N'Kaçanik', 71000, N'Bedri Pejani 7')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (6, N'044123456', N'Kaçanik', 71000, N'Rexhep Luci 6')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (7, N'049234567', N'Ferizaj', 70000, N'Naim Frasheri 14')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (8, N'044765432', N'Prizren ', 20000, N'Perparim Krasniqi 7')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (9, N'045876543', N'Gjilan ', 60000, N'Rruga e Kavajes 36')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (10, N'045234567', N'Gjakova ', 50000, N'Bajram Kelmendi 33')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (11, N'044987654', N'Peja ', 30000, N'Hivzi Sulejmani 8')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (12, N'049876543', N'Ferizaj ', 70000, N'29 Nentori 19')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (13, N'043345678', N'Prizren ', 20000, N'Skenderbeu 2')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (14, N'046234567', N'Mitrovica ', 40000, N'Adem Jashari 11')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (15, N'045987654', N'Gjilan ', 60000, N'Rruga e Kavajes 24')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (16, N'044123456', N'Prishtina ', 10000, N'Rruga e Dibres 3')
INSERT [dbo].[TeDhenatPerdoruesit] ([userID], [nrKontaktit], [qyteti], [zipKodi], [adresa]) VALUES (17, N'045876543', N'Prizren ', 20000, N'Shaban Shala 9')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Perdorue__F3DBC572BE0CC5A7]    Script Date: 28/03/2023 23:59:19 ******/
ALTER TABLE [dbo].[Perdoruesi] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactForm] ADD  DEFAULT (getdate()) FOR [dataDergeses]
GO
ALTER TABLE [dbo].[ContactForm] ADD  DEFAULT ('Mesazhi juaj eshte derguar tek Stafi') FOR [statusi]
GO
ALTER TABLE [dbo].[KodiZbritjes] ADD  DEFAULT (getdate()) FOR [dataKrijimit]
GO
ALTER TABLE [dbo].[Kompania] ADD  DEFAULT ('kompaniPaFoto.png') FOR [logo]
GO
ALTER TABLE [dbo].[Perdoruesi] ADD  DEFAULT ((0)) FOR [aksesi]
GO
ALTER TABLE [dbo].[Porosit] ADD  DEFAULT (getdate()) FOR [dataPorosis]
GO
ALTER TABLE [dbo].[Porosit] ADD  DEFAULT ('Ne Procesim') FOR [statusiPorosis]
GO
ALTER TABLE [dbo].[Produkti] ADD  DEFAULT ('produktPaFoto.png') FOR [fotoProduktit]
GO
ALTER TABLE [dbo].[ContactForm]  WITH CHECK ADD  CONSTRAINT [FK_ContactForm_Perdoruesi] FOREIGN KEY([userID])
REFERENCES [dbo].[Perdoruesi] ([userID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ContactForm] CHECK CONSTRAINT [FK_ContactForm_Perdoruesi]
GO
ALTER TABLE [dbo].[KodiZbritjes]  WITH CHECK ADD  CONSTRAINT [FK_KodiZbritjes_Produkti] FOREIGN KEY([idProdukti])
REFERENCES [dbo].[Produkti] ([produktiID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[KodiZbritjes] CHECK CONSTRAINT [FK_KodiZbritjes_Produkti]
GO
ALTER TABLE [dbo].[Porosit]  WITH CHECK ADD  CONSTRAINT [FK_Porosit_Klienti] FOREIGN KEY([idKlienti])
REFERENCES [dbo].[Perdoruesi] ([userID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Porosit] CHECK CONSTRAINT [FK_Porosit_Klienti]
GO
ALTER TABLE [dbo].[Produkti]  WITH CHECK ADD  CONSTRAINT [FK_Produkti_Kategoria] FOREIGN KEY([kategoriaID])
REFERENCES [dbo].[KategoriaProduktit] ([kategoriaID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Produkti] CHECK CONSTRAINT [FK_Produkti_Kategoria]
GO
ALTER TABLE [dbo].[Produkti]  WITH CHECK ADD  CONSTRAINT [FK_Produkti_Kompania] FOREIGN KEY([kompaniaID])
REFERENCES [dbo].[Kompania] ([kompaniaID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Produkti] CHECK CONSTRAINT [FK_Produkti_Kompania]
GO
ALTER TABLE [dbo].[TeDhenatEPorosis]  WITH CHECK ADD  CONSTRAINT [FK_TeDhenatPorosis_KodiZbritjes] FOREIGN KEY([kodiZbritjes])
REFERENCES [dbo].[KodiZbritjes] ([kodi])
GO
ALTER TABLE [dbo].[TeDhenatEPorosis] CHECK CONSTRAINT [FK_TeDhenatPorosis_KodiZbritjes]
GO
ALTER TABLE [dbo].[TeDhenatEPorosis]  WITH CHECK ADD  CONSTRAINT [FK_TeDhenatPorosis_Porosia] FOREIGN KEY([idPorosia])
REFERENCES [dbo].[Porosit] ([idPorosia])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeDhenatEPorosis] CHECK CONSTRAINT [FK_TeDhenatPorosis_Porosia]
GO
ALTER TABLE [dbo].[TeDhenatEPorosis]  WITH CHECK ADD  CONSTRAINT [FK_TeDhenatPorosis_Produkti] FOREIGN KEY([idProdukti])
REFERENCES [dbo].[Produkti] ([produktiID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TeDhenatEPorosis] CHECK CONSTRAINT [FK_TeDhenatPorosis_Produkti]
GO
ALTER TABLE [dbo].[TeDhenatPerdoruesit]  WITH CHECK ADD  CONSTRAINT [FK_TeDhenatPerdorues_Perdoruesi] FOREIGN KEY([userID])
REFERENCES [dbo].[Perdoruesi] ([userID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeDhenatPerdoruesit] CHECK CONSTRAINT [FK_TeDhenatPerdorues_Perdoruesi]
GO
USE [master]
GO
ALTER DATABASE [TechStoreDB] SET  READ_WRITE 
GO
