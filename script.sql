USE [master]
GO
/****** Object:  Database [Cursos]    Script Date: 11/8/2020 9:58:03 AM ******/
CREATE DATABASE [Cursos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cursos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Cursos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Cursos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Cursos_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Cursos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cursos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cursos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cursos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cursos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cursos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cursos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cursos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cursos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cursos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cursos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cursos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cursos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cursos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cursos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cursos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cursos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cursos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cursos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cursos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cursos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cursos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cursos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cursos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cursos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cursos] SET  MULTI_USER 
GO
ALTER DATABASE [Cursos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cursos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cursos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cursos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Cursos] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Cursos]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[legajo] [int] NOT NULL,
	[estado] [int] NOT NULL CONSTRAINT [DF_Alumno_estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Beca]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Beca](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[porcentaje] [float] NOT NULL,
	[estado] [int] NOT NULL CONSTRAINT [DF_Beca_estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Beca] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Curso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[costo] [float] NOT NULL,
	[fecha_limite] [datetime] NOT NULL,
	[cupo] [int] NOT NULL,
	[estado] [int] NOT NULL CONSTRAINT [DF_Curso_estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[alumno_id] [int] NOT NULL,
	[curso_id] [int] NOT NULL,
	[beca_id] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[estado] [int] NOT NULL CONSTRAINT [DF_Inscripcion_estado]  DEFAULT ((1)),
 CONSTRAINT [PK_Inscripcion_1] PRIMARY KEY CLUSTERED 
(
	[alumno_id] ASC,
	[curso_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([id], [nombre], [legajo], [estado]) VALUES (1, N'Jorge', 23456789, 1)
INSERT [dbo].[Alumno] ([id], [nombre], [legajo], [estado]) VALUES (2, N'Juan Perez', 2222, 1)
INSERT [dbo].[Alumno] ([id], [nombre], [legajo], [estado]) VALUES (3, N'Jorge Perez', 5555, 1)
INSERT [dbo].[Alumno] ([id], [nombre], [legajo], [estado]) VALUES (4, N'Ernesto Perez', 6666, 1)
INSERT [dbo].[Alumno] ([id], [nombre], [legajo], [estado]) VALUES (5, N'Fito Perez', 7777, 1)
INSERT [dbo].[Alumno] ([id], [nombre], [legajo], [estado]) VALUES (6, N'Donatelo Ninja', 9999, 1)
SET IDENTITY_INSERT [dbo].[Alumno] OFF
SET IDENTITY_INSERT [dbo].[Beca] ON 

INSERT [dbo].[Beca] ([id], [nombre], [porcentaje], [estado]) VALUES (1, N'Sin Beca', 1, 1)
INSERT [dbo].[Beca] ([id], [nombre], [porcentaje], [estado]) VALUES (2, N'Media Beca', 0.5, 1)
INSERT [dbo].[Beca] ([id], [nombre], [porcentaje], [estado]) VALUES (3, N'Beca 80%', 0.8, 1)
SET IDENTITY_INSERT [dbo].[Beca] OFF
SET IDENTITY_INSERT [dbo].[Curso] ON 

INSERT [dbo].[Curso] ([id], [nombre], [costo], [fecha_limite], [cupo], [estado]) VALUES (1, N'Gastronomia', 10000, CAST(N'2020-11-30 00:00:00.000' AS DateTime), 10, 1)
INSERT [dbo].[Curso] ([id], [nombre], [costo], [fecha_limite], [cupo], [estado]) VALUES (2, N'Video Juego', 15000, CAST(N'2020-11-30 00:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[Curso] ([id], [nombre], [costo], [fecha_limite], [cupo], [estado]) VALUES (3, N'Astronomia', 4000, CAST(N'2020-12-30 00:00:00.000' AS DateTime), 50, 1)
INSERT [dbo].[Curso] ([id], [nombre], [costo], [fecha_limite], [cupo], [estado]) VALUES (4, N'Master Chef', 20000, CAST(N'2020-11-20 00:00:00.000' AS DateTime), 10, 1)
INSERT [dbo].[Curso] ([id], [nombre], [costo], [fecha_limite], [cupo], [estado]) VALUES (7, N'Arte', 50000, CAST(N'2020-11-30 00:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[Curso] ([id], [nombre], [costo], [fecha_limite], [cupo], [estado]) VALUES (8, N'Paleontologia', 28000, CAST(N'2020-10-27 00:00:00.000' AS DateTime), 15, 1)
INSERT [dbo].[Curso] ([id], [nombre], [costo], [fecha_limite], [cupo], [estado]) VALUES (9, N'Hard Bass', 5000, CAST(N'2020-11-09 00:00:00.000' AS DateTime), 60, 1)
SET IDENTITY_INSERT [dbo].[Curso] OFF
INSERT [dbo].[Inscripcion] ([alumno_id], [curso_id], [beca_id], [fecha], [estado]) VALUES (1, 1, 1, CAST(N'2020-11-03 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inscripcion] ([alumno_id], [curso_id], [beca_id], [fecha], [estado]) VALUES (1, 2, 2, CAST(N'2020-11-10 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inscripcion] ([alumno_id], [curso_id], [beca_id], [fecha], [estado]) VALUES (1, 3, 3, CAST(N'2020-11-19 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inscripcion] ([alumno_id], [curso_id], [beca_id], [fecha], [estado]) VALUES (1, 4, 2, CAST(N'2020-11-04 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inscripcion] ([alumno_id], [curso_id], [beca_id], [fecha], [estado]) VALUES (2, 1, 1, CAST(N'2020-11-05 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inscripcion] ([alumno_id], [curso_id], [beca_id], [fecha], [estado]) VALUES (2, 7, 3, CAST(N'2020-11-12 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inscripcion] ([alumno_id], [curso_id], [beca_id], [fecha], [estado]) VALUES (4, 7, 3, CAST(N'2020-11-09 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inscripcion] ([alumno_id], [curso_id], [beca_id], [fecha], [estado]) VALUES (5, 2, 2, CAST(N'2020-11-19 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inscripcion] ([alumno_id], [curso_id], [beca_id], [fecha], [estado]) VALUES (5, 7, 3, CAST(N'2020-11-14 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inscripcion] ([alumno_id], [curso_id], [beca_id], [fecha], [estado]) VALUES (6, 7, 2, CAST(N'2020-11-04 00:00:00.000' AS DateTime), 1)
/****** Object:  Index [AK_Leg]    Script Date: 11/8/2020 9:58:03 AM ******/
ALTER TABLE [dbo].[Alumno] ADD  CONSTRAINT [AK_Leg] UNIQUE NONCLUSTERED 
(
	[legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [AK_NombreLeg]    Script Date: 11/8/2020 9:58:03 AM ******/
ALTER TABLE [dbo].[Alumno] ADD  CONSTRAINT [AK_NombreLeg] UNIQUE NONCLUSTERED 
(
	[nombre] ASC,
	[legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Alumno] FOREIGN KEY([alumno_id])
REFERENCES [dbo].[Alumno] ([id])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Alumno]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Beca] FOREIGN KEY([beca_id])
REFERENCES [dbo].[Beca] ([id])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Beca]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Curso] FOREIGN KEY([curso_id])
REFERENCES [dbo].[Curso] ([id])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Curso]
GO
/****** Object:  StoredProcedure [dbo].[Alumno_Insertar]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Alumno_Insertar]
@nombre varchar(50),
@legajo int
AS
BEGIN
	insert into Alumno(nombre,legajo,estado)
	values(@nombre,@legajo,1)
END

GO
/****** Object:  StoredProcedure [dbo].[Alumno_Listar]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[Alumno_Listar]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Alumno
END

GO
/****** Object:  StoredProcedure [dbo].[Alumno_Modificar]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Alumno_Modificar]
@id int,
@nombre varchar(50),
@legajo int
AS
BEGIN
	update Alumno set nombre=@nombre, legajo=@legajo WHERE Id=@id;
END

GO
/****** Object:  StoredProcedure [dbo].[Alumno_Obtener]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Alumno_Obtener] 
@ID int
AS
BEGIN
	select * from Alumno where estado=1 and Id=@ID;
END

GO
/****** Object:  StoredProcedure [dbo].[Beca_Listar]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[Beca_Listar]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM beca
   
END

GO
/****** Object:  StoredProcedure [dbo].[Beca_Obtener]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Beca_Obtener] 
@ID int
AS
BEGIN
	select * from Beca where estado = 1 and Id=@ID;
END

GO
/****** Object:  StoredProcedure [dbo].[Curso_Insertar]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Curso_Insertar]
@nombre varchar(250) ,
@costo float , 
@fechalimite datetime , 
@cupo int,
@estado int 
AS
BEGIN

INSERT INTO Curso ( nombre, costo, fecha_limite , cupo  , estado)
VALUES (@nombre,  @costo, @fechalimite, @cupo, @estado);


END

GO
/****** Object:  StoredProcedure [dbo].[Curso_Listar]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[Curso_Listar]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Curso WHERE estado = 1 Order By nombre;
   
END

GO
/****** Object:  StoredProcedure [dbo].[Curso_Modificar]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Curso_Modificar]
@id int,
@nombre varchar(250) ,
@costo float , 
@fechalimite datetime , 
@cupo int,
@estado int 
AS
BEGIN
	update Curso set nombre = @nombre,  costo = @costo, fecha_limite = @fechalimite, cupo = @cupo, estado = @estado WHERE id=@id;
END

GO
/****** Object:  StoredProcedure [dbo].[Curso_Obtener]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Curso_Obtener] 
@ID int
AS
BEGIN
	select * from Curso where estado = 1 and Id=@ID;
END

GO
/****** Object:  StoredProcedure [dbo].[Inscripcion_Insertar]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Inscripcion_Insertar]
@alumno int,
@beca int,
@curso int,
@fecha Datetime
AS
BEGIN
	insert into Inscripcion(alumno_id, beca_id, curso_id, fecha, estado)
	values(@alumno,@beca,@curso,@fecha , 1)
END


GO
/****** Object:  StoredProcedure [dbo].[Inscripcion_Listar]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROC [dbo].[Inscripcion_Listar]
@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Inscripcion where curso_id=@ID
   
END

GO
/****** Object:  StoredProcedure [dbo].[Inscripcion_Modificar]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Inscripcion_Modificar]
@alumno_id int,
@beca_id int,
@curso_id int
AS
BEGIN
	update Inscripcion set alumno_id=@alumno_id, beca_id=@beca_id WHERE curso_id=@curso_id;
END

GO
/****** Object:  StoredProcedure [dbo].[Inscripcion_ObtenerCurso]    Script Date: 11/8/2020 9:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROC [dbo].[Inscripcion_ObtenerCurso]
@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Inscripcion where curso_id=@ID
   
END

GO
USE [master]
GO
ALTER DATABASE [Cursos] SET  READ_WRITE 
GO
