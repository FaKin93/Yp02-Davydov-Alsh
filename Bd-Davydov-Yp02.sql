USE [master]
GO
/****** Object:  Database [BuissnesManagement]    Script Date: 19.12.2024 17:01:59 ******/
CREATE DATABASE [BuissnesManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BuissnesManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\BuissnesManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BuissnesManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\BuissnesManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BuissnesManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BuissnesManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BuissnesManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BuissnesManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BuissnesManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BuissnesManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BuissnesManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [BuissnesManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BuissnesManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BuissnesManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BuissnesManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BuissnesManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BuissnesManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BuissnesManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BuissnesManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BuissnesManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BuissnesManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BuissnesManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BuissnesManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BuissnesManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BuissnesManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BuissnesManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BuissnesManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BuissnesManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BuissnesManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BuissnesManagement] SET  MULTI_USER 
GO
ALTER DATABASE [BuissnesManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BuissnesManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BuissnesManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BuissnesManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BuissnesManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BuissnesManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BuissnesManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [BuissnesManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BuissnesManagement]
GO
/****** Object:  Table [dbo].[Material_type]    Script Date: 19.12.2024 17:01:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_type](
	[ID_type_material] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](max) NULL,
	[Procent_material] [float] NULL,
 CONSTRAINT [PK_Material_type] PRIMARY KEY CLUSTERED 
(
	[ID_type_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_products]    Script Date: 19.12.2024 17:01:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_products](
	[ID_partner_products] [int] IDENTITY(1,1) NOT NULL,
	[ID_Products] [int] NULL,
	[ID_Partners] [int] NULL,
	[Num_of_products] [bigint] NULL,
	[Date_of_sale] [date] NULL,
 CONSTRAINT [PK_Partner_products] PRIMARY KEY CLUSTERED 
(
	[ID_partner_products] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_type]    Script Date: 19.12.2024 17:01:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_type](
	[ID_Type] [int] IDENTITY(1,1) NOT NULL,
	[Name_Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Partner_type] PRIMARY KEY CLUSTERED 
(
	[ID_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 19.12.2024 17:01:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[ID_partner] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Director_name] [varchar](max) NOT NULL,
	[Director_middle_name] [varchar](max) NOT NULL,
	[Director_last_name] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[Phone] [varchar](max) NOT NULL,
	[Adress] [varchar](max) NOT NULL,
	[INN] [bigint] NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[ID_partner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_type]    Script Date: 19.12.2024 17:01:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_type](
	[ID_type_product] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](max) NULL,
	[Сoefficient_product] [float] NULL,
 CONSTRAINT [PK_Product_type] PRIMARY KEY CLUSTERED 
(
	[ID_type_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 19.12.2024 17:01:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID_product] [int] IDENTITY(1,1) NOT NULL,
	[ID_type_products] [int] NULL,
	[ID_type_material] [int] NULL,
	[Name_products] [varchar](max) NULL,
	[Number] [int] NULL,
	[Min_cost] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material_type] ON 

INSERT [dbo].[Material_type] ([ID_type_material], [Type], [Procent_material]) VALUES (1, N'1', 0.001)
INSERT [dbo].[Material_type] ([ID_type_material], [Type], [Procent_material]) VALUES (2, N'2', 0.0095)
INSERT [dbo].[Material_type] ([ID_type_material], [Type], [Procent_material]) VALUES (3, N'3', 0.0028)
INSERT [dbo].[Material_type] ([ID_type_material], [Type], [Procent_material]) VALUES (4, N'4', 0.0055)
INSERT [dbo].[Material_type] ([ID_type_material], [Type], [Procent_material]) VALUES (5, N'5', 0.0034)
SET IDENTITY_INSERT [dbo].[Material_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Partner_products] ON 

INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[Partner_products] ([ID_partner_products], [ID_Products], [ID_Partners], [Num_of_products], [Date_of_sale]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[Partner_products] OFF
GO
SET IDENTITY_INSERT [dbo].[Partner_type] ON 

INSERT [dbo].[Partner_type] ([ID_Type], [Name_Type]) VALUES (1, N'ЗАО')
INSERT [dbo].[Partner_type] ([ID_Type], [Name_Type]) VALUES (2, N'ПАО')
INSERT [dbo].[Partner_type] ([ID_Type], [Name_Type]) VALUES (3, N'ООО')
INSERT [dbo].[Partner_type] ([ID_Type], [Name_Type]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[Partner_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([ID_partner], [Type], [Name], [Director_name], [Director_middle_name], [Director_last_name], [Email], [Phone], [Adress], [INN], [Rating]) VALUES (1, 2, N'База Строитель', N'Иванова', N'Александра', N'Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', 2222455179, 10)
INSERT [dbo].[Partners] ([ID_partner], [Type], [Name], [Director_name], [Director_middle_name], [Director_last_name], [Email], [Phone], [Adress], [INN], [Rating]) VALUES (2, 3, N'Паркет 29', N'Петров', N'Василий', N'Петрович', N'vppetrov@vl.ru', N'987 123 56 78', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', 3333888520, 7)
INSERT [dbo].[Partners] ([ID_partner], [Type], [Name], [Director_name], [Director_middle_name], [Director_last_name], [Email], [Phone], [Adress], [INN], [Rating]) VALUES (3, 2, N'Стройсервис', N'Соловьев', N'Андрей', N'Николаевич', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', 4440391035, 8)
INSERT [dbo].[Partners] ([ID_partner], [Type], [Name], [Director_name], [Director_middle_name], [Director_last_name], [Email], [Phone], [Adress], [INN], [Rating]) VALUES (4, 4, N'Ремонт и отделка', N'Воробьева', N'Екатерина', N'Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', 1111520857, 5)
INSERT [dbo].[Partners] ([ID_partner], [Type], [Name], [Director_name], [Director_middle_name], [Director_last_name], [Email], [Phone], [Adress], [INN], [Rating]) VALUES (5, 1, N'МонтажПро', N'Степанов', N'Степан', N'Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', 5552431140, 10)
INSERT [dbo].[Partners] ([ID_partner], [Type], [Name], [Director_name], [Director_middle_name], [Director_last_name], [Email], [Phone], [Adress], [INN], [Rating]) VALUES (6, 1, N'sadf', N'sadf', N'sadf', N'sadf', N'dsaf', N'234', N'asdf', 0, 2)
INSERT [dbo].[Partners] ([ID_partner], [Type], [Name], [Director_name], [Director_middle_name], [Director_last_name], [Email], [Phone], [Adress], [INN], [Rating]) VALUES (7, 1, N'qwer', N'wqc', N'qwcsad', N'vzcv', N'sad', N'2134', N'qwer', 0, 2)
INSERT [dbo].[Partners] ([ID_partner], [Type], [Name], [Director_name], [Director_middle_name], [Director_last_name], [Email], [Phone], [Adress], [INN], [Rating]) VALUES (8, 4, N'ggrtb', N'kyt', N'tyumn ', N'thj', N'rtujut', N'rt yu ', N'ytu', 0, 20)
INSERT [dbo].[Partners] ([ID_partner], [Type], [Name], [Director_name], [Director_middle_name], [Director_last_name], [Email], [Phone], [Adress], [INN], [Rating]) VALUES (9, 3, N'sdfvdsvczd', N'csad', N'sadc', N'adsc', N'adsf', N'893 022 32 33', N'asdf', 0, 3)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_type] ON 

INSERT [dbo].[Product_type] ([ID_type_product], [Type], [Сoefficient_product]) VALUES (1, N'Ламинат', 2.35)
INSERT [dbo].[Product_type] ([ID_type_product], [Type], [Сoefficient_product]) VALUES (2, N'Массивная доска', 5.15)
INSERT [dbo].[Product_type] ([ID_type_product], [Type], [Сoefficient_product]) VALUES (3, N'Паркетная доска', 4.34)
INSERT [dbo].[Product_type] ([ID_type_product], [Type], [Сoefficient_product]) VALUES (4, N'Пробковое покрытие', 1.5)
SET IDENTITY_INSERT [dbo].[Product_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID_product], [ID_type_products], [ID_type_material], [Name_products], [Number], [Min_cost]) VALUES (1, 3, NULL, N'Паркетная доска Ясень темный однополосная 14 мм', 8758385, 4456.9)
INSERT [dbo].[Products] ([ID_product], [ID_type_products], [ID_type_material], [Name_products], [Number], [Min_cost]) VALUES (2, 3, NULL, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 8858958, 7330.99)
INSERT [dbo].[Products] ([ID_product], [ID_type_products], [ID_type_material], [Name_products], [Number], [Min_cost]) VALUES (3, 1, NULL, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 7750282, 1799.33)
INSERT [dbo].[Products] ([ID_product], [ID_type_products], [ID_type_material], [Name_products], [Number], [Min_cost]) VALUES (4, 1, NULL, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 7028748, 3890.41)
INSERT [dbo].[Products] ([ID_product], [ID_type_products], [ID_type_material], [Name_products], [Number], [Min_cost]) VALUES (5, 4, NULL, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 5012543, 5450.59)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Partner_products]  WITH CHECK ADD  CONSTRAINT [FK_Partner_products_Partners] FOREIGN KEY([ID_Partners])
REFERENCES [dbo].[Partners] ([ID_partner])
GO
ALTER TABLE [dbo].[Partner_products] CHECK CONSTRAINT [FK_Partner_products_Partners]
GO
ALTER TABLE [dbo].[Partner_products]  WITH CHECK ADD  CONSTRAINT [FK_Partner_products_Products] FOREIGN KEY([ID_Products])
REFERENCES [dbo].[Products] ([ID_product])
GO
ALTER TABLE [dbo].[Partner_products] CHECK CONSTRAINT [FK_Partner_products_Products]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_Partner_type] FOREIGN KEY([Type])
REFERENCES [dbo].[Partner_type] ([ID_Type])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_Partner_type]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Material_type] FOREIGN KEY([ID_type_material])
REFERENCES [dbo].[Material_type] ([ID_type_material])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Material_type]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Product_type] FOREIGN KEY([ID_type_products])
REFERENCES [dbo].[Product_type] ([ID_type_product])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Product_type]
GO
USE [master]
GO
ALTER DATABASE [BuissnesManagement] SET  READ_WRITE 
GO
