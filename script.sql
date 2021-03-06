USE [master]
GO
/****** Object:  Database [Farmacia]    Script Date: 11/16/2019 6:59:01 PM ******/
CREATE DATABASE [Farmacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmacia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\Farmacia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Farmacia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\Farmacia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Farmacia] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farmacia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Farmacia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farmacia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farmacia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farmacia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farmacia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farmacia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farmacia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farmacia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farmacia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farmacia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farmacia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farmacia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farmacia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farmacia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farmacia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farmacia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Farmacia] SET  MULTI_USER 
GO
ALTER DATABASE [Farmacia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farmacia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farmacia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farmacia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Farmacia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Farmacia] SET QUERY_STORE = OFF
GO
USE [Farmacia]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 11/16/2019 6:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[localidad] [varchar](50) NOT NULL,
	[calle] [varchar](50) NOT NULL,
	[altura] [int] NOT NULL,
	[piso] [varchar](50) NOT NULL,
	[id_direccion] [int] NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[id_direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 11/16/2019 6:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id_empleado] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[rol] [varchar](50) NOT NULL,
	[id_direccion] [int] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enfermero]    Script Date: 11/16/2019 6:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enfermero](
	[id_enfermero] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[id_direccion] [int] NOT NULL,
	[licenciado] [varchar](50) NOT NULL,
	[supervisor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Enfermero] PRIMARY KEY CLUSTERED 
(
	[id_enfermero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 11/16/2019 6:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[id_item] [int] NOT NULL,
	[marca] [varchar](50) NOT NULL,
	[lote] [varchar](50) NOT NULL,
	[vencimiento] [date] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[id_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 11/16/2019 6:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[id_medico] [int] NOT NULL,
	[matricula] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[especialidad] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[id_direccion] [int] NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[id_medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 11/16/2019 6:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[id_paciente] [int] NOT NULL,
	[id_medico] [int] NOT NULL,
	[id_enfermero] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PacienteDatos]    Script Date: 11/16/2019 6:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PacienteDatos](
	[id_paciente] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[obra social] [varchar](50) NOT NULL,
	[fecha_nac] [date] NOT NULL,
 CONSTRAINT [PK_PacienteDatos] PRIMARY KEY CLUSTERED 
(
	[id_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 11/16/2019 6:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[id_pedido] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[hora] [timestamp] NOT NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido_Items]    Script Date: 11/16/2019 6:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido_Items](
	[id_pedido] [int] NOT NULL,
	[id_item] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido-Enfermero]    Script Date: 11/16/2019 6:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido-Enfermero](
	[id_recepcion] [int] NOT NULL,
	[id_pedido] [int] NOT NULL,
	[id_enfermero] [int] NOT NULL,
	[fecha] [date] NULL,
	[hora] [timestamp] NOT NULL,
 CONSTRAINT [PK_Pedido-Enfermero] PRIMARY KEY CLUSTERED 
(
	[id_recepcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 11/16/2019 6:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[id_receta] [int] NOT NULL,
	[id_medico] [int] NOT NULL,
	[id_paciente] [int] NOT NULL,
 CONSTRAINT [PK_Receta] PRIMARY KEY CLUSTERED 
(
	[id_receta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta-Empleado]    Script Date: 11/16/2019 6:59:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta-Empleado](
	[id_orden] [int] NOT NULL,
	[id_receta] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [timestamp] NOT NULL,
 CONSTRAINT [PK_Receta-Empleado] PRIMARY KEY CLUSTERED 
(
	[id_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Direccion] ([localidad], [calle], [altura], [piso], [id_direccion]) VALUES (N'boedo', N'versalles', 5654, N'0', 540)
INSERT [dbo].[Direccion] ([localidad], [calle], [altura], [piso], [id_direccion]) VALUES (N'almagro', N'gallo', 123, N'2', 541)
INSERT [dbo].[Direccion] ([localidad], [calle], [altura], [piso], [id_direccion]) VALUES (N'haedo', N'bonpland', 312, N'4', 542)
INSERT [dbo].[Direccion] ([localidad], [calle], [altura], [piso], [id_direccion]) VALUES (N'colegiales', N'zabala', 2800, N'0', 543)
INSERT [dbo].[Direccion] ([localidad], [calle], [altura], [piso], [id_direccion]) VALUES (N'barracas', N'brasil', 1433, N'20', 544)
INSERT [dbo].[Direccion] ([localidad], [calle], [altura], [piso], [id_direccion]) VALUES (N'almagro', N'gallo', 255, N'3', 545)
INSERT [dbo].[Direccion] ([localidad], [calle], [altura], [piso], [id_direccion]) VALUES (N'monserrat', N'pellegrini', 121, N'45', 546)
INSERT [dbo].[Empleado] ([id_empleado], [nombre], [apellido], [rol], [id_direccion]) VALUES (6, N'lucas', N'gonzalez', N'tecnico', 541)
INSERT [dbo].[Empleado] ([id_empleado], [nombre], [apellido], [rol], [id_direccion]) VALUES (7, N'sergio', N'juarez', N'farmaceutico', 542)
INSERT [dbo].[Empleado] ([id_empleado], [nombre], [apellido], [rol], [id_direccion]) VALUES (8, N'analia', N'marez', N'tecnico', 541)
INSERT [dbo].[Empleado] ([id_empleado], [nombre], [apellido], [rol], [id_direccion]) VALUES (9, N'federico', N'coco', N'farmaceutico', 543)
INSERT [dbo].[Empleado] ([id_empleado], [nombre], [apellido], [rol], [id_direccion]) VALUES (10, N'karina', N'souza', N'tecnico', NULL)
INSERT [dbo].[Enfermero] ([id_enfermero], [nombre], [apellido], [id_direccion], [licenciado], [supervisor]) VALUES (997, N'esteban', N'andrada', 540, N'si', N'si')
INSERT [dbo].[Enfermero] ([id_enfermero], [nombre], [apellido], [id_direccion], [licenciado], [supervisor]) VALUES (998, N'juan', N'grabouis', 546, N'si', N'no')
INSERT [dbo].[Enfermero] ([id_enfermero], [nombre], [apellido], [id_direccion], [licenciado], [supervisor]) VALUES (999, N'mara', N'gomez', 540, N'no', N'no')
INSERT [dbo].[Items] ([id_item], [marca], [lote], [vencimiento], [nombre]) VALUES (1, N'drawer', N'a2w3', CAST(N'2021-10-10' AS Date), N'paracetamol')
INSERT [dbo].[Items] ([id_item], [marca], [lote], [vencimiento], [nombre]) VALUES (2, N'bago', N'a22ed33', CAST(N'2023-12-12' AS Date), N'aspirina')
INSERT [dbo].[Items] ([id_item], [marca], [lote], [vencimiento], [nombre]) VALUES (3, N'bago', N'r44t5', CAST(N'2025-12-31' AS Date), N'reliveran')
INSERT [dbo].[Items] ([id_item], [marca], [lote], [vencimiento], [nombre]) VALUES (4, N'astra', N'tr33', CAST(N'2020-01-25' AS Date), N'amoxidal')
INSERT [dbo].[Items] ([id_item], [marca], [lote], [vencimiento], [nombre]) VALUES (5, N'novartis', N't4443d', CAST(N'2025-03-03' AS Date), N'hepatalgina')
INSERT [dbo].[Medico] ([id_medico], [matricula], [nombre], [apellido], [especialidad], [telefono], [id_direccion]) VALUES (1, N'10', N'mariana', N'diaz', N'general', N'12345678', 540)
INSERT [dbo].[Medico] ([id_medico], [matricula], [nombre], [apellido], [especialidad], [telefono], [id_direccion]) VALUES (2, N'20', N'mariano', N'lopez', N'cirugia', N'78654321', 544)
INSERT [dbo].[Medico] ([id_medico], [matricula], [nombre], [apellido], [especialidad], [telefono], [id_direccion]) VALUES (3, N'30', N'juan', N'perez', N'oncologia', N'45556666', 543)
INSERT [dbo].[Medico] ([id_medico], [matricula], [nombre], [apellido], [especialidad], [telefono], [id_direccion]) VALUES (4, N'40', N'juana', N'paez', N'pediatria', N'77788899', 540)
INSERT [dbo].[Medico] ([id_medico], [matricula], [nombre], [apellido], [especialidad], [telefono], [id_direccion]) VALUES (5, N'50', N'esteban', N'quito', N'hematologia', N'99988887', 541)
INSERT [dbo].[Paciente] ([id_paciente], [id_medico], [id_enfermero]) VALUES (500, 1, 998)
INSERT [dbo].[Paciente] ([id_paciente], [id_medico], [id_enfermero]) VALUES (501, 2, 997)
INSERT [dbo].[Paciente] ([id_paciente], [id_medico], [id_enfermero]) VALUES (502, 3, 999)
INSERT [dbo].[Paciente] ([id_paciente], [id_medico], [id_enfermero]) VALUES (503, 4, 999)
INSERT [dbo].[PacienteDatos] ([id_paciente], [nombre], [apellido], [obra social], [fecha_nac]) VALUES (500, N'juan', N'frazier', N'osde', CAST(N'1949-01-01' AS Date))
INSERT [dbo].[PacienteDatos] ([id_paciente], [nombre], [apellido], [obra social], [fecha_nac]) VALUES (501, N'ana', N'tolos', N'galeno', CAST(N'1993-12-30' AS Date))
INSERT [dbo].[PacienteDatos] ([id_paciente], [nombre], [apellido], [obra social], [fecha_nac]) VALUES (502, N'marcos', N'gogol', N'osde', CAST(N'1976-09-26' AS Date))
INSERT [dbo].[PacienteDatos] ([id_paciente], [nombre], [apellido], [obra social], [fecha_nac]) VALUES (503, N'LAURA', N'NOESTA', N'NO', CAST(N'1989-02-02' AS Date))
INSERT [dbo].[Pedido] ([id_pedido], [id_empleado], [fecha]) VALUES (132, 6, NULL)
INSERT [dbo].[Pedido] ([id_pedido], [id_empleado], [fecha]) VALUES (133, 6, NULL)
INSERT [dbo].[Pedido] ([id_pedido], [id_empleado], [fecha]) VALUES (134, 8, NULL)
INSERT [dbo].[Pedido_Items] ([id_pedido], [id_item]) VALUES (132, 3)
INSERT [dbo].[Pedido_Items] ([id_pedido], [id_item]) VALUES (132, 1)
INSERT [dbo].[Pedido_Items] ([id_pedido], [id_item]) VALUES (132, 1)
INSERT [dbo].[Pedido_Items] ([id_pedido], [id_item]) VALUES (133, 5)
INSERT [dbo].[Pedido_Items] ([id_pedido], [id_item]) VALUES (133, 4)
INSERT [dbo].[Pedido_Items] ([id_pedido], [id_item]) VALUES (133, 2)
INSERT [dbo].[Receta] ([id_receta], [id_medico], [id_paciente]) VALUES (1, 1, 500)
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Direccion] FOREIGN KEY([id_direccion])
REFERENCES [dbo].[Direccion] ([id_direccion])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Direccion]
GO
ALTER TABLE [dbo].[Enfermero]  WITH CHECK ADD  CONSTRAINT [FK_Enfermero_Direccion] FOREIGN KEY([id_direccion])
REFERENCES [dbo].[Direccion] ([id_direccion])
GO
ALTER TABLE [dbo].[Enfermero] CHECK CONSTRAINT [FK_Enfermero_Direccion]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Direccion] FOREIGN KEY([id_direccion])
REFERENCES [dbo].[Direccion] ([id_direccion])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Direccion]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Enfermero1] FOREIGN KEY([id_enfermero])
REFERENCES [dbo].[Enfermero] ([id_enfermero])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Enfermero1]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Medico2] FOREIGN KEY([id_medico])
REFERENCES [dbo].[Medico] ([id_medico])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Medico2]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_PacienteDatos] FOREIGN KEY([id_paciente])
REFERENCES [dbo].[PacienteDatos] ([id_paciente])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_PacienteDatos]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Empleado]
GO
ALTER TABLE [dbo].[Pedido_Items]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Items_Items] FOREIGN KEY([id_item])
REFERENCES [dbo].[Items] ([id_item])
GO
ALTER TABLE [dbo].[Pedido_Items] CHECK CONSTRAINT [FK_Pedido_Items_Items]
GO
ALTER TABLE [dbo].[Pedido_Items]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Items_Pedido] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[Pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[Pedido_Items] CHECK CONSTRAINT [FK_Pedido_Items_Pedido]
GO
ALTER TABLE [dbo].[Pedido-Enfermero]  WITH CHECK ADD  CONSTRAINT [FK_Pedido-Enfermero_Enfermero] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[Enfermero] ([id_enfermero])
GO
ALTER TABLE [dbo].[Pedido-Enfermero] CHECK CONSTRAINT [FK_Pedido-Enfermero_Enfermero]
GO
ALTER TABLE [dbo].[Pedido-Enfermero]  WITH CHECK ADD  CONSTRAINT [FK_Pedido-Enfermero_Pedido] FOREIGN KEY([id_recepcion])
REFERENCES [dbo].[Pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[Pedido-Enfermero] CHECK CONSTRAINT [FK_Pedido-Enfermero_Pedido]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Medico] FOREIGN KEY([id_medico])
REFERENCES [dbo].[Medico] ([id_medico])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Medico]
GO
ALTER TABLE [dbo].[Receta-Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Receta-Empleado_Empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[Receta-Empleado] CHECK CONSTRAINT [FK_Receta-Empleado_Empleado]
GO
ALTER TABLE [dbo].[Receta-Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Receta-Empleado_Receta] FOREIGN KEY([id_orden])
REFERENCES [dbo].[Receta] ([id_receta])
GO
ALTER TABLE [dbo].[Receta-Empleado] CHECK CONSTRAINT [FK_Receta-Empleado_Receta]
GO
USE [master]
GO
ALTER DATABASE [Farmacia] SET  READ_WRITE 
GO
