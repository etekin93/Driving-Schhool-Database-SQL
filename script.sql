USE [master]
GO
/****** Object:  Database [DrivingSchool]    Script Date: 5/14/2018 10:51:30 AM ******/
CREATE DATABASE [DrivingSchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DrivingSchool', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DrivingSchool.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DrivingSchool_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DrivingSchool_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DrivingSchool] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DrivingSchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DrivingSchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DrivingSchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DrivingSchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DrivingSchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DrivingSchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [DrivingSchool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DrivingSchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DrivingSchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DrivingSchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DrivingSchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DrivingSchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DrivingSchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DrivingSchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DrivingSchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DrivingSchool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DrivingSchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DrivingSchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DrivingSchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DrivingSchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DrivingSchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DrivingSchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DrivingSchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DrivingSchool] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DrivingSchool] SET  MULTI_USER 
GO
ALTER DATABASE [DrivingSchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DrivingSchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DrivingSchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DrivingSchool] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DrivingSchool] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DrivingSchool]
GO
/****** Object:  Table [dbo].[5HOURCLASS]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[5HOURCLASS](
	[ClassID] [int] NOT NULL,
	[PresenterID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_CLASS] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR](
	[CarVIN] [int] NOT NULL,
	[ModelYear] [date] NOT NULL,
	[CarType] [varchar](15) NOT NULL,
	[Condition] [nchar](10) NOT NULL,
	[Manufacturer] [nchar](15) NOT NULL,
	[DateOfPurchase] [date] NOT NULL,
 CONSTRAINT [PK_CAR] PRIMARY KEY CLUSTERED 
(
	[CarVIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENT]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENT](
	[ClientID] [int] NOT NULL,
	[Client_Fname] [varchar](20) NOT NULL,
	[Client_Lname] [varchar](20) NOT NULL,
	[Street] [varchar](30) NOT NULL,
	[City] [varchar](15) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[Zip] [char](5) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[DrivingPermitID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_CLIENT] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPLETEDLESSON]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPLETEDLESSON](
	[DrivingLessonID] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
 CONSTRAINT [PK_COMPLETEDLESSON] PRIMARY KEY CLUSTERED 
(
	[DrivingLessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[EmployeeID] [int] NOT NULL,
	[Emp_Fname] [varchar](20) NOT NULL,
	[Emp_Lname] [varchar](20) NOT NULL,
	[Street] [varchar](30) NOT NULL,
	[City] [varchar](15) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[PhoneNumber] [char](10) NOT NULL,
	[EmailAdress] [varchar](40) NOT NULL,
	[HireDate] [date] NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Reporsto] [int] NULL,
 CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLOYEEJOBS]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEEJOBS](
	[EmployeeID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
 CONSTRAINT [PK_EMPLOYEEJOB] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INSPECTION]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSPECTION](
	[CarVIN] [int] NOT NULL,
	[DateInspected] [date] NOT NULL,
	[TimeInspected] [time](0) NOT NULL,
	[Result] [varchar](10) NOT NULL,
 CONSTRAINT [PK_INSPECTION] PRIMARY KEY CLUSTERED 
(
	[CarVIN] ASC,
	[DateInspected] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INSTRUCTOR]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSTRUCTOR](
	[InstructorID] [int] NOT NULL,
	[InstructorLicenseID] [int] NOT NULL,
	[DateIssued] [date] NOT NULL,
 CONSTRAINT [PK_INSTRUCTOR] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INSTRUCTORVACATION]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSTRUCTORVACATION](
	[InstructorID] [int] NOT NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [date] NOT NULL,
 CONSTRAINT [PK_INSTRUCTORVACATION] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOB]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOB](
	[JobID] [int] NOT NULL,
	[Description] [varchar](20) NOT NULL,
 CONSTRAINT [PK_JOB] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MANAGER]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MANAGER](
	[ManagerID] [int] NOT NULL,
	[DatePromoted] [date] NOT NULL,
 CONSTRAINT [PK_MANAGER] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OFFICE]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE](
	[OfficeID] [int] NOT NULL,
	[Street] [varchar](30) NOT NULL,
	[City] [varchar](15) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[ZipCode] [int] NOT NULL,
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [PK_OFFICE] PRIMARY KEY CLUSTERED 
(
	[OfficeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPAIR]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPAIR](
	[CarVIN] [int] NOT NULL,
	[RepairDate] [date] NOT NULL,
	[RepairType] [varchar](30) NOT NULL,
 CONSTRAINT [PK_REPAIR] PRIMARY KEY CLUSTERED 
(
	[CarVIN] ASC,
	[RepairDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROADTEST]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROADTEST](
	[RoadTestID] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[CarVIN] [int] NOT NULL,
	[RoadTestDate] [datetime] NOT NULL,
	[Result] [varchar](10) NOT NULL,
	[ReasonForFailure] [varchar](45) NULL,
 CONSTRAINT [PK_ROADTEST] PRIMARY KEY CLUSTERED 
(
	[RoadTestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCHEDULEDLESSON]    Script Date: 5/14/2018 10:51:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCHEDULEDLESSON](
	[DrivingLessonID] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[CarVIN] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](0) NOT NULL,
	[Mileage] [int] NOT NULL,
	[Price] [decimal](19, 2) NOT NULL,
 CONSTRAINT [PK_SCHEDULEDLESSON] PRIMARY KEY CLUSTERED 
(
	[DrivingLessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[5HOURCLASS] ([ClassID], [PresenterID], [Date], [Price]) VALUES (20180323, 5, CAST(N'2018-04-23' AS Date), 50)
INSERT [dbo].[5HOURCLASS] ([ClassID], [PresenterID], [Date], [Price]) VALUES (20180419, 1, CAST(N'2018-04-19' AS Date), 50)
INSERT [dbo].[5HOURCLASS] ([ClassID], [PresenterID], [Date], [Price]) VALUES (20180420, 2, CAST(N'2018-04-20' AS Date), 50)
INSERT [dbo].[5HOURCLASS] ([ClassID], [PresenterID], [Date], [Price]) VALUES (20180421, 3, CAST(N'2018-04-21' AS Date), 50)
INSERT [dbo].[5HOURCLASS] ([ClassID], [PresenterID], [Date], [Price]) VALUES (20180422, 4, CAST(N'2018-04-22' AS Date), 50)
INSERT [dbo].[CAR] ([CarVIN], [ModelYear], [CarType], [Condition], [Manufacturer], [DateOfPurchase]) VALUES (123123123, CAST(N'2014-01-01' AS Date), N'MidSize', N'Fair      ', N'Toyota         ', CAST(N'2014-05-06' AS Date))
INSERT [dbo].[CAR] ([CarVIN], [ModelYear], [CarType], [Condition], [Manufacturer], [DateOfPurchase]) VALUES (123123124, CAST(N'2015-01-01' AS Date), N'GrandTour', N'Good      ', N'Honda          ', CAST(N'2015-02-03' AS Date))
INSERT [dbo].[CAR] ([CarVIN], [ModelYear], [CarType], [Condition], [Manufacturer], [DateOfPurchase]) VALUES (123123125, CAST(N'2016-01-01' AS Date), N'Compact', N'Good      ', N'Mazda          ', CAST(N'2016-07-21' AS Date))
INSERT [dbo].[CAR] ([CarVIN], [ModelYear], [CarType], [Condition], [Manufacturer], [DateOfPurchase]) VALUES (123123126, CAST(N'2017-01-01' AS Date), N'MiniSuv', N'Excellent ', N'Volkswagen     ', CAST(N'2017-11-06' AS Date))
INSERT [dbo].[CAR] ([CarVIN], [ModelYear], [CarType], [Condition], [Manufacturer], [DateOfPurchase]) VALUES (123123127, CAST(N'2018-01-01' AS Date), N'MidSize', N'Excellent ', N'Ford           ', CAST(N'2018-01-03' AS Date))
INSERT [dbo].[CLIENT] ([ClientID], [Client_Fname], [Client_Lname], [Street], [City], [State], [Zip], [BirthDate], [DrivingPermitID], [ClassID]) VALUES (10000001, N'Adam', N'Fripp', N'9718 FortHamilton Plwy.', N'Brooklyn', N'NY', N'11209', CAST(N'2000-04-08' AS Date), 147258369, 20180323)
INSERT [dbo].[CLIENT] ([ClientID], [Client_Fname], [Client_Lname], [Street], [City], [State], [Zip], [BirthDate], [DrivingPermitID], [ClassID]) VALUES (10000002, N'James', N'Landry', N'663 55th St.', N'Queens', N'NY', N'11146', CAST(N'1993-08-29' AS Date), 258369147, 20180419)
INSERT [dbo].[CLIENT] ([ClientID], [Client_Fname], [Client_Lname], [Street], [City], [State], [Zip], [BirthDate], [DrivingPermitID], [ClassID]) VALUES (10000003, N'Payam', N'Kaufling', N'570 82nd St.', N'Bronx', N'NY', N'10014', CAST(N'1999-12-16' AS Date), 369147258, 20180420)
INSERT [dbo].[CLIENT] ([ClientID], [Client_Fname], [Client_Lname], [Street], [City], [State], [Zip], [BirthDate], [DrivingPermitID], [ClassID]) VALUES (10000004, N'Shelley', N'Higgins', N'909 40th St', N'Brooklyn', N'NY', N'11245', CAST(N'1991-05-05' AS Date), 159357456, 20180421)
INSERT [dbo].[CLIENT] ([ClientID], [Client_Fname], [Client_Lname], [Street], [City], [State], [Zip], [BirthDate], [DrivingPermitID], [ClassID]) VALUES (10000005, N'Shanta', N'Vollman', N'4555 15th Ave.', N'Quenns', N'NY', N'11348', CAST(N'1995-07-09' AS Date), 357159852, 20180422)
INSERT [dbo].[COMPLETEDLESSON] ([DrivingLessonID], [InstructorID]) VALUES (3001, 4)
INSERT [dbo].[COMPLETEDLESSON] ([DrivingLessonID], [InstructorID]) VALUES (3002, 5)
INSERT [dbo].[COMPLETEDLESSON] ([DrivingLessonID], [InstructorID]) VALUES (3003, 6)
INSERT [dbo].[COMPLETEDLESSON] ([DrivingLessonID], [InstructorID]) VALUES (3004, 6)
INSERT [dbo].[COMPLETEDLESSON] ([DrivingLessonID], [InstructorID]) VALUES (3005, 4)
INSERT [dbo].[COMPLETEDLESSON] ([DrivingLessonID], [InstructorID]) VALUES (3006, 7)
INSERT [dbo].[COMPLETEDLESSON] ([DrivingLessonID], [InstructorID]) VALUES (3007, 8)
INSERT [dbo].[COMPLETEDLESSON] ([DrivingLessonID], [InstructorID]) VALUES (3009, 9)
INSERT [dbo].[COMPLETEDLESSON] ([DrivingLessonID], [InstructorID]) VALUES (3011, 9)
INSERT [dbo].[COMPLETEDLESSON] ([DrivingLessonID], [InstructorID]) VALUES (3013, 4)
INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Emp_Fname], [Emp_Lname], [Street], [City], [State], [ZipCode], [PhoneNumber], [EmailAdress], [HireDate], [BirthDate], [Reporsto]) VALUES (1, N'Gerald', N'Cambrault', N'380 80 St.', N'Brooklyn', N'NY', N'11111', N'123456789 ', N'g.cambrault@gmail.com', CAST(N'2013-08-13' AS Date), CAST(N'1980-09-01' AS Date), 7)
INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Emp_Fname], [Emp_Lname], [Street], [City], [State], [ZipCode], [PhoneNumber], [EmailAdress], [HireDate], [BirthDate], [Reporsto]) VALUES (2, N'Renske', N'Ladwig', N'270 33 St.', N'Queens', N'NY', N'22222', N'223456789 ', N'r.ladwig@gmail.com', CAST(N'2017-06-17' AS Date), CAST(N'1987-03-24' AS Date), 8)
INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Emp_Fname], [Emp_Lname], [Street], [City], [State], [ZipCode], [PhoneNumber], [EmailAdress], [HireDate], [BirthDate], [Reporsto]) VALUES (3, N'Janette', N'King', N'564 40 sT.', N'Brooklyn', N'NY', N'33333', N'323456789 ', N'j.king@gmail.com', CAST(N'2014-09-08' AS Date), CAST(N'1986-07-29' AS Date), 8)
INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Emp_Fname], [Emp_Lname], [Street], [City], [State], [ZipCode], [PhoneNumber], [EmailAdress], [HireDate], [BirthDate], [Reporsto]) VALUES (4, N'Sarath', N'Sewal', N'27 W23 St.', N'NewYork', N'NY', N'44444', N'423456789 ', N's.sewall@gmail.com', CAST(N'2018-03-11' AS Date), CAST(N'1989-09-08' AS Date), 9)
INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Emp_Fname], [Emp_Lname], [Street], [City], [State], [ZipCode], [PhoneNumber], [EmailAdress], [HireDate], [BirthDate], [Reporsto]) VALUES (5, N'William', N'Gietz', N'99 Ridge Blvd.', N'Queens', N'NY', N'55555', N'523456789 ', N'w.gietz@gmail.com', CAST(N'2005-07-26' AS Date), CAST(N'1974-08-25' AS Date), 8)
INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Emp_Fname], [Emp_Lname], [Street], [City], [State], [ZipCode], [PhoneNumber], [EmailAdress], [HireDate], [BirthDate], [Reporsto]) VALUES (6, N'Jennifer', N'Whalen', N'8827 F.Hamilton Pkwy', N'Bronx', N'NY', N'66666', N'623456789 ', N'j.whalen@gmail.com', CAST(N'2009-11-27' AS Date), CAST(N'1979-09-24' AS Date), 7)
INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Emp_Fname], [Emp_Lname], [Street], [City], [State], [ZipCode], [PhoneNumber], [EmailAdress], [HireDate], [BirthDate], [Reporsto]) VALUES (7, N'Britney', N'Everett', N'9102 Colonial Road', N'Staten Island', N'NY', N'77777', N'723456789 ', N'b.everett@gmail.com', CAST(N'2003-07-01' AS Date), CAST(N'1972-07-15' AS Date), 8)
INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Emp_Fname], [Emp_Lname], [Street], [City], [State], [ZipCode], [PhoneNumber], [EmailAdress], [HireDate], [BirthDate], [Reporsto]) VALUES (8, N'Anthony', N'Cabrio', N'868 Bayridge Ave.', N'Brooklyn', N'NY', N'88888', N'823456789 ', N'a.cabrio@gmail.com', CAST(N'2008-06-07' AS Date), CAST(N'1978-03-04' AS Date), 9)
INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Emp_Fname], [Emp_Lname], [Street], [City], [State], [ZipCode], [PhoneNumber], [EmailAdress], [HireDate], [BirthDate], [Reporsto]) VALUES (9, N'Alexis ', N'Bull', N'7701 6th Ave.', N'Brooklyn', N'NY', N'99999', N'923456789 ', N'a.bull@gmail.com', CAST(N'2008-07-13' AS Date), CAST(N'1975-05-12' AS Date), 10)
INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Emp_Fname], [Emp_Lname], [Street], [City], [State], [ZipCode], [PhoneNumber], [EmailAdress], [HireDate], [BirthDate], [Reporsto]) VALUES (10, N'James', N'Marlow', N'9921 4th Ave.', N'Queens', N'NY', N'21111', N'113456789 ', N'j.marlow@gmail.com', CAST(N'2002-04-04' AS Date), CAST(N'1970-06-13' AS Date), NULL)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (1, 101)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (2, 101)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (3, 101)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (4, 102)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (5, 102)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (6, 102)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (7, 102)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (7, 103)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (8, 102)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (8, 103)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (9, 102)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (9, 103)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (10, 102)
INSERT [dbo].[EMPLOYEEJOBS] ([EmployeeID], [JobID]) VALUES (10, 103)
INSERT [dbo].[INSPECTION] ([CarVIN], [DateInspected], [TimeInspected], [Result]) VALUES (123123123, CAST(N'2014-12-01' AS Date), CAST(N'11:00:00' AS Time), N'PASSED')
INSERT [dbo].[INSPECTION] ([CarVIN], [DateInspected], [TimeInspected], [Result]) VALUES (123123123, CAST(N'2015-12-01' AS Date), CAST(N'12:00:00' AS Time), N'PASSED')
INSERT [dbo].[INSPECTION] ([CarVIN], [DateInspected], [TimeInspected], [Result]) VALUES (123123123, CAST(N'2017-12-01' AS Date), CAST(N'10:00:00' AS Time), N'PASSED')
INSERT [dbo].[INSPECTION] ([CarVIN], [DateInspected], [TimeInspected], [Result]) VALUES (123123124, CAST(N'2015-08-20' AS Date), CAST(N'09:00:00' AS Time), N'PASSED')
INSERT [dbo].[INSPECTION] ([CarVIN], [DateInspected], [TimeInspected], [Result]) VALUES (123123124, CAST(N'2017-08-20' AS Date), CAST(N'16:00:00' AS Time), N'PASSED')
INSERT [dbo].[INSPECTION] ([CarVIN], [DateInspected], [TimeInspected], [Result]) VALUES (123123125, CAST(N'2016-11-10' AS Date), CAST(N'14:00:00' AS Time), N'PASSED')
INSERT [dbo].[INSPECTION] ([CarVIN], [DateInspected], [TimeInspected], [Result]) VALUES (123123126, CAST(N'2017-12-25' AS Date), CAST(N'15:00:00' AS Time), N'PASSED')
INSERT [dbo].[INSTRUCTOR] ([InstructorID], [InstructorLicenseID], [DateIssued]) VALUES (4, 1111111, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[INSTRUCTOR] ([InstructorID], [InstructorLicenseID], [DateIssued]) VALUES (5, 2222222, CAST(N'2005-06-13' AS Date))
INSERT [dbo].[INSTRUCTOR] ([InstructorID], [InstructorLicenseID], [DateIssued]) VALUES (6, 3333333, CAST(N'2009-10-23' AS Date))
INSERT [dbo].[INSTRUCTOR] ([InstructorID], [InstructorLicenseID], [DateIssued]) VALUES (7, 4444444, CAST(N'2003-03-03' AS Date))
INSERT [dbo].[INSTRUCTOR] ([InstructorID], [InstructorLicenseID], [DateIssued]) VALUES (8, 5555555, CAST(N'2008-01-06' AS Date))
INSERT [dbo].[INSTRUCTOR] ([InstructorID], [InstructorLicenseID], [DateIssued]) VALUES (9, 6666666, CAST(N'2008-07-10' AS Date))
INSERT [dbo].[INSTRUCTOR] ([InstructorID], [InstructorLicenseID], [DateIssued]) VALUES (10, 7777777, CAST(N'2002-01-02' AS Date))
INSERT [dbo].[INSTRUCTORVACATION] ([InstructorID], [FromDate], [ToDate]) VALUES (4, CAST(N'2018-06-15' AS Date), CAST(N'2018-07-15' AS Date))
INSERT [dbo].[INSTRUCTORVACATION] ([InstructorID], [FromDate], [ToDate]) VALUES (5, CAST(N'2018-07-01' AS Date), CAST(N'2018-07-20' AS Date))
INSERT [dbo].[INSTRUCTORVACATION] ([InstructorID], [FromDate], [ToDate]) VALUES (6, CAST(N'2018-08-13' AS Date), CAST(N'2018-08-19' AS Date))
INSERT [dbo].[INSTRUCTORVACATION] ([InstructorID], [FromDate], [ToDate]) VALUES (7, CAST(N'2018-06-25' AS Date), CAST(N'2018-07-02' AS Date))
INSERT [dbo].[INSTRUCTORVACATION] ([InstructorID], [FromDate], [ToDate]) VALUES (8, CAST(N'2018-07-19' AS Date), CAST(N'2018-07-26' AS Date))
INSERT [dbo].[JOB] ([JobID], [Description]) VALUES (101, N'Presenter')
INSERT [dbo].[JOB] ([JobID], [Description]) VALUES (102, N'Instructor')
INSERT [dbo].[JOB] ([JobID], [Description]) VALUES (103, N'Manager')
INSERT [dbo].[MANAGER] ([ManagerID], [DatePromoted]) VALUES (7, CAST(N'2010-05-04' AS Date))
INSERT [dbo].[MANAGER] ([ManagerID], [DatePromoted]) VALUES (8, CAST(N'2009-12-24' AS Date))
INSERT [dbo].[MANAGER] ([ManagerID], [DatePromoted]) VALUES (9, CAST(N'2008-10-13' AS Date))
INSERT [dbo].[MANAGER] ([ManagerID], [DatePromoted]) VALUES (10, CAST(N'2003-01-07' AS Date))
INSERT [dbo].[OFFICE] ([OfficeID], [Street], [City], [State], [ZipCode], [ManagerID]) VALUES (1001, N'5904 4th Ave', N'Brooklyn', N'NY', 11209, 10)
INSERT [dbo].[OFFICE] ([OfficeID], [Street], [City], [State], [ZipCode], [ManagerID]) VALUES (1002, N'32 31st St.', N'Astoria', N'NY', 11106, 9)
INSERT [dbo].[REPAIR] ([CarVIN], [RepairDate], [RepairType]) VALUES (123123123, CAST(N'2016-05-04' AS Date), N'TireRotate')
INSERT [dbo].[REPAIR] ([CarVIN], [RepairDate], [RepairType]) VALUES (123123123, CAST(N'2017-01-20' AS Date), N'Emission')
INSERT [dbo].[REPAIR] ([CarVIN], [RepairDate], [RepairType]) VALUES (123123123, CAST(N'2017-07-20' AS Date), N'AirFilterChange')
INSERT [dbo].[REPAIR] ([CarVIN], [RepairDate], [RepairType]) VALUES (123123123, CAST(N'2017-12-21' AS Date), N'BatteryReplace')
INSERT [dbo].[REPAIR] ([CarVIN], [RepairDate], [RepairType]) VALUES (123123124, CAST(N'2016-01-03' AS Date), N'ClutchesAndBrakes')
INSERT [dbo].[REPAIR] ([CarVIN], [RepairDate], [RepairType]) VALUES (123123125, CAST(N'2017-07-04' AS Date), N'Suspension')
INSERT [dbo].[REPAIR] ([CarVIN], [RepairDate], [RepairType]) VALUES (123123126, CAST(N'2018-01-03' AS Date), N'OilChange')
INSERT [dbo].[ROADTEST] ([RoadTestID], [InstructorID], [ClientID], [CarVIN], [RoadTestDate], [Result], [ReasonForFailure]) VALUES (1001, 4, 10000001, 123123123, CAST(N'2018-03-01T09:00:00.000' AS DateTime), N'Failed', N'InappropriateSpeed')
INSERT [dbo].[ROADTEST] ([RoadTestID], [InstructorID], [ClientID], [CarVIN], [RoadTestDate], [Result], [ReasonForFailure]) VALUES (1002, 5, 10000002, 123123123, CAST(N'2018-03-15T09:00:00.000' AS DateTime), N'Passed', NULL)
INSERT [dbo].[ROADTEST] ([RoadTestID], [InstructorID], [ClientID], [CarVIN], [RoadTestDate], [Result], [ReasonForFailure]) VALUES (1003, 6, 10000003, 123123124, CAST(N'2018-04-01T09:00:00.000' AS DateTime), N'Failed', N'LackOfSteeringControl')
INSERT [dbo].[ROADTEST] ([RoadTestID], [InstructorID], [ClientID], [CarVIN], [RoadTestDate], [Result], [ReasonForFailure]) VALUES (1004, 7, 10000004, 123123125, CAST(N'2018-04-15T09:00:00.000' AS DateTime), N'Paased', NULL)
INSERT [dbo].[ROADTEST] ([RoadTestID], [InstructorID], [ClientID], [CarVIN], [RoadTestDate], [Result], [ReasonForFailure]) VALUES (1005, 8, 10000005, 123123126, CAST(N'2018-04-01T09:00:00.000' AS DateTime), N'Failed', N'HitSideWalkOrCurb')
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3001, 4, 10000001, 123123123, CAST(N'2018-04-01' AS Date), CAST(N'09:00:00' AS Time), 51, CAST(45.00 AS Decimal(19, 2)))
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3002, 5, 10000001, 123123123, CAST(N'2018-04-15' AS Date), CAST(N'09:00:00' AS Time), 47, CAST(45.00 AS Decimal(19, 2)))
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3003, 6, 10000001, 123123124, CAST(N'2018-04-20' AS Date), CAST(N'11:00:00' AS Time), 35, CAST(45.00 AS Decimal(19, 2)))
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3004, 6, 10000001, 123123126, CAST(N'2018-04-22' AS Date), CAST(N'09:00:00' AS Time), 62, CAST(45.00 AS Decimal(19, 2)))
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3005, 4, 10000001, 123123125, CAST(N'2018-04-23' AS Date), CAST(N'14:00:00' AS Time), 29, CAST(45.00 AS Decimal(19, 2)))
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3006, 7, 10000001, 123123126, CAST(N'2018-04-25' AS Date), CAST(N'12:00:00' AS Time), 31, CAST(45.00 AS Decimal(19, 2)))
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3007, 8, 10000002, 123123123, CAST(N'2018-04-08' AS Date), CAST(N'09:00:00' AS Time), 19, CAST(45.00 AS Decimal(19, 2)))
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3008, 5, 10000003, 123123124, CAST(N'2018-07-21' AS Date), CAST(N'15:00:00' AS Time), 34, CAST(45.00 AS Decimal(19, 2)))
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3009, 9, 10000004, 123123125, CAST(N'2018-04-12' AS Date), CAST(N'09:00:00' AS Time), 41, CAST(45.00 AS Decimal(19, 2)))
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3010, 10, 10000004, 123123126, CAST(N'2018-06-01' AS Date), CAST(N'11:00:00' AS Time), 23, CAST(45.00 AS Decimal(19, 2)))
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3011, 9, 10000005, 123123127, CAST(N'2018-04-14' AS Date), CAST(N'16:00:00' AS Time), 27, CAST(45.00 AS Decimal(19, 2)))
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3012, 10, 10000005, 123123127, CAST(N'2018-06-02' AS Date), CAST(N'18:00:00' AS Time), 33, CAST(45.00 AS Decimal(19, 2)))
INSERT [dbo].[SCHEDULEDLESSON] ([DrivingLessonID], [InstructorID], [ClientID], [CarVIN], [Date], [Time], [Mileage], [Price]) VALUES (3013, 4, 10000004, 123123124, CAST(N'2018-04-27' AS Date), CAST(N'17:00:00' AS Time), 22, CAST(45.00 AS Decimal(19, 2)))
/****** Object:  Index [UIX_DRISDI]    Script Date: 5/14/2018 10:51:31 AM ******/
ALTER TABLE [dbo].[INSTRUCTOR] ADD  CONSTRAINT [UIX_DRISDI] UNIQUE NONCLUSTERED 
(
	[InstructorLicenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[5HOURCLASS]  WITH CHECK ADD  CONSTRAINT [FK_5HOURCLASS_EMPLOYEE] FOREIGN KEY([PresenterID])
REFERENCES [dbo].[EMPLOYEE] ([EmployeeID])
GO
ALTER TABLE [dbo].[5HOURCLASS] CHECK CONSTRAINT [FK_5HOURCLASS_EMPLOYEE]
GO
ALTER TABLE [dbo].[CLIENT]  WITH CHECK ADD  CONSTRAINT [FK_CLIENT_CLASS] FOREIGN KEY([ClassID])
REFERENCES [dbo].[5HOURCLASS] ([ClassID])
GO
ALTER TABLE [dbo].[CLIENT] CHECK CONSTRAINT [FK_CLIENT_CLASS]
GO
ALTER TABLE [dbo].[COMPLETEDLESSON]  WITH CHECK ADD  CONSTRAINT [FK_COMPLETEDLESSON_INSTRUCTOR] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[INSTRUCTOR] ([InstructorID])
GO
ALTER TABLE [dbo].[COMPLETEDLESSON] CHECK CONSTRAINT [FK_COMPLETEDLESSON_INSTRUCTOR]
GO
ALTER TABLE [dbo].[COMPLETEDLESSON]  WITH CHECK ADD  CONSTRAINT [FK_COMPLETEDLESSON_SCHEDULEDLESSON] FOREIGN KEY([DrivingLessonID])
REFERENCES [dbo].[SCHEDULEDLESSON] ([DrivingLessonID])
GO
ALTER TABLE [dbo].[COMPLETEDLESSON] CHECK CONSTRAINT [FK_COMPLETEDLESSON_SCHEDULEDLESSON]
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEE_MANAGER] FOREIGN KEY([Reporsto])
REFERENCES [dbo].[MANAGER] ([ManagerID])
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [FK_EMPLOYEE_MANAGER]
GO
ALTER TABLE [dbo].[EMPLOYEEJOBS]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEEJOBS_EMPLOYEE] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EMPLOYEE] ([EmployeeID])
GO
ALTER TABLE [dbo].[EMPLOYEEJOBS] CHECK CONSTRAINT [FK_EMPLOYEEJOBS_EMPLOYEE]
GO
ALTER TABLE [dbo].[EMPLOYEEJOBS]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEEJOBS_JOB] FOREIGN KEY([JobID])
REFERENCES [dbo].[JOB] ([JobID])
GO
ALTER TABLE [dbo].[EMPLOYEEJOBS] CHECK CONSTRAINT [FK_EMPLOYEEJOBS_JOB]
GO
ALTER TABLE [dbo].[INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_CAR] FOREIGN KEY([CarVIN])
REFERENCES [dbo].[CAR] ([CarVIN])
GO
ALTER TABLE [dbo].[INSPECTION] CHECK CONSTRAINT [FK_INSPECTION_CAR]
GO
ALTER TABLE [dbo].[INSTRUCTOR]  WITH CHECK ADD  CONSTRAINT [FK_INSTRUCTOR_EMPLOYEE] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[EMPLOYEE] ([EmployeeID])
GO
ALTER TABLE [dbo].[INSTRUCTOR] CHECK CONSTRAINT [FK_INSTRUCTOR_EMPLOYEE]
GO
ALTER TABLE [dbo].[INSTRUCTORVACATION]  WITH CHECK ADD  CONSTRAINT [FK_INSTRUCTORVACATION_INSTRUCTOR] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[INSTRUCTOR] ([InstructorID])
GO
ALTER TABLE [dbo].[INSTRUCTORVACATION] CHECK CONSTRAINT [FK_INSTRUCTORVACATION_INSTRUCTOR]
GO
ALTER TABLE [dbo].[MANAGER]  WITH CHECK ADD  CONSTRAINT [FK_MANAGER_EMPLOYEE] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[EMPLOYEE] ([EmployeeID])
GO
ALTER TABLE [dbo].[MANAGER] CHECK CONSTRAINT [FK_MANAGER_EMPLOYEE]
GO
ALTER TABLE [dbo].[OFFICE]  WITH CHECK ADD  CONSTRAINT [FK_OFFICE_MANAGER] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[MANAGER] ([ManagerID])
GO
ALTER TABLE [dbo].[OFFICE] CHECK CONSTRAINT [FK_OFFICE_MANAGER]
GO
ALTER TABLE [dbo].[REPAIR]  WITH CHECK ADD  CONSTRAINT [FK_REPAIR_CAR] FOREIGN KEY([CarVIN])
REFERENCES [dbo].[CAR] ([CarVIN])
GO
ALTER TABLE [dbo].[REPAIR] CHECK CONSTRAINT [FK_REPAIR_CAR]
GO
ALTER TABLE [dbo].[ROADTEST]  WITH CHECK ADD  CONSTRAINT [FK_ROADTEST_CAR] FOREIGN KEY([CarVIN])
REFERENCES [dbo].[CAR] ([CarVIN])
GO
ALTER TABLE [dbo].[ROADTEST] CHECK CONSTRAINT [FK_ROADTEST_CAR]
GO
ALTER TABLE [dbo].[ROADTEST]  WITH CHECK ADD  CONSTRAINT [FK_ROADTEST_CLIENT] FOREIGN KEY([ClientID])
REFERENCES [dbo].[CLIENT] ([ClientID])
GO
ALTER TABLE [dbo].[ROADTEST] CHECK CONSTRAINT [FK_ROADTEST_CLIENT]
GO
ALTER TABLE [dbo].[ROADTEST]  WITH CHECK ADD  CONSTRAINT [FK_ROADTEST_INSTRUCTOR] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[INSTRUCTOR] ([InstructorID])
GO
ALTER TABLE [dbo].[ROADTEST] CHECK CONSTRAINT [FK_ROADTEST_INSTRUCTOR]
GO
ALTER TABLE [dbo].[SCHEDULEDLESSON]  WITH CHECK ADD  CONSTRAINT [FK_SCHEDULEDLESSON_CAR] FOREIGN KEY([CarVIN])
REFERENCES [dbo].[CAR] ([CarVIN])
GO
ALTER TABLE [dbo].[SCHEDULEDLESSON] CHECK CONSTRAINT [FK_SCHEDULEDLESSON_CAR]
GO
ALTER TABLE [dbo].[SCHEDULEDLESSON]  WITH CHECK ADD  CONSTRAINT [FK_SCHEDULEDLESSON_CLIENT] FOREIGN KEY([ClientID])
REFERENCES [dbo].[CLIENT] ([ClientID])
GO
ALTER TABLE [dbo].[SCHEDULEDLESSON] CHECK CONSTRAINT [FK_SCHEDULEDLESSON_CLIENT]
GO
ALTER TABLE [dbo].[SCHEDULEDLESSON]  WITH CHECK ADD  CONSTRAINT [FK_SCHEDULEDLESSON_INSTRUCTOR] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[INSTRUCTOR] ([InstructorID])
GO
ALTER TABLE [dbo].[SCHEDULEDLESSON] CHECK CONSTRAINT [FK_SCHEDULEDLESSON_INSTRUCTOR]
GO
ALTER TABLE [dbo].[CAR]  WITH CHECK ADD  CONSTRAINT [CHKYEAR] CHECK  ((datediff(year,[modelyear],[dateofpurchase])<=(5)))
GO
ALTER TABLE [dbo].[CAR] CHECK CONSTRAINT [CHKYEAR]
GO
ALTER TABLE [dbo].[CLIENT]  WITH CHECK ADD  CONSTRAINT [CHK_BIRTHDATE] CHECK  ((datediff(year,[birthdate],getdate())>=(18)))
GO
ALTER TABLE [dbo].[CLIENT] CHECK CONSTRAINT [CHK_BIRTHDATE]
GO
ALTER TABLE [dbo].[SCHEDULEDLESSON]  WITH CHECK ADD  CONSTRAINT [CHK_TIME] CHECK  (([time]>='08:00' AND [time]<='20:00'))
GO
ALTER TABLE [dbo].[SCHEDULEDLESSON] CHECK CONSTRAINT [CHK_TIME]
GO
USE [master]
GO
ALTER DATABASE [DrivingSchool] SET  READ_WRITE 
GO
