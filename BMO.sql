USE [master]
GO
/****** Object:  Database [BMO]    Script Date: 19.04.2023 22:01:20 ******/
CREATE DATABASE [BMO]
GO
ALTER DATABASE [BMO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BMO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BMO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BMO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BMO] SET ARITHABORT OFF 
GO
ALTER DATABASE [BMO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BMO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BMO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BMO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BMO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BMO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BMO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BMO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BMO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BMO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BMO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BMO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BMO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BMO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BMO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BMO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BMO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BMO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BMO] SET  MULTI_USER 
GO
ALTER DATABASE [BMO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BMO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BMO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BMO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BMO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BMO] SET QUERY_STORE = ON
GO
ALTER DATABASE [BMO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [BMO]
GO
/****** Object:  Table [dbo].[EmpPost]    Script Date: 19.04.2023 22:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpPost](
	[EmpPost] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpPost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 19.04.2023 22:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[GoodsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](128) NOT NULL,
	[Descrip] [varchar](max) NOT NULL,
	[Cost] [real] NOT NULL,
	[Amount] [int] NOT NULL,
	[ImagePath] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderGoods]    Script Date: 19.04.2023 22:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderGoods](
	[GoodsId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[OrderGoodsId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_OrderGoods] PRIMARY KEY CLUSTERED 
(
	[OrderGoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19.04.2023 22:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Us_login] [varchar](50) NULL,
	[Us_password] [varchar](max) NULL,
	[EmpPost] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EmpPost] ON 
GO
INSERT [dbo].[EmpPost] ([EmpPost], [Title]) VALUES (1, N'Пользователь')
GO
INSERT [dbo].[EmpPost] ([EmpPost], [Title]) VALUES (2, N'Сотрудник')
GO
INSERT [dbo].[EmpPost] ([EmpPost], [Title]) VALUES (3, N'Админ')
GO
SET IDENTITY_INSERT [dbo].[EmpPost] OFF
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (3, N'Корпус', N'Пластмассовый корпус для вашего любимого БиМО. Такая обновка точно заставит золотое сердечко вашего друга радостно биться!', 55, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (4, N'Экран', N'Экран, который жизненно необходим для БиМО, ведь это главное его средство коммуникации с миром...', 104.5, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (5, N'Аккумулятор', N'Батарейка, необходимая для работы всех функций устройства. Сердечко одно не справится...', 48, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (6, N'Счастливая монетка', N'Монетка на удачу. Чтобы точно работало', 99.99, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (7, N'Золотое сердце', N'Бесценно. И не продается отдельно.', 999.99, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (8, N'Микрофон', N'Уши вашего БиМО. Без него он вас просто не услышит.', 15, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (9, N'Динамик', N'Рот вашего БиМО. Очевидно, для чего он нужен.', 17.5, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (10, N'Кнопочки', N'Кнопочки делают тык. И помогают БиМО лучше вас понять. Цена зависит от количества и типа кнопок.', 10, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (11, N'Материнская плата', N'Если у вашего БиМО сдохла мать... То вы можете просто купить новую.', 85.75, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (12, N'Дополнительные платы', N'Дополнительные платы в асс. Ассортименте, то есть', 56.5, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (13, N'Транзисторы росыпью', N'Если вам нужен кружок любителей радиотехники, то вам нужно в соседний магазин.', 18, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (14, N'Процессор', N'Мозги вашего БиМО. Эти, в отличие от обезъянних лучше не есть. Да и обезъяньи тоже.', 120, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (15, N'Память', N'Забыл, что должен сюда написать...', 62.5, 100, N'Pictures\BmoTEST.jpg')
GO
INSERT [dbo].[Goods] ([GoodsId], [Title], [Descrip], [Cost], [Amount], [ImagePath]) VALUES (17, N'Бета-Бимо', N'Уже выкуплен основными багоделами. Осторожно, отсутствует обработка исключения при делении на ноль', 1452, -1, N'Pictures\BmoTEST.jpg')
GO
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderGoods] ON 
GO
INSERT [dbo].[OrderGoods] ([GoodsId], [UserId], [Amount], [OrderGoodsId]) VALUES (13, 3, 1, 47)
GO
INSERT [dbo].[OrderGoods] ([GoodsId], [UserId], [Amount], [OrderGoodsId]) VALUES (4, 3, 1, 48)
GO
INSERT [dbo].[OrderGoods] ([GoodsId], [UserId], [Amount], [OrderGoodsId]) VALUES (3, 3, 1, 49)
GO
INSERT [dbo].[OrderGoods] ([GoodsId], [UserId], [Amount], [OrderGoodsId]) VALUES (4, 8, 1, 81)
GO
SET IDENTITY_INSERT [dbo].[OrderGoods] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [Us_login], [Us_password], [EmpPost]) VALUES (1, N'Tutoff', N'2567', 3)
GO
INSERT [dbo].[Users] ([UserID], [Us_login], [Us_password], [EmpPost]) VALUES (2, N'Egorka', N'6633', 2)
GO
INSERT [dbo].[Users] ([UserID], [Us_login], [Us_password], [EmpPost]) VALUES (3, N'Polinka', N'4080', 2)
GO
INSERT [dbo].[Users] ([UserID], [Us_login], [Us_password], [EmpPost]) VALUES (4, N'Nestor', N'5180', 3)
GO
INSERT [dbo].[Users] ([UserID], [Us_login], [Us_password], [EmpPost]) VALUES (5, N'Vladislav', N'1234567', 1)
GO
INSERT [dbo].[Users] ([UserID], [Us_login], [Us_password], [EmpPost]) VALUES (6, N'EgorkinaMama', N'1234567', 1)
GO
INSERT [dbo].[Users] ([UserID], [Us_login], [Us_password], [EmpPost]) VALUES (7, N'Мать69', N'123456', 1)
GO
INSERT [dbo].[Users] ([UserID], [Us_login], [Us_password], [EmpPost]) VALUES (8, N'qwertyui', N'12345678', 1)
GO
INSERT [dbo].[Users] ([UserID], [Us_login], [Us_password], [EmpPost]) VALUES (9, N'89885010500', N'12345678', 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Goods] ADD  DEFAULT ('Описание отсутствует') FOR [Descrip]
GO
ALTER TABLE [dbo].[Goods] ADD  DEFAULT ((100)) FOR [Amount]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [EmpPost]
GO
ALTER TABLE [dbo].[OrderGoods]  WITH CHECK ADD  CONSTRAINT [FK__OrderGood__Goods__4E88ABD4] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([GoodsId])
GO
ALTER TABLE [dbo].[OrderGoods] CHECK CONSTRAINT [FK__OrderGood__Goods__4E88ABD4]
GO
ALTER TABLE [dbo].[OrderGoods]  WITH CHECK ADD  CONSTRAINT [FK__OrderGood__UserI__4F7CD00D] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[OrderGoods] CHECK CONSTRAINT [FK__OrderGood__UserI__4F7CD00D]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([EmpPost])
REFERENCES [dbo].[EmpPost] ([EmpPost])
GO
USE [master]
GO
ALTER DATABASE [BMO] SET  READ_WRITE 
GO
