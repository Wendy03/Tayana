USE [master]
GO
/****** Object:  Database [Tayana]    Script Date: 2023/9/19 上午 11:17:13 ******/
CREATE DATABASE [Tayana]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tayana', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\Tayana.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Tayana_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\Tayana_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tayana] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tayana].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tayana] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tayana] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tayana] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tayana] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tayana] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tayana] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tayana] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tayana] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tayana] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tayana] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tayana] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tayana] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tayana] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tayana] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tayana] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tayana] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tayana] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tayana] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tayana] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tayana] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tayana] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tayana] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tayana] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tayana] SET  MULTI_USER 
GO
ALTER DATABASE [Tayana] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tayana] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tayana] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tayana] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Tayana] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tayana] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tayana] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tayana] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tayana]
GO
/****** Object:  Table [dbo].[Compan]    Script Date: 2023/9/19 上午 11:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aboutContent] [nvarchar](max) NULL,
	[certificatContent] [nvarchar](max) NULL,
	[initDate] [datetime] NULL,
 CONSTRAINT [PK_Compan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 2023/9/19 上午 11:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](50) NULL,
	[initDate] [datetime] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dealers]    Script Date: 2023/9/19 上午 11:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dealers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[countryId] [int] NULL,
	[dealerImg] [nvarchar](max) NULL,
	[area] [nvarchar](50) NULL,
	[name] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[contact] [nvarchar](100) NULL,
	[tel] [nvarchar](20) NULL,
	[cell] [nvarchar](20) NULL,
	[fax] [nvarchar](100) NULL,
	[email] [nvarchar](50) NULL,
	[link] [nvarchar](100) NULL,
	[initDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 2023/9/19 上午 11:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[yachtId] [int] NULL,
	[image] [nvarchar](max) NULL,
	[isCover] [bit] NULL,
	[initDate] [datetime] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2023/9/19 上午 11:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[guid] [nvarchar](100) NULL,
	[coverImg] [nvarchar](max) NULL,
	[title] [nvarchar](100) NULL,
	[subtitle] [nvarchar](max) NULL,
	[newsContent] [nvarchar](max) NULL,
	[isTop] [bit] NULL,
	[publishDate] [date] NULL,
	[initDate] [datetime] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2023/9/19 上午 11:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[avatar] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[name] [nvarchar](15) NULL,
	[password] [nvarchar](50) NULL,
	[salt] [nvarchar](50) NULL,
	[isAdmin] [bit] NULL,
	[initDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yachts]    Script Date: 2023/9/19 上午 11:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yachts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[guid] [nvarchar](50) NULL,
	[coverImg] [nvarchar](max) NULL,
	[model] [nvarchar](50) NULL,
	[overview] [nvarchar](max) NULL,
	[dim] [nvarchar](max) NULL,
	[specs] [nvarchar](max) NULL,
	[layoutImg] [nvarchar](max) NULL,
	[deckImg] [nvarchar](max) NULL,
	[video] [nvarchar](max) NULL,
	[pdfFile] [nvarchar](max) NULL,
	[isNewBuild] [bit] NULL,
	[isNewDesign] [bit] NULL,
	[initDate] [datetime] NULL,
 CONSTRAINT [PK_Yachts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Compan] ON 

INSERT [dbo].[Compan] ([id], [aboutContent], [certificatContent], [initDate]) VALUES (1, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;"><img alt="" src="/upload/images/pit010.jpg" style="width: 274px; height: 192px; float: right;" />&ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;&nbsp;</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span></p>
', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yacht has the approval of ISO9001: 2000 quality certification by Bureau Veritas Certification (Taiwan) Co., Ltd in 2002. In August, 2011, formally upgraded to ISO9001: 2008. We will continue to adhere to quality-oriented, transparent and committed to delivering improvement customer satisfaction and build even stronger trusting relationships with customers.</span></p>
', CAST(N'2023-07-10T14:58:21.993' AS DateTime))
SET IDENTITY_INSERT [dbo].[Compan] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([id], [country], [initDate]) VALUES (4, N'USA', NULL)
INSERT [dbo].[Countries] ([id], [country], [initDate]) VALUES (8, N'China', CAST(N'2023-07-18T13:57:08.077' AS DateTime))
INSERT [dbo].[Countries] ([id], [country], [initDate]) VALUES (9, N'Hong Kong', CAST(N'2023-07-18T14:15:51.730' AS DateTime))
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Dealers] ON 

INSERT [dbo].[Dealers] ([id], [countryId], [dealerImg], [area], [name], [address], [contact], [tel], [cell], [fax], [email], [link], [initDate]) VALUES (1, 4, N'/upload/images/20230711104641.jpg', N'Annapolis', N'Sail yard Inc. Noyce Yacht serice', N'326 First Street Suite 18 Annapolis, Maryland 21403', N'Mr. W.Cary Lukens', N'(410)268-4100', N'', N'(410)268-2974', N'', N'http://www.sailyard.com', CAST(N'2023-07-11T01:32:30.207' AS DateTime))
INSERT [dbo].[Dealers] ([id], [countryId], [dealerImg], [area], [name], [address], [contact], [tel], [cell], [fax], [email], [link], [initDate]) VALUES (3, 4, N'/upload/images/20230711114737.jpg', N'San Francisco', N'Pacific Yacht Imports', N'Grand Marina 2051 Grand Street# 12 Alameda, CA 94501, USA', N'Mr. Neil Weinberg', N'(510)865-2541', N'', N'(510)865-2369', N'', N'tayana@mindspring.com', CAST(N'2023-07-11T11:47:37.180' AS DateTime))
INSERT [dbo].[Dealers] ([id], [countryId], [dealerImg], [area], [name], [address], [contact], [tel], [cell], [fax], [email], [link], [initDate]) VALUES (5, 4, N'/upload/images/20230718035513.jpg', N'San Diego', N'Cabrillo Yacht sales', N'5060 N.Harbor Dr.san Diego,CA 92106', N'Mr. Dan Peter', N'866-353-0409', N'', N'(619)200-1024', N'danpeter@cabrilloyachtsales.com', N'', CAST(N'2023-07-18T13:57:00.230' AS DateTime))
INSERT [dbo].[Dealers] ([id], [countryId], [dealerImg], [area], [name], [address], [contact], [tel], [cell], [fax], [email], [link], [initDate]) VALUES (9, 8, N'/upload/images/noimage.jpg', N'China', N'StarBay Boats(Dalian) Co.,Ltd', N'No.7-5 Zone B, Xinghai Square, Dalian,China P.C.116021', N'Mr.Peter Dong', N'+86-411-8464 3093', N'', N'+86-411-8464 3093', N'peter_pme@163.com', N'http://www.me-cn.com', CAST(N'2023-07-18T20:44:59.827' AS DateTime))
INSERT [dbo].[Dealers] ([id], [countryId], [dealerImg], [area], [name], [address], [contact], [tel], [cell], [fax], [email], [link], [initDate]) VALUES (8, 9, N'/upload/images/noimage.jpg', N'Hong Kong', N'Piercey Marine Limited', N'93 Che Keng Tuk Road, Sai Kung, HONG KONG', N'Mr. Steve Piercey', N'(852) 2791 4106', N'', N'(852) 2791 4124', N'info@pierceymarine.com', N'http://www.pierceymarine.com', CAST(N'2023-07-18T16:18:23.297' AS DateTime))
SET IDENTITY_INSERT [dbo].[Dealers] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (10, 4, N'/upload/images/20230713114917.jpg', 1, CAST(N'2023-07-13T11:49:17.650' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (11, 4, N'/upload/images/20230713034654.jpg', 0, CAST(N'2023-07-13T15:46:54.987' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (18, 7, N'/upload/images/20230718024631.jpg', 0, CAST(N'2023-07-18T14:46:31.110' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (19, 7, N'/upload/images/20230718024835.jpg', 0, CAST(N'2023-07-18T14:48:35.043' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (20, 7, N'/upload/images/20230718025127.jpg', 0, CAST(N'2023-07-18T14:51:27.643' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (21, 8, N'/upload/images/20230718025803.jpg', 0, CAST(N'2023-07-18T14:58:03.370' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (22, 9, N'/upload/images/20230718030550.jpg', 0, CAST(N'2023-07-18T15:05:50.367' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (23, 9, N'/upload/images/20230718030556.jpg', 0, CAST(N'2023-07-18T15:05:56.300' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (24, 9, N'/upload/images/20230718030603.jpg', 0, CAST(N'2023-07-18T15:06:03.487' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (25, 7, N'/upload/images/20230718033115.jpg', 0, CAST(N'2023-07-18T15:31:15.380' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (26, 7, N'/upload/images/20230718033143.jpg', 0, CAST(N'2023-07-18T15:31:43.573' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (27, 8, N'/upload/images/20230718045938.jpg', 0, CAST(N'2023-07-18T16:59:38.960' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (28, 10, N'/upload/images/20230719105713.jpg', 0, CAST(N'2023-07-19T10:57:13.560' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (29, 10, N'/upload/images/20230719115924.jpg', 0, CAST(N'2023-07-19T11:59:24.280' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (38, 13, N'/upload/images/20230804015803.jpg', 0, CAST(N'2023-08-04T13:58:03.350' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (39, 13, N'/upload/images/20230804015809.jpg', 0, CAST(N'2023-08-04T13:58:09.070' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (40, 13, N'/upload/images/20230804015813.jpg', 0, CAST(N'2023-08-04T13:58:13.490' AS DateTime))
INSERT [dbo].[Images] ([id], [yachtId], [image], [isCover], [initDate]) VALUES (41, 13, N'/upload/images/20230804015818.jpg', 0, CAST(N'2023-08-04T13:58:18.210' AS DateTime))
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([id], [guid], [coverImg], [title], [subtitle], [newsContent], [isTop], [publishDate], [initDate]) VALUES (3, N'4d53f124-a4f2-4a33-b9ef-d56e4da7e03328', N'/upload/images/20230711042249.jpg', N'TAYANA 48 setting mas', N'TAYANA 48 setting mast', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">New Building Tayana 48 &quot;OAHANCHI&quot; setting mast in test. Estimated completing in Aug. and delivery in Nov.2017</span></p>
<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;"><img alt="" src="/upload/images/pit009.jpg" style="width: 274px; height: 192px;" /></span></p>
', 1, CAST(N'2023-07-13' AS Date), CAST(N'2023-07-11T16:22:49.297' AS DateTime))
INSERT [dbo].[News] ([id], [guid], [coverImg], [title], [subtitle], [newsContent], [isTop], [publishDate], [initDate]) VALUES (5, N'5247a6fb-af79-412c-9f7a-1fa19e0a4b6d92', N'/upload/images/20230713020338.jpg', N'TAYANA 47 PEREGRINA’S JOURNEY', N'PEREGRINA is a TAYANA 47’ Yacht in 1991', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">n 2010, TAYANA 47 PEREGRINA&rsquo;s owner Peter and his family began their journey from Miami. During 5 &frac12; year circumnavigation, they visited 35 countries and traveled about 34,000 miles with safety. Peter recorded all journeying stories with words and pictures in his blog. If you are interested in their journey, please visit his blog&nbsp;</span><a href="https://web.archive.org/web/20170824082241/http://www.blog.mailasail.com/peregrina" style="font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" target="_blank">www.blog.mailasail.com/peregrina</a><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">. We believe that you will feel amazed at their journey.&nbsp;</span></p>
', 0, CAST(N'2023-07-15' AS Date), CAST(N'2023-07-13T02:03:38.937' AS DateTime))
INSERT [dbo].[News] ([id], [guid], [coverImg], [title], [subtitle], [newsContent], [isTop], [publishDate], [initDate]) VALUES (7, N'195a31b9-be56-40b9-90cc-ea1c319d524a26', N'/upload/images/20230718082518.jpg', N'Taiwan Boat Show', N'Taiwan Boat Show', N'<p style="margin: 0px; padding: 0px; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<span style="font-size: 12px;">Welcome to visit us in Taiwan INT&#39;L Boat Show March 10-13 , 2016</span></p>
<p style="margin: 0px; padding: 0px; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<span style="font-size: 12px;"><span style="line-height: 24.48px;">TAYANA</span><span style="line-height: 24.48px;">&nbsp;will exhibit&nbsp;&nbsp;</span><span style="line-height: 24.48px;">&quot;TAYANA 37&quot;</span><span style="line-height: 24.48px;">&nbsp;in Kaohsiung exhibition center.</span>&nbsp;&nbsp;</span></p>
', 0, CAST(N'2023-07-18' AS Date), CAST(N'2023-07-18T20:25:18.307' AS DateTime))
INSERT [dbo].[News] ([id], [guid], [coverImg], [title], [subtitle], [newsContent], [isTop], [publishDate], [initDate]) VALUES (8, N'81531979-19df-4b66-9184-53e04f88595668', N'/upload/images/20230718083220.jpg', N'Tayana 54 entering the EU', N'For Tayana 54 entering the EU', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">For Tayana 54 entering the EU, CE Certificates are AVAILABLE to ensure conformity to all applicable European directives and requirements.</span></p>
', 0, CAST(N'2023-07-18' AS Date), CAST(N'2023-07-18T20:32:20.697' AS DateTime))
INSERT [dbo].[News] ([id], [guid], [coverImg], [title], [subtitle], [newsContent], [isTop], [publishDate], [initDate]) VALUES (9, N'c1f2dd1f-a194-485d-91b9-d064aade304656', N'/upload/images/20230718083426.jpg', N'Asia''s Yachting Future', N'One of ten top yacht builder in Asia', N'<ul style="margin: 0px; padding-right: 0px; padding-left: 0px; list-style-type: none; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<li style="margin: 0px; padding: 0px; list-style-type: none; display: inline;">
		One of ten top yacht builder in Asia</li>
</ul>
<p style="margin: 0px; padding: 0px; list-style-type: none; display: inline;">
	<img alt="" src="/upload/images/s20120402032254.jpg" style="width: 161px; height: 121px;" /></p>
', 0, CAST(N'2023-07-18' AS Date), CAST(N'2023-07-18T20:34:10.563' AS DateTime))
INSERT [dbo].[News] ([id], [guid], [coverImg], [title], [subtitle], [newsContent], [isTop], [publishDate], [initDate]) VALUES (10, N'b0e83ed0-b7f0-40f2-aa52-4b938a70920652', N'/upload/images/20230718083524.jpg', N'TAYANA T37''-590', N'TAYANA T37''-590 will be shipped to Dalian,China', N'<p>
	<span closure_uid_aergm5="677" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">TAYANA T37&#39;-590</span><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">&nbsp;</span><span class="hps" closure_uid_aergm5="678" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">on</span><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">&nbsp;</span><span class="hps" closure_uid_aergm5="679" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">May 5, 2012</span><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">&nbsp;</span><span class="hps" closure_uid_aergm5="680" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">to complete</span><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">&nbsp;</span><span class="hps" closure_uid_aergm5="681" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">electrical</span><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">&nbsp;</span><span class="hps" closure_uid_aergm5="682" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">and</span><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">&nbsp;</span><span class="hps" closure_uid_aergm5="683" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">mechanical</span><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">&nbsp;</span><span class="hps" closure_uid_aergm5="684" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">testing</span><span closure_uid_aergm5="685" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">,</span><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">&nbsp;</span><span class="hps" closure_uid_aergm5="686" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">and</span><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">&nbsp;</span><span class="hps" closure_uid_aergm5="687" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">will soon</span><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">&nbsp;</span><span class="hps" closure_uid_aergm5="688" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">be shipped</span><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">&nbsp;</span><span class="hps" closure_uid_aergm5="689" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">to</span><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">&nbsp;</span><span class="hps" closure_uid_aergm5="690" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">Dalian,China.</span></p>
', 0, CAST(N'2023-07-18' AS Date), CAST(N'2023-07-18T20:35:24.527' AS DateTime))
INSERT [dbo].[News] ([id], [guid], [coverImg], [title], [subtitle], [newsContent], [isTop], [publishDate], [initDate]) VALUES (11, N'fb583702-a957-48a2-b9c9-430667ddfd3f26', N'/upload/images/20230719110850.jpg', N'Tayana 44 (New Design)', N'Tayana 44 (New Design)', N'<ul style="margin: 0px; padding-right: 0px; padding-left: 0px; list-style-type: none; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<li style="margin: 0px; padding: 0px; list-style-type: none; display: inline;">
		Tayana 44 (New Design)</li>
</ul>
<p style="margin: 0px; padding: 0px; list-style-type: none; display: inline;">
	&nbsp;</p>
<ul style="margin: 0px; padding-right: 0px; padding-left: 0px; list-style-type: none; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<li style="margin: 0px; padding: 0px; list-style-type: none; display: inline;">
		<a href="https://web.archive.org/web/20170824105907/http://www.tayanaworld.com/new_view.aspx?id=9d9b9dc2-4312-45c6-bbd6-716e6f37a230" style="color: rgb(52, 169, 212); text-decoration-line: none;">)<img alt="" src="/upload/images/20230711042249.jpg" style="width: 161px; height: 121px;" /></a></li>
</ul>
', 0, CAST(N'2023-07-19' AS Date), CAST(N'2023-07-19T11:08:50.267' AS DateTime))
INSERT [dbo].[News] ([id], [guid], [coverImg], [title], [subtitle], [newsContent], [isTop], [publishDate], [initDate]) VALUES (16, N'4b448de6-2b07-4194-a119-014dcfbde16d48', N'/upload/images/20230804020018.jpg', N'Taiwan Boat Show closed', N'PEREGRINA is a TAYANA 47’ Yacht in 1991', N'<p>
	PEREGRINA is a TAYANA 47&rsquo; Yacht in 1991</p>
', 0, CAST(N'2023-08-04' AS Date), CAST(N'2023-08-04T14:00:18.493' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [avatar], [email], [name], [password], [salt], [isAdmin], [initDate]) VALUES (1, N'/upload/images/20230714112016.jpg', N'admin@gmail.com', N'Admin', N'APbXsyfxgCQ5XDuvHZSmSA==', N'hhwuO36Kkhx21IeYhv/TCw==', 1, CAST(N'2023-07-12T17:30:47.343' AS DateTime))
INSERT [dbo].[Users] ([id], [avatar], [email], [name], [password], [salt], [isAdmin], [initDate]) VALUES (4, N'/upload/images/avatar.png', N'test@gmail.com', N'test', N'l6FWdCzfnLHDvE5bYqpi5Q==', N'eHwZmBjw+VE4YTb7VJYf0A==', 0, CAST(N'2023-07-18T15:37:49.210' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Yachts] ON 

INSERT [dbo].[Yachts] ([id], [guid], [coverImg], [model], [overview], [dim], [specs], [layoutImg], [deckImg], [video], [pdfFile], [isNewBuild], [isNewDesign], [initDate]) VALUES (4, N'037cedfd-d732-4052-b3af-f6fe931f90c990', N'/upload/images/20230713114917.jpg', N'Tayana 37', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">The Tayana 37 is perhaps the most successful semi-custom cruising boat to be built. It was designed by Bob Perry and introduced in 1975 as a response to the Westsail 32 which were selling in enormous numbers. Today looking back, with the boat still in production with a boat count of 588, most still sailing, and an active and owners community, its very apparent that Perry has succeeded.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">One could say the boat was designed to ignite imaginations of tropical sunsets in exotic locations; think oodles of teak and a beautiful custom interior, wrapped into traditional double-ender hull with a full keel. Beneath the alluring romance, you&rsquo;ll find a boat that is solidly built, and indeed many Tayana 37s can be found on the blue water cruising circuit around the world.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">Tayana 37 has been constructed of the finest materials, using the best techniques. There is no better yacht in her size range on the market. With care and proper maintenance she will not only prove to be an excellent investment, she will take you cruising anywhere in the world safely and comfortably. This is being proven almost daily. Ocean crossings by Tayana 37&rsquo;s are routine. Circumnavigations have been reported. By the same token, over 500 of these yachts are the primary homes of their owners.</span></p>
', N'<table class="table02" style="border-collapse: collapse; border-spacing: 0px; width: 713px; border-style: solid; border-color: rgb(52, 169, 212); color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<tbody>
		<tr>
			<td class="table02td01" style="margin: 0px; padding: 0px; width: 433px; vertical-align: top; border-style: solid; border-color: rgb(52, 169, 212);">
				<table style="border-collapse: collapse; border-spacing: 0px; width: 433px;">
					<tbody>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Hull length</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								36&rsquo;-8&rdquo;</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								L.W.L.</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								31&rsquo;-0&rdquo;&rsquo;</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								B. MAX</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								11&rsquo;-6&rdquo;</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Standard draft</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								5&rsquo;-8&rdquo;</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Ballast</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								8000 lbs</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Displacement</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								22500 lbs</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Sail area</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								768 sq.ft.</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Cutter</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								861 sq.ft.</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td style="margin: 0px; padding: 0px; border-style: solid; border-color: rgb(52, 169, 212);">
				<img alt="Tayana" src="https://web.archive.org/web/20170920135936im_/http://www.tayanaworld.com/upload/images/37.gif" /></td>
		</tr>
	</tbody>
</table>
<p>
	&nbsp;</p>
', N'
	&lt;p&gt;HULL&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Hand laid up FRP hull, white with blue cove stripe and boot top.&lt;/li&gt;

	&lt;li&gt; Teak rubrail&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;DECK/HARDWARE&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Hand laid up FRP cord deck.&lt;/li&gt;

	&lt;li&gt;Teak cockpit seats and cockpit grating&lt;/li&gt;

	&lt;li&gt;Teak skylight&lt;/li&gt;

	&lt;li&gt;Teak companionway hatch with doors &amp;amp; stormboards&lt;/li&gt;

	&lt;li&gt;Teak or alumnum forward hatch&lt;/li&gt;

	&lt;li&gt;Teak exterior trim&lt;/li&gt;

	&lt;li&gt;Teak exterior handrails&lt;/li&gt;

	&lt;li&gt;Teak samsom posts forward&lt;/li&gt;

	&lt;li&gt;Laminated bow sprit with teak platform &amp;amp; anchor rollers&lt;/li&gt;

	&lt;li&gt;Chain locker and one deck pipe&lt;/li&gt;

	&lt;li&gt;SS stanchions, vinyl covered dbl lifelines w/ gates P&amp;amp;S&lt;/li&gt;

	&lt;li&gt;SS bow pulpit&lt;/li&gt;

	&lt;li&gt;SS stern pulpit&lt;/li&gt;

	&lt;li&gt;Stainless hawse pipes &amp;amp; mooring cleats (six)&lt;/li&gt;

	&lt;li&gt;Stainless steel opening ports (ten)&lt;/li&gt;

	&lt;li&gt;Dorade vents (four)&lt;/li&gt;

	&lt;li&gt;FRP seahood&lt;/li&gt;

	&lt;li&gt;Propane locker for two 20 lb tanks, vented overboard&lt;/li&gt;

	&lt;li&gt;Two coaming lockers&lt;/li&gt;

	&lt;li&gt;Aluminium mainsheet traveler w/ roller car&lt;/li&gt;

	&lt;li&gt;Staysail track&lt;/li&gt;

	&lt;li&gt;Aluminium genoa tracks with cars&lt;/li&gt;

	&lt;li&gt;Teak sliding companionway hatch&lt;/li&gt;

	&lt;li&gt;Teak coaming caps&lt;/li&gt;

	&lt;li&gt;Winch handles&lt;/li&gt;

	&lt;li&gt;Seven Lewmar winches &lt;br/&gt;

	Two 40CST jib sheet&lt;br/&gt;

	One 40CSTmain sheet&lt;br/&gt;

	One 30CST staysail&lt;br/&gt;

	One 30CST jib halyard&lt;br/&gt;

	One 30CST main halyard&lt;br/&gt;

	One 30CST staysail halyard&amp;lt;

	&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;ENGINE/MACHINERY&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;01Diesel engine &ndash; Yanmar 4JHE, fresh water cooled, 55HP&lt;/li&gt;

	&lt;li&gt;Engine cooling water intake strainer&lt;/li&gt;

	&lt;li&gt;Dripless shaft gland&lt;/li&gt;

	&lt;li&gt;Bronze three blade propeller&lt;/li&gt;

	&lt;li&gt;Fiberglass drip pan

	&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;STEERING&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Pedestal steering &lt;/li&gt;

	&lt;li&gt;Teak traditional steering wheel&lt;/li&gt;

	&lt;li&gt;Teak &amp;amp; SS emergency tiller&lt;/li&gt;

	&lt;li&gt;SS rudder shaft&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;SPARS/RIGGING&lt;/p&gt;

	&lt;ul&gt;

	&nbsp; &lt;li&gt;Alumnium mast &amp;amp; boom, mast with electrical conduits&lt;/li&gt;

	&nbsp; &lt;li&gt;5/16&rdquo; SS standing rigging w/ swaged terminals&lt;/li&gt;

	&nbsp; &lt;li&gt;Staysail boom &amp;amp; fittings&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;SAILS&lt;/p&gt;

	&lt;ul&gt;

	&nbsp; &lt;li&gt;Main, 8 oz, w/2 reef points&lt;/li&gt;

	&nbsp; &lt;li&gt;Yankee jib, 8 oz, 100%&lt;/li&gt;

	&nbsp; &lt;li&gt;Staysail, 8 oz&lt;/li&gt;

	&nbsp; &lt;li&gt;Mizzon, 8 oz (ketch only)&lt;/li&gt;

	&nbsp; &lt;li&gt;Sail bags for all sails&lt;/li&gt;

	&nbsp; &lt;li&gt;Sail covers for all sails (blue) &lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;INTERIOR&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Teak and holly cabin sole&lt;/li&gt;

	&lt;li&gt;White formica counters in head &amp;amp; galley. Teak veneer chart &amp;amp; dinette table tops.&lt;/li&gt;

	&lt;li&gt;Teak framed mirror in head&lt;/li&gt;

	&lt;li&gt;Interior teak handrails&lt;/li&gt;

	&lt;li&gt;V-berth filler (if applicable)&lt;/li&gt;

	&lt;li&gt;Vinyl cushion covers&lt;/li&gt;

	&lt;li&gt;Ice chest insulated w/ 4&rdquo; PU foam &amp;amp; SS lined&lt;/li&gt;

	&lt;li&gt;Interior varnished quality polyurethane satin&lt;/li&gt;

	&lt;li&gt;Stove alcove SS lined&lt;/li&gt;

	&lt;li&gt;Easily removable head liner&lt;/li&gt;

	&lt;li&gt;Ceiling on all exposed hull areas&nbsp; &lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;ELECTRICAL&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Dual l20AH, 12 volt batteries in FRP boxes&lt;/li&gt;

	&lt;li&gt;Eight l2 volt cabin lights overhead &amp;amp; six reading lights&lt;/li&gt;

	&lt;li&gt;12 volt electrical system w/ 3 way switch, electric panel w/ breakers &amp;amp; volt meter&nbsp; &amp;amp; ammeter and DC outltes&lt;/li&gt;

	&lt;li&gt;ll0 volt shore power system w/ 30amp power socket, electric panel w/ breakers &amp;amp;&nbsp;

	&nbsp; &nbsp; volt meter and ammeter, ll0 volt outlets throughout yacht&lt;/li&gt;

	&lt;li&gt;International rules running lights&lt;/li&gt;

	&lt;li&gt;Deck flood light&lt;/li&gt;

	&lt;li&gt;Anchor light &lt;/li&gt;

	&lt;/ul&gt;
', N'/upload/images/20230713122106.jpg', N'/upload/images/20230713122115.jpg', NULL, N'/upload/files/20230718032827.pdf', 1, 0, CAST(N'2023-07-13T00:20:11.910' AS DateTime))
INSERT [dbo].[Yachts] ([id], [guid], [coverImg], [model], [overview], [dim], [specs], [layoutImg], [deckImg], [video], [pdfFile], [isNewBuild], [isNewDesign], [initDate]) VALUES (7, N'56d71d35-4bc0-4cd8-94d9-d7bcfb86ef8835', N'/upload/images/20230718033115.jpg', N'Tayana 42', N'<p>
	Putting thoroughbred performance into performance cruisers has never been easy. In his Vancouver 42, however, Robert Harris has made it look easy. Combing rugged good looks, liveaboard volume, and go-anywhere capabilities in a boat that still ghosts racily in single-digit wind strengths is quite a feat. On top of that, Harris made here a double-ender. To this exceptional design the builder, Ta-Yang of Taiwan, brings both an internationally acclaimed standard of construction quality and a refined semicustom flexibility that gives individual sailors exceptional control of the look and layout of their boats. The formula for making husky boats sail like-sylphs is one that Harris has explored in depth throughout his decades at the forefront of sailboat design. Oversimplified, that approach involves a very slippery hull, a very powerful sailplan, and a set of jumbo underwater foils that are as efficient as they are big. Although the Vancouver 42 displaces close to 30,000 pounds, Harris has made it possible for her to carry that weight with considerable grace. For pure power and for coast-wise sailing, she can be rigged as a sloop. The vast majority of buyers, however, specify the cutter rig and its putative superiority for passagemaking. An even wider range of options is available below. Dealers in the States have become very adept at working with factory- so adept that they are able to make next-day price quotations on custom arrangements Auto-cad aid or facsimile-copied to Taiwan. Ta Yang yard have developed an expertise and a price in exercising it that are evident in the 42 from her superbly finished glass moldings to the seamanlike way in which her systems have been integrated into units organized to function well.</p>
', N'<table class="table02" style="border-collapse: collapse; border-spacing: 0px; width: 713px; border-style: solid; border-color: rgb(52, 169, 212); color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<tbody>
		<tr>
			<td class="table02td01" style="margin: 0px; padding: 0px; width: 433px; vertical-align: top; border-style: solid; border-color: rgb(52, 169, 212);">
				<table style="border-collapse: collapse; border-spacing: 0px; width: 433px;">
					<tbody>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Hull length</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								41&rsquo;-9&rdquo;</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								L.W.L.</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								33&rsquo;</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								B. MAX</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								12&rsquo;-6&rdquo;</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Standard draft</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								5&rsquo;-10&rdquo;</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Ballast</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								11800 lbs</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Displacement</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								29147 lbs</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Engine diesel</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								56 hp</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Sail area</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								1009 sq.ft.</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Designer</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								Robert Harris</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td style="margin: 0px; padding: 0px; border-style: solid; border-color: rgb(52, 169, 212);">
				<img alt="" src="https://web.archive.org/web/20170825131200im_/http://www.tayanaworld.com/upload/images/V42-1.JPG" style="width: 278px; height: 345px;" /></td>
		</tr>
	</tbody>
</table>
<p>
	&nbsp;</p>
', N'
	&lt;p&gt;DECK/HARDWARE&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Hand laid up FRP, cored deck&lt;/li&gt;

	&lt;li&gt;Molded nonskid&lt;/li&gt;

	&lt;li&gt;Teak cockpit seats and sole&lt;/li&gt;

	&lt;li&gt;FRP cockpit coaming with teak&nbsp; cap&lt;/li&gt;

	&lt;li&gt;Aluminum hatches&lt;/li&gt;

	&lt;li&gt;S.S. potholes&lt;/li&gt;

	&lt;li&gt;Teak exterior handrails&lt;/li&gt;

	&lt;li&gt;Double anchor sprit with&nbsp; rollers&lt;/li&gt;

	&lt;li&gt;Chain locker &amp;amp; one deckpipe&lt;/li&gt;

	&lt;li&gt;Anchor well in foredeck&lt;/li&gt;

	&lt;li&gt;SS bow pulpit&lt;/li&gt;

	&lt;li&gt;SS stern pulpit&lt;/li&gt;

	&lt;li&gt;Aluminum toe rail with haswse&nbsp; holes&lt;/li&gt;

	&lt;li&gt;Mooring cleats&lt;/li&gt;

	&lt;li&gt;Dorade vents, 5 ea&lt;/li&gt;

	&lt;li&gt;FRP seahood&lt;/li&gt;

	&lt;li&gt;Propane locker for two 20 lb&nbsp; tanks vented overboard&lt;/li&gt;

	&lt;li&gt;Lazarette hatch&lt;/li&gt;

	&lt;li&gt;Two coaming lockers&lt;/li&gt;

	&lt;li&gt;Aluminum mainsheet traveler w/&nbsp; roller car&lt;/li&gt;

	&lt;li&gt;SS staysail traveler&lt;/li&gt;

	&lt;li&gt;SS genoa tracks with cars&lt;/li&gt;

	&lt;li&gt;Mast safety guards&lt;/li&gt;

	&lt;li&gt;Anchor windlass, two speed&nbsp; &nbsp; &lt;/li&gt;

	&lt;li&gt;Lexan sliding companionway hatch&nbsp; &nbsp; &lt;/li&gt;

	&lt;li&gt;Teak louvered companionway doors &lt;/li&gt;

	&lt;li&gt;SS stanchions w/ vinyl covered&nbsp; double life lines w/ gates P&amp;amp;S&lt;/li&gt;

	&lt;li&gt;Winches, Lewmar&lt;br/&gt;

	Two 44CST primary

	&lt;br/&gt;

	Two 40CST secondary

	&lt;br/&gt;

	One 30CST main halyard

	&lt;br/&gt;

	One 30CST jib halyard

	&lt;br/&gt;

	One 16CST staysail halyard

	&lt;br/&gt;

	One 16CST reefing&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;ENGINE/MACHINERY&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Diesel engine-Yanmar 4JH2E&nbsp; freshwater cooled, 50HP&lt;/li&gt;

	&lt;li&gt;Engine cooling water intake&nbsp; strainer&lt;/li&gt;

	&lt;li&gt;Dripless shaft gland&lt;/li&gt;

	&lt;li&gt;Bronze three blade propeller&lt;/li&gt;

	&lt;li&gt;FRP drip pan&lt;/li&gt;

	&lt;li&gt;Engine room blower&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;STEERING&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Pedestal steering EDSON&lt;/li&gt;

	&lt;li&gt;Destroyer type steering wheel&nbsp; SS&lt;/li&gt;

	&lt;li&gt;Teak emergency tiller&lt;/li&gt;

	&lt;li&gt;SS rudder&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;SPARS/RIGGING&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Aluminum mast and boom, mast w/&nbsp; electrical conduits&lt;/li&gt;

	&lt;li&gt;Standing rigging 5/16&rdquo; &amp;amp;&nbsp; 3/8&rdquo; SS w/ swaged terminals.&lt;/li&gt;

	&lt;li&gt;Staysail boom &amp;amp; fittings&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;SAILS&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Mainsail, 8 oz dacron w/ 2 reef&nbsp; points&lt;/li&gt;

	&lt;li&gt;Jib, 8 oz dacron&lt;/li&gt;

	&lt;li&gt;Staysail, 8 oz dacron&lt;/li&gt;

	&lt;li&gt;Sail bags for all sails&lt;/li&gt;

	&lt;li&gt;Sail covers for main sail&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;INTERIOR&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Teak and spruce joinery &amp;amp;&nbsp; cabinetry throughout&lt;/li&gt;

	&lt;li&gt;Teak &amp;amp; holly cabin sole&lt;/li&gt;

	&lt;li&gt;White formica counter in head&nbsp; &amp;amp; galley, simulated wood grain, teak veneer desk &amp;amp; table top&lt;/li&gt;

	&lt;li&gt;Teak framed mirror in head&lt;/li&gt;

	&lt;li&gt;Interior teak handrails&lt;/li&gt;

	&lt;li&gt;V-berth filler if applicable&lt;/li&gt;

	&lt;li&gt;Cloth cushions covers&lt;/li&gt;

	&lt;li&gt;Ice chest has 4&rdquo; P.U. foam&nbsp; &amp;amp; SS liner&lt;/li&gt;

	&lt;li&gt;Interior polyurethane vanrish,&nbsp; satin&lt;/li&gt;

	&lt;li&gt;Stove alcove SS lined&lt;/li&gt;

	&lt;li&gt;Easily removable head liner&lt;/li&gt;

	&lt;li&gt;Teak fiddles &amp;amp; teak trim on&nbsp; counters &amp;amp; tables&lt;/li&gt;

	&lt;li&gt;Four inch interior foam&nbsp; cushions w/ cloth covering&lt;/li&gt;

	&lt;li&gt;Solid teak doors &amp;amp; frames&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;ELECTRICAL&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Two 120AH 12 volt batteries&nbsp; &amp;amp; FRP boxes&lt;/li&gt;

	&lt;li&gt;International running lights&lt;/li&gt;

	&lt;li&gt;Eight 12 volt cabin lights&nbsp; overhead &amp;amp; two reading lights&lt;/li&gt;

	&lt;li&gt;12 volt electrical system w/ 3&nbsp; way switch, electric panel w/ breakers and volt meter &amp;amp; ammeter&lt;/li&gt;&nbsp;&nbsp;

	&lt;li&gt;12 volt deck flood light&lt;/li&gt;

	&lt;li&gt;12 volt anchor light&lt;/li&gt;

	&lt;li&gt;110 volt electrical system w/30&nbsp; amp shore power plug, electric panel w/ breakers &amp;amp; voltmeter &amp;amp; ammeter&nbsp; &amp;amp; 110 volt outlets throughout the yacht&lt;/li&gt;&nbsp;&nbsp;

	&lt;/ul&gt;

	&lt;p&gt;PLUMBING&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Two 60 gallon mild steel fuel&nbsp; tanks&lt;/li&gt;

	&lt;li&gt;Two 70 gallon SS water tanks&lt;/li&gt;

	&lt;li&gt;One 30 gallon holding tank&lt;/li&gt;

	&lt;li&gt;One 10 gallon hot water heater,&nbsp; 110 volt &amp;amp; engine heat exchanger&lt;/li&gt;

	&lt;li&gt;Manual marine head&lt;/li&gt;

	&lt;li&gt;Hot and cold pressure water&nbsp; system&lt;/li&gt;

	&lt;li&gt;One high capacity manual bilge&nbsp; pump&lt;/li&gt;

	&lt;li&gt;One heavy duty electric bilge&nbsp; pump&lt;/li&gt;

	&lt;li&gt;Bilge pump strainers&lt;/li&gt;

	&lt;li&gt;Sea cocks on all through hulls&lt;/li&gt;

	&lt;/ul&gt;

	&nbsp;
', NULL, NULL, NULL, N'/upload/files/20230718033722.pdf', 0, 0, CAST(N'2023-07-18T14:30:05.360' AS DateTime))
INSERT [dbo].[Yachts] ([id], [guid], [coverImg], [model], [overview], [dim], [specs], [layoutImg], [deckImg], [video], [pdfFile], [isNewBuild], [isNewDesign], [initDate]) VALUES (8, N'0f338765-76d0-4b61-b505-e77a4066c7a192', N'/upload/images/20230718045938.jpg', N'Tayana 44', N'<div>
	This is &quot;don&#39;t miss news&quot; from one of the world&#39;s oldest and most successful offshore yacht builders. Tayana has been staying busy working on a comprehensive program of new boat development. With customer product development, the new Tayana 44 is a reality ! With a keen ear we listened to offshore sailors around the world. Now, the Dixon designed 44 is the latest in the pround Tayana fleet. The Tayanaworld flagship Ladd 64, the Dixon 54 and now the 44 share the same design, quality and value that you demand. Team up with our experts and cruise beautifully with TAYANA !</div>
<div>
	&nbsp;</div>
<div>
	Quality, Performance and Value-Welcome to the new Tayanaworld Yachts !</div>
', N'<table border="1" cellpadding="1" cellspacing="1" class="table02" style="border-collapse: collapse; border-spacing: 0px; width: 500px; border: 1px solid rgb(52, 169, 212); color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<tbody>
		<tr>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				<strong>&nbsp;LENGTH OVERALL</strong></td>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				13.225 m</td>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				43&#39;-5&quot;</td>
		</tr>
		<tr>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				<strong>&nbsp;LENGTH WATERLINE</strong></td>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				12.48 m</td>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				40&#39;-11&quot;</td>
		</tr>
		<tr>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				<strong>&nbsp;BEAM MAX</strong></td>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				4.187 m</td>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				13&#39;-9&quot;</td>
		</tr>
		<tr>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				<strong>&nbsp;LIGHTSHIP DISPLACEMENT</strong></td>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				14&nbsp;tonnes</td>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				30,800 lbs</td>
		</tr>
		<tr>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				<strong>&nbsp;DRAFT</strong></td>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				1.98 m</td>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				6&#39;-6&quot;</td>
		</tr>
		<tr>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				<strong>&nbsp;SHALLOW DRAFT KEEL</strong></td>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				1.6 m</td>
			<td style="margin: 0px; padding: 0px; border: 1px solid rgb(52, 169, 212); text-align: center;">
				5&#39;-3&quot;</td>
		</tr>
	</tbody>
</table>
<p>
	&nbsp;</p>
', NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-07-18T14:53:33.930' AS DateTime))
INSERT [dbo].[Yachts] ([id], [guid], [coverImg], [model], [overview], [dim], [specs], [layoutImg], [deckImg], [video], [pdfFile], [isNewBuild], [isNewDesign], [initDate]) VALUES (9, N'8789645e-ab13-4c12-8618-9378342f969c42', N'/upload/images/20230718030550.jpg', N'Tayana 46', N'<div>
	Tayana VANCOUVER 460</div>
<div>
	&nbsp;</div>
<div>
	Well, finally, here she is!</div>
<div>
	　</div>
<div>
	With the New Tayana/Vancouver 460 Pilot, Robert B. Harris has achieved a unique break-through in design. A yacht that combines long haul passage-making with crew comfort, luxury and extensive cruising amenities unseen before in yachts under 65 feet.</div>
<div>
	&nbsp;</div>
<div>
	The design of the Tayana/Vancouver 460 Pilot smoothly blends the Vancouver tradition of a powerful proven sea kindly hull, with the latest refinements in hull design. With its very respectable speed under sail or power, and with the added luxury and protection of a true pilothouse, she has the ability to cross the world&#39;s oceans in safety and comfort without compromise, driving through the roughest of sea conditions with power and control. With all lines brought back to the cockpit (including 8 lines in 2 conduits) and 2 separate, fully instrumented steering stations, she can be handled by 1 or 2 people in safety and comfort. Imagine a pilot house with clean, beautiful lines, the 6&#39;5&quot; headroom underneath creating 33% more space than similar sized yachts. We have an exciting new keel which is encapsulated lead in an elongated bulb &amp; now the option of an extra salt water keel ballast system. The keel is designed to complement a no-nonsense, work to weather, deep-chested yacht. No saucer shaped hulls for us! Built in Taiwan by the world famous Tayana Yachts, she is a head-turning new boat design combining the enviable Vancouver heritage with the finest in cruising design and safety. A fresh new design whose time has arrived.</div>
<div>
	&nbsp;</div>
<div>
	We have a choice of rigs, High Seas or ICW and an amazing angle of vanishing stability of zero degrees! You can choose one of two transoms: Traditional or Sugar Scoop, and we can customize to a high degree to help create your dream yacht.</div>
<div>
	　</div>
<div>
	She is a Tayana Yacht built by the famous Ta-Yang Shipyard in Taiwan.</div>
', N'<table class="table02" style="border-collapse: collapse; border-spacing: 0px; width: 713px; border-style: solid; border-color: rgb(52, 169, 212); color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<tbody>
		<tr>
			<td class="table02td01" style="margin: 0px; padding: 0px; width: 433px; vertical-align: top; border-style: solid; border-color: rgb(52, 169, 212);">
				<table style="border-collapse: collapse; border-spacing: 0px; width: 433px;">
					<tbody>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Hull length</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								45&rsquo;-7&rdquo;</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								L.W.L.</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								37&rsquo;-2&rdquo;</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								B. MAX</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								13&rsquo;-6&rdquo;</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Draft</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								5&rsquo;-10&rdquo;</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Head room</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								6&rsquo;-5&rdquo;</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Ballast</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								11000 lbs</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Displacement</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								34500 lbs</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Engine diesel</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								100 hp</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Sail area</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								1425 sq.ft.</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td style="margin: 0px; padding: 0px; border-style: solid; border-color: rgb(52, 169, 212);">
				<img alt="Tayana" src="https://web.archive.org/web/20170902095547im_/http://www.tayanaworld.com/upload/images/46.jpg" style="width: 278px; height: 345px;" /></td>
		</tr>
	</tbody>
</table>
<p>
	&nbsp;</p>
', NULL, NULL, NULL, N'F9hGEBGjsOc', NULL, 0, 0, CAST(N'2023-07-18T15:04:06.427' AS DateTime))
INSERT [dbo].[Yachts] ([id], [guid], [coverImg], [model], [overview], [dim], [specs], [layoutImg], [deckImg], [video], [pdfFile], [isNewBuild], [isNewDesign], [initDate]) VALUES (10, N'a26919c3-e098-4026-9606-9a5cfb85d36f79', N'/upload/images/20230719105713.jpg', N'Tayana 48', N'<div>
	Many sailors want a boat with traditional looks, fine joinery, strong construction, conservative lines, and all the modern convenience. The craftsmen at Tayana have been putting those elements together for years. Tayana 48 the hull is a solidly built Bob design, and the cruising skipper can create an interior layout choosing from a range of options designed around the popular center cockpit configuration. The 40-foot waterline is relatively long to produce good speed, and the boat&#39;s underwater profile features a long-chord keel of moderate draft and a solid rudder mounted on a large skeg for good tracking and control response. The hull has a moderate reverse transom. All these components together form a contemporary and well-proportioned boat. Every Tayana can be slightly different below to accommodate in the individual owner&#39;s needs. The design process is an easy one, since Tayana&#39;s factory dealers use a computer-aided design (CAD) system to layout potential interiors suited to specific needs. In winds that ranged from 10-20 knots for the test sail, the cutter rig 48 slid through the short, steep waves easily with a solid, gentle motion. The boat sails well to windward in these conditions, and off the wind it tracks ruler straight; it&#39;s stable and easy to steer. The Tayana 48 represents a refined approach to the questions of getting a well-executed interior and a solid, proven hull form. The Tayana 48 DS is a variation on the company&#39;s popular 48-footer. Designer Rob Ladd added a deck saloon and raised the floor structure on Bob Perry&#39;s original hull to create a spacious, open interior. Raising the saloon floor not only improved visibility from the cabin, but also opened more space for tankage, always welcome on a cruiser. Warm, traditional teak joinery is everywhere. The large wrap-around saloon windows keep the living spaces bright, and headroom ( in spite of the raised floor) will make any tall sailor smile, but additional handholds below would make navigating the wide-open interior easier. The master cabin aft is equipped with a large double bunk on centerline, a private head and stand-up shower stall, a hanging locker, and plenty of storage space. Two-and three-cabin accommodation plans are available for guest staterooms. The boat&#39;s system are carefully installed, with substantial wiring and plumbing that should hold up for years, but this is a complex vessel. The genset is mounted where it will have to be removed to gain access to the front of the engine for repairs, and, because the stainless steel tanks are mounted in the bilge, periodic checks for corrosion are in order. Diligent monitoring and familiarity with the systems and/or careful selection of a knowledgeable mechanic will be essential. On deck, torails that are more like mini bulwarks combine with 32-inch-tall lifelines and tree-sturdy stanchions stanchions to provide a secure feeling under way. The high center cockpit is comfortable and dry, but there is a large step down from the cockpit to the deck. The ground-tackle system is outstanding. Hefty bow rollers and a powerful windlass make it easy to set and raise the hook, and oversized polished stainless mooring cleats are strong, well placed, and aesthetically pleasing. The Tayana 48DS is big and strong enough to take care of you on a passage, and it will wrap you in luxury as well.</div>
<div>
	&nbsp;</div>
<div>
	Designer&#39;s comments The design target for the Tayana 48 was to produce a boat that would outperform the competition in this size range in both boat speed and interior volume. This began with a comparative process not unlike the type used by designers designing racing yachs. Hull proportions were studied along with interior layouts in order to produce a hull that was not entirely based upon getting the maximum number of cubic feet into the allotted length overall. The general hull form features overhangs on the short side for a long useable sailing length. The sections shown moderate deadrise running from the forefoot to just aft of amidships where it begins to flatten out. All deadrise is gone at the transom. Beam at the waterline (BWL) is generous for good initial stability. Beam aft is moderate insuring that the 48 will not show distorted asymmetry when heeled that can lead to wicked helm situation and a boat with two personalities. The rig is positioned well forward in this design. This does two things that work to the cruisers advantage. It creates a rig that is forgiving in terms of helm balance and the need to reef in order to keep the boat manageable in a breeze. This boat has the power in it&#39;s stability to be pressed hard and you can&#39;t take advantage of that without good helm balance. This mast positional also results in the mast being lined up with the main bulkhead which opens up the main saloon space and makes strong chainplate attachment easy. The interior is available in either a three stateroom or two stateroom layout. Numerous optional arrangements are available as are further customizations to the existing layouts. Headroom is excellent in this design due to the deck onfiguration. My association with the Ta Yang yard goes back to the third fiberglass boat I ever designed, the venerable Tayana 37. The detailing is clean and the joinerwork is excellent. A new 48 shows just how far this Taiwanese yard has come in the last 20 years.</div>
', N'<table class="table02" style="border-collapse: collapse; border-spacing: 0px; width: 713px; border-style: solid; border-color: rgb(52, 169, 212); color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<tbody>
		<tr>
			<td class="table02td01" style="margin: 0px; padding: 0px; width: 433px; vertical-align: top; border-style: solid; border-color: rgb(52, 169, 212);">
				<table style="border-collapse: collapse; border-spacing: 0px; width: 433px;">
					<tbody>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Hull length</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								48&rsquo;</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								L.W.L.</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								40&rsquo;-3&rdquo;</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								B. MAX</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								14&rsquo;-6&rdquo;</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Standard draft</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								6&rsquo;</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Draft shoal(option)</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								5&rsquo;-3&rdquo;</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Ballast</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								11675 lbs</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Displacement</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								35000 lbs</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Engine diesel</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								75 hp</td>
						</tr>
						<tr>
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Sail area(cutter)</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								1316 sq.ft.</td>
						</tr>
						<tr class="tr003" style="background-color: rgb(246, 246, 246);">
							<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
								Designer</th>
							<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
								Robert H.Perry</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td style="margin: 0px; padding: 0px; border-style: solid; border-color: rgb(52, 169, 212);">
				<img alt="Tayana" src="https://web.archive.org/web/20170827123606im_/http://www.tayanaworld.com/upload/images/48.gif" /></td>
		</tr>
	</tbody>
</table>
<p>
	&nbsp;</p>
', N'
	&lt;p&gt;DECK/HARDWARE&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Hand laid up FRP, cored deck&lt;/li&gt;

	&lt;li&gt;Molded nonskid on deck and deck house&lt;/li&gt;

	&lt;li&gt;Teak cockpit seats and floor&lt;/li&gt;

	&lt;li&gt;FRP cockpit coaming&lt;/li&gt;

	&lt;li&gt;Aluminum hatches&lt;/li&gt;

	&lt;li&gt;Stainless steel opening ports&lt;/li&gt;

	&lt;li&gt;Teak exterior handrails&lt;/li&gt;

	&lt;li&gt;Double anchor sprit &amp;amp; rollers&lt;/li&gt;

	&lt;li&gt;Chain locker &amp;amp; one deck pipe&lt;/li&gt;

	&lt;li&gt;SS bow pulpit&lt;/li&gt;

	&lt;li&gt;SS stern pulpit&lt;/li&gt;

	&lt;li&gt;Teak cap rails with hawse holes &amp;amp;&nbsp; mooring cleats (six)&lt;/li&gt;

	&lt;li&gt;Dorade vents w/ FRP boxes&lt;/li&gt;

	&lt;li&gt;FRP seahood&lt;/li&gt;

	&lt;li&gt;Propane locker for two 20 lb tanks, vented overboard&lt;/li&gt;

	&lt;li&gt;Two coaming lockers&lt;/li&gt;

	&lt;li&gt;Aluminum mainsheet traveler w/ roller car&lt;/li&gt;

	&lt;li&gt;Aluminum staysail tracks w/ cars&lt;/li&gt;

	&lt;li&gt;Aluminum genoa tracks w/ cars&lt;/li&gt;&nbsp; &nbsp;

	&lt;li&gt;Plexiglas sliding companionway hatch&lt;/li&gt;

	&lt;li&gt;Instrument console mounted on seahood&lt;/li&gt;

	&lt;li&gt;Plexiglas weather boards&lt;/li&gt;

	&lt;li&gt;SS stanchions w/ vinyl covered double&nbsp; lifelines w/ gates P&amp;amp;S&lt;/li&gt;

	&lt;li&gt; <span style="white-space:pre"> </span>Winches, Lewmar

	Two 54CST jib sheet winches&lt;br/&gt;

	Two 40CST secondary sheet winches&lt;br/&gt;

	One 40CST mainsheet winch&lt;br/&gt;

	One 40CST main halyard winch&lt;br/&gt;

	Two 40CST headsail halyard winches&lt;br/&gt;

	&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;ENGINE/MACHINERY&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Diesel engine, Yanmar 4JH3-TE, fresh&nbsp; water cooled, 75HP&lt;/li&gt;

	&lt;li&gt;Engine cooling water intake strainer&lt;/li&gt;

	&lt;li&gt;Dripless shaft gland&lt;/li&gt;

	&lt;li&gt;Bronze three blade propeller on 1.5&nbsp; inch SS shaft&lt;/li&gt;

	&lt;li&gt;Fiberglass drip pan&lt;/li&gt;

	&lt;li&gt;Engine room blower&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;INTERIOR&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Teak joinery &amp;amp; cabinetry throughout&lt;/li&gt;

	&lt;li&gt;Teak &amp;amp; holly cabin sole&lt;/li&gt;&nbsp;&nbsp;

	&lt;li&gt;Teak framed mirror in head(s)&lt;/li&gt;

	&lt;li&gt;Interior teak handrails&lt;/li&gt;

	&lt;li&gt;V-berth filler if applicable&lt;/li&gt;

	&lt;li&gt;Cloth cushion covers&lt;/li&gt;

	&lt;li&gt;Ice chest 4&rdquo; foam, SS lined&lt;/li&gt;

	&lt;li&gt;Interior varnish, polyurethane satin&lt;/li&gt;

	&lt;li&gt;Stove alcove, SS lined&lt;/li&gt;

	&lt;li&gt;Easily removable headliner&lt;/li&gt;

	&lt;li&gt;Teak fiddles and teak trim on counters&nbsp; &amp;amp; tables&lt;/li&gt;

	&lt;li&gt;Four inch foam cushions&lt;/li&gt;

	&lt;li&gt;Solid teak doors &amp;amp; frames&lt;/li&gt;

	&lt;li&gt;White formica counters in head &amp;amp;&nbsp; galley, teak veneer chart &amp;amp; dinette table tops&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;SPARS/RIGGING&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Aluminum mast &amp;amp; boom; mast w/&nbsp; electrical conduit, decklight &amp;amp; halyards&lt;/li&gt;

	&lt;li&gt;Standing rigging SS w/swaged terminals&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;SAILS&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Mainsail dacron w/ 2 reef points&lt;/li&gt;

	&lt;li&gt;100% Yankee, dacron&lt;/li&gt;

	&lt;li&gt;Staysail, dacron&lt;/li&gt;

	&lt;li&gt;Sail bags for sails&lt;/li&gt;

	&lt;li&gt;Sail covers for main sail&lt;/li&gt;

	&lt;/ul&gt;

	&nbsp;

	&nbsp;

	&lt;p&gt;ELECTRICAL&lt;/p&gt;

	&lt;ul&gt;

	&nbsp; &lt;li&gt;Two 120amp hour 12 volt batteries &amp;amp;&nbsp; FRP boxes&lt;/li&gt;

	&nbsp; &lt;li&gt;12V cabin lights overhead &amp;amp; reading&nbsp; lights&lt;/li&gt;

	&nbsp; &lt;li&gt;12 volt electrical system w/ three way&nbsp; switch, electric panel w/ breakers, and volt meter &amp;amp; ammeter &amp;amp;12 volt&nbsp; outlets throughout the yacht&lt;/li&gt;

	&nbsp; &lt;li&gt;110 volt electrical system w/ 30 amp&nbsp; shore power plug, electric panel w/breakers &amp;amp; volt meter &amp;amp; 110 volt&nbsp; outlets throughout the yacht&lt;/li&gt;

	&nbsp; &lt;li&gt;International running lights&lt;/li&gt;

	&nbsp; &lt;li&gt;12 volt deck flood light&lt;/li&gt;

	&nbsp; &lt;li&gt;12 volt anchor light&lt;/li&gt;

	&nbsp; &lt;li&gt;Electrical system totally bonded&lt;/li&gt;

	&lt;/ul&gt;

	&nbsp;

	&nbsp;

	&lt;p&gt;STEERING&lt;/p&gt;

	&lt;ul&gt;

	&nbsp; &lt;li&gt;Pedestal steering, Whitlock or&nbsp; equivalent&lt;/li&gt;

	&nbsp; &lt;li&gt;SS 40&rdquo; destroyer type wheel&lt;/li&gt;

	&nbsp; &lt;li&gt;Emergency tiller&lt;/li&gt;

	&nbsp; &lt;li&gt;SS rudder shaft&lt;/li&gt;

	&lt;/ul&gt;

	&nbsp;

	&nbsp;

	&lt;p&gt;PLUMBING&lt;/p&gt;

	&lt;ul&gt;

	&nbsp; &lt;li&gt;One 120 gallon iron fuel tanks&lt;/li&gt;

	&nbsp; &lt;li&gt;Two SS water tanks, total of 220&nbsp; gallons&lt;/li&gt;

	&nbsp; &lt;li&gt;Holding tank, FRP, 30 gallons&lt;/li&gt;

	&nbsp; &lt;li&gt;Hot water heater, 110 volt &amp;amp; engine&nbsp; heat exchanger&lt;/li&gt;

	&nbsp; &lt;li&gt;Manual marine heads&lt;/li&gt;

	&nbsp; &lt;li&gt;Hot &amp;amp; cold pressure water&lt;/li&gt;

	&nbsp; &lt;li&gt;One high capacity manual bilge pump&lt;/li&gt;

	&nbsp; &lt;li&gt;One heavy duty electric bilge pump&lt;/li&gt;

	&nbsp; &lt;li&gt;Bilge pump strainers&lt;/li&gt;

	&nbsp; &lt;li&gt;Sea cocks on all through hulls&lt;/li&gt;

	&nbsp; &lt;li&gt;Shower sump tanks w/ 12 volt pumps&lt;/li&gt;

	&lt;/ul&gt;
', N'/upload/images/20230719110041.jpg', N'/upload/images/20230719110048.jpg', NULL, N'/upload/files/20230719033600.pdf', 1, 0, CAST(N'2023-07-19T10:57:03.793' AS DateTime))
INSERT [dbo].[Yachts] ([id], [guid], [coverImg], [model], [overview], [dim], [specs], [layoutImg], [deckImg], [video], [pdfFile], [isNewBuild], [isNewDesign], [initDate]) VALUES (13, N'ac315584-d256-4ce3-aeec-3108622b082c52', NULL, N'Tayana 52', N'<div>
	Breaking 400 means a lot in baseball. In the world of production auxiliary sailboats, it can mean even more. The Ta Yang yard built and sold over 600 of Bob Perry&#39;s Tayana 37s. It&#39;s not surprising that it gave him another turn at the plate. This time up produced the Tayana 52. She is a fast cruiser of moderate draft. Perry tried hard to work greater than expected stability into the equation, through both the extra-firm turn that he gave her bilges and the depth to which he sunk her more than 7 tons of ballast in her longish fin keel. Available in either aft- or center- cockpit configurations, the 52 retains quite a traditional air, no matter how you slice her deck mold. Achieving 6-foot 6-inch headroom while maintaining a low silhouette is something that Perry says is &quot;nothing tricky, just a matter of lots of little details.&quot; Her modern masthead rig is well understood by sailors and offers a good helping of power in most wind conditions. An inner forestay suitable for a staysail adds lots of versatility to the setup. Ta Yang allows considerable owner involvement in detailing the below decks accommodations. Lockers and drawers are there in the standard layout in an abundance the proves that a good amount of thought has gone into helping a boat of this size support the large number that she can sleep.</div>
<div>
	&nbsp;</div>
<div>
	From her counter stern to her characteristically Perry scimitar bow, the Tayana 52 helps to illustrate why Perry&#39;s designs tend to be hit far more than the average. Robert Perry said that Tayana has the &quot;sweetest sheer&quot; he has ever drawn.Few yachts exhibit the stunning symmetry and the sheer beauty of the 52. Whether lying at anchor or playing with high sweeping seas, she is an eye-catcher of the first magnitude. The Tayana 52 is truly a magnificent sailing machine.</div>
', N'<table style="border-collapse: collapse; border-spacing: 0px; width: 497.958px; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<tbody>
		<tr>
			<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
				Hull length</th>
			<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
				55&rsquo;-5&rdquo;</td>
		</tr>
		<tr class="tr003" style="background-color: rgb(246, 246, 246);">
			<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
				L.W.L.</th>
			<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
				42&rsquo;</td>
		</tr>
		<tr>
			<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
				B. MAX</th>
			<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
				15&rsquo;-1&rdquo;</td>
		</tr>
		<tr class="tr003" style="background-color: rgb(246, 246, 246);">
			<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
				Standard draft</th>
			<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
				6&rsquo;-6&rdquo;</td>
		</tr>
		<tr>
			<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
				Draft shoal(option)</th>
			<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
				5&rsquo;-8&rdquo;</td>
		</tr>
		<tr class="tr003" style="background-color: rgb(246, 246, 246);">
			<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
				Ballast</th>
			<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
				14800 lbs</td>
		</tr>
		<tr>
			<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
				Displacement</th>
			<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
				38570 lbs</td>
		</tr>
		<tr class="tr003" style="background-color: rgb(246, 246, 246);">
			<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
				Engine diesel</th>
			<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
				100 hp</td>
		</tr>
		<tr>
			<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
				Sail area(cutter)</th>
			<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
				1414 sq.ft.</td>
		</tr>
		<tr class="tr003" style="background-color: rgb(246, 246, 246);">
			<th style="margin: 0px; padding: 0px 0px 0px 10px; text-align: left; border-style: solid; border-color: rgb(52, 169, 212);">
				Designer</th>
			<td style="margin: 0px; padding: 7px 0px 7px 10px; border-style: solid; border-color: rgb(52, 169, 212);">
				Robert H.Perry</td>
		</tr>
	</tbody>
</table>
<p>
	&nbsp;</p>
', N'
	&lt;p&gt;DECK/HARDWARE&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Hand paid up FRP, cored deck, white&lt;/li&gt;

	&lt;li&gt;Molded nonskid on deck and deck house&lt;/li&gt;

	&lt;li&gt;Teak cockpit seats and floor&lt;/li&gt;

	&lt;li&gt;FRP cockpit coaming&lt;/li&gt;

	&lt;li&gt;Aluminum hatches&lt;/li&gt;

	&lt;li&gt;Stainless steel opening ports&lt;/li&gt;

	&lt;li&gt;Teak exterior handrails&lt;/li&gt;

	&lt;li&gt;Six mooring cleats&lt;/li&gt;

	&lt;li&gt;Double anchor sprit &amp;amp; rollers&lt;/li&gt;

	&lt;li&gt;Chain locker &amp;amp; one deckpipe&lt;/li&gt;

	&lt;li&gt;SS bow pulpit&lt;/li&gt;&nbsp; &nbsp;

	&lt;li&gt;SS stern pulpit&lt;/li&gt;

	&lt;li&gt;Teak caprail on FRP bulwark&lt;/li&gt;

	&lt;li&gt;Dorade vents w/ FRP boxes&lt;/li&gt;

	&lt;li&gt;FRP seahood &lt;/li&gt;

	&lt;li&gt;Propane locker for two 20 lb tanks, vented overboard&lt;/li&gt;

	&lt;li&gt;Lazaret hatch&lt;/li&gt;

	&lt;li&gt;Two coaming lockers&lt;/li&gt;

	&lt;li&gt;Aluminum mainsheet traveler w/ roller&nbsp; car&lt;/li&gt;

	&lt;li&gt;Aluminum staysail tracks w/ cars&lt;/li&gt;

	&lt;li&gt;Aluminum genoa tracks w/ cars&lt;/li&gt;

	&lt;li&gt;Plexiglas sliding companionway hatch&lt;/li&gt;

	&lt;li&gt;Teak or plexiglas weather boards&lt;/li&gt;

	&lt;li&gt;SS stanchion w/ vinyl covered double&nbsp; lifelines w/gates P&amp;amp;S&lt;/li&gt;

	&lt;li&gt;Winches, Lewmar&lt;br/&gt;

	Two&nbsp; 58CST jib sheet winches&lt;br/&gt;

	Two&nbsp; 40CST secondary sheet winches&lt;br/&gt;

	One&nbsp; 40CST main sheet winch&lt;br/&gt;

	One&nbsp; 40CST main halyard winch&lt;br/&gt;

	One&nbsp; 40CST jib halyard winch&lt;br/&gt;

	One&nbsp; 30CST staysail halyard winch&lt;/li&gt;

	&lt;/ul&gt;&nbsp; &nbsp; &nbsp;

	&lt;p&gt;ENGINE/MACHINERY&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Engine cooling water intake strainer&lt;/li&gt;

	&lt;li&gt;Dripless shaft gland&lt;/li&gt;

	&lt;li&gt;Bronze three blade propeller on 1.5&nbsp; inch SS shaft&lt;/li&gt;

	&lt;li&gt;Fiberglass drip pan&lt;/li&gt;

	&lt;li&gt;Engine room blower&lt;/li&gt;

	&lt;li&gt;Diesel engine, Yanmar 4JH3-TE, fresh&nbsp; water cooled, 75HP&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;STEERING&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt; Pedestal steering, Whitlock or equivalent&lt;/li&gt;

	&lt;li&gt; SS 48&rdquo;&nbsp; destroyer type wheel ( after cockpit )&lt;/li&gt;

	&lt;li&gt; Emergency tiller&lt;/li&gt;

	&lt;li&gt; SS rudder shaft&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;SPARS/RIGGING&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Mainsail, dacron w/ 2 reef points and&nbsp; cover&lt;/li&gt;

	&lt;li&gt;100 percent Yankee, dacron&lt;/li&gt;

	&lt;li&gt;Staysail, dacron&lt;/li&gt;

	&lt;li&gt;Sail bags for all sails&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;SAILS&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Aluminum mast &amp;amp; boom, mast w/&nbsp; electrical conduit &amp;amp; internal halyards&lt;/li&gt;

	&lt;li&gt;Standing rigging, stainless steel w/&nbsp; swaged terminals.&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;INTERIOR&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Teak joinery &amp;amp; cabinetry throughout&lt;/li&gt;

	&lt;li&gt;Teak &amp;amp; holly cabin sole&lt;/li&gt;

	&lt;li&gt;Teak veneer in all locker&lt;/li&gt;

	&lt;li&gt;White formica counters in head &amp;amp;&nbsp; galley&lt;/li&gt;

	&lt;li&gt;Teak framed mirror in head(s)&lt;/li&gt;

	&lt;li&gt;Interior teak handrails&lt;/li&gt;

	&lt;li&gt;V-berth filler if applicable&lt;/li&gt;

	&lt;li&gt;Cloth cushion covers on 4&rdquo; cushions&lt;/li&gt;

	&lt;li&gt;Ice chest 4&rdquo; foam, SS lined&lt;/li&gt;

	&lt;li&gt;Interior varnish, polyurethane satin&lt;/li&gt;

	&lt;li&gt;Stove alcove, SS lined&lt;/li&gt;

	&lt;li&gt;Easily removable head liner&lt;/li&gt;

	&lt;li&gt;Teak fiddles and teak trim on counters&nbsp; &amp;amp; tables&lt;/li&gt;

	&lt;li&gt;Solid teak doors &amp;amp; frames&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;ELECTRICAL&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Three 120 amp hour 12 volt batteries&nbsp; &amp;amp; FRP boxes&lt;/li&gt;

	&lt;li&gt;Twelve 12v cabin lights overhead &amp;amp;&nbsp; eight reading lights&lt;/li&gt;

	&lt;li&gt;12 volt electrical system w/ three way&nbsp; switch, Newmar electric panel w/ breakers, and voltmeter &amp;amp; ammeter&lt;/li&gt;

	&lt;li&gt;110 volt electrical system w/ 50 amp&nbsp; shore power plug, electric panel w/breakers &amp;amp; voltmeter &amp;amp; ammeter,&nbsp; &amp;amp; 110 volt outlets throughout the yacht&lt;/li&gt;

	&lt;li&gt;International running lights to meet&nbsp; IMCO standards&lt;/li&gt;

	&lt;li&gt;12 volt deck flood light&lt;/li&gt;

	&lt;li&gt;12 volt anchor light&lt;/li&gt;

	&lt;li&gt;Completely bonded electrical system&lt;/li&gt;

	&lt;/ul&gt;

	&lt;p&gt;PLUMBING&lt;/p&gt;

	&lt;ul&gt;

	&lt;li&gt;Two 90 gallon mild steel fuel tanks (&nbsp; after cockpit )&lt;/li&gt;

	&lt;li&gt;Two SS water tanks, total of 200&nbsp; gallons ( after cockpit )&lt;/li&gt;

	&lt;li&gt;Holding tank, FRP, 35 gallons&lt;/li&gt;

	&lt;li&gt;Hot water heater, 110 volt &amp;amp;&nbsp; engine heat exchanger&lt;/li&gt;

	&lt;li&gt;Manual marine heads&lt;/li&gt;

	&lt;li&gt;Hot &amp;amp; cold pressure water&lt;/li&gt;

	&lt;li&gt;One high capacity manual bilge pump&lt;/li&gt;

	&lt;li&gt;One heavy duty electric bilge pump&lt;/li&gt;

	&lt;li&gt;Bilge pump strainers&lt;/li&gt;

	&lt;li&gt;Sea cocks on all through hull&lt;/li&gt;

	&lt;li&gt;11&nbsp; Shower sump tanks w/ 12 volt pumps&lt;/li&gt;

	&lt;/ul&gt;
', N'/upload/images/20230804015850.jpg', N'/upload/images/20230804015857.png', N'mWZUaJkEpWE', N'/upload/files/20230804015923.pdf', 0, 0, CAST(N'2023-08-04T13:57:52.530' AS DateTime))
SET IDENTITY_INSERT [dbo].[Yachts] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 2023/9/19 上午 11:17:16 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Yachts]    Script Date: 2023/9/19 上午 11:17:16 ******/
ALTER TABLE [dbo].[Yachts] ADD  CONSTRAINT [IX_Yachts] UNIQUE NONCLUSTERED 
(
	[model] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Compan] ADD  CONSTRAINT [DF_Compan_initDate]  DEFAULT (getdate()) FOR [initDate]
