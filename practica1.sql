USE [master]
GO
/****** Object:  Database [Farmacias]    Script Date: 29/09/2018 13:46:27 ******/
CREATE DATABASE [Farmacias]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmacias', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Farmacias.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Farmacias_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Farmacias_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Farmacias] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farmacias].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Farmacias] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farmacias] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farmacias] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farmacias] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farmacias] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farmacias] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Farmacias] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farmacias] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farmacias] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farmacias] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farmacias] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farmacias] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farmacias] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farmacias] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farmacias] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Farmacias] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farmacias] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farmacias] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farmacias] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farmacias] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farmacias] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farmacias] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farmacias] SET RECOVERY FULL 
GO
ALTER DATABASE [Farmacias] SET  MULTI_USER 
GO
ALTER DATABASE [Farmacias] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farmacias] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farmacias] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farmacias] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Farmacias] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Farmacias', N'ON'
GO
ALTER DATABASE [Farmacias] SET QUERY_STORE = OFF
GO
USE [Farmacias]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 29/09/2018 13:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] NULL,
	[nom_cli] [varchar](50) NULL,
	[dir_cli] [varchar](50) NULL,
	[tel_cli] [nchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 29/09/2018 13:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farmacia](
	[id_farmacia] [int] NULL,
	[rfc] [nchar](20) NULL,
	[direccion] [nchar](50) NULL,
	[telefono] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 29/09/2018 13:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id_producto] [int] NULL,
	[nom_prod] [varchar](50) NULL,
	[precio_venta] [money] NULL,
	[precio_compra] [money] NULL,
	[fecha_venci] [date] NULL,
	[stock] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 29/09/2018 13:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[id_proveedor] [int] NULL,
	[nom_prov] [varchar](50) NULL,
	[dir_prov] [varchar](50) NULL,
	[fecha_nacimiento] [date] NULL,
	[sexo] [varchar](10) NULL,
	[tel_prov] [nchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 29/09/2018 13:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[id_vendedor] [int] NULL,
	[nom_emp] [varchar](50) NULL,
	[foto_emp] [image] NULL,
	[dir_emp] [varchar](50) NULL,
	[cargo] [varchar](20) NULL,
	[tel_emp] [nchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Farmacias] SET  READ_WRITE 
GO
