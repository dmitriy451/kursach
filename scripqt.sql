USE [master]
GO
/****** Object:  Database [Учет посещаемости2]    Script Date: 08.12.2022 5:40:07 ******/
CREATE DATABASE [Учет посещаемости2]
 CONTAINMENT = NONE
 GO
ALTER DATABASE [Учет посещаемости2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Учет посещаемости2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Учет посещаемости2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Учет посещаемости2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Учет посещаемости2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Учет посещаемости2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Учет посещаемости2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET RECOVERY FULL 
GO
ALTER DATABASE [Учет посещаемости2] SET  MULTI_USER 
GO
ALTER DATABASE [Учет посещаемости2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Учет посещаемости2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Учет посещаемости2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Учет посещаемости2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Учет посещаемости2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Учет посещаемости2', N'ON'
GO
ALTER DATABASE [Учет посещаемости2] SET QUERY_STORE = OFF
GO
USE [Учет посещаемости2]
GO
/****** Object:  Table [dbo].[Группы]    Script Date: 08.12.2022 5:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Группы](
	[ID группы] [int] IDENTITY(1,1) NOT NULL,
	[Название группы] [nvarchar](max) NOT NULL,
	[Тип обучения] [nvarchar](max) NOT NULL,
	[Классный руководитель] [int] NOT NULL,
 CONSTRAINT [PK_Группы] PRIMARY KEY CLUSTERED 
(
	[ID группы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Дисциплины]    Script Date: 08.12.2022 5:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Дисциплины](
	[ID дисциплины] [int] IDENTITY(1,1) NOT NULL,
	[Название дисциплины] [nvarchar](max) NOT NULL,
	[ID Преподавателя] [int] NOT NULL,
 CONSTRAINT [PK_Дисциплины] PRIMARY KEY CLUSTERED 
(
	[ID дисциплины] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Преподаватели]    Script Date: 08.12.2022 5:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Преподаватели](
	[ID Преподавателя] [int] IDENTITY(1,1) NOT NULL,
	[Имя] [nvarchar](max) NOT NULL,
	[Фамилия] [nvarchar](max) NOT NULL,
	[Отчество] [nvarchar](max) NOT NULL,
	[Номер телефона] [nvarchar](max) NOT NULL,
	[E-mail] [nvarchar](max) NOT NULL,
	[Пароль] [nvarchar](max) NOT NULL,
	[Логин] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Преподаватели] PRIMARY KEY CLUSTERED 
(
	[ID Преподавателя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Расписание]    Script Date: 08.12.2022 5:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Расписание](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Кабинет] [nvarchar](max) NOT NULL,
	[День недели] [nvarchar](max) NOT NULL,
	[Дата] [date] NOT NULL,
	[ID пары] [int] NOT NULL,
	[Порядковый номер пары] [int] NOT NULL,
	[ID Группы] [int] NOT NULL,
 CONSTRAINT [PK_Расписание] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Студенты]    Script Date: 08.12.2022 5:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Студенты](
	[ID Студента] [int] IDENTITY(1,1) NOT NULL,
	[Имя] [nvarchar](max) NOT NULL,
	[Фамилия] [nvarchar](max) NOT NULL,
	[Отчество] [nvarchar](max) NOT NULL,
	[Номер телефона] [nvarchar](max) NOT NULL,
	[Номер пропуска] [nchar](10) NULL,
	[ID группы] [int] NULL,
 CONSTRAINT [PK_Студенты] PRIMARY KEY CLUSTERED 
(
	[ID Студента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Успеваемость]    Script Date: 08.12.2022 5:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Успеваемость](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID студента] [int] NOT NULL,
	[ID преподавателя] [int] NOT NULL,
	[ID предмета] [int] NOT NULL,
	[оценка] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Успеваемость] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Группы] ON 

INSERT [dbo].[Группы] ([ID группы], [Название группы], [Тип обучения], [Классный руководитель]) VALUES (1, N'ДП-3', N'Очно', 1)
SET IDENTITY_INSERT [dbo].[Группы] OFF
SET IDENTITY_INSERT [dbo].[Дисциплины] ON 

INSERT [dbo].[Дисциплины] ([ID дисциплины], [Название дисциплины], [ID Преподавателя]) VALUES (1, N'МДК 01.01', 1)
SET IDENTITY_INSERT [dbo].[Дисциплины] OFF
SET IDENTITY_INSERT [dbo].[Преподаватели] ON 

INSERT [dbo].[Преподаватели] ([ID Преподавателя], [Имя], [Фамилия], [Отчество], [Номер телефона], [E-mail], [Пароль], [Логин]) VALUES (1, N'Василий', N'Васильев', N'Васильевич', N'89855221254', N'vasil@mail.ru', N'123', N'qwe')
SET IDENTITY_INSERT [dbo].[Преподаватели] OFF
SET IDENTITY_INSERT [dbo].[Расписание] ON 

INSERT [dbo].[Расписание] ([ID], [Кабинет], [День недели], [Дата], [ID пары], [Порядковый номер пары], [ID Группы]) VALUES (2, N'1123', N'Вторник', CAST(N'2022-12-08' AS Date), 1, 4, 1)
SET IDENTITY_INSERT [dbo].[Расписание] OFF
SET IDENTITY_INSERT [dbo].[Студенты] ON 

INSERT [dbo].[Студенты] ([ID Студента], [Имя], [Фамилия], [Отчество], [Номер телефона], [Номер пропуска], [ID группы]) VALUES (2, N'Андрей', N'Горбаток', N'Олегович', N'89652147852', N'12123     ', 1)
INSERT [dbo].[Студенты] ([ID Студента], [Имя], [Фамилия], [Отчество], [Номер телефона], [Номер пропуска], [ID группы]) VALUES (3, N'Александр', N'Емельнянко', N'Максимович', N'89654785269', N'68545     ', 1)
INSERT [dbo].[Студенты] ([ID Студента], [Имя], [Фамилия], [Отчество], [Номер телефона], [Номер пропуска], [ID группы]) VALUES (4, N'Александр', N'Михайлоа', N'Андреевич', N'89658745962', N'587596    ', 1)
INSERT [dbo].[Студенты] ([ID Студента], [Имя], [Фамилия], [Отчество], [Номер телефона], [Номер пропуска], [ID группы]) VALUES (7, N'22', N'22', N'22', N'22', NULL, 1)
SET IDENTITY_INSERT [dbo].[Студенты] OFF
SET IDENTITY_INSERT [dbo].[Успеваемость] ON 

INSERT [dbo].[Успеваемость] ([ID], [ID студента], [ID преподавателя], [ID предмета], [оценка]) VALUES (1, 2, 1, 2, N'4')
SET IDENTITY_INSERT [dbo].[Успеваемость] OFF
ALTER TABLE [dbo].[Группы]  WITH CHECK ADD  CONSTRAINT [FK_Группы_Преподаватели] FOREIGN KEY([Классный руководитель])
REFERENCES [dbo].[Преподаватели] ([ID Преподавателя])
GO
ALTER TABLE [dbo].[Группы] CHECK CONSTRAINT [FK_Группы_Преподаватели]
GO
ALTER TABLE [dbo].[Дисциплины]  WITH CHECK ADD  CONSTRAINT [FK_Дисциплины_Преподаватели] FOREIGN KEY([ID Преподавателя])
REFERENCES [dbo].[Преподаватели] ([ID Преподавателя])
GO
ALTER TABLE [dbo].[Дисциплины] CHECK CONSTRAINT [FK_Дисциплины_Преподаватели]
GO
ALTER TABLE [dbo].[Расписание]  WITH CHECK ADD  CONSTRAINT [FK_Расписание_Группы] FOREIGN KEY([ID Группы])
REFERENCES [dbo].[Группы] ([ID группы])
GO
ALTER TABLE [dbo].[Расписание] CHECK CONSTRAINT [FK_Расписание_Группы]
GO
ALTER TABLE [dbo].[Расписание]  WITH CHECK ADD  CONSTRAINT [FK_Расписание_Дисциплины] FOREIGN KEY([ID пары])
REFERENCES [dbo].[Дисциплины] ([ID дисциплины])
GO
ALTER TABLE [dbo].[Расписание] CHECK CONSTRAINT [FK_Расписание_Дисциплины]
GO
ALTER TABLE [dbo].[Студенты]  WITH CHECK ADD  CONSTRAINT [FK_Студенты_Группы] FOREIGN KEY([ID группы])
REFERENCES [dbo].[Группы] ([ID группы])
GO
ALTER TABLE [dbo].[Студенты] CHECK CONSTRAINT [FK_Студенты_Группы]
GO
ALTER TABLE [dbo].[Успеваемость]  WITH CHECK ADD  CONSTRAINT [FK_Успеваемость_Преподаватели] FOREIGN KEY([ID преподавателя])
REFERENCES [dbo].[Преподаватели] ([ID Преподавателя])
GO
ALTER TABLE [dbo].[Успеваемость] CHECK CONSTRAINT [FK_Успеваемость_Преподаватели]
GO
ALTER TABLE [dbo].[Успеваемость]  WITH CHECK ADD  CONSTRAINT [FK_Успеваемость_Расписание] FOREIGN KEY([ID предмета])
REFERENCES [dbo].[Расписание] ([ID])
GO
ALTER TABLE [dbo].[Успеваемость] CHECK CONSTRAINT [FK_Успеваемость_Расписание]
GO
ALTER TABLE [dbo].[Успеваемость]  WITH CHECK ADD  CONSTRAINT [FK_Успеваемость_Студенты] FOREIGN KEY([ID студента])
REFERENCES [dbo].[Студенты] ([ID Студента])
GO
ALTER TABLE [dbo].[Успеваемость] CHECK CONSTRAINT [FK_Успеваемость_Студенты]
GO
USE [master]
GO
ALTER DATABASE [Учет посещаемости2] SET  READ_WRITE 
GO