GO
ALTER TABLE [dbo].[Countries] ADD  CONSTRAINT [DF_Countries_initDate]  DEFAULT (getdate()) FOR [initDate]
GO
ALTER TABLE [dbo].[Dealers] ADD  CONSTRAINT [DF_Dealers_initDate]  DEFAULT (getdate()) FOR [initDate]
GO
ALTER TABLE [dbo].[Images] ADD  CONSTRAINT [DF_Images_isNewBuild]  DEFAULT ((0)) FOR [isCover]
GO
ALTER TABLE [dbo].[Images] ADD  CONSTRAINT [DF_Images_initDate]  DEFAULT (getdate()) FOR [initDate]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_isTop]  DEFAULT ((0)) FOR [isTop]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_initDate]  DEFAULT (getdate()) FOR [initDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_isAdmin]  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_initDate]  DEFAULT (getdate()) FOR [initDate]
GO
ALTER TABLE [dbo].[Yachts] ADD  CONSTRAINT [DF_Yachts_isNewBuild]  DEFAULT ((0)) FOR [isNewBuild]
GO
ALTER TABLE [dbo].[Yachts] ADD  CONSTRAINT [DF_Yachts_isNewDesign]  DEFAULT ((0)) FOR [isNewDesign]
GO
ALTER TABLE [dbo].[Yachts] ADD  CONSTRAINT [DF_Yachts_initDate]  DEFAULT (getdate()) FOR [initDate]
GO
USE [master]
GO
ALTER DATABASE [Tayana] SET  READ_WRITE 
GO
