USE [EquipmentRent]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](75) NOT NULL,
	[LastName] [nvarchar](75) NOT NULL,
	[Patronymic] [nvarchar](75) NULL,
	[BirthDate] [datetime] NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[GenderID] [int] NOT NULL,
	[PassportID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ProfilePhoto] [varbinary](max) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientEquipment]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientEquipment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[IssueTimestamp] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ClientEquipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](75) NOT NULL,
	[LastName] [nvarchar](75) NOT NULL,
	[Patronymic] [nvarchar](75) NULL,
	[PhoneNumber] [nchar](20) NOT NULL,
	[Email] [nchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeRole]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeRole](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EmployeeRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Name] [nvarchar](75) NOT NULL,
	[Price] [decimal](9, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentStatus]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentStatus](
	[ID] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EquipmentStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentType]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](75) NOT NULL,
 CONSTRAINT [PK_EquipmentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientEquipmentID] [int] NOT NULL,
	[RentStart] [datetime] NOT NULL,
	[RentEnd] [datetime] NOT NULL,
	[ReturnTime] [datetime] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passport]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PassportTypeID] [int] NOT NULL,
	[PassportNumber] [nvarchar](10) NOT NULL,
	[PassportSeries] [nvarchar](15) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Passport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PassportType]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PassportType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PassportType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (204, N'Артём', N'Сальников', N'Михайлович', CAST(N'1993-11-06T00:00:00.000' AS DateTime), N'7(34)838-72-95', N'chunzi@aol.com', 1, 4, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (208, N'Александр', N'Семенов', N'Максимович', CAST(N'1990-09-07T00:00:00.000' AS DateTime), N'7(72)067-55-31', N'fangorn@msn.com', 1, 8, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (209, N'Игорь', N'Соловьев', N'Павлович', CAST(N'1995-06-10T00:00:00.000' AS DateTime), N'7(48)086-06-12', N'jonadab@mac.com', 1, 9, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (211, N'Диана', N'Гончарова', N'Даниловна', CAST(N'1997-07-02T00:00:00.000' AS DateTime), N'7(82)473-58-74', N'lbaxter@gmail.com', 2, 11, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (215, N'Мария', N'Иванова', N'Александровна', CAST(N'2002-02-07T00:00:00.000' AS DateTime), N'7(5323)576-81-91', N'dgatwood@comcast.net', 2, 15, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (217, N'Дарья', N'Смирнова', N'Кирилловна', CAST(N'1996-06-01T00:00:00.000' AS DateTime), N'7(0160)658-98-44', N'larry@msn.com', 2, 17, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (221, N'Кира', N'Боброва', N'Алексеевна', CAST(N'1991-01-08T00:00:00.000' AS DateTime), N'7(10)587-97-81', N'bader@me.com', 2, 21, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (222, N'Тимофей', N'Константинов', N'Егорович', CAST(N'1997-02-05T00:00:00.000' AS DateTime), N'7(048)270-96-60', N'arandal@comcast.net', 1, 22, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (226, N'Роман', N'Михеев', N'Савельевич', CAST(N'2000-02-08T00:00:00.000' AS DateTime), N'7(253)837-14-12', N'sblack@msn.com', 1, 26, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (228, N'Мария', N'Рыжова', N'Тимофеевна', CAST(N'1993-05-10T00:00:00.000' AS DateTime), N'7(43)694-22-95', N'boein@att.net', 2, 28, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (232, N'Гордей', N'Фирсов', N'Иванович', CAST(N'1992-07-12T00:00:00.000' AS DateTime), N'7(126)815-71-26', N'simone@icloud.com', 1, 32, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (235, N'Тимур', N'Зайцев', N'Даниилович', CAST(N'1999-05-02T00:00:00.000' AS DateTime), N'7(84)003-78-82', N'uncle@hotmail.com', 1, 35, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (239, N'Виктория', N'Кукушкина', N'Васильевна', CAST(N'2002-02-06T00:00:00.000' AS DateTime), N'7(91)742-74-81', N'timlinux@icloud.com', 2, 39, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (240, N'Лев', N'Лобанов', N'Тимурович', CAST(N'1997-10-01T00:00:00.000' AS DateTime), N'7(57)418-85-96', N'retoh@me.com', 1, 40, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (241, N'Тихон', N'Косарев', N'Русланович', CAST(N'1990-09-09T00:00:00.000' AS DateTime), N'7(9222)683-88-40', N'killmenow@comcast.net', 1, 41, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (244, N'Дмитрий', N'Быков', N'Владиславович', CAST(N'2002-05-08T00:00:00.000' AS DateTime), N'7(43)319-36-87', N'matty@me.com', 1, 44, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (245, N'Александр', N'Ларин', N'Дмитриевич', CAST(N'2000-09-05T00:00:00.000' AS DateTime), N'7(2848)537-86-76', N'malin@verizon.net', 1, 45, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (247, N'Глеб', N'Кузнецов', N'Иванович', CAST(N'1996-08-08T00:00:00.000' AS DateTime), N'7(2779)981-74-60', N'crowl@hotmail.com', 1, 47, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (250, N'Николь', N'Григорьева', N'Ильинична', CAST(N'1997-08-10T00:00:00.000' AS DateTime), N'7(7705)763-23-23', N'noneme@me.com', 1, 50, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (251, N'Константин', N'Павлов', N'Максимович', CAST(N'1996-01-12T00:00:00.000' AS DateTime), N'7(67)504-99-82', N'kohlis@sbcglobal.net', 1, 51, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (253, N'Елизавета', N'Иванова', N'Максимовна', CAST(N'1990-04-03T00:00:00.000' AS DateTime), N'7(296)207-98-64', N'andersbr@att.net', 2, 53, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (254, N'Маргарита', N'Козлова', N'Александровна', CAST(N'1999-08-06T00:00:00.000' AS DateTime), N'7(0388)529-28-18', N'bigmauler@att.net', 2, 54, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (256, N'Давид', N'Лазарев', N'Матвеевич', CAST(N'1992-11-07T00:00:00.000' AS DateTime), N'7(39)938-07-78', N'pakaste@verizon.net', 1, 56, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (261, N'Евангелина', N'Ильинская', N'Марковна', CAST(N'1996-05-06T00:00:00.000' AS DateTime), N'7(453)637-73-11', N'carmena@hotmail.com', 2, 61, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (266, N'Демид', N'Добрынин', N'Александрович', CAST(N'1997-10-10T00:00:00.000' AS DateTime), N'7(889)162-77-87', N'jaffe@gmail.com', 1, 66, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (268, N'Анна', N'Тарасова', N'Евгеньевна', CAST(N'1999-02-11T00:00:00.000' AS DateTime), N'7(79)183-77-27', N'meinkej@hotmail.com', 2, 68, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (271, N'Платон', N'Селиванов', N'Артёмович', CAST(N'1993-02-02T00:00:00.000' AS DateTime), N'7(45)177-10-03', N'bogjobber@hotmail.com', 1, 71, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (272, N'Арина', N'Казакова', N'Ивановна', CAST(N'1996-10-09T00:00:00.000' AS DateTime), N'7(24)079-57-23', N'gslondon@live.com', 2, 72, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (276, N'Лев', N'Кулаков', N'Львович', CAST(N'2002-01-08T00:00:00.000' AS DateTime), N'7(064)787-00-24', N'djpig@icloud.com', 1, 76, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (279, N'Полина', N'Воронцова', N'Олеговна', CAST(N'1990-10-07T00:00:00.000' AS DateTime), N'7(741)441-83-47', N'yfreund@gmail.com', 2, 79, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (281, N'Андрей', N'Соловьев', N'Давидович', CAST(N'1994-05-01T00:00:00.000' AS DateTime), N'7(6827)228-96-06', N'eabrown@yahoo.com', 1, 81, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (282, N'Артём', N'Семенов', N'Дмитриевич', CAST(N'1993-06-08T00:00:00.000' AS DateTime), N'7(48)826-01-99', N'kudra@hotmail.com', 1, 82, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (285, N'Дарья', N'Егорова', N'Ильинична', CAST(N'2001-12-04T00:00:00.000' AS DateTime), N'7(3195)906-09-80', N'malin@mac.com', 2, 85, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (287, N'Марк', N'Александров', N'Никитич', CAST(N'1995-01-08T00:00:00.000' AS DateTime), N'7(37)373-21-51', N'lushe@att.net', 1, 87, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (288, N'Евгения', N'Матвеева', N'Максимовна', CAST(N'1999-10-01T00:00:00.000' AS DateTime), N'7(6173)712-01-96', N'arachne@aol.com', 2, 88, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (290, N'Никита', N'Виноградов', N'Иванович', CAST(N'1995-06-07T00:00:00.000' AS DateTime), N'7(546)637-81-09', N'moxfulder@yahoo.ca', 1, 90, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (293, N'Вероника', N'Новикова', N'Юрьевна', CAST(N'1994-01-11T00:00:00.000' AS DateTime), N'7(527)268-46-36', N'stewwy@aol.com', 2, 93, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (296, N'Виктор', N'Трофимов', N'Иванович', CAST(N'1992-12-01T00:00:00.000' AS DateTime), N'7(749)766-07-37', N'lamprecht@gmail.com', 1, 96, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (298, N'Милана', N'Орлова', N'Артёмовна', CAST(N'1999-08-11T00:00:00.000' AS DateTime), N'7(785)916-65-60', N'kmiller@icloud.com', 2, 98, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (299, N'Илья', N'Комаров', N'Кириллович', CAST(N'1998-02-10T00:00:00.000' AS DateTime), N'7(27)010-43-74', N'osaru@yahoo.com', 1, 99, 0)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [BirthDate], [PhoneNumber], [Email], [GenderID], [PassportID], [IsDeleted]) VALUES (301, N'мяу', N'мяу', N'мяу', CAST(N'2013-05-17T00:00:00.000' AS DateTime), N'+2305991044', N'zzz@zzz.zzz', 2, 101, 1)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Patronymic], [PhoneNumber], [Email], [RoleID], [Login], [Password], [IsDeleted]) VALUES (26, N'Мирослав', N'Журавлев', N'Даниилович', N'7(4965)990-19-24    ', N'leviathan@me.com                                  ', 3, N'Shanklinar', N'kqW-nvcdppRvvA1v', 0)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Patronymic], [PhoneNumber], [Email], [RoleID], [Login], [Password], [IsDeleted]) VALUES (27, N'Артур', N'Соколов', N'Александрович', N'7(2608)007-96-06    ', N'wildfire@outlook.com                              ', 2, N'Byland', N'94GVoxBHk98_UeDv', 0)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Patronymic], [PhoneNumber], [Email], [RoleID], [Login], [Password], [IsDeleted]) VALUES (28, N'Артём', N'Блинов', N'Дмитриевич', N'7(770)645-30-23     ', N'ebassi@verizon.net                                ', 3, N'Err', N'_yYCVGqPSE-PXe89', 0)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Patronymic], [PhoneNumber], [Email], [RoleID], [Login], [Password], [IsDeleted]) VALUES (29, N'Илья', N'Орлов', N'Андреевич', N'7(3596)895-87-88    ', N'grinder@gmail.com                                 ', 3, N'Eena', N'jwSm1J8c0ZP1-f39', 0)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Patronymic], [PhoneNumber], [Email], [RoleID], [Login], [Password], [IsDeleted]) VALUES (30, N'Амелия', N'Орлова', N'Тимофеевна', N'7(5845)031-00-85    ', N'chaffar@msn.com                                   ', 2, N'Ynd', N'ZDEhFHAnG1doS-B4', 0)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Patronymic], [PhoneNumber], [Email], [RoleID], [Login], [Password], [IsDeleted]) VALUES (31, N'Вероника', N'Митрофанова', N'Мирославовна', N'7(258)521-49-03     ', N'biglou@verizon.net                                ', 3, N'Mishnav', N'ECZweKJwbHB60YB_', 0)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Patronymic], [PhoneNumber], [Email], [RoleID], [Login], [Password], [IsDeleted]) VALUES (32, N'Максим', N'Пономарев', N'Маркович', N'7(6154)209-66-47    ', N'njpayne@comcast.net                               ', 3, N'Callo', N'KZC5Dj3s8yd_DfKR', 0)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Patronymic], [PhoneNumber], [Email], [RoleID], [Login], [Password], [IsDeleted]) VALUES (33, N'Милана', N'Левина', N'Святославовна', N'7(6794)579-43-46    ', N'dprice@att.net                                    ', 3, N'Quasiahamuso', N'BrmR70_gu3tMeOc4', 0)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Patronymic], [PhoneNumber], [Email], [RoleID], [Login], [Password], [IsDeleted]) VALUES (34, N'Виктория', N'Карпова', N'Егоровна', N'7(965)425-97-52     ', N'weazelman@att.net                                 ', 3, N'Tonielea', N'_c76l2oaRXbGkx6d', 0)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Patronymic], [PhoneNumber], [Email], [RoleID], [Login], [Password], [IsDeleted]) VALUES (35, N'Александр', N'Симонов', N'Демидович', N'7(5949)354-30-78    ', N'ebassi@gmail.com                                  ', 3, N'Cesce', N'MXDVqRd72ckAc-1G', 0)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Patronymic], [PhoneNumber], [Email], [RoleID], [Login], [Password], [IsDeleted]) VALUES (36, N'Test', N'Test', N'Test', N'7(777)777-77-77     ', N'testtest@test.test                                ', 1, N'a', N'a', 0)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[EmployeeRole] ([ID], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[EmployeeRole] ([ID], [Name]) VALUES (2, N'Менеджер')
INSERT [dbo].[EmployeeRole] ([ID], [Name]) VALUES (3, N'Работник')
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([ID], [TypeID], [StatusID], [Name], [Price], [IsDeleted]) VALUES (1, 1, 3, N'Дрель', CAST(3000.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[Equipment] ([ID], [TypeID], [StatusID], [Name], [Price], [IsDeleted]) VALUES (2, 1, 3, N'Шуруповерт', CAST(1700.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[Equipment] ([ID], [TypeID], [StatusID], [Name], [Price], [IsDeleted]) VALUES (3, 2, 3, N'Каска', CAST(250.00 AS Decimal(9, 2)), 0)
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
INSERT [dbo].[EquipmentStatus] ([ID], [Status]) VALUES (1, N'Забронировано')
INSERT [dbo].[EquipmentStatus] ([ID], [Status]) VALUES (2, N'В аренде')
INSERT [dbo].[EquipmentStatus] ([ID], [Status]) VALUES (3, N'В наличии')
INSERT [dbo].[EquipmentStatus] ([ID], [Status]) VALUES (4, N'Потеряно')
INSERT [dbo].[EquipmentStatus] ([ID], [Status]) VALUES (5, N'Неисправно')
GO
INSERT [dbo].[EquipmentType] ([ID], [Name]) VALUES (1, N'Инструмент')
INSERT [dbo].[EquipmentType] ([ID], [Name]) VALUES (2, N'Экипировка')
INSERT [dbo].[EquipmentType] ([ID], [Name]) VALUES (3, N'Деталь')
INSERT [dbo].[EquipmentType] ([ID], [Name]) VALUES (4, N'Набор')
GO
INSERT [dbo].[Gender] ([ID], [Name]) VALUES (1, N'Мужской')
INSERT [dbo].[Gender] ([ID], [Name]) VALUES (2, N'Женский')
GO
SET IDENTITY_INSERT [dbo].[Passport] ON 

INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (1, 1, N'9043749', N'6491', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (2, 1, N'5927923', N'4315', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (3, 1, N'5982897', N'2661', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (4, 1, N'1771256', N'5481', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (5, 1, N'2611877', N'1554', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (6, 1, N'2746008', N'9836', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (7, 1, N'9283081', N'9680', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (8, 1, N'5043902', N'1933', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (9, 1, N'8661532', N'6566', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (10, 1, N'2577771', N'6738', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (11, 1, N'3466737', N'8439', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (12, 1, N'8710532', N'6466', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (13, 1, N'9533235', N'8276', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (14, 1, N'8809175', N'8303', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (15, 1, N'6322535', N'1801', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (16, 1, N'8246832', N'8790', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (17, 1, N'4845503', N'7921', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (18, 1, N'3088879', N'6016', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (19, 1, N'8393315', N'8243', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (20, 1, N'2137111', N'2611', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (21, 1, N'5899787', N'6288', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (22, 1, N'3504300', N'9597', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (23, 1, N'6579833', N'9569', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (24, 1, N'8717926', N'2453', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (25, 1, N'7556018', N'1527', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (26, 1, N'6194045', N'6413', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (27, 1, N'5452723', N'7027', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (28, 1, N'2532346', N'7822', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (29, 1, N'1645914', N'5114', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (30, 1, N'5575234', N'1021', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (31, 1, N'7095973', N'8216', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (32, 1, N'1085147', N'5684', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (33, 1, N'9084907', N'9941', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (34, 1, N'5471623', N'9114', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (35, 1, N'7867163', N'6876', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (36, 1, N'8738412', N'7835', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (37, 1, N'7997509', N'4110', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (38, 1, N'5438714', N'5293', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (39, 1, N'9326601', N'5539', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (40, 1, N'4153280', N'9525', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (41, 1, N'8778496', N'8477', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (42, 1, N'7005290', N'7158', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (43, 1, N'4999440', N'2119', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (44, 1, N'2250321', N'2842', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (45, 1, N'8007732', N'1759', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (46, 1, N'1860640', N'7858', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (47, 1, N'1572988', N'4198', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (48, 1, N'1708878', N'5666', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (49, 1, N'5854192', N'3972', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (50, 1, N'6506512', N'6176', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (51, 1, N'9303520', N'6568', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (52, 1, N'9280660', N'1096', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (53, 1, N'8702766', N'3976', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (54, 1, N'3301657', N'5217', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (55, 1, N'4335563', N'4263', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (56, 1, N'9021350', N'9954', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (57, 1, N'9100200', N'4289', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (58, 1, N'6274527', N'7153', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (59, 1, N'4890483', N'6055', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (60, 1, N'4260584', N'9141', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (61, 1, N'8370954', N'7240', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (62, 1, N'3052126', N'9731', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (63, 1, N'3455243', N'6492', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (64, 1, N'1365207', N'1376', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (65, 1, N'6740156', N'8926', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (66, 1, N'5754449', N'1444', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (67, 1, N'6765731', N'7461', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (68, 1, N'3509346', N'1228', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (69, 1, N'1211501', N'9168', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (70, 1, N'7024420', N'8664', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (71, 1, N'9611731', N'2713', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (72, 1, N'8521656', N'6281', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (73, 1, N'5460038', N'3349', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (74, 1, N'5281163', N'3881', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (75, 1, N'7982241', N'3267', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (76, 1, N'2229281', N'9415', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (77, 1, N'1856251', N'9233', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (78, 1, N'9867674', N'5506', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (79, 1, N'3019831', N'8281', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (80, 1, N'5782559', N'6680', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (81, 1, N'8736195', N'1203', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (82, 1, N'8246297', N'2814', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (83, 1, N'9262870', N'5965', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (84, 1, N'6859643', N'1913', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (85, 1, N'1771670', N'2054', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (86, 1, N'5952058', N'3828', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (87, 1, N'4917556', N'4387', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (88, 1, N'9839742', N'6494', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (89, 1, N'4436322', N'7727', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (90, 1, N'3384905', N'2025', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (91, 1, N'5600870', N'6354', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (92, 1, N'4773617', N'6104', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (93, 1, N'2202904', N'8096', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (94, 1, N'1104874', N'2596', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (95, 1, N'4783275', N'8150', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (96, 1, N'3616489', N'1636', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (97, 1, N'4669649', N'5254', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (98, 1, N'7885179', N'4708', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (99, 1, N'1836550', N'5299', 0)
GO
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (100, 1, N'4441732', N'8011', 0)
INSERT [dbo].[Passport] ([ID], [PassportTypeID], [PassportNumber], [PassportSeries], [IsDeleted]) VALUES (101, 2, N'654321', N'1111', 1)
SET IDENTITY_INSERT [dbo].[Passport] OFF
GO
INSERT [dbo].[PassportType] ([ID], [Name]) VALUES (1, N'Внутренний паспорт')
INSERT [dbo].[PassportType] ([ID], [Name]) VALUES (2, N'Заграничный паспорт')
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ClientEquipment] ADD  CONSTRAINT [DF_ClientEquipment_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Equipment] ADD  CONSTRAINT [DF_Equipment_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Passport] ADD  CONSTRAINT [DF_Passport_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Passport] FOREIGN KEY([PassportID])
REFERENCES [dbo].[Passport] ([ID])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Passport]
GO
ALTER TABLE [dbo].[ClientEquipment]  WITH CHECK ADD  CONSTRAINT [FK_ClientEquipment_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientEquipment] CHECK CONSTRAINT [FK_ClientEquipment_Client]
GO
ALTER TABLE [dbo].[ClientEquipment]  WITH CHECK ADD  CONSTRAINT [FK_ClientEquipment_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[ClientEquipment] CHECK CONSTRAINT [FK_ClientEquipment_Employee]
GO
ALTER TABLE [dbo].[ClientEquipment]  WITH CHECK ADD  CONSTRAINT [FK_ClientEquipment_Equipment] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([ID])
GO
ALTER TABLE [dbo].[ClientEquipment] CHECK CONSTRAINT [FK_ClientEquipment_Equipment]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[EmployeeRole] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeRole]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_EquipmentStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[EquipmentStatus] ([ID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_EquipmentStatus]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_EquipmentType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[EquipmentType] ([ID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_EquipmentType]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_ClientEquipment] FOREIGN KEY([ClientEquipmentID])
REFERENCES [dbo].[ClientEquipment] ([ID])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_ClientEquipment]
GO
ALTER TABLE [dbo].[Passport]  WITH CHECK ADD  CONSTRAINT [FK_Passport_PassportType] FOREIGN KEY([PassportTypeID])
REFERENCES [dbo].[PassportType] ([ID])
GO
ALTER TABLE [dbo].[Passport] CHECK CONSTRAINT [FK_Passport_PassportType]
GO
/****** Object:  Trigger [dbo].[TR_Client_SoftDelete]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   trigger [dbo].[TR_Client_SoftDelete] on [dbo].[Client]
instead of delete as
begin
	update [Client]
	set IsDeleted = 1
	where ID in (select ID from deleted)

	update Passport
	set IsDeleted = 1
	where ID in (select PassportID from deleted)
end
GO
ALTER TABLE [dbo].[Client] ENABLE TRIGGER [TR_Client_SoftDelete]
GO
/****** Object:  Trigger [dbo].[TR_ClientEquipment_SoftDelete]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[TR_ClientEquipment_SoftDelete] on [dbo].[ClientEquipment]
instead of delete as
begin
	update ClientEquipment
	set IsDeleted = 1
	where ID in (select ID from deleted)
end
GO
ALTER TABLE [dbo].[ClientEquipment] ENABLE TRIGGER [TR_ClientEquipment_SoftDelete]
GO
/****** Object:  Trigger [dbo].[TR_Employee_SoftDelete]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[TR_Employee_SoftDelete] on [dbo].[Employee]
instead of delete as
begin
	update Employee
	set IsDeleted = 1
	where ID in (select ID from deleted)
end
GO
ALTER TABLE [dbo].[Employee] ENABLE TRIGGER [TR_Employee_SoftDelete]
GO
/****** Object:  Trigger [dbo].[TR_Equipment_SoftDelete]    Script Date: 24.02.2022 10:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[TR_Equipment_SoftDelete] on [dbo].[Equipment]
instead of delete as
begin
	update Equipment
	set IsDeleted = 1
	where ID in (select ID from deleted)
end
GO
ALTER TABLE [dbo].[Equipment] ENABLE TRIGGER [TR_Equipment_SoftDelete]
GO
