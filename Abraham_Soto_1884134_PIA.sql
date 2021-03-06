USE [master]
GO
/****** Object:  Database [FARMACIA]    Script Date: 04/11/2018 07:28:43 p. m. ******/
CREATE DATABASE [FARMACIA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FARMACIA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FARMACIA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FARMACIA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FARMACIA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FARMACIA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FARMACIA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FARMACIA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FARMACIA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FARMACIA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FARMACIA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FARMACIA] SET ARITHABORT OFF 
GO
ALTER DATABASE [FARMACIA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FARMACIA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FARMACIA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FARMACIA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FARMACIA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FARMACIA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FARMACIA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FARMACIA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FARMACIA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FARMACIA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FARMACIA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FARMACIA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FARMACIA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FARMACIA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FARMACIA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FARMACIA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FARMACIA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FARMACIA] SET RECOVERY FULL 
GO
ALTER DATABASE [FARMACIA] SET  MULTI_USER 
GO
ALTER DATABASE [FARMACIA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FARMACIA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FARMACIA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FARMACIA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FARMACIA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FARMACIA', N'ON'
GO
ALTER DATABASE [FARMACIA] SET QUERY_STORE = OFF
GO
USE [FARMACIA]
GO
/****** Object:  Table [dbo].[OrdenVenta]    Script Date: 04/11/2018 07:28:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenVenta](
	[id_ordenVenta] [uniqueidentifier] NOT NULL,
	[id_farmacia1] [uniqueidentifier] NOT NULL,
	[id_cliente1] [uniqueidentifier] NOT NULL,
	[nombre_prod1] [varchar](50) NOT NULL,
	[id_producto1] [uniqueidentifier] NOT NULL,
	[id_tipo_de_pago1] [int] NOT NULL,
	[id_empleado1] [uniqueidentifier] NOT NULL,
	[fecha_venta] [date] NOT NULL,
 CONSTRAINT [PK_OrdenVenta] PRIMARY KEY CLUSTERED 
(
	[id_ordenVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[pagosConCheque]    Script Date: 04/11/2018 07:28:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[pagosConCheque]
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '2'
GO
/****** Object:  View [dbo].[pagosEnEfectivo]    Script Date: 04/11/2018 07:28:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[pagosEnEfectivo]
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '1'
GO
/****** Object:  View [dbo].[pagosConTarjeta]    Script Date: 04/11/2018 07:28:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[pagosConTarjeta]
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '3'
GO
/****** Object:  View [dbo].[pagosConTarjetaDebito]    Script Date: 04/11/2018 07:28:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE VIEW [dbo].[pagosConTarjetaDebito]
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '4'
GO
/****** Object:  View [dbo].[pagosPorPaypal]    Script Date: 04/11/2018 07:28:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   CREATE VIEW [dbo].[pagosPorPaypal]
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '5'
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 04/11/2018 07:28:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farmacia](
	[id_farmacia] [uniqueidentifier] NOT NULL,
	[Dirección_farm] [varchar](50) NOT NULL,
	[Tel_farm] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Farmacia] PRIMARY KEY CLUSTERED 
(
	[id_farmacia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[phoneNumebers]    Script Date: 04/11/2018 07:28:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE VIEW [dbo].[phoneNumebers]
 AS 
 SELECT Tel_farm 
 FROM Farmacia
GO
/****** Object:  View [dbo].[phoneNumbers]    Script Date: 04/11/2018 07:28:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[phoneNumbers]
 AS 
 SELECT Tel_farm 
 FROM Farmacia
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 04/11/2018 07:28:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id_cliente] [uniqueidentifier] NOT NULL,
	[nom_cliente] [varchar](50) NOT NULL,
	[edad_cliente] [nchar](2) NOT NULL,
	[dir_cliente] [varchar](50) NOT NULL,
	[tel_cliente] [nchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 04/11/2018 07:28:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id_Empleado] [uniqueidentifier] NOT NULL,
	[nom_emp] [varchar](30) NOT NULL,
	[dir_emp] [varchar](50) NOT NULL,
	[id_tipo_emp] [int] NOT NULL,
	[foto_emp] [image] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[id_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 04/11/2018 07:28:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id_producto] [uniqueidentifier] NOT NULL,
	[nombre_prod] [varchar](50) NOT NULL,
	[foto_prod] [image] NULL,
	[precio_venta] [money] NOT NULL,
	[precio_compra] [money] NOT NULL,
	[fecha_venc] [date] NOT NULL,
	[stock] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 04/11/2018 07:28:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[id_proveedor] [uniqueidentifier] NOT NULL,
	[nombre_prov] [varchar](20) NOT NULL,
	[dir_prov] [varchar](50) NOT NULL,
	[tel_prov] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo empleado]    Script Date: 04/11/2018 07:28:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo empleado](
	[id_tipo_emp] [int] NOT NULL,
	[descripción] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Tipo empleado] PRIMARY KEY CLUSTERED 
(
	[id_tipo_emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_de_pago]    Script Date: 04/11/2018 07:28:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_de_pago](
	[id_tipo_de_pago] [int] NOT NULL,
	[descripción] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_de_pago] PRIMARY KEY CLUSTERED 
(
	[id_tipo_de_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [FARMACIA] SET  READ_WRITE 
GO
