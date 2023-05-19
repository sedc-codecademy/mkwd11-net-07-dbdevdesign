USE [master]
GO
/****** Object:  Database [FootballLeague]    Script Date: 18.5.2023 20:51:16 ******/
CREATE DATABASE [FootballLeague]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FootballLeague', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FootballLeague.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FootballLeague_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FootballLeague_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FootballLeague] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FootballLeague].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FootballLeague] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FootballLeague] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FootballLeague] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FootballLeague] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FootballLeague] SET ARITHABORT OFF 
GO
ALTER DATABASE [FootballLeague] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FootballLeague] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FootballLeague] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FootballLeague] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FootballLeague] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FootballLeague] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FootballLeague] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FootballLeague] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FootballLeague] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FootballLeague] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FootballLeague] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FootballLeague] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FootballLeague] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FootballLeague] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FootballLeague] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FootballLeague] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FootballLeague] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FootballLeague] SET RECOVERY FULL 
GO
ALTER DATABASE [FootballLeague] SET  MULTI_USER 
GO
ALTER DATABASE [FootballLeague] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FootballLeague] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FootballLeague] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FootballLeague] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FootballLeague] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FootballLeague] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FootballLeague', N'ON'
GO
ALTER DATABASE [FootballLeague] SET QUERY_STORE = OFF
GO
USE [FootballLeague]
GO
/****** Object:  Table [dbo].[Clubs]    Script Date: 18.5.2023 20:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clubs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Club] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 18.5.2023 20:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Nationality] [nvarchar](50) NOT NULL,
	[ClubId] [int] NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clubs] ON 
GO
INSERT [dbo].[Clubs] ([Id], [Name], [City]) VALUES (1, N'Chelsea', N'London')
GO
INSERT [dbo].[Clubs] ([Id], [Name], [City]) VALUES (2, N'Liverpool', N'Liverpool')
GO
INSERT [dbo].[Clubs] ([Id], [Name], [City]) VALUES (3, N'Everton', N'Liverpool')
GO
INSERT [dbo].[Clubs] ([Id], [Name], [City]) VALUES (4, N'Man Utd', N'Manchester')
GO
SET IDENTITY_INSERT [dbo].[Clubs] OFF
GO
SET IDENTITY_INSERT [dbo].[Players] ON 
GO
INSERT [dbo].[Players] ([Id], [FirstName], [LastName], [Nationality], [ClubId]) VALUES (1, N'Ngolo', N'Kante', N'France', 1)
GO
INSERT [dbo].[Players] ([Id], [FirstName], [LastName], [Nationality], [ClubId]) VALUES (2, N'Mo', N'Salah', N'Egipt', 2)
GO
INSERT [dbo].[Players] ([Id], [FirstName], [LastName], [Nationality], [ClubId]) VALUES (3, N'Alex', N'Arnold', N'England', 2)
GO
INSERT [dbo].[Players] ([Id], [FirstName], [LastName], [Nationality], [ClubId]) VALUES (4, N'Raphael', N'Varane', N'France', 4)
GO
INSERT [dbo].[Players] ([Id], [FirstName], [LastName], [Nationality], [ClubId]) VALUES (5, N'Bruno', N'Fernandes', N'Portugal', 4)
GO
INSERT [dbo].[Players] ([Id], [FirstName], [LastName], [Nationality], [ClubId]) VALUES (6, N'Martin', N'Odegard', N'Denmark', NULL)
GO
INSERT [dbo].[Players] ([Id], [FirstName], [LastName], [Nationality], [ClubId]) VALUES (7, N'Erling', N'Haland', N'Denmark', NULL)
GO
SET IDENTITY_INSERT [dbo].[Players] OFF
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Clubs] FOREIGN KEY([ClubId])
REFERENCES [dbo].[Clubs] ([Id])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Clubs]
GO
USE [master]
GO
ALTER DATABASE [FootballLeague] SET  READ_WRITE 
GO
