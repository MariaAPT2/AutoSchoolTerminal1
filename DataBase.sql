USE [master]
GO
CREATE DATABASE [AutoSchoolTerminal]
GO
USE [AutoSchoolTerminal]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CourseRegistrations](
	[RegistrationID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[RegistrationDate] [date] NOT NULL,
 CONSTRAINT [PK__CourseRe__6EF58830660C3409] PRIMARY KEY CLUSTERED 
(
	[RegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](100) NOT NULL,
	[Description] [text] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__Courses__C92D71871D06AE2C] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DrivingLessons](
	[DrivingLessonID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
	[LessonDescription] [nvarchar](max) NULL,
	[LessonDate] [date] NOT NULL,
	[LessonTime] [time](0) NOT NULL,
	[DurationID] [int] NOT NULL,
	[LessonCost] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__DrivingL__20F6B812C1A4554F] PRIMARY KEY CLUSTERED 
(
	[DrivingLessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DurationList](
	[DurationID] [int] IDENTITY(1,1) NOT NULL,
	[DurationOnMinutes] [int] NOT NULL,
 CONSTRAINT [PK_DurationList] PRIMARY KEY CLUSTERED 
(
	[DurationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ExamResults](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[ExamDate] [date] NOT NULL,
	[Grade] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK__ExamResu__976902282B9E9D7F] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Instructors](
	[InstructorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[SurName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PhoneNumber] [nvarchar](18) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[HireDate] [date] NOT NULL,
	[Salary] [decimal](10, 2) NOT NULL,
	[UserID] [int] NOT NULL,
	[Photo] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK__Instruct__9D010B7B1071117E] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lessons](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
	[LessonDate] [date] NOT NULL,
	[LessonTime] [time](0) NOT NULL,
	[DurationID] [int] NOT NULL,
 CONSTRAINT [PK__Lessons__B084ACB02351F97A] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Roles__8AFACE3A1DF10B7A] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[SurName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[UserID] [int] NOT NULL,
	[Photo] [nvarchar](50) NULL,
 CONSTRAINT [PK__Students__32C52A790372981D] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK__Users__1788CCACD23E7644] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Courses] ON 

INSERT [Courses] ([CourseID], [CourseName], [Description], [Price]) VALUES (1, N'Вождение автомобиля (категория B)', N'Обучение вождению легкового автомобиля', CAST(500.00 AS Decimal(10, 2)))
INSERT [Courses] ([CourseID], [CourseName], [Description], [Price]) VALUES (2, N'Вождение мотоцикла (категория A)', N'Обучение вождению мотоцикла', CAST(400.00 AS Decimal(10, 2)))
INSERT [Courses] ([CourseID], [CourseName], [Description], [Price]) VALUES (3, N'Вождение грузовика (категория C)', N'Обучение вождению грузовика', CAST(600.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [Courses] OFF
GO
SET IDENTITY_INSERT [DrivingLessons] ON 

INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (1, 1, 2, N'Урок по управлению автомобилем', CAST(N'2024-02-01' AS Date), CAST(N'09:00:00' AS Time), 1, CAST(300.00 AS Decimal(10, 2)))
INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (2, 2, 3, N'Урок по парковке', CAST(N'2024-02-02' AS Date), CAST(N'10:30:00' AS Time), 2, CAST(400.00 AS Decimal(10, 2)))
INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (3, 3, 4, N'Урок по перестроению', CAST(N'2024-02-03' AS Date), CAST(N'11:00:00' AS Time), 1, CAST(300.00 AS Decimal(10, 2)))
INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (4, 4, 5, N'Урок по движению в потоке', CAST(N'2024-02-04' AS Date), CAST(N'12:30:00' AS Time), 2, CAST(400.00 AS Decimal(10, 2)))
INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (5, 5, 6, N'Урок по безопасности на дороге', CAST(N'2024-02-05' AS Date), CAST(N'13:00:00' AS Time), 1, CAST(300.00 AS Decimal(10, 2)))
INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (6, 1, 2, N'Урок по парковке', CAST(N'2024-02-06' AS Date), CAST(N'14:30:00' AS Time), 2, CAST(400.00 AS Decimal(10, 2)))
INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (7, 2, 3, N'Урок по управлению автомобилем', CAST(N'2024-02-07' AS Date), CAST(N'15:00:00' AS Time), 1, CAST(300.00 AS Decimal(10, 2)))
INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (8, 3, 4, N'Урок по безопасности на дороге', CAST(N'2024-02-08' AS Date), CAST(N'16:30:00' AS Time), 3, CAST(500.00 AS Decimal(10, 2)))
INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (9, 4, 5, N'Урок по парковке', CAST(N'2024-02-09' AS Date), CAST(N'17:00:00' AS Time), 1, CAST(300.00 AS Decimal(10, 2)))
INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (10, 5, 6, N'Урок по управлению автомобилем', CAST(N'2024-02-10' AS Date), CAST(N'18:30:00' AS Time), 2, CAST(400.00 AS Decimal(10, 2)))
INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (11, 2, 3, NULL, CAST(N'2024-02-25' AS Date), CAST(N'08:00:00' AS Time), 2, CAST(400.00 AS Decimal(10, 2)))
INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (12, 2, 3, NULL, CAST(N'2024-02-25' AS Date), CAST(N'08:00:00' AS Time), 4, CAST(600.00 AS Decimal(10, 2)))
INSERT [DrivingLessons] ([DrivingLessonID], [StudentID], [InstructorID], [LessonDescription], [LessonDate], [LessonTime], [DurationID], [LessonCost]) VALUES (14, 3, 3, NULL, CAST(N'2024-02-25' AS Date), CAST(N'10:00:00' AS Time), 3, CAST(500.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [DrivingLessons] OFF
GO
SET IDENTITY_INSERT [DurationList] ON 

INSERT [DurationList] ([DurationID], [DurationOnMinutes]) VALUES (1, 60)
INSERT [DurationList] ([DurationID], [DurationOnMinutes]) VALUES (2, 90)
INSERT [DurationList] ([DurationID], [DurationOnMinutes]) VALUES (3, 120)
INSERT [DurationList] ([DurationID], [DurationOnMinutes]) VALUES (4, 150)
SET IDENTITY_INSERT [DurationList] OFF
GO
SET IDENTITY_INSERT [ExamResults] ON 

INSERT [ExamResults] ([ResultID], [StudentID], [CourseID], [ExamDate], [Grade]) VALUES (1, 1, 1, CAST(N'2023-01-15' AS Date), CAST(4.50 AS Decimal(5, 2)))
INSERT [ExamResults] ([ResultID], [StudentID], [CourseID], [ExamDate], [Grade]) VALUES (2, 2, 1, CAST(N'2023-01-20' AS Date), CAST(4.20 AS Decimal(5, 2)))
INSERT [ExamResults] ([ResultID], [StudentID], [CourseID], [ExamDate], [Grade]) VALUES (3, 3, 2, CAST(N'2023-02-05' AS Date), CAST(4.80 AS Decimal(5, 2)))
INSERT [ExamResults] ([ResultID], [StudentID], [CourseID], [ExamDate], [Grade]) VALUES (4, 4, 2, CAST(N'2023-02-10' AS Date), CAST(4.60 AS Decimal(5, 2)))
INSERT [ExamResults] ([ResultID], [StudentID], [CourseID], [ExamDate], [Grade]) VALUES (5, 5, 3, CAST(N'2023-03-12' AS Date), CAST(4.70 AS Decimal(5, 2)))
SET IDENTITY_INSERT [ExamResults] OFF
GO
SET IDENTITY_INSERT [Instructors] ON 

INSERT [Instructors] ([InstructorID], [FirstName], [LastName], [SurName], [DateOfBirth], [PhoneNumber], [Email], [HireDate], [Salary], [UserID], [Photo], [Description]) VALUES (2, N'Владимир', N'Иванов', N'Евгеньевич', CAST(N'1980-01-01' AS Date), N'+7 (914) 851-32-11', N'ivan_instructor@mail.ru', CAST(N'2019-01-01' AS Date), CAST(30000.00 AS Decimal(10, 2)), 2, N'person1.jpg', N'Инструктор Владимир является опытным водителем с многолетним стажем работы в автошколе. Его профессиональный подход и терпеливое отношение к студентам делают его одним из лучших инструкторов в городе. В свободное время Владимир увлекается автомобильными гонками и поддерживает высокий уровень профессиональной подготовки.')
INSERT [Instructors] ([InstructorID], [FirstName], [LastName], [SurName], [DateOfBirth], [PhoneNumber], [Email], [HireDate], [Salary], [UserID], [Photo], [Description]) VALUES (3, N'Елена', N'Петровна', N'Алексеевна', CAST(N'1975-02-02' AS Date), N'+7 (994) 123-45-67', N'petr_instructor@gmail.com', CAST(N'2020-02-01' AS Date), CAST(32000.00 AS Decimal(10, 2)), 3, N'person4.jpg', N'Инструктор Елена имеет богатый опыт в обучении вождению и помогла сотням студентов успешно получить водительские права. Ее теплый и дружелюбный подход создает комфортную обстановку для обучения. В свободное время Елена увлекается чтением книг и путешествиями.')
INSERT [Instructors] ([InstructorID], [FirstName], [LastName], [SurName], [DateOfBirth], [PhoneNumber], [Email], [HireDate], [Salary], [UserID], [Photo], [Description]) VALUES (4, N'Александр', N'Сидоров', N'Егорович', CAST(N'1985-03-03' AS Date), N'+7 (999) 098-76-54', N'anna_instructor@mail.ru', CAST(N'2017-03-01' AS Date), CAST(31000.00 AS Decimal(10, 2)), 4, N'person2.jpg', N'Александр - высококвалифицированный инструктор с индивидуальным подходом к каждому студенту. Он обладает отличными коммуникативными навыками и помогает студентам преодолевать трудности на пути к получению водительских прав. В свободное время Александр увлекается спортом и активным отдыхом на природе.')
INSERT [Instructors] ([InstructorID], [FirstName], [LastName], [SurName], [DateOfBirth], [PhoneNumber], [Email], [HireDate], [Salary], [UserID], [Photo], [Description]) VALUES (5, N'Елена', N'Кузнецова', N'Кириловна', CAST(N'1990-04-04' AS Date), N'+7 (111) 111-11-11', N'elena_instructor@yandex.ru', CAST(N'2020-04-01' AS Date), CAST(33000.00 AS Decimal(10, 2)), 5, N'person5.jpg', N'Инструктор Елена - это энергичный и терпеливый профессионал, который делает обучение вождению увлекательным и интересным. Она обладает прекрасным чувством юмора и способна создать дружественную атмосферу на занятиях. В свободное время Наталья увлекается рисованием и рукоделием.')
INSERT [Instructors] ([InstructorID], [FirstName], [LastName], [SurName], [DateOfBirth], [PhoneNumber], [Email], [HireDate], [Salary], [UserID], [Photo], [Description]) VALUES (6, N'Дмитрий', N'Смирнов', N'Олегович', CAST(N'1988-05-05' AS Date), N'+7 (222) 222-22-22', N'dmitriy_instructor@yandex.ru', CAST(N'2018-05-01' AS Date), CAST(34000.00 AS Decimal(10, 2)), 6, NULL, N'Дмитрий - высококвалифицированный инструктор с высоким уровнем внимания к деталям и безопасности. Он обладает обширными знаниями в области автомобильной техники и помогает студентам развивать навыки безопасного вождения. В свободное время Дмитрий увлекается музыкой и активным образом жизни.')
SET IDENTITY_INSERT [Instructors] OFF
GO
SET IDENTITY_INSERT [Lessons] ON 

INSERT [Lessons] ([LessonID], [CourseID], [InstructorID], [LessonDate], [LessonTime], [DurationID]) VALUES (1, 1, 2, CAST(N'2023-01-01' AS Date), CAST(N'13:00:00' AS Time), 2)
INSERT [Lessons] ([LessonID], [CourseID], [InstructorID], [LessonDate], [LessonTime], [DurationID]) VALUES (2, 2, 3, CAST(N'2023-02-01' AS Date), CAST(N'14:30:00' AS Time), 3)
INSERT [Lessons] ([LessonID], [CourseID], [InstructorID], [LessonDate], [LessonTime], [DurationID]) VALUES (3, 3, 4, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 4)
INSERT [Lessons] ([LessonID], [CourseID], [InstructorID], [LessonDate], [LessonTime], [DurationID]) VALUES (4, 1, 5, CAST(N'2023-04-02' AS Date), CAST(N'10:00:00' AS Time), 2)
INSERT [Lessons] ([LessonID], [CourseID], [InstructorID], [LessonDate], [LessonTime], [DurationID]) VALUES (5, 2, 6, CAST(N'2023-05-02' AS Date), CAST(N'12:00:00' AS Time), 3)
INSERT [Lessons] ([LessonID], [CourseID], [InstructorID], [LessonDate], [LessonTime], [DurationID]) VALUES (6, 1, 5, CAST(N'2023-04-02' AS Date), CAST(N'19:00:00' AS Time), 2)
INSERT [Lessons] ([LessonID], [CourseID], [InstructorID], [LessonDate], [LessonTime], [DurationID]) VALUES (7, 1, 5, CAST(N'2023-04-02' AS Date), CAST(N'19:00:00' AS Time), 2)
INSERT [Lessons] ([LessonID], [CourseID], [InstructorID], [LessonDate], [LessonTime], [DurationID]) VALUES (8, 1, 5, CAST(N'2023-04-02' AS Date), CAST(N'19:00:00' AS Time), 2)
INSERT [Lessons] ([LessonID], [CourseID], [InstructorID], [LessonDate], [LessonTime], [DurationID]) VALUES (9, 1, 5, CAST(N'2023-04-02' AS Date), CAST(N'19:00:00' AS Time), 2)
INSERT [Lessons] ([LessonID], [CourseID], [InstructorID], [LessonDate], [LessonTime], [DurationID]) VALUES (10, 1, 5, CAST(N'2023-04-02' AS Date), CAST(N'20:00:00' AS Time), 2)
INSERT [Lessons] ([LessonID], [CourseID], [InstructorID], [LessonDate], [LessonTime], [DurationID]) VALUES (11, 1, 5, CAST(N'2023-04-02' AS Date), CAST(N'23:00:00' AS Time), 2)
INSERT [Lessons] ([LessonID], [CourseID], [InstructorID], [LessonDate], [LessonTime], [DurationID]) VALUES (12, 1, 3, CAST(N'2024-02-25' AS Date), CAST(N'10:00:00' AS Time), 4)
SET IDENTITY_INSERT [Lessons] OFF
GO
SET IDENTITY_INSERT [Roles] ON 

INSERT [Roles] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [Roles] ([RoleID], [RoleName]) VALUES (2, N'Instructor')
INSERT [Roles] ([RoleID], [RoleName]) VALUES (3, N'Student')
SET IDENTITY_INSERT [Roles] OFF
GO
SET IDENTITY_INSERT [Students] ON 

INSERT [Students] ([StudentID], [FirstName], [LastName], [SurName], [DateOfBirth], [PhoneNumber], [Email], [UserID], [Photo]) VALUES (1, N'Иван', N'Иванов', N'Иванович', CAST(N'2000-01-01' AS Date), N'1234567890', N'ivan@example.com', 7, NULL)
INSERT [Students] ([StudentID], [FirstName], [LastName], [SurName], [DateOfBirth], [PhoneNumber], [Email], [UserID], [Photo]) VALUES (2, N'Петр', N'Петров', N'Петрович', CAST(N'1999-02-02' AS Date), N'0987654321', N'petr@example.com', 8, NULL)
INSERT [Students] ([StudentID], [FirstName], [LastName], [SurName], [DateOfBirth], [PhoneNumber], [Email], [UserID], [Photo]) VALUES (3, N'Анна', N'Сидорова', N'Дмитриевна', CAST(N'1998-03-03' AS Date), N'1112223333', N'anna@example.com', 9, NULL)
INSERT [Students] ([StudentID], [FirstName], [LastName], [SurName], [DateOfBirth], [PhoneNumber], [Email], [UserID], [Photo]) VALUES (4, N'Елена', N'Кузнецова', N'Максимовна', CAST(N'1997-04-04' AS Date), N'4445556666', N'elena@example.com', 10, NULL)
INSERT [Students] ([StudentID], [FirstName], [LastName], [SurName], [DateOfBirth], [PhoneNumber], [Email], [UserID], [Photo]) VALUES (5, N'Дмитрий', N'Смирнов', N'Олегович', CAST(N'1996-05-05' AS Date), N'7778889999', N'dmitriy@example.com', 11, NULL)
SET IDENTITY_INSERT [Students] OFF
GO
SET IDENTITY_INSERT [Users] ON 

INSERT [Users] ([UserID], [Username], [Password], [RoleID]) VALUES (1, N'user1', N'password1', 1)
INSERT [Users] ([UserID], [Username], [Password], [RoleID]) VALUES (2, N'user2', N'password2', 2)
INSERT [Users] ([UserID], [Username], [Password], [RoleID]) VALUES (3, N'user3', N'password3', 2)
INSERT [Users] ([UserID], [Username], [Password], [RoleID]) VALUES (4, N'user4', N'password4', 2)
INSERT [Users] ([UserID], [Username], [Password], [RoleID]) VALUES (5, N'user5', N'password5', 2)
INSERT [Users] ([UserID], [Username], [Password], [RoleID]) VALUES (6, N'user6', N'password6', 2)
INSERT [Users] ([UserID], [Username], [Password], [RoleID]) VALUES (7, N'user7', N'password7', 3)
INSERT [Users] ([UserID], [Username], [Password], [RoleID]) VALUES (8, N'user8', N'password8', 3)
INSERT [Users] ([UserID], [Username], [Password], [RoleID]) VALUES (9, N'user9', N'password9', 3)
INSERT [Users] ([UserID], [Username], [Password], [RoleID]) VALUES (10, N'user10', N'password10', 3)
INSERT [Users] ([UserID], [Username], [Password], [RoleID]) VALUES (11, N'user11', N'password11', 3)
SET IDENTITY_INSERT [Users] OFF
GO
ALTER TABLE [CourseRegistrations]  WITH CHECK ADD  CONSTRAINT [FK__CourseReg__Cours__2F10007B] FOREIGN KEY([CourseID])
REFERENCES [Courses] ([CourseID])
GO
ALTER TABLE [CourseRegistrations] CHECK CONSTRAINT [FK__CourseReg__Cours__2F10007B]
GO
ALTER TABLE [CourseRegistrations]  WITH CHECK ADD  CONSTRAINT [FK__CourseReg__Stude__2E1BDC42] FOREIGN KEY([StudentID])
REFERENCES [Students] ([StudentID])
GO
ALTER TABLE [CourseRegistrations] CHECK CONSTRAINT [FK__CourseReg__Stude__2E1BDC42]
GO
ALTER TABLE [DrivingLessons]  WITH CHECK ADD  CONSTRAINT [FK_DrivingLessons_DurationList] FOREIGN KEY([DurationID])
REFERENCES [DurationList] ([DurationID])
GO
ALTER TABLE [DrivingLessons] CHECK CONSTRAINT [FK_DrivingLessons_DurationList]
GO
ALTER TABLE [DrivingLessons]  WITH CHECK ADD  CONSTRAINT [FK_Instructor] FOREIGN KEY([InstructorID])
REFERENCES [Instructors] ([InstructorID])
GO
ALTER TABLE [DrivingLessons] CHECK CONSTRAINT [FK_Instructor]
GO
ALTER TABLE [DrivingLessons]  WITH CHECK ADD  CONSTRAINT [FK_Student] FOREIGN KEY([StudentID])
REFERENCES [Students] ([StudentID])
GO
ALTER TABLE [DrivingLessons] CHECK CONSTRAINT [FK_Student]
GO
ALTER TABLE [ExamResults]  WITH CHECK ADD  CONSTRAINT [FK__ExamResul__Cours__32E0915F] FOREIGN KEY([CourseID])
REFERENCES [Courses] ([CourseID])
GO
ALTER TABLE [ExamResults] CHECK CONSTRAINT [FK__ExamResul__Cours__32E0915F]
GO
ALTER TABLE [ExamResults]  WITH CHECK ADD  CONSTRAINT [FK__ExamResul__Stude__31EC6D26] FOREIGN KEY([StudentID])
REFERENCES [Students] ([StudentID])
GO
ALTER TABLE [ExamResults] CHECK CONSTRAINT [FK__ExamResul__Stude__31EC6D26]
GO
ALTER TABLE [Instructors]  WITH CHECK ADD  CONSTRAINT [FK_Instructors_Users] FOREIGN KEY([UserID])
REFERENCES [Users] ([UserID])
GO
ALTER TABLE [Instructors] CHECK CONSTRAINT [FK_Instructors_Users]
GO
ALTER TABLE [Lessons]  WITH CHECK ADD  CONSTRAINT [FK__Lessons__CourseI__2A4B4B5E] FOREIGN KEY([CourseID])
REFERENCES [Courses] ([CourseID])
GO
ALTER TABLE [Lessons] CHECK CONSTRAINT [FK__Lessons__CourseI__2A4B4B5E]
GO
ALTER TABLE [Lessons]  WITH CHECK ADD  CONSTRAINT [FK__Lessons__Instruc__2B3F6F97] FOREIGN KEY([InstructorID])
REFERENCES [Instructors] ([InstructorID])
GO
ALTER TABLE [Lessons] CHECK CONSTRAINT [FK__Lessons__Instruc__2B3F6F97]
GO
ALTER TABLE [Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_DurationList] FOREIGN KEY([DurationID])
REFERENCES [DurationList] ([DurationID])
GO
ALTER TABLE [Lessons] CHECK CONSTRAINT [FK_Lessons_DurationList]
GO
ALTER TABLE [Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Users] FOREIGN KEY([UserID])
REFERENCES [Users] ([UserID])
GO
ALTER TABLE [Students] CHECK CONSTRAINT [FK_Students_Users]
GO
ALTER TABLE [Users]  WITH CHECK ADD  CONSTRAINT [FK__Users__RoleID__3B75D760] FOREIGN KEY([RoleID])
REFERENCES [Roles] ([RoleID])
GO
ALTER TABLE [Users] CHECK CONSTRAINT [FK__Users__RoleID__3B75D760]
GO
USE [master]
GO
ALTER DATABASE [AutoSchoolTerminal] SET  READ_WRITE 
GO
