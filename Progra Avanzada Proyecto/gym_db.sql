USE [master]
GO
/****** Object:  Database [GYM]    Script Date: 6 dic. 2023 07:31:47 ******/
CREATE DATABASE [GYM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GYM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GYM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GYM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GYM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GYM] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GYM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GYM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GYM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GYM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GYM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GYM] SET ARITHABORT OFF 
GO
ALTER DATABASE [GYM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GYM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GYM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GYM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GYM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GYM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GYM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GYM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GYM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GYM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GYM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GYM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GYM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GYM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GYM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GYM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GYM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GYM] SET RECOVERY FULL 
GO
ALTER DATABASE [GYM] SET  MULTI_USER 
GO
ALTER DATABASE [GYM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GYM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GYM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GYM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GYM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GYM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GYM', N'ON'
GO
ALTER DATABASE [GYM] SET QUERY_STORE = ON
GO
ALTER DATABASE [GYM] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GYM]
GO
/****** Object:  Table [dbo].[TCarrito]    Script Date: 6 dic. 2023 07:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCarrito](
	[ConCarrito] [bigint] IDENTITY(1,1) NOT NULL,
	[ConUsuario] [bigint] NOT NULL,
	[ConProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaCarrito] [datetime] NOT NULL,
 CONSTRAINT [PK_TCarrito] PRIMARY KEY CLUSTERED 
(
	[ConCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TCategoria]    Script Date: 6 dic. 2023 07:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCategoria](
	[ConCategoria] [bigint] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[ConCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDetalle]    Script Date: 6 dic. 2023 07:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDetalle](
	[ConDetalle] [bigint] IDENTITY(1,1) NOT NULL,
	[ConMaestro] [bigint] NOT NULL,
	[ConProducto] [bigint] NOT NULL,
	[PrecioPagado] [decimal](18, 2) NOT NULL,
	[CantidadPagado] [int] NOT NULL,
	[ImpuestoPagado] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TDetalle] PRIMARY KEY CLUSTERED 
(
	[ConDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMaestro]    Script Date: 6 dic. 2023 07:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMaestro](
	[ConMaestro] [bigint] IDENTITY(1,1) NOT NULL,
	[ConUsuario] [bigint] NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
	[TotalCompra] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TMaestro] PRIMARY KEY CLUSTERED 
(
	[ConMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TProducto]    Script Date: 6 dic. 2023 07:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TProducto](
	[ConProducto] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Imagen] [varchar](250) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Categoria] [bigint] NULL,
 CONSTRAINT [PK_TProducto] PRIMARY KEY CLUSTERED 
(
	[ConProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TProvincia]    Script Date: 6 dic. 2023 07:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TProvincia](
	[ConProvincia] [bigint] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TProvincia] PRIMARY KEY CLUSTERED 
(
	[ConProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRol]    Script Date: 6 dic. 2023 07:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRol](
	[ConRol] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TRol] PRIMARY KEY CLUSTERED 
(
	[ConRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUsuario]    Script Date: 6 dic. 2023 07:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUsuario](
	[ConUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](25) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Contrasenna] [varchar](25) NOT NULL,
	[Estado] [bit] NOT NULL,
	[ConProvincia] [bigint] NOT NULL,
	[ConRol] [bigint] NOT NULL,
 CONSTRAINT [PK_TUsuario] PRIMARY KEY CLUSTERED 
(
	[ConUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TCategoria] ([ConCategoria], [Descripcion]) VALUES (1, N'Shakers')
INSERT [dbo].[TCategoria] ([ConCategoria], [Descripcion]) VALUES (2, N'Accesorios')
INSERT [dbo].[TCategoria] ([ConCategoria], [Descripcion]) VALUES (3, N'Suplementos Deportivos')
INSERT [dbo].[TCategoria] ([ConCategoria], [Descripcion]) VALUES (4, N'Suplementos Adultos')
INSERT [dbo].[TCategoria] ([ConCategoria], [Descripcion]) VALUES (5, N'Proteinas polvo')
INSERT [dbo].[TCategoria] ([ConCategoria], [Descripcion]) VALUES (6, N'Proteinas suero')
INSERT [dbo].[TCategoria] ([ConCategoria], [Descripcion]) VALUES (7, N'Proteinas vegetal')
GO
SET IDENTITY_INSERT [dbo].[TDetalle] ON 

INSERT [dbo].[TDetalle] ([ConDetalle], [ConMaestro], [ConProducto], [PrecioPagado], [CantidadPagado], [ImpuestoPagado]) VALUES (9, 11, 20, CAST(15000.00 AS Decimal(18, 2)), 1, CAST(1950.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([ConDetalle], [ConMaestro], [ConProducto], [PrecioPagado], [CantidadPagado], [ImpuestoPagado]) VALUES (10, 12, 20, CAST(15000.00 AS Decimal(18, 2)), 2, CAST(3900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([ConDetalle], [ConMaestro], [ConProducto], [PrecioPagado], [CantidadPagado], [ImpuestoPagado]) VALUES (11, 13, 21, CAST(30000.00 AS Decimal(18, 2)), 4, CAST(15600.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([ConDetalle], [ConMaestro], [ConProducto], [PrecioPagado], [CantidadPagado], [ImpuestoPagado]) VALUES (12, 14, 20, CAST(15000.00 AS Decimal(18, 2)), 1, CAST(1950.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[TMaestro] ON 

INSERT [dbo].[TMaestro] ([ConMaestro], [ConUsuario], [FechaCompra], [TotalCompra]) VALUES (11, 4, CAST(N'2023-12-04T09:20:56.480' AS DateTime), CAST(16950.00 AS Decimal(18, 2)))
INSERT [dbo].[TMaestro] ([ConMaestro], [ConUsuario], [FechaCompra], [TotalCompra]) VALUES (12, 3, CAST(N'2023-12-04T09:23:08.950' AS DateTime), CAST(33900.00 AS Decimal(18, 2)))
INSERT [dbo].[TMaestro] ([ConMaestro], [ConUsuario], [FechaCompra], [TotalCompra]) VALUES (13, 3, CAST(N'2023-12-04T09:23:41.390' AS DateTime), CAST(135600.00 AS Decimal(18, 2)))
INSERT [dbo].[TMaestro] ([ConMaestro], [ConUsuario], [FechaCompra], [TotalCompra]) VALUES (14, 4, CAST(N'2023-12-05T20:08:23.523' AS DateTime), CAST(16950.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TMaestro] OFF
GO
SET IDENTITY_INSERT [dbo].[TProducto] ON 

INSERT [dbo].[TProducto] ([ConProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Imagen], [Estado], [Categoria]) VALUES (20, N'Shaker Azul', N'Shaker edicion limitada', 4, CAST(15000.00 AS Decimal(18, 2)), N'/Images/18.png', 1, 1)
INSERT [dbo].[TProducto] ([ConProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Imagen], [Estado], [Categoria]) VALUES (21, N'Proteina Whey ', N'Sabor Vainilla', 11, CAST(30000.00 AS Decimal(18, 2)), N'/Images/21.jpg', 1, 5)
SET IDENTITY_INSERT [dbo].[TProducto] OFF
GO
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (1, N'San Jose')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (2, N'Alajuela')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (3, N'Cartago')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (4, N'Heredia')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (5, N'Puntarenas')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (6, N'Guanacaste')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (7, N'Limón')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (8, N'Seleccione')
GO
SET IDENTITY_INSERT [dbo].[TRol] ON 

INSERT [dbo].[TRol] ([ConRol], [Descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[TRol] ([ConRol], [Descripcion]) VALUES (2, N'Usuario')
SET IDENTITY_INSERT [dbo].[TRol] OFF
GO
SET IDENTITY_INSERT [dbo].[TUsuario] ON 

INSERT [dbo].[TUsuario] ([ConUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [ConProvincia], [ConRol]) VALUES (3, N'402410998', N'SALAS TORRES ANDRE FRANCISCO', N'asalas10998@ufide.ac.cr', N'90417', 1, 4, 2)
INSERT [dbo].[TUsuario] ([ConUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [ConProvincia], [ConRol]) VALUES (4, N'112810821', N'VASQUEZ PEREZ CLAUDIO ALBERTO', N'cvazquez10821@ufide.ac.cr', N'10821', 1, 4, 1)
INSERT [dbo].[TUsuario] ([ConUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [ConProvincia], [ConRol]) VALUES (5, N'118860740', N'CASTILLO IRIAS OSCAR ANDRES', N'ocastillo60740@ufide.ac.cr', N'60740', 1, 1, 2)
INSERT [dbo].[TUsuario] ([ConUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [ConProvincia], [ConRol]) VALUES (6, N'118820054', N'ARAYA VALENCIANO MARIANA', N'maraya20054@ufide.ac.cr', N'20054', 1, 4, 2)
SET IDENTITY_INSERT [dbo].[TUsuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Identificacion]    Script Date: 6 dic. 2023 07:31:56 ******/
ALTER TABLE [dbo].[TUsuario] ADD  CONSTRAINT [UK_Identificacion] UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TCarrito]  WITH CHECK ADD  CONSTRAINT [FK_TCarrito_TProducto] FOREIGN KEY([ConProducto])
REFERENCES [dbo].[TProducto] ([ConProducto])
GO
ALTER TABLE [dbo].[TCarrito] CHECK CONSTRAINT [FK_TCarrito_TProducto]
GO
ALTER TABLE [dbo].[TCarrito]  WITH CHECK ADD  CONSTRAINT [FK_TCarrito_TUsuario] FOREIGN KEY([ConUsuario])
REFERENCES [dbo].[TUsuario] ([ConUsuario])
GO
ALTER TABLE [dbo].[TCarrito] CHECK CONSTRAINT [FK_TCarrito_TUsuario]
GO
ALTER TABLE [dbo].[TDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TDetalle_TMaestro] FOREIGN KEY([ConMaestro])
REFERENCES [dbo].[TMaestro] ([ConMaestro])
GO
ALTER TABLE [dbo].[TDetalle] CHECK CONSTRAINT [FK_TDetalle_TMaestro]
GO
ALTER TABLE [dbo].[TDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TDetalle_TProducto] FOREIGN KEY([ConProducto])
REFERENCES [dbo].[TProducto] ([ConProducto])
GO
ALTER TABLE [dbo].[TDetalle] CHECK CONSTRAINT [FK_TDetalle_TProducto]
GO
ALTER TABLE [dbo].[TMaestro]  WITH CHECK ADD  CONSTRAINT [FK_TMaestro_TMaestro] FOREIGN KEY([ConUsuario])
REFERENCES [dbo].[TUsuario] ([ConUsuario])
GO
ALTER TABLE [dbo].[TMaestro] CHECK CONSTRAINT [FK_TMaestro_TMaestro]
GO
ALTER TABLE [dbo].[TProducto]  WITH CHECK ADD  CONSTRAINT [FK_TProducto_TCategoria] FOREIGN KEY([Categoria])
REFERENCES [dbo].[TCategoria] ([ConCategoria])
GO
ALTER TABLE [dbo].[TProducto] CHECK CONSTRAINT [FK_TProducto_TCategoria]
GO
ALTER TABLE [dbo].[TUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TUsuario_TProvincia] FOREIGN KEY([ConProvincia])
REFERENCES [dbo].[TProvincia] ([ConProvincia])
GO
ALTER TABLE [dbo].[TUsuario] CHECK CONSTRAINT [FK_TUsuario_TProvincia]
GO
ALTER TABLE [dbo].[TUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TUsuario_TRol] FOREIGN KEY([ConRol])
REFERENCES [dbo].[TRol] ([ConRol])
GO
ALTER TABLE [dbo].[TUsuario] CHECK CONSTRAINT [FK_TUsuario_TRol]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarCuentaSP]    Script Date: 6 dic. 2023 07:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarCuentaSP]
	@Identificacion	VARCHAR(25),
	@Nombre			VARCHAR(250),
	@Correo			VARCHAR(100),
	@ConProvincia	BIGINT,
	@ConUsuario		BIGINT
