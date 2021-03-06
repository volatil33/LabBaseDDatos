USE [master]
GO
/****** Object:  Database [FARMACIA]    Script Date: 05/11/2018 07:32:35 p. m. ******/
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
/****** Object:  Table [dbo].[OrdenVenta]    Script Date: 05/11/2018 07:32:35 p. m. ******/
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
/****** Object:  View [dbo].[pagosConCheque]    Script Date: 05/11/2018 07:32:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[pagosConCheque]
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '2'
GO
/****** Object:  View [dbo].[pagosEnEfectivo]    Script Date: 05/11/2018 07:32:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[pagosEnEfectivo]
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '1'
GO
/****** Object:  View [dbo].[pagosConTarjeta]    Script Date: 05/11/2018 07:32:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[pagosConTarjeta]
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '3'
GO
/****** Object:  View [dbo].[pagosConTarjetaDebito]    Script Date: 05/11/2018 07:32:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE VIEW [dbo].[pagosConTarjetaDebito]
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '4'
GO
/****** Object:  View [dbo].[pagosPorPaypal]    Script Date: 05/11/2018 07:32:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   CREATE VIEW [dbo].[pagosPorPaypal]
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '5'
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 05/11/2018 07:32:36 p. m. ******/
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
/****** Object:  View [dbo].[phoneNumebers]    Script Date: 05/11/2018 07:32:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE VIEW [dbo].[phoneNumebers]
 AS 
 SELECT Tel_farm 
 FROM Farmacia
GO
/****** Object:  View [dbo].[phoneNumbers]    Script Date: 05/11/2018 07:32:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[phoneNumbers]
 AS 
 SELECT Tel_farm 
 FROM Farmacia
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 05/11/2018 07:32:36 p. m. ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 05/11/2018 07:32:36 p. m. ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 05/11/2018 07:32:36 p. m. ******/
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
/****** Object:  Table [dbo].[Proveedor]    Script Date: 05/11/2018 07:32:36 p. m. ******/
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
/****** Object:  Table [dbo].[Tipo empleado]    Script Date: 05/11/2018 07:32:36 p. m. ******/
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
/****** Object:  Table [dbo].[Tipo_de_pago]    Script Date: 05/11/2018 07:32:36 p. m. ******/
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
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'72eeb54c-6348-46bb-b560-dc773f61f365', N'Adam Clayton', N'24', N'Av.Cuahutemoc #34', N'777-777-7777   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'b4e62dbd-3818-463f-8e2f-3e0be691ed68', N'Eli Gonzalez', N'62', N'Av. Paseo de los andes #56', N'923-942-2848   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'7e1ba3c3-7683-409c-ba7a-64c12cb43176', N'Lourdes Almaraz', N'46', N'Av. Del las flores #34', N'836-835-3643   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'1e54e834-069b-4284-a39e-7f747c67f865', N'Martin Esquivel', N'35', N'Av. San Mateo #243', N'366-623-4343   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'1819f922-db90-45c4-aa75-dda6a5977a83', N'Paola Avilez', N'83', N'Cielito lindo #4', N'868-234-2344   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'21bb93ea-0d61-4282-a1d1-12124e965a92', N'Luis Mesa', N'34', N'calle 34 #400', N'545-677-3424   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'abab7810-508c-4251-8580-0965f04b9771', N'Eva Perón', N'69', N'Av.de leas culturas #356', N'233-535-2133   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'a23c238b-a9e6-43f7-8f8e-a527230b02f7', N'Alfonso Garcia', N'63', N'Calle Naranjo #908', N'244-344-4535   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'4657db2e-e55e-4972-a66b-03651675da32', N'Antonio Rios', N'52', N'Camino a Sta.Rosa #23', N'325-425-2455   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'365401b0-85c0-4845-82d0-988c8e4dc54d', N'Ana Carmona', N'71', N'Av.Palmas #35', N'232-234-3424   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'7a9c0159-097d-4e03-be2f-eed6573a4180', N'Luisa Jaramillo', N'64', N'calle 24 #5', N'653-343-3444   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'ed481a95-1c94-46dc-83b9-4c8f10137bd7', N'Adrian Loazano', N'72', N'Av.Paseo de los conquistadores #345', N'324-454-4355   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'12dcec94-b0e3-4a1b-b724-fbef22a0ce62', N'Roberto Lira', N'31', N'Carretera Nvo.Laredo #4342', N'667-678-6787   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'c3ab3901-ec5d-4d60-9486-7708dcdf1d4b', N'Felipe Solis', N'87', N'Av.Rio de los remedios #456', N'342-334-4545   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'80eb4600-cb73-4c8a-81f7-19905dc40362', N'Pedro Sanchez', N'36', N'Copan #345', N'566-989-6574   ')
INSERT [dbo].[Clientes] ([id_cliente], [nom_cliente], [edad_cliente], [dir_cliente], [tel_cliente]) VALUES (N'21da5d37-8296-4347-bd6b-dc09c05757d0', N'Carlos Resendis', N'67', N'Av.A.López Mateos #678', N'685-678-6858   ')
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'1f097034-b283-45cc-98c5-02ca225fdc91', N'Aarón Espindola', N'Calle de la esperaza #864', 2, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'c3ca56f3-b63e-4279-9500-08b28e46d5d6', N'Esteban Lara', N'Cuahutemoc #356', 3, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'0405ff69-c99b-45be-b3a7-28b473368e2c', N'Leonardo Fernandez', N'Comitan #63', 4, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'd4fb9f0a-85eb-4438-897c-30a365aa3205', N'Marta Galvan', N'Av. de la luz #345', 4, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'c843b780-9290-487f-928a-371ef8f644ca', N'Claudia Rios', N'Av.Jardín #345', 2, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'e51453ab-be15-46e0-aece-383c2874f00f', N'Zaul Valdez', N'paseo de las lomas #78', 5, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'0ba73aeb-be7c-4f1b-b892-400127ed2be2', N'Christian Esparza', N'Loma linda #45', 1, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'9e1cead5-9a7f-44b5-b686-489d74dac81e', N'Alina Islas', N'Av. de la Vida #387', 1, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'f78a9e7c-137b-4183-9d00-6b0fa5cd97c0', N'Aldo Saldivar', N'Av.Del rio #50', 4, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'cc7d9b26-7d9b-4803-854e-7ccf73a3de4e', N'Susana Avila', N'Av. C.Colón #392', 5, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'33e2e6c4-53e9-4848-974a-8ddd0197669d', N'Jorge Tolentino', N'Guadalajara #33', 5, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'76ce6c56-d986-4afb-b9e8-9696fecc6285', N'Laura Escamilla', N'calle 9 #198', 1, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'5b969091-5d44-4310-b9d6-b4423ba08d2b', N'Esperanza Briones', N'Paeo Maya #60', 4, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'cad7d0c9-d994-4786-b032-c0e0af4c6fbb', N'Daniel Hernandez', N'Paseo de las Mitras #592', 1, NULL)
INSERT [dbo].[Empleado] ([id_Empleado], [nom_emp], [dir_emp], [id_tipo_emp], [foto_emp]) VALUES (N'abb501d2-0a78-499d-a097-e7e5ded48943', N'Patricio Mungía', N'Av. Juarez #561', 3, NULL)
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'99f5a352-fd6e-44e6-93e3-024e9e81a2f5', N'Normandy #565', N'555-356-5633')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'32179b25-af84-4f1a-826c-1d23753eab24', N'Knenaan #8080', N'666-363-5766')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'1c213865-c2d9-409b-8224-1f97ee1f617f', N'QueenCrab #567', N'444-333-3333')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'7b15df10-cb4e-446b-8dc1-2367bbda98cd', N'Shark Valley Av #780', N'555-797-7900')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'c7ea5d22-2766-4471-8cd0-28c5935eae16', N'SkyPark #799', N'444-456-3333')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'14e3e153-e8df-42aa-825c-2e47a9e7e2a8', N'RoastedRoad #808', N'444-457-5478')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'0f2faee1-0979-43d4-bc9a-6531fc2f0416', N'SunsetBlv #547', N'666-893-8686')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'7fa3c884-39f6-44e2-9d15-65bd56020cb1', N'StaMonicaAV #567', N'444-779-4676')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'83db5a5d-1dd2-4384-bb6d-72b2d1e5b891', N'TastyTuna #345', N'555-333-3333')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'cc8336a3-9b85-42a7-acd9-7d707a637162', N'LonellyRoad #345', N'555-333-5788')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'b852abed-3e09-4351-b8f8-c6d4f15a8218', N'HookAv #45', N'777-777-7777')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'3f49af9f-5b78-474f-94f9-d2139a6e60a2', N'WellDone #979', N'666-333-3333')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'fa2f3ad7-44a2-4f74-9792-da42ca44a609', N'ProudRd #678', N'666-334-3456')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'06204a5d-8839-437b-aada-dfd0944e304c', N'PomanaAv #678', N'666-434-7998')
INSERT [dbo].[Farmacia] ([id_farmacia], [Dirección_farm], [Tel_farm]) VALUES (N'34253239-6956-46a2-b318-e57f00fd5c93', N'KingRd #45', N'444-567-7689')
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'b7ec3abf-220e-436a-82fe-059db7e8983e', N'fa2f3ad7-44a2-4f74-9792-da42ca44a609', N'a23c238b-a9e6-43f7-8f8e-a527230b02f7', N'Dexametazona', N'97a7c870-3d89-475e-bca9-3ad0ab7cd55d', 5, N'e51453ab-be15-46e0-aece-383c2874f00f', CAST(N'2018-08-16' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'9cf0762b-a7d2-4bc2-80be-1c3bac6042c8', N'7b15df10-cb4e-446b-8dc1-2367bbda98cd', N'80eb4600-cb73-4c8a-81f7-19905dc40362', N'Ciplofloxacino', N'6aa7b3b8-a2ef-41e9-b421-8657e5e0f4fd', 2, N'5b969091-5d44-4310-b9d6-b4423ba08d2b', CAST(N'2018-02-14' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'6a40a651-08f7-4038-a765-1f5c7106690d', N'99f5a352-fd6e-44e6-93e3-024e9e81a2f5', N'72eeb54c-6348-46bb-b560-dc773f61f365', N'Terramicina', N'91538bdc-cea7-406a-92ef-22460cee8957', 2, N'abb501d2-0a78-499d-a097-e7e5ded48943', CAST(N'2018-03-10' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'ab7b30da-c253-4be6-8dc7-5bee502ab7ad', N'06204a5d-8839-437b-aada-dfd0944e304c', N'4657db2e-e55e-4972-a66b-03651675da32', N'Doloneurobion', N'b32b48f9-b258-4ad8-88bc-64fcba3a4555', 5, N'0ba73aeb-be7c-4f1b-b892-400127ed2be2', CAST(N'2018-02-23' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'fe74bbf1-217a-45d1-98d6-769444c4ffab', N'fa2f3ad7-44a2-4f74-9792-da42ca44a609', N'ed481a95-1c94-46dc-83b9-4c8f10137bd7', N'Bromehexina', N'c2f55ee0-f441-4c22-ba15-d4392d453f1f', 1, N'cad7d0c9-d994-4786-b032-c0e0af4c6fbb', CAST(N'2018-07-16' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'0f3fdcb7-fa21-45fa-9d3c-7f8d1d731edf', N'fa2f3ad7-44a2-4f74-9792-da42ca44a609', N'7a9c0159-097d-4e03-be2f-eed6573a4180', N'Clorfenamina', N'a4d25b5a-a879-4595-be46-b73e72436ed6', 5, N'cad7d0c9-d994-4786-b032-c0e0af4c6fbb', CAST(N'2018-08-17' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'2f0f5c61-1b4f-49c6-8816-932c06b2a495', N'3f49af9f-5b78-474f-94f9-d2139a6e60a2', N'abab7810-508c-4251-8580-0965f04b9771', N'Acido folico', N'16fb3db1-73f7-494c-8f54-4bc0342b1391', 3, N'33e2e6c4-53e9-4848-974a-8ddd0197669d', CAST(N'2018-04-12' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'49e05cce-48d7-45df-97f8-aa4e97496172', N'c7ea5d22-2766-4471-8cd0-28c5935eae16', N'21bb93ea-0d61-4282-a1d1-12124e965a92', N'Dexametazona', N'97a7c870-3d89-475e-bca9-3ad0ab7cd55d', 1, N'9e1cead5-9a7f-44b5-b686-489d74dac81e', CAST(N'2018-05-23' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'b5dacc41-65e8-4289-865d-b8741a94143d', N'7fa3c884-39f6-44e2-9d15-65bd56020cb1', N'a23c238b-a9e6-43f7-8f8e-a527230b02f7', N'Ibuprofeno', N'd7a2a96e-72b1-463d-a255-365630e83697', 1, N'f78a9e7c-137b-4183-9d00-6b0fa5cd97c0', CAST(N'2018-01-19' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'e3eb54db-8b21-4d4b-bdb1-d5c2cdf05088', N'0f2faee1-0979-43d4-bc9a-6531fc2f0416', N'b4e62dbd-3818-463f-8e2f-3e0be691ed68', N'Complejo-b', N'8033562a-a9eb-45c9-abc1-ab97ffe47db7', 3, N'c843b780-9290-487f-928a-371ef8f644ca', CAST(N'2018-01-28' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'55269c2f-a7d4-457c-9bcf-d6999471d536', N'34253239-6956-46a2-b318-e57f00fd5c93', N'21da5d37-8296-4347-bd6b-dc09c05757d0', N'Paracetamol', N'9a3083d2-c05c-4c78-aad3-252d388e51e7', 4, N'c843b780-9290-487f-928a-371ef8f644ca', CAST(N'2018-01-13' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'84482c74-f19f-4055-ad15-e3125d4d729e', N'7fa3c884-39f6-44e2-9d15-65bd56020cb1', N'365401b0-85c0-4845-82d0-988c8e4dc54d', N'Acido folico', N'16fb3db1-73f7-494c-8f54-4bc0342b1391', 1, N'd4fb9f0a-85eb-4438-897c-30a365aa3205', CAST(N'2018-07-24' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'a8f1c048-349d-4968-a69f-e40d086eaa4b', N'14e3e153-e8df-42aa-825c-2e47a9e7e2a8', N'ed481a95-1c94-46dc-83b9-4c8f10137bd7', N'Meloxicam', N'4b5d84c9-a10f-4f29-85a9-92717f82a3ac', 3, N'cc7d9b26-7d9b-4803-854e-7ccf73a3de4e', CAST(N'2018-06-13' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'519fe3b8-0d29-4906-8ff9-ed135cded67f', N'83db5a5d-1dd2-4384-bb6d-72b2d1e5b891', N'a23c238b-a9e6-43f7-8f8e-a527230b02f7', N'Dramamine', N'1ee27629-f3f2-4e4b-aebc-013936eab865', 1, N'76ce6c56-d986-4afb-b9e8-9696fecc6285', CAST(N'2018-06-14' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'9304fbc3-163e-4f8d-9156-faaef22e4be9', N'7fa3c884-39f6-44e2-9d15-65bd56020cb1', N'12dcec94-b0e3-4a1b-b724-fbef22a0ce62', N'Ketoconazol', N'ef08632a-ece2-4d2a-88ba-763585ccf106', 1, N'9e1cead5-9a7f-44b5-b686-489d74dac81e', CAST(N'2018-02-12' AS Date))
INSERT [dbo].[OrdenVenta] ([id_ordenVenta], [id_farmacia1], [id_cliente1], [nombre_prod1], [id_producto1], [id_tipo_de_pago1], [id_empleado1], [fecha_venta]) VALUES (N'9dda558e-668f-4460-8245-faf93b036291', N'b852abed-3e09-4351-b8f8-c6d4f15a8218', N'80eb4600-cb73-4c8a-81f7-19905dc40362', N'Ivermectina', N'37a29ecd-83f2-4095-b5cf-a2120617d4b8', 4, N'abb501d2-0a78-499d-a097-e7e5ded48943', CAST(N'2018-04-15' AS Date))
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'1ee27629-f3f2-4e4b-aebc-013936eab865', N'Dramamine', NULL, 48.9200, 20.5400, CAST(N'2022-01-19' AS Date), N'342                 ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'91538bdc-cea7-406a-92ef-22460cee8957', N'Terramicina', NULL, 29.0700, 12.9900, CAST(N'2022-08-12' AS Date), N'23                  ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'9a3083d2-c05c-4c78-aad3-252d388e51e7', N'Paracetamol', NULL, 20.3000, 17.5800, CAST(N'2020-07-10' AS Date), N'3                   ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'ce29f69b-e60b-4d4f-b2bb-2b03b58b0759', N'Diclofenaco', NULL, 15.6000, 12.1400, CAST(N'2019-10-23' AS Date), N'25                  ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'd7a2a96e-72b1-463d-a255-365630e83697', N'Ibuprofeno', NULL, 33.3300, 25.7200, CAST(N'2024-05-20' AS Date), N'324                 ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'97a7c870-3d89-475e-bca9-3ad0ab7cd55d', N'Dexametazona', NULL, 55.4000, 30.3400, CAST(N'2030-02-20' AS Date), N'49                  ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'16fb3db1-73f7-494c-8f54-4bc0342b1391', N'Acido folico', NULL, 15.3000, 9.4800, CAST(N'2023-11-03' AS Date), N'42                  ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'b32b48f9-b258-4ad8-88bc-64fcba3a4555', N'Doloneurobion', NULL, 130.1200, 110.1100, CAST(N'2019-09-27' AS Date), N'344                 ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'ef08632a-ece2-4d2a-88ba-763585ccf106', N'Ketoconazol', NULL, 43.2500, 27.0700, CAST(N'2019-04-13' AS Date), N'79                  ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'6aa7b3b8-a2ef-41e9-b421-8657e5e0f4fd', N'Ciprofloxacino', NULL, 77.0200, 50.5200, CAST(N'2021-12-03' AS Date), N'321                 ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'4b5d84c9-a10f-4f29-85a9-92717f82a3ac', N'Meloxicam', NULL, 10.0000, 5.8000, CAST(N'2022-04-20' AS Date), N'345                 ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'37a29ecd-83f2-4095-b5cf-a2120617d4b8', N'Ivermectina', NULL, 60.6000, 48.0300, CAST(N'2019-09-27' AS Date), N'245                 ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'8033562a-a9eb-45c9-abc1-ab97ffe47db7', N'Complejo-b', NULL, 60.3200, 45.2400, CAST(N'2022-05-08' AS Date), N'311                 ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'a4d25b5a-a879-4595-be46-b73e72436ed6', N'Clorfenamina', NULL, 48.9200, 39.6400, CAST(N'2019-11-21' AS Date), N'245                 ')
INSERT [dbo].[Producto] ([id_producto], [nombre_prod], [foto_prod], [precio_venta], [precio_compra], [fecha_venc], [stock]) VALUES (N'c2f55ee0-f441-4c22-ba15-d4392d453f1f', N'Bromhexina', NULL, 129.1900, 107.7800, CAST(N'2024-06-26' AS Date), N'255                 ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'72943d02-2e09-4097-812b-0b01f73142b3', N'Manuel Aleman ', N'Calle Republica mexicana #23', N'689-757-6722        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'811ba0a0-8ce3-400c-b0c3-192636ab2d0f', N'Paola Rivera', N'Av. De los angeles #3242', N'686-345-4554        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'39be8951-0c4c-4a8d-8da8-2a0faef9ef29', N'Gustavo Treviño', N'Av. Barragan #235', N'688-345-4355        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'c181d5dc-2ede-4b9d-9238-2ef6f9946aa4', N'Salvador Lozada', N'Calle Bugambilias #4', N'435-245-3324        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'7d77577e-7d9a-41be-ba89-3310dd357e3f', N'Jilberto Bustamante', N'Laguna de patzcuaro #435', N'688-754-4545        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'a158d722-32d6-46f0-a4d4-451c2744499c', N'Alfredo Gomez', N'Av. San Nicolas #632', N'687-342-7435        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'9de96c2a-cf3d-4c0f-b986-4fc6d69b84c4', N'Jilberto Norvez', N'Calle Alamo #345', N'688-356-2348        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'9d148ecc-e461-4d8b-9163-622a54ede9aa', N'Guadalupe Delgado', N'Calle Platino #56', N'682-323-435         ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'abc15f0e-876b-4215-af46-633108d0a1a3', N'Alvaro Cortez', N'Las Alamedas #345', N'647-903-4578        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'4a2769c8-9db1-4259-b916-8ac6a5e95c5e', N'Eduardo Nuñez', N'calle Medicos #2314', N'685-565-2432        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'6590ac47-ed3d-4a83-ae77-b612b95b0f14', N'Rodrigo Estrada', N'Almazan #303', N'665-778-6323        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'c744313b-ecb0-4f00-a307-dabf84897340', N'Andrea Villarreal', N'Av. Sendero #2353', N'685-7832-2376       ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'abc995b1-5360-4703-8eba-dd2382fd230a', N'Arelí Salgado', N'Av. Sto. Domingo #634', N'685-455-3445        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'2250500e-eb28-4f3e-b3f3-e8c8f4ce162f', N'Teresa Soliz', N'Av. Huitzillopoztli #2344', N'682-323-2334        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'899a61c8-4504-475e-b871-ea7a8fe16860', N'Alejandro Estrada', N'Av. Lazaro Cardenas #523', N'685-565-2432        ')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_prov], [dir_prov], [tel_prov]) VALUES (N'be6c1d8d-3808-45ad-bdd3-fe8f6676cdf9', N'Estefania Azuara', N'Av. Linda vista #215', N'685-545-4554        ')
INSERT [dbo].[Tipo empleado] ([id_tipo_emp], [descripción]) VALUES (1, N'Ejecutivo')
INSERT [dbo].[Tipo empleado] ([id_tipo_emp], [descripción]) VALUES (2, N'Supervisión')
INSERT [dbo].[Tipo empleado] ([id_tipo_emp], [descripción]) VALUES (3, N'Administrativo Contable')
INSERT [dbo].[Tipo empleado] ([id_tipo_emp], [descripción]) VALUES (4, N'Almacén y envio')
INSERT [dbo].[Tipo empleado] ([id_tipo_emp], [descripción]) VALUES (5, N'Ventas mostrador')
INSERT [dbo].[Tipo_de_pago] ([id_tipo_de_pago], [descripción]) VALUES (1, N'Efectivo')
INSERT [dbo].[Tipo_de_pago] ([id_tipo_de_pago], [descripción]) VALUES (2, N'Pago con cheque')
INSERT [dbo].[Tipo_de_pago] ([id_tipo_de_pago], [descripción]) VALUES (3, N'Pago con tarjeta de credito')
INSERT [dbo].[Tipo_de_pago] ([id_tipo_de_pago], [descripción]) VALUES (4, N'Pago con tarjeta de debito')
INSERT [dbo].[Tipo_de_pago] ([id_tipo_de_pago], [descripción]) VALUES (5, N'PayPal')
INSERT [dbo].[Tipo_de_pago] ([id_tipo_de_pago], [descripción]) VALUES (6, N'Otro')
USE [master]
GO
ALTER DATABASE [FARMACIA] SET  READ_WRITE 
GO
