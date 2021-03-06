USE [master]
GO
/****** Object:  Database [MovieDatabase]    Script Date: 23/04/2018 01:42:15 ******/
CREATE DATABASE [MovieDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MovieDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MovieDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MovieDatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [MovieDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [MovieDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MovieDatabase', N'ON'
GO
ALTER DATABASE [MovieDatabase] SET QUERY_STORE = OFF
GO
USE [MovieDatabase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MovieDatabase]
GO
/****** Object:  User [necati]    Script Date: 23/04/2018 01:42:15 ******/
CREATE USER [necati] FOR LOGIN [necati] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [necati]
GO
/****** Object:  Table [dbo].[Cast]    Script Date: 23/04/2018 01:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cast](
	[movie_id] [int] NOT NULL,
	[character] [nvarchar](max) NULL,
	[person_id] [int] NOT NULL,
	[order] [int] NULL,
 CONSTRAINT [PK_Cast] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC,
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crew]    Script Date: 23/04/2018 01:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crew](
	[movie_id] [int] NOT NULL,
	[department] [nvarchar](max) NOT NULL,
	[person_id] [int] NOT NULL,
	[job] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Crew] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC,
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 23/04/2018 01:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keyword]    Script Date: 23/04/2018 01:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keyword](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Keyword] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 23/04/2018 01:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[adult] [bit] NOT NULL,
	[backdrop_path] [nvarchar](max) NULL,
	[budget] [int] NOT NULL,
	[homepage] [nvarchar](max) NULL,
	[id] [int] NOT NULL,
	[imdb_id] [nvarchar](9) NULL,
	[original_language] [nvarchar](max) NOT NULL,
	[original_title] [nvarchar](max) NOT NULL,
	[overview] [nvarchar](max) NULL,
	[popularity] [float] NULL,
	[poster_path] [nvarchar](max) NULL,
	[release_date] [date] NOT NULL,
	[revenue] [int] NOT NULL,
	[runtime] [int] NULL,
	[status] [nvarchar](max) NOT NULL,
	[tagline] [nvarchar](max) NULL,
	[title] [nvarchar](max) NOT NULL,
	[vote_average] [float] NULL,
	[vote_count] [int] NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieGenre]    Script Date: 23/04/2018 01:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieGenre](
	[movie_id] [int] NOT NULL,
	[genre_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieKeyword]    Script Date: 23/04/2018 01:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieKeyword](
	[movie_id] [int] NOT NULL,
	[keyword_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieProductionCompany]    Script Date: 23/04/2018 01:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieProductionCompany](
	[movie_id] [int] NOT NULL,
	[production_company_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieProductionCountry]    Script Date: 23/04/2018 01:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieProductionCountry](
	[movie_id] [int] NOT NULL,
	[production_country_iso_3166_1] [nvarchar](3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieSpokenLanguage]    Script Date: 23/04/2018 01:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieSpokenLanguage](
	[movie_id] [int] NOT NULL,
	[spoken_language_iso_639_1] [nvarchar](3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 23/04/2018 01:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[adult] [bit] NOT NULL,
	[biography] [nvarchar](max) NOT NULL,
	[birthday] [date] NULL,
	[deathday] [date] NULL,
	[gender] [tinyint] NOT NULL,
	[homepage] [nvarchar](max) NULL,
	[id] [int] NOT NULL,
	[imdb_id] [nvarchar](9) NULL,
	[name] [nvarchar](max) NOT NULL,
	[place_of_birth] [nvarchar](max) NULL,
	[popularity] [float] NOT NULL,
	[profile_path] [nvarchar](max) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionCompany]    Script Date: 23/04/2018 01:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionCompany](
	[description] [nvarchar](max) NOT NULL,
	[headquarters] [nvarchar](max) NOT NULL,
	[homepage] [nvarchar](max) NOT NULL,
	[id] [int] NOT NULL,
	[logo_path] [nvarchar](max) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[origin_country] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductionCompany] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionCountry]    Script Date: 23/04/2018 01:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionCountry](
	[iso_3166_1] [nvarchar](3) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductionCountry] PRIMARY KEY CLUSTERED 
(
	[iso_3166_1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpokenLanguage]    Script Date: 23/04/2018 01:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpokenLanguage](
	[iso_639_1] [nvarchar](3) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SpokenLanguage] PRIMARY KEY CLUSTERED 
(
	[iso_639_1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cast]  WITH CHECK ADD  CONSTRAINT [FK_Cast_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([id])
GO
ALTER TABLE [dbo].[Cast] CHECK CONSTRAINT [FK_Cast_Movie]
GO
ALTER TABLE [dbo].[Cast]  WITH CHECK ADD  CONSTRAINT [FK_Cast_Person] FOREIGN KEY([person_id])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Cast] CHECK CONSTRAINT [FK_Cast_Person]
GO
ALTER TABLE [dbo].[Crew]  WITH CHECK ADD  CONSTRAINT [FK_Crew_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([id])
GO
ALTER TABLE [dbo].[Crew] CHECK CONSTRAINT [FK_Crew_Movie]
GO
ALTER TABLE [dbo].[Crew]  WITH CHECK ADD  CONSTRAINT [FK_Crew_Person] FOREIGN KEY([person_id])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Crew] CHECK CONSTRAINT [FK_Crew_Person]
GO
ALTER TABLE [dbo].[MovieGenre]  WITH CHECK ADD  CONSTRAINT [FK_MovieGenre_Genre] FOREIGN KEY([genre_id])
REFERENCES [dbo].[Genre] ([id])
GO
ALTER TABLE [dbo].[MovieGenre] CHECK CONSTRAINT [FK_MovieGenre_Genre]
GO
ALTER TABLE [dbo].[MovieGenre]  WITH CHECK ADD  CONSTRAINT [FK_MovieGenre_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([id])
GO
ALTER TABLE [dbo].[MovieGenre] CHECK CONSTRAINT [FK_MovieGenre_Movie]
GO
ALTER TABLE [dbo].[MovieKeyword]  WITH CHECK ADD  CONSTRAINT [FK_MovieKeyword_Keyword] FOREIGN KEY([keyword_id])
REFERENCES [dbo].[Keyword] ([id])
GO
ALTER TABLE [dbo].[MovieKeyword] CHECK CONSTRAINT [FK_MovieKeyword_Keyword]
GO
ALTER TABLE [dbo].[MovieKeyword]  WITH CHECK ADD  CONSTRAINT [FK_MovieKeyword_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([id])
GO
ALTER TABLE [dbo].[MovieKeyword] CHECK CONSTRAINT [FK_MovieKeyword_Movie]
GO
ALTER TABLE [dbo].[MovieProductionCompany]  WITH CHECK ADD  CONSTRAINT [FK_MovieProductionCompany_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([id])
GO
ALTER TABLE [dbo].[MovieProductionCompany] CHECK CONSTRAINT [FK_MovieProductionCompany_Movie]
GO
ALTER TABLE [dbo].[MovieProductionCompany]  WITH CHECK ADD  CONSTRAINT [FK_MovieProductionCompany_ProductionCompany] FOREIGN KEY([production_company_id])
REFERENCES [dbo].[ProductionCompany] ([id])
GO
ALTER TABLE [dbo].[MovieProductionCompany] CHECK CONSTRAINT [FK_MovieProductionCompany_ProductionCompany]
GO
ALTER TABLE [dbo].[MovieProductionCountry]  WITH CHECK ADD  CONSTRAINT [FK_MovieProductionCountry_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([id])
GO
ALTER TABLE [dbo].[MovieProductionCountry] CHECK CONSTRAINT [FK_MovieProductionCountry_Movie]
GO
ALTER TABLE [dbo].[MovieProductionCountry]  WITH CHECK ADD  CONSTRAINT [FK_MovieProductionCountry_ProductionCountry] FOREIGN KEY([production_country_iso_3166_1])
REFERENCES [dbo].[ProductionCountry] ([iso_3166_1])
GO
ALTER TABLE [dbo].[MovieProductionCountry] CHECK CONSTRAINT [FK_MovieProductionCountry_ProductionCountry]
GO
ALTER TABLE [dbo].[MovieSpokenLanguage]  WITH CHECK ADD  CONSTRAINT [FK_MovieSpokenLanguage_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([id])
GO
ALTER TABLE [dbo].[MovieSpokenLanguage] CHECK CONSTRAINT [FK_MovieSpokenLanguage_Movie]
GO
ALTER TABLE [dbo].[MovieSpokenLanguage]  WITH CHECK ADD  CONSTRAINT [FK_MovieSpokenLanguage_SpokenLanguage] FOREIGN KEY([spoken_language_iso_639_1])
REFERENCES [dbo].[SpokenLanguage] ([iso_639_1])
GO
ALTER TABLE [dbo].[MovieSpokenLanguage] CHECK CONSTRAINT [FK_MovieSpokenLanguage_SpokenLanguage]
GO
USE [master]
GO
ALTER DATABASE [MovieDatabase] SET  READ_WRITE 
GO