AS
BEGIN
	
	UPDATE	dbo.TUsuario
	SET		Identificacion = @Identificacion,
			Nombre = @Nombre,
			Correo = @Correo,
			ConProvincia = @ConProvincia
	WHERE	ConUsuario = @ConUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoUsuarioSP]    Script Date: 6 dic. 2023 07:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarEstadoUsuarioSP]
	@ConUsuario BIGINT
AS
BEGIN

	UPDATE	TUsuario
	SET		Estado = (CASE WHEN Estado = 1 THEN 0 ELSE 1 END)
	WHERE	ConUsuario = @ConUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesionSP]    Script Date: 6 dic. 2023 07:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IniciarSesionSP]
	@Correo         varchar(100),
    @Contrasenna    varchar(25)
AS
BEGIN
	
	SELECT ConUsuario,
		   Identificacion,
		   Nombre,
		   Correo,
		   Contrasenna,
		   Estado,
		   P.Descripcion 'DescripcionProvincia',
		   R.Descripcion 'DescripcionRol'
	  FROM dbo.TUsuario	  U
	  INNER JOIN dbo.TRol		R ON U.ConRol = R.ConRol
	  INNER JOIN dbo.TProvincia P ON U.ConProvincia = P.ConProvincia
	  WHERE Correo = @Correo
	  AND   Contrasenna = @Contrasenna
	  AND	Estado = 1

