USE [master]
GO
/****** Object:  Database [epush]    Script Date: 1/16/2018 5:38:26 PM ******/
CREATE DATABASE [epush] ON  PRIMARY 
( NAME = N'epushserver', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\epush.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'epushserver_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\epush_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [epush].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [epush] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [epush] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [epush] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [epush] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [epush] SET ARITHABORT OFF 
GO
ALTER DATABASE [epush] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [epush] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [epush] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [epush] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [epush] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [epush] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [epush] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [epush] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [epush] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [epush] SET  DISABLE_BROKER 
GO
ALTER DATABASE [epush] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [epush] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [epush] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [epush] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [epush] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [epush] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [epush] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [epush] SET  MULTI_USER 
GO
ALTER DATABASE [epush] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [epush] SET DB_CHAINING OFF 
GO
USE [epush]
GO
/****** Object:  Table [dbo].[BioFormat]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BioFormat](
	[BioFormatId] [int] NOT NULL,
	[BioFormat] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_BioFormat] PRIMARY KEY CLUSTERED 
(
	[BioFormatId] ASC,
	[BioFormat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BioType]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BioType](
	[BioTypeId] [int] NOT NULL,
	[BioType] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_BioType] PRIMARY KEY CLUSTERED 
(
	[BioTypeId] ASC,
	[BioType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commands]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commands](
	[CommandId] [bigint] IDENTITY(1,1) NOT NULL,
	[CommandTypeId] [int] NOT NULL,
	[DeviceId] [bigint] NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[BioId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[DeviceCommandId] [bigint] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Commands] PRIMARY KEY CLUSTERED 
(
	[CommandId] ASC,
	[CommandTypeId] ASC,
	[DeviceId] ASC,
	[EmployeeId] ASC,
	[BioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceCommands]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceCommands](
	[DeviceCommandId] [int] IDENTITY(101,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[DeviceCommand] [nvarchar](4000) NULL,
	[SerialNumber] [nvarchar](255) NOT NULL,
	[Status] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[CreationDate] [datetime] NULL,
	[ExecutionDate] [datetime] NULL,
 CONSTRAINT [PK_DeviceCommands] PRIMARY KEY CLUSTERED 
(
	[DeviceCommandId] ASC,
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceErrorMessages]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceErrorMessages](
	[DeviceErrorMessageId] [int] IDENTITY(101,1) NOT NULL,
	[SerialNumber] [nvarchar](50) NOT NULL,
	[ErrorMessage] [nvarchar](500) NULL,
	[LogStream] [nvarchar](4000) NULL,
	[CreatedDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_DeviceErrorMessages] PRIMARY KEY CLUSTERED 
(
	[DeviceErrorMessageId] ASC,
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceGroup]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceGroup](
	[DeviceGroupId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[VerificationTypeId] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DeviceGroup] PRIMARY KEY CLUSTERED 
(
	[DeviceGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceLogs]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceLogs](
	[DeviceLogId] [int] IDENTITY(1,1) NOT NULL,
	[DownloadDate] [datetime] NULL,
	[DeviceId] [int] NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[LogDate] [datetime] NOT NULL,
	[Direction] [nvarchar](255) NULL,
	[AttDirection] [nvarchar](255) NULL,
	[C1] [nvarchar](255) NULL,
	[C2] [nvarchar](255) NULL,
	[C3] [nvarchar](255) NULL,
	[C4] [nvarchar](255) NULL,
	[C5] [nvarchar](255) NULL,
	[C6] [nvarchar](255) NULL,
	[C7] [nvarchar](255) NULL,
	[WorkCode] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceLogs_Processed]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceLogs_Processed](
	[DeviceLogId] [int] IDENTITY(1,1) NOT NULL,
	[DownloadDate] [datetime] NULL,
	[DeviceId] [int] NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[LogDate] [datetime] NOT NULL,
	[Direction] [nvarchar](255) NULL,
	[AttDirection] [nvarchar](255) NULL,
	[C1] [nvarchar](255) NULL,
	[C2] [nvarchar](255) NULL,
	[C3] [nvarchar](255) NULL,
	[C4] [nvarchar](255) NULL,
	[C5] [nvarchar](255) NULL,
	[C6] [nvarchar](255) NULL,
	[C7] [nvarchar](255) NULL,
	[WorkCode] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceLogsInfoBL]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceLogsInfoBL](
	[DeviceLogId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DownloadDate] [datetime] NULL,
	[DeviceId] [int] NOT NULL,
	[LogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DeviceLogsInfoBL] PRIMARY KEY CLUSTERED 
(
	[DeviceId] ASC,
	[LogDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceOperationLogs]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceOperationLogs](
	[DeviceOperationLogId] [int] IDENTITY(1,1) NOT NULL,
	[DeviceOperationLogCode] [int] NULL,
	[DeviceOperationLogExecutedOn] [datetime] NOT NULL,
	[SerialNumber] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_DeviceOperationLogs] PRIMARY KEY CLUSTERED 
(
	[DeviceOperationLogId] ASC,
	[DeviceOperationLogExecutedOn] ASC,
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceOperationLogTypes]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceOperationLogTypes](
	[OperationLogTypeId] [int] NOT NULL,
	[OperationLogTypeCode] [int] NULL,
	[OperationLogTypeName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devices]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices](
	[DeviceId] [int] IDENTITY(101,1) NOT NULL,
	[DeviceFName] [nvarchar](255) NOT NULL,
	[DeviceSName] [nvarchar](255) NOT NULL,
	[DeviceDirection] [nvarchar](255) NULL,
	[SerialNumber] [nvarchar](255) NOT NULL,
	[ConnectionType] [nvarchar](255) NULL,
	[IpAddress] [nvarchar](255) NULL,
	[BaudRate] [nvarchar](255) NULL,
	[CommKey] [nvarchar](255) NOT NULL,
	[ComPort] [nvarchar](255) NULL,
	[LastLogDownloadDate] [datetime] NULL,
	[C1] [nvarchar](255) NULL,
	[C2] [nvarchar](255) NULL,
	[C3] [nvarchar](255) NULL,
	[C4] [nvarchar](255) NULL,
	[C5] [nvarchar](255) NULL,
	[C6] [nvarchar](255) NULL,
	[C7] [nvarchar](255) NULL,
	[TransactionStamp] [nvarchar](50) NULL,
	[LastPing] [datetime] NULL,
	[DeviceType] [nvarchar](255) NULL,
	[OpStamp] [nvarchar](255) NULL,
	[DownLoadType] [int] NULL,
	[Timezone] [nvarchar](50) NULL,
	[DeviceLocation] [nvarchar](50) NULL,
	[TimeOut] [nvarchar](50) NULL,
 CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED 
(
	[DeviceId] ASC,
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(101,1) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[EmployeeCode] [nvarchar](50) NOT NULL,
	[StringCode] [nvarchar](50) NOT NULL,
	[NumericCode] [int] NOT NULL,
	[Gender] [nvarchar](255) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Designation] [nvarchar](255) NULL,
	[CategoryId] [int] NOT NULL,
	[DOJ] [datetime] NULL,
	[DOR] [datetime] NULL,
	[DOC] [datetime] NULL,
	[EmployeeCodeInDevice] [nvarchar](50) NOT NULL,
	[EmployeeRFIDNumber] [nvarchar](255) NULL,
	[EmployementType] [nvarchar](255) NOT NULL,
	[Status] [nvarchar](255) NOT NULL,
	[EmployeeDevicePassword] [nvarchar](50) NULL,
	[EmployeeDeviceGroup] [nvarchar](50) NULL,
	[FatherName] [nvarchar](255) NULL,
	[MotherName] [nvarchar](255) NULL,
	[ResidentialAddress] [nvarchar](255) NULL,
	[PermanentAddress] [nvarchar](255) NULL,
	[ContactNo] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[DOB] [datetime] NULL,
	[PlaceOfBirth] [nvarchar](255) NULL,
	[Nomenee1] [nvarchar](255) NULL,
	[Nomenee2] [nvarchar](255) NULL,
	[Remarks] [ntext] NULL,
	[RecordStatus] [int] NULL,
	[C1] [nvarchar](255) NULL,
	[C2] [nvarchar](255) NULL,
	[C3] [nvarchar](255) NULL,
	[C4] [nvarchar](255) NULL,
	[C5] [nvarchar](255) NULL,
	[C6] [nvarchar](255) NULL,
	[C7] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[BLOODGROUP] [nvarchar](255) NULL,
	[WorkPlace] [nvarchar](255) NULL,
	[ExtensionNo] [nvarchar](255) NULL,
	[LoginName] [nvarchar](255) NULL,
	[LoginPassword] [nvarchar](255) NULL,
	[Grade] [nvarchar](255) NULL,
	[Team] [nvarchar](255) NULL,
	[IsRecieveNotification] [int] NULL,
	[HolidayGroup] [int] NULL,
	[ShiftGroupId] [int] NULL,
	[ShiftRosterId] [int] NULL,
	[LastModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employees_1] PRIMARY KEY CLUSTERED 
(
	[EmployeeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesBio]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesBio](
	[EmployeeBioId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[BioType] [nvarchar](50) NOT NULL,
	[BioVersion] [nvarchar](50) NULL,
	[BioIndex] [int] NOT NULL,
	[BioId] [int] NOT NULL,
	[Bio] [ntext] NULL,
	[BioFormatId] [int] NOT NULL,
 CONSTRAINT [PK_EmployeesBio] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC,
	[BioType] ASC,
	[BioIndex] ASC,
	[BioId] ASC,
	[BioFormatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeZone]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeZone](
	[TimeZoneId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[SunStart] [nvarchar](10) NOT NULL,
	[SunEnd] [nvarchar](10) NOT NULL,
	[MonStart] [nvarchar](10) NOT NULL,
	[MonEnd] [nvarchar](10) NOT NULL,
	[TueStart] [nvarchar](10) NOT NULL,
	[TueEnd] [nvarchar](10) NOT NULL,
	[WedStart] [nvarchar](10) NOT NULL,
	[WedEnd] [nvarchar](10) NOT NULL,
	[ThuStart] [nvarchar](10) NOT NULL,
	[ThuEnd] [nvarchar](10) NOT NULL,
	[FriStart] [nvarchar](10) NOT NULL,
	[FriEnd] [nvarchar](10) NOT NULL,
	[SatStart] [nvarchar](10) NOT NULL,
	[SatEnd] [nvarchar](10) NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TimeZone] PRIMARY KEY CLUSTERED 
(
	[TimeZoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(101,1) NOT NULL,
	[LoginName] [nvarchar](50) NOT NULL,
	[LoginPassword] [nvarchar](50) NOT NULL,
	[RoleName] [nvarchar](255) NULL,
	[IsAdmin] [int] NOT NULL,
	[AccessI] [int] NOT NULL,
	[RecordStatus] [int] NULL,
	[C1] [nvarchar](255) NULL,
	[C2] [nvarchar](255) NULL,
	[C3] [nvarchar](255) NULL,
	[C4] [nvarchar](255) NULL,
	[C5] [nvarchar](255) NULL,
	[C6] [nvarchar](255) NULL,
	[C7] [nvarchar](255) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerificationMode]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerificationMode](
	[VerifyMethodCode] [int] NULL,
	[VerifyMethodName] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerificationType]    Script Date: 1/16/2018 5:38:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerificationType](
	[VerificationTypeId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_VerificationType] PRIMARY KEY CLUSTERED 
(
	[VerificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[BioFormat] ([BioFormatId], [BioFormat]) VALUES (0, N'ES')
INSERT [dbo].[BioFormat] ([BioFormatId], [BioFormat]) VALUES (1, N'ISO')
INSERT [dbo].[BioFormat] ([BioFormatId], [BioFormat]) VALUES (2, N'ANSI')
INSERT [dbo].[BioType] ([BioTypeId], [BioType]) VALUES (0, N'UserPic')
INSERT [dbo].[BioType] ([BioTypeId], [BioType]) VALUES (1, N'Fingerprint')
INSERT [dbo].[BioType] ([BioTypeId], [BioType]) VALUES (2, N'Face')
INSERT [dbo].[BioType] ([BioTypeId], [BioType]) VALUES (3, N'Voiceprint')
INSERT [dbo].[BioType] ([BioTypeId], [BioType]) VALUES (4, N'Iris')
INSERT [dbo].[BioType] ([BioTypeId], [BioType]) VALUES (5, N'Retina')
INSERT [dbo].[BioType] ([BioTypeId], [BioType]) VALUES (6, N'Palmprint')
INSERT [dbo].[BioType] ([BioTypeId], [BioType]) VALUES (7, N'Fingervein')
INSERT [dbo].[BioType] ([BioTypeId], [BioType]) VALUES (8, N'Palm')
INSERT [dbo].[DeviceGroup] ([DeviceGroupId], [Name], [Description], [VerificationTypeId], [LastModifiedDate]) VALUES (1, N'DeviceGroup 01', N'DeviceGroup 01', 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DeviceGroup] ([DeviceGroupId], [Name], [Description], [VerificationTypeId], [LastModifiedDate]) VALUES (2, N'DeviceGroup 02', N'DeviceGroup 02', 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DeviceGroup] ([DeviceGroupId], [Name], [Description], [VerificationTypeId], [LastModifiedDate]) VALUES (3, N'DeviceGroup 03', N'DeviceGroup 03', 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DeviceGroup] ([DeviceGroupId], [Name], [Description], [VerificationTypeId], [LastModifiedDate]) VALUES (4, N'DeviceGroup 04', N'DeviceGroup 04', 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DeviceGroup] ([DeviceGroupId], [Name], [Description], [VerificationTypeId], [LastModifiedDate]) VALUES (5, N'DeviceGroup 05', N'DeviceGroup 05', 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DeviceGroup] ([DeviceGroupId], [Name], [Description], [VerificationTypeId], [LastModifiedDate]) VALUES (6, N'DeviceGroup 06', N'DeviceGroup 06', 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DeviceGroup] ([DeviceGroupId], [Name], [Description], [VerificationTypeId], [LastModifiedDate]) VALUES (7, N'DeviceGroup 07', N'DeviceGroup 07', 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DeviceGroup] ([DeviceGroupId], [Name], [Description], [VerificationTypeId], [LastModifiedDate]) VALUES (8, N'DeviceGroup 08', N'DeviceGroup 08', 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DeviceGroup] ([DeviceGroupId], [Name], [Description], [VerificationTypeId], [LastModifiedDate]) VALUES (9, N'DeviceGroup 09', N'DeviceGroup 09', 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DeviceGroup] ([DeviceGroupId], [Name], [Description], [VerificationTypeId], [LastModifiedDate]) VALUES (10, N'DeviceGroup 10', N'DeviceGroup 10', 0, CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (1, 0, N'Power On')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (2, 1, N'Power Off')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (3, 2, N'The Authentication is Failed')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (4, 3, N'Alarm')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (5, 4, N'Enter into the Main Menu')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (6, 5, N'Change The Setting')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (7, 6, N'Enroll a FingerPrint')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (8, 7, N'Enroll a Password')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (9, 8, N'Enroll a HID Card')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (10, 9, N'Delete a User')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (11, 10, N'Delete a FingerPrint')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (12, 11, N'Delete a Password')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (13, 12, N'Delete a RFID Card')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (14, 13, N'Clear the Data')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (15, 14, N'Create a MF Card')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (16, 15, N'Enroll a MF Card')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (17, 16, N'Register  a MF Card')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (18, 17, N'Delete The Registration of MF Card')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (19, 18, N'Clear the MF Cards Content')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (20, 19, N'Move The Enroll Data into Card')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (21, 20, N'Coyp The Data in The Card to The Machine')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (22, 21, N'Set The Time')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (23, 22, N'Factory Setting')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (24, 23, N'Delete The In And Out Record')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (25, 24, N'Clear The Administrator Privilege')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (26, 25, N'Modify The Setting of Access Control Group')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (27, 26, N'Modify The Setting Of User Access Control')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (28, 27, N'Modify The Time Field Of Access Control')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (29, 28, N'Modify The Setting Of Unclock Combination')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (30, 29, N'Unclock')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (31, 30, N'Enroll a User')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (32, 31, N'Change The Finger Prints Attribute')
INSERT [dbo].[DeviceOperationLogTypes] ([OperationLogTypeId], [OperationLogTypeCode], [OperationLogTypeName]) VALUES (33, 32, N'Duress Alarm')
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (1, N'TimeZone 01', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (2, N'TimeZone 02', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (3, N'TimeZone 03', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (4, N'TimeZone 04', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (5, N'TimeZone 05', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (6, N'TimeZone 06', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (7, N'TimeZone 07', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (8, N'TimeZone 08', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (9, N'TimeZone 09', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (10, N'TimeZone 10', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (11, N'TimeZone 11', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (12, N'TimeZone 12', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (13, N'TimeZone 13', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (14, N'TimeZone 14', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (15, N'TimeZone 15', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (16, N'TimeZone 16', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (17, N'TimeZone 17', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (18, N'TimeZone 18', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (19, N'TimeZone 19', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (20, N'TimeZone 20', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (21, N'TimeZone 21', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (22, N'TimeZone 22', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (23, N'TimeZone 23', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (24, N'TimeZone 24', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (25, N'TimeZone 25', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (26, N'TimeZone 26', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (27, N'TimeZone 27', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (28, N'TimeZone 28', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (29, N'TimeZone 29', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (30, N'TimeZone 30', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (31, N'TimeZone 31', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (32, N'TimeZone 32', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (33, N'TimeZone 33', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (34, N'TimeZone 34', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (35, N'TimeZone 35', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (36, N'TimeZone 36', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (37, N'TimeZone 37', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (38, N'TimeZone 38', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (39, N'TimeZone 39', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (40, N'TimeZone 40', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (41, N'TimeZone 41', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (42, N'TimeZone 42', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (43, N'TimeZone 43', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (44, N'TimeZone 44', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (45, N'TimeZone 45', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (46, N'TimeZone 46', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (47, N'TimeZone 47', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (48, N'TimeZone 48', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (49, N'TimeZone 49', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TimeZone] ([TimeZoneId], [Name], [Description], [SunStart], [SunEnd], [MonStart], [MonEnd], [TueStart], [TueEnd], [WedStart], [WedEnd], [ThuStart], [ThuEnd], [FriStart], [FriEnd], [SatStart], [SatEnd], [LastModifiedDate]) VALUES (50, N'TimeZone 50', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', N'0000', CAST(N'1970-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [LoginName], [LoginPassword], [RoleName], [IsAdmin], [AccessI], [RecordStatus], [C1], [C2], [C3], [C4], [C5], [C6], [C7]) VALUES (101, N'root', N'63A9F0EA7BB98050796B649E85481845', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2018-01-12 17:09:12')
INSERT [dbo].[Users] ([UserId], [LoginName], [LoginPassword], [RoleName], [IsAdmin], [AccessI], [RecordStatus], [C1], [C2], [C3], [C4], [C5], [C6], [C7]) VALUES (102, N'system', N'202CB962AC59075B964B07152D234B70', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (0, N'VS_FP_OR_PW_OR_RF_OR_FACE')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (1, N'VS_FP')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (2, N'VS_PIN')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (3, N'VS_PW')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (4, N'VS_RF')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (5, N'VS_FP_OR_PW')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (6, N'VS_FP_OR_RF')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (7, N'VS_PW_OR_RF')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (8, N'VS_PIN_AND_FP')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (9, N'VS_FP_AND_PW')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (10, N'VS_FP_AND_RF')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (11, N'VS_PW_AND_RF')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (12, N'VS_FP_AND_PW_AND_RF')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (13, N'VS_PIN_AND_FP_AND_PW')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (14, N'VS_FP_AND_RF_OR_PIN')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (15, N'VS_FACE')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (16, N'VS_FACE_AND_FP')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (17, N'VS_FACE_AND_PW')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (18, N'VS_FACE_AND_RF')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (19, N'VS_FACE_AND_FP_AND_RF')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (20, N'VS_FACE_AND_FP_AND_PW')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (21, N'VS_OTHER')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (22, N'VS_NUM')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (25, N'VS_PALM')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (101, N'VS_FP')
INSERT [dbo].[VerificationMode] ([VerifyMethodCode], [VerifyMethodName]) VALUES (102, N'VS_RF')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (0, N'Fingerprint or Password or Badge')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (1, N'Fingerprint Only')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (2, N'EmployeeCode Only')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (3, N'Password Only')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (4, N'Badge Only')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (5, N'Fingerprint or Password')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (6, N'Fingerprint or Badge')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (7, N'Password or Badge')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (8, N'EmployeeCode And Fingerprint')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (9, N'Fingerprint And Password')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (10, N'Fingerprint And Badge')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (11, N'Password And Badge')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (12, N'Fingerprint And Password And Badge')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (13, N'EmployeeCode And Fingerprint And Password')
INSERT [dbo].[VerificationType] ([VerificationTypeId], [Name]) VALUES (14, N'Fingerprint And Badge And EmployeeCode')
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_DeviceGroup_Name]    Script Date: 1/16/2018 5:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_DeviceGroup_Name] ON [dbo].[DeviceGroup]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_EmployeeCodeInDevice]    Script Date: 1/16/2018 5:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_EmployeeCodeInDevice] ON [dbo].[Employees]
(
	[EmployeeCodeInDevice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_TimeZone_Name]    Script Date: 1/16/2018 5:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_TimeZone_Name] ON [dbo].[TimeZone]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeesBio] ADD  CONSTRAINT [DF_EmployeesBio_BioIndex]  DEFAULT ((0)) FOR [BioIndex]
GO
ALTER TABLE [dbo].[EmployeesBio] ADD  CONSTRAINT [DF_EmployeesBio_BioFormatId]  DEFAULT ((0)) FOR [BioFormatId]
GO
USE [master]
GO
ALTER DATABASE [epush] SET  READ_WRITE 
GO