END
GO
/****** Object:  StoredProcedure [dbo].[PagarCarrito]    Script Date: 6 dic. 2023 07:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagarCarrito]
	@ConUsuario BIGINT
AS
BEGIN
	
	IF (SELECT	P.Cantidad - C.Cantidad 
		FROM	TProducto	P
		INNER	JOIN	TCarrito  C	ON P.ConProducto = C.ConProducto
		WHERE	ConUsuario = @ConUsuario) >= 0
	BEGIN

		DECLARE @TotalCompra DECIMAL(18,2)
		DECLARE @CodigoMaestro BIGINT
	
		SELECT	@TotalCompra = SUM(P.Precio * C.Cantidad) + (SUM(P.Precio * C.Cantidad) * 0.13)
		FROM	TCarrito C
		INNER	JOIN TProducto P ON C.ConProducto = P.ConProducto
		WHERE	ConUsuario = @ConUsuario

		INSERT INTO dbo.TMaestro(ConUsuario,FechaCompra,TotalCompra)
		VALUES (@ConUsuario, GETDATE(), @TotalCompra)

		SET @CodigoMaestro = @@IDENTITY

		INSERT INTO dbo.TDetalle(ConMaestro,ConProducto,PrecioPagado,CantidadPagado,ImpuestoPagado)
		SELECT	@CodigoMaestro, C.ConProducto, P.Precio, C.Cantidad, (C.Cantidad * P.Precio) * 0.13
		FROM	TCarrito C
		INNER	JOIN TProducto P ON C.ConProducto = P.ConProducto
		WHERE	ConUsuario = @ConUsuario

		UPDATE	P
		SET		P.Cantidad = P.Cantidad - C.Cantidad
		FROM	TProducto P
		INNER	JOIN TCarrito C ON C.ConProducto = P.ConProducto
		WHERE	ConUsuario = @ConUsuario

		DELETE FROM TCarrito
		WHERE ConUsuario = @ConUsuario

	END

END
GO
/****** Object:  StoredProcedure [dbo].[RecuperarCuentaSP]    Script Date: 6 dic. 2023 07:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RecuperarCuentaSP]
	@Identificacion varchar(25)
AS
BEGIN
	
	SELECT Nombre,
		   Correo,
		   Contrasenna
	  FROM dbo.TUsuario
	  WHERE Identificacion = @Identificacion

END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCuentaSP]    Script Date: 6 dic. 2023 07:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegistrarCuentaSP]
	@Identificacion varchar(25),
    @Nombre         varchar(250),
    @Correo         varchar(100),
    @Contrasenna    varchar(25)
AS
BEGIN

	INSERT INTO dbo.TUsuario (Identificacion,Nombre,Correo,Contrasenna,Estado,ConProvincia,ConRol)
    VALUES (@Identificacion,@Nombre,@Correo,@Contrasenna,1,8,2)

END
GO
USE [master]
GO
ALTER DATABASE [GYM] SET  READ_WRITE 
GO
