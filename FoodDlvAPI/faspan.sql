USE [master]
GO
/****** Object:  Database [FoodDelivery]    Script Date: 2023/3/21 下午 09:48:38 ******/
CREATE DATABASE [FoodDelivery]
ALTER DATABASE [FoodDelivery] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodDelivery].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodDelivery] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodDelivery] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodDelivery] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodDelivery] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodDelivery] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodDelivery] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FoodDelivery] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodDelivery] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodDelivery] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodDelivery] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodDelivery] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodDelivery] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodDelivery] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodDelivery] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodDelivery] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FoodDelivery] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodDelivery] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodDelivery] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodDelivery] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodDelivery] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodDelivery] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FoodDelivery] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodDelivery] SET RECOVERY FULL 
GO
ALTER DATABASE [FoodDelivery] SET  MULTI_USER 
GO
ALTER DATABASE [FoodDelivery] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodDelivery] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodDelivery] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodDelivery] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FoodDelivery] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FoodDelivery] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FoodDelivery', N'ON'
GO
ALTER DATABASE [FoodDelivery] SET QUERY_STORE = ON
GO
ALTER DATABASE [FoodDelivery] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FoodDelivery]
GO
/****** Object:  User [FoodDiv]    Script Date: 2023/3/21 下午 09:48:38 ******/
CREATE USER [FoodDiv] FOR LOGIN [FoodDiv] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [FoodDiv]
GO
/****** Object:  Table [dbo].[AccountAddress]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountAddress](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AccountAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountStatues]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountStatues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_MemberAccountStatues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIs]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[APIName] [nvarchar](50) NOT NULL,
	[APIKey] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_API] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppealRecord]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppealRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[ComplaintId] [int] NOT NULL,
	[Content] [nvarchar](500) NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_AppealRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BenefitStandard]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenefitStandard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PerOrder] [int] NOT NULL,
	[PerMilage] [int] NOT NULL,
	[BonusThreshold1] [int] NOT NULL,
	[BonusThreshold2] [int] NOT NULL,
	[BonusThreshold3] [int] NOT NULL,
	[Bouns1] [int] NOT NULL,
	[Bouns2] [int] NOT NULL,
	[Bouns3] [int] NOT NULL,
	[HolidayBouns] [float] NOT NULL,
	[RushHoursBouns] [float] NOT NULL,
	[RushHoursStart1] [time](7) NOT NULL,
	[RushHoursStart2] [time](7) NOT NULL,
	[RushHoursEnd1] [time](7) NOT NULL,
	[RushHoursEnd2] [time](7) NOT NULL,
	[Selected] [bit] NOT NULL,
 CONSTRAINT [PK_BenefitStandard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdentifyNum] [int] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[ItemId] [int] NULL,
	[Qty] [int] NOT NULL,
	[CartId] [bigint] NOT NULL,
 CONSTRAINT [PK_CartCustomizationItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommonReplies]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommonReplies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Answer] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_CommonReplies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplaintStatus]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ComplaintStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplaintType]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComplaintType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ComplaintType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCards]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[BankName] [nvarchar](10) NOT NULL,
	[CreditCard] [nchar](16) NOT NULL,
 CONSTRAINT [PK_CreditCards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryDrivers]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryDrivers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountStatusId] [int] NOT NULL,
	[WorkStatuseId] [int] NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Phone] [nchar](10) NOT NULL,
	[BankAccount] [nvarchar](50) NOT NULL,
	[IDCard] [nvarchar](50) NOT NULL,
	[RegistrationTime] [datetime] NOT NULL,
	[VehicleRegistration] [nvarchar](50) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[DriverLicense] [nvarchar](50) NOT NULL,
	[longitude] [float] NULL,
	[latitude] [float] NULL,
 CONSTRAINT [PK_DeliveryDrivers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryDriverWorkStatuses]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryDriverWorkStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_DeliveryDriverWorkStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryViolationRecords]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryViolationRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryDriversId] [int] NOT NULL,
	[ViolationId] [int] NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ViolationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DeliveryViolationRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryViolationTypes]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryViolationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ViolationContent] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](100) NULL,
 CONSTRAINT [PK_DeliveryViolationLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverCancellationRecords]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverCancellationRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CancellationId] [int] NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[DeliveryDriversId] [int] NOT NULL,
	[CancellationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CancellationRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverCancellations]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverCancellations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](100) NULL,
 CONSTRAINT [PK_Cancellations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favourites]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourites](
	[MemberId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
 CONSTRAINT [PK_Favourites] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC,
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountStatusId] [int] NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Phone] [nchar](10) NOT NULL,
	[Balance] [int] NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[RegistrationTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberViolationRecords]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberViolationRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[ViolationId] [int] NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ViolationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberViolationRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberViolationTypes]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberViolationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ViolationContent] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](100) NULL,
 CONSTRAINT [PK_MemberViolationList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdentifyNum] [int] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[ProductPrice] [int] NOT NULL,
	[ItemId] [int] NULL,
	[ItemPrice] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[OrderId] [bigint] NOT NULL,
 CONSTRAINT [PK_OrderAssItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DeliveryDriversId] [int] NULL,
	[MemberId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[DeliveryFee] [int] NOT NULL,
	[DeliveryAddress] [nvarchar](100) NOT NULL,
	[DriverRating] [int] NULL,
	[StoreRating] [int] NULL,
	[DriverComment] [nvarchar](100) NULL,
	[StoreComment] [nvarchar](100) NULL,
	[Milage] [decimal](18, 0) NOT NULL,
	[CreateMark] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderSchedules]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderSchedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[StatusId] [int] NOT NULL,
	[MarkTime] [datetime] NOT NULL,
 CONSTRAINT [PK_OrderStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatues]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_OrderStatues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pays]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryDriversId] [int] NOT NULL,
	[DeliveryCount] [int] NOT NULL,
	[TotalMilage] [int] NOT NULL,
	[Bouns] [int] NOT NULL,
	[TotalPay] [int] NOT NULL,
	[SettlementMonth] [date] NOT NULL,
 CONSTRAINT [PK_Pays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessingStatues]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessingStatues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ProcessingStatues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCustomizationItems]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCustomizationItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProuctId] [bigint] NOT NULL,
	[ItemName] [nvarchar](50) NOT NULL,
	[UnitPrice] [int] NOT NULL,
 CONSTRAINT [PK_CustomizationItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](100) NULL,
	[ProductContent] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
	[UnitPrice] [int] NOT NULL,
 CONSTRAINT [PK_ProductInformations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QA]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Answer] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_QA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QACategory]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QACategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Displayorder] [int] NOT NULL,
 CONSTRAINT [PK_QACategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[EncryptedPassword] [nvarchar](200) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[RegistrationTime] [date] NOT NULL,
	[Photo] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NOT NULL,
	[birthday] [date] NOT NULL,
 CONSTRAINT [PK_CustomerServices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreBusinessHour]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreBusinessHour](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[OpeningTime] [time](7) NOT NULL,
	[ClosingTime] [time](7) NOT NULL,
	[OpeningDays] [int] NOT NULL,
 CONSTRAINT [PK_StoreBusinessHour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreCancellationRecords]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreCancellationRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CancellationId] [int] NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[StoreId] [int] NOT NULL,
	[CancellationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StoreCancellationRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreCancellationTypes]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreCancellationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](100) NULL,
 CONSTRAINT [PK_StoreCancellations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreCategories]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[CategoryContent] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_StoreCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorePrincipals]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorePrincipals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountStatusId] [int] NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Phone] [nchar](10) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Birthday] [date] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[RegistrationTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ShopPrincipal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StorePrincipalId] [int] NOT NULL,
	[StoreName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[ContactNumber] [nvarchar](10) NOT NULL,
	[Photo] [nvarchar](50) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoresCategoriesLists]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoresCategoriesLists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_StoresCategoriesLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreViolationRecords]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreViolationRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[ViolationId] [int] NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ViolationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StoreViolationRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreViolationTypes]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreViolationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ViolationContent] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](100) NULL,
 CONSTRAINT [PK_StoreViolationList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreWallet]    Script Date: 2023/3/21 下午 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreWallet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[Total] [int] NOT NULL,
 CONSTRAINT [PK_StoreWallet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccountAddress] ON 

INSERT [dbo].[AccountAddress] ([Id], [MemberId], [Address]) VALUES (3, 17, N'聖德基督學院')
INSERT [dbo].[AccountAddress] ([Id], [MemberId], [Address]) VALUES (7, 17, N'桃園市中壢區新生路105號')
INSERT [dbo].[AccountAddress] ([Id], [MemberId], [Address]) VALUES (15, 14, N'320桃園市中壢區元化路357號號 B1')
INSERT [dbo].[AccountAddress] ([Id], [MemberId], [Address]) VALUES (18, 17, N'320桃園市中壢區大同路48號')
SET IDENTITY_INSERT [dbo].[AccountAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountStatues] ON 

INSERT [dbo].[AccountStatues] ([Id], [Status]) VALUES (1, N'未開通')
INSERT [dbo].[AccountStatues] ([Id], [Status]) VALUES (2, N'已開通')
INSERT [dbo].[AccountStatues] ([Id], [Status]) VALUES (3, N'已停用')
SET IDENTITY_INSERT [dbo].[AccountStatues] OFF
GO
SET IDENTITY_INSERT [dbo].[BenefitStandard] ON 

INSERT [dbo].[BenefitStandard] ([Id], [PerOrder], [PerMilage], [BonusThreshold1], [BonusThreshold2], [BonusThreshold3], [Bouns1], [Bouns2], [Bouns3], [HolidayBouns], [RushHoursBouns], [RushHoursStart1], [RushHoursStart2], [RushHoursEnd1], [RushHoursEnd2], [Selected]) VALUES (1, 40, 8, 45, 70, 90, 900, 1500, 2500, 0, 0, CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), 0)
INSERT [dbo].[BenefitStandard] ([Id], [PerOrder], [PerMilage], [BonusThreshold1], [BonusThreshold2], [BonusThreshold3], [Bouns1], [Bouns2], [Bouns3], [HolidayBouns], [RushHoursBouns], [RushHoursStart1], [RushHoursStart2], [RushHoursEnd1], [RushHoursEnd2], [Selected]) VALUES (2, 56, 9, 30, 20, 10, 600, 1200, 1800, 0, 0, CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), 0)
INSERT [dbo].[BenefitStandard] ([Id], [PerOrder], [PerMilage], [BonusThreshold1], [BonusThreshold2], [BonusThreshold3], [Bouns1], [Bouns2], [Bouns3], [HolidayBouns], [RushHoursBouns], [RushHoursStart1], [RushHoursStart2], [RushHoursEnd1], [RushHoursEnd2], [Selected]) VALUES (3, 50, 7, 50, 70, 80, 1000, 1500, 2200, 0, 0, CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[BenefitStandard] OFF
GO
SET IDENTITY_INSERT [dbo].[CommonReplies] ON 

INSERT [dbo].[CommonReplies] ([Id], [CreateTime], [Answer]) VALUES (3, CAST(N'2023-01-11T15:08:00.000' AS DateTime), N'您好,請問有甚麼需要幫助的?')
INSERT [dbo].[CommonReplies] ([Id], [CreateTime], [Answer]) VALUES (5, CAST(N'2023-01-12T15:32:00.000' AS DateTime), N'請稍等,我查詢後回復您')
INSERT [dbo].[CommonReplies] ([Id], [CreateTime], [Answer]) VALUES (6, CAST(N'2023-01-12T17:39:00.000' AS DateTime), N'不好意思,我無法回答您的問題')
INSERT [dbo].[CommonReplies] ([Id], [CreateTime], [Answer]) VALUES (7, CAST(N'2023-01-16T15:15:00.000' AS DateTime), N'已收到訊息,請稍待客服回應')
INSERT [dbo].[CommonReplies] ([Id], [CreateTime], [Answer]) VALUES (8, CAST(N'2023-01-16T15:16:00.000' AS DateTime), N'謝謝您的反映，我們請客服立即為您處理問題')
INSERT [dbo].[CommonReplies] ([Id], [CreateTime], [Answer]) VALUES (9, CAST(N'2023-01-16T15:17:00.000' AS DateTime), N'非常感謝您的回應, 我們會針對此問題做改善')
INSERT [dbo].[CommonReplies] ([Id], [CreateTime], [Answer]) VALUES (10, CAST(N'2023-01-14T15:21:00.000' AS DateTime), N'非常感謝您的耐心等待')
INSERT [dbo].[CommonReplies] ([Id], [CreateTime], [Answer]) VALUES (11, CAST(N'2023-01-04T15:21:00.000' AS DateTime), N' 感謝您的批評指正，我們將及時改正，不斷提高服務水平')
INSERT [dbo].[CommonReplies] ([Id], [CreateTime], [Answer]) VALUES (12, CAST(N'2023-01-15T15:22:00.000' AS DateTime), N' 祝您生活愉快！')
INSERT [dbo].[CommonReplies] ([Id], [CreateTime], [Answer]) VALUES (13, CAST(N'2023-01-15T15:22:00.000' AS DateTime), N'希望下次有機會再為您服務！')
INSERT [dbo].[CommonReplies] ([Id], [CreateTime], [Answer]) VALUES (14, CAST(N'2023-01-06T15:22:00.000' AS DateTime), N'對於造成你的不便，我們感到由衷的抱歉。')
INSERT [dbo].[CommonReplies] ([Id], [CreateTime], [Answer]) VALUES (15, CAST(N'2023-01-15T15:24:00.000' AS DateTime), N'感謝您的支持，訂單已經送出')
SET IDENTITY_INSERT [dbo].[CommonReplies] OFF
GO
SET IDENTITY_INSERT [dbo].[ComplaintStatus] ON 

INSERT [dbo].[ComplaintStatus] ([Id], [Status]) VALUES (1, N'處理中')
INSERT [dbo].[ComplaintStatus] ([Id], [Status]) VALUES (2, N'已完成')
INSERT [dbo].[ComplaintStatus] ([Id], [Status]) VALUES (3, N'待處理')
SET IDENTITY_INSERT [dbo].[ComplaintStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[ComplaintType] ON 

INSERT [dbo].[ComplaintType] ([Id], [ComplaintType]) VALUES (1, N'客訴外送員')
INSERT [dbo].[ComplaintType] ([Id], [ComplaintType]) VALUES (2, N'客訴店家')
INSERT [dbo].[ComplaintType] ([Id], [ComplaintType]) VALUES (3, N'產品有問題')
SET IDENTITY_INSERT [dbo].[ComplaintType] OFF
GO
SET IDENTITY_INSERT [dbo].[DeliveryDrivers] ON 

INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (1, 2, 3, N'文哲', N'柯', N'0956253562', N'8222364252', N'1.jpg', CAST(N'2023-01-07T17:22:48.280' AS DateTime), N'1.jpg', N'kowj@gmail.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'1.jpg', 121.222767032174, 24.981779847017144)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (3, 2, 2, N'Jason', N'Statham', N'0987121551', N'7811846146', N'3.jpg', CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'3.jpg', N'Statham@gmail.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'3.jpg', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (4, 2, 2, N'Dwayne Douglas', N'Johnson', N'0985445451', N'7815645455', N'3', CAST(N'2021-04-09T00:00:00.000' AS DateTime), N'3', N'Statham2@gmail.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'3', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (5, 2, 2, N'業驥', N'趙', N'0945461551', N'7815411566', N'4', CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'4', N'angela4763@outlook.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'4', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (6, 2, 2, N'孝慈', N'郭', N'0914544651', N'4546156145', N'5', CAST(N'2022-02-04T00:00:00.000' AS DateTime), N'5', N'cullen594@icloud.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'5', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (7, 2, 2, N'辛陽', N'王', N'0988119851', N'5798198918', N'6', CAST(N'2022-04-14T00:00:00.000' AS DateTime), N'6', N'green9685@gmail.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'6', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (9, 2, 2, N'嬡郁', N'袁', N'0915015611', N'8719842164', N'8', CAST(N'2022-05-29T00:00:00.000' AS DateTime), N'8', N'trenton2019@gmail.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'8', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (10, 1, 2, N'洢聖', N'謝', N'0954641455', N'9958515156', N'9', CAST(N'2022-07-04T00:00:00.000' AS DateTime), N'9', N'mcqueen9614@gmail.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'9', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (11, 3, 1, N'Jinping', N'Xi', N'0989934616', N'7124145645', N'10', CAST(N'2022-08-07T00:00:00.000' AS DateTime), N'10', N'Jinping4@gmail.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'10', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (12, 2, 1, N'Allen', N'Kuo', N'0920202020', N'82232115874522152', N'12.jpg', CAST(N'2023-03-06T10:22:43.733' AS DateTime), N'12.jpg', N'allen11@gmail.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'12.jpg', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (13, 2, 1, N'孜昊', N'陳', N'0914345318', N'00433159648214682', N'13.jpg', CAST(N'2023-03-06T12:28:27.197' AS DateTime), N'13.jpg', N'howfun@gmail.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'13.jpg', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (14, 1, 1, N'汁和', N'陳', N'0936547852', N'94202647513547852', N'14.jpg', CAST(N'2023-03-07T14:35:10.617' AS DateTime), N'14.jpg', N'chen123@gmail.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'14.jpg', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (15, 1, 1, N'周', N'杰倫', N'0987654321', N'82232521426584256', N'15.jpg', CAST(N'2023-03-07T15:20:57.953' AS DateTime), N'15.jpg', N'jay@gmail.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'15.jpg', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (16, 1, 1, N'維尼', N'熊', N'0953482368', N'82232521426582364', N'16.jpg', CAST(N'2023-03-07T15:28:18.987' AS DateTime), N'16.jpg', N'winnie123@test.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'16.jpg', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (17, 1, 1, N'張', N'胖胖', N'0964782352', N'82236547426586324', N'17.jpg', CAST(N'2023-03-08T14:56:43.423' AS DateTime), N'17.jpg', N'fat123@test.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'17.jpg', NULL, NULL)
INSERT [dbo].[DeliveryDrivers] ([Id], [AccountStatusId], [WorkStatuseId], [FirstName], [LastName], [Phone], [BankAccount], [IDCard], [RegistrationTime], [VehicleRegistration], [Account], [Password], [DriverLicense], [longitude], [latitude]) VALUES (18, 1, 1, N'聞折', N'科', N'0923548532', N'82236587423654875', N'18.jpg', CAST(N'2023-03-09T14:44:31.030' AS DateTime), N'18.jpg', N'kowj12345@gmail.com', N'F5478EBD0ECCDE7FB5911BB0C1D4BE0E0422FE150E3E4165338CE3A74B6BF439', N'18.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[DeliveryDrivers] OFF
GO
SET IDENTITY_INSERT [dbo].[DeliveryDriverWorkStatuses] ON 

INSERT [dbo].[DeliveryDriverWorkStatuses] ([Id], [Status]) VALUES (1, N'離線中')
INSERT [dbo].[DeliveryDriverWorkStatuses] ([Id], [Status]) VALUES (2, N'上線中')
INSERT [dbo].[DeliveryDriverWorkStatuses] ([Id], [Status]) VALUES (3, N'等待接單中')
INSERT [dbo].[DeliveryDriverWorkStatuses] ([Id], [Status]) VALUES (4, N'跑單中')
SET IDENTITY_INSERT [dbo].[DeliveryDriverWorkStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[DeliveryViolationTypes] ON 

INSERT [dbo].[DeliveryViolationTypes] ([Id], [ViolationContent], [Content]) VALUES (1, N'態度不佳', N'對店家或客人惡言相向，甚至動手')
INSERT [dbo].[DeliveryViolationTypes] ([Id], [ViolationContent], [Content]) VALUES (2, N'毀損商品', N'未讓產品維持完整包裝，或是弄髒產品，造成食安疑慮')
SET IDENTITY_INSERT [dbo].[DeliveryViolationTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[DriverCancellations] ON 

INSERT [dbo].[DriverCancellations] ([Id], [Reason], [Content]) VALUES (1, N'身體不適', NULL)
INSERT [dbo].[DriverCancellations] ([Id], [Reason], [Content]) VALUES (2, N'交通事故', NULL)
INSERT [dbo].[DriverCancellations] ([Id], [Reason], [Content]) VALUES (3, N'距離太遠', NULL)
SET IDENTITY_INSERT [dbo].[DriverCancellations] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (3, 1, N'鍾奭', N'李', N'0987654321', 741412, N'jongsuk@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2022-10-06T02:00:00.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (5, 2, N'知恩', N'李', N'0912523856', 5201314, N'iu@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2022-02-14T13:00:12.000' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (6, 1, N'相赫', N'李', N'0998123456', 7777777, N'faker123@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-01-11T14:51:52.397' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (7, 1, N'小明', N'王', N'0914725836', 5000, N'ming1@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-01-16T15:44:58.063' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (8, 1, N'小美', N'黃', N'0945678123', 8000, N'asd123@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-01-16T15:46:00.910' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (9, 1, N'大雄', N'李', N'0998123455', 10000, N'bear123@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-01-16T15:47:14.267' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (10, 1, N'大壯', N'王', N'0998123789', 15000, N'strong123@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-01-16T15:49:28.880' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (11, 1, N'小壯', N'王', N'0998124512', 500, N'strong456@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-01-16T15:50:19.837' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (12, 1, N'大美', N'陳', N'0998123499', 1000, N'haha123@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-01-16T15:51:19.300' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (13, 1, N'大明', N'張', N'0998123558', 555, N'qwe123@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-01-16T15:52:12.827' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (14, 1, N'台銘', N'郭', N'0977777777', 100000000, N'rich123@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-01-16T15:53:29.920' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (15, 1, N'Beryl', N'Wang', N'0936478236', 0, N'beryl123@test.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-03-06T14:31:41.377' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (16, 1, N'John', N'Chen', N'0911111111', 0, N'john123@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-03-08T17:20:25.273' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (17, 1, N'之憾', N'塵', N'0936475236', 995535, N'chen123@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-03-09T16:39:36.907' AS DateTime))
INSERT [dbo].[Members] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Balance], [Account], [Password], [RegistrationTime]) VALUES (18, 1, N'佳行', N'章', N'0935486242', 0, N'hellpig123@gmail.com', N'D362416A92B1879B512B036EA108B634ABC4DD08E07682AE9896C10D5D97192C', CAST(N'2023-03-09T18:37:11.470' AS DateTime))
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberViolationTypes] ON 

INSERT [dbo].[MemberViolationTypes] ([Id], [ViolationContent], [Content]) VALUES (1, N'惡意棄單', N'餐點已在路上，卻臨時取消訂單')
INSERT [dbo].[MemberViolationTypes] ([Id], [ViolationContent], [Content]) VALUES (2, N'謊報餐點問題', N'餐點已確實送達，卻謊報餐點有缺失')
INSERT [dbo].[MemberViolationTypes] ([Id], [ViolationContent], [Content]) VALUES (3, N'與外送員發生衝突', N'毆打外送員')
INSERT [dbo].[MemberViolationTypes] ([Id], [ViolationContent], [Content]) VALUES (4, N'取餐不付款', N'拿到餐點不付錢')
SET IDENTITY_INSERT [dbo].[MemberViolationTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (1, 1, 4, 125, 7, 10, 2, 1)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (2, 2, 4, 125, 8, 0, 1, 1)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (3, 3, 4, 125, NULL, 0, 1, 1)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (4, 4, 4, 125, 7, 10, 1, 1)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (5, 4, 4, 125, 8, 0, 1, 1)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (6, 1, 17, 175, 24, 40, 1, 2)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (7, 1, 4, 125, 7, 10, 1, 3)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (8, 1, 4, 125, 8, 0, 1, 3)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (9, 2, 16, 155, NULL, 0, 1, 3)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (10, 1, 4, 125, NULL, 0, 1, 4)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (11, 2, 17, 175, 22, 10, 1, 4)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (12, 3, 18, 135, NULL, 0, 1, 4)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (13, 1, 4, 125, 7, 10, 1, 5)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (14, 1, 4, 125, 8, 0, 1, 5)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (15, 2, 4, 125, 7, 10, 1, 5)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (16, 2, 16, 155, NULL, 0, 1, 6)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (17, 3, 4, 125, 7, 10, 1, 6)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (18, 3, 4, 125, 8, 0, 1, 6)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (19, 1, 2, 150, 1, 10, 1, 7)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (20, 1, 2, 150, 2, 20, 1, 7)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (21, 1, 2, 150, 1, 10, 2, 8)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (22, 1, 2, 150, 2, 20, 2, 8)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (23, 2, 2, 150, NULL, 0, 1, 8)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (24, 2, 15, 155, 15, 10, 1, 9)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (25, 2, 15, 155, 16, 0, 1, 9)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (26, 3, 4, 125, NULL, 0, 3, 9)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (27, 1, 4, 125, NULL, 0, 1, 10)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (28, 1, 4, 125, 7, 10, 1, 11)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (29, 1, 4, 125, 7, 10, 1, 12)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (30, 1, 4, 125, 8, 0, 1, 12)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (31, 1, 4, 125, 7, 10, 3, 13)
INSERT [dbo].[OrderDetails] ([Id], [IdentifyNum], [ProductId], [ProductPrice], [ItemId], [ItemPrice], [Qty], [OrderId]) VALUES (32, 1, 4, 125, 8, 0, 3, 13)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (1, NULL, 17, 3, 20, N'320桃園市中壢區新生路二段421號', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (2, NULL, 17, 3, 20, N'320桃園市中壢區新生路二段421號', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (3, NULL, 17, 3, 20, N'320桃園市中壢區新生路二段421號', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (4, 1, 17, 3, 20, N'聖德基督學院', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (5, NULL, 17, 3, 20, N'320桃園市中壢區新生路二段421號', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (6, 1, 17, 3, 20, N'聖德基督學院', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (7, 1, 17, 2, 30, N'聖德基督學院', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (8, 1, 17, 2, 20, N'桃園市中壢區新生路105號', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (9, 1, 17, 3, 20, N'聖德基督學院', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (10, 1, 17, 3, 20, N'聖德基督學院', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (11, NULL, 17, 3, 20, N'聖德基督學院', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (12, 1, 17, 3, 20, N'聖德基督學院', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[Orders] ([Id], [DeliveryDriversId], [MemberId], [StoreId], [DeliveryFee], [DeliveryAddress], [DriverRating], [StoreRating], [DriverComment], [StoreComment], [Milage], [CreateMark]) VALUES (13, 1, 17, 3, 20, N'聖德基督學院', NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderSchedules] ON 

INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (1, 1, 1, CAST(N'2023-03-20T13:55:24.703' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (2, 2, 1, CAST(N'2023-03-20T13:57:00.040' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (3, 3, 1, CAST(N'2023-03-20T15:00:21.363' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (4, 4, 1, CAST(N'2023-03-20T15:06:11.280' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (5, 4, 2, CAST(N'2023-03-20T15:06:50.490' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (6, 4, 3, CAST(N'2023-03-20T15:06:50.503' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (7, 4, 4, CAST(N'2023-03-20T15:06:50.510' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (8, 4, 5, CAST(N'2023-03-20T15:07:15.123' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (10, 1, 2, CAST(N'2023-03-20T13:56:00.000' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (11, 1, 3, CAST(N'2023-03-20T14:20:00.000' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (14, 1, 4, CAST(N'2023-03-20T14:30:00.000' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (16, 1, 5, CAST(N'2023-03-20T14:30:10.000' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (17, 2, 2, CAST(N'2023-03-20T13:57:30.040' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (18, 2, 3, CAST(N'2023-03-20T14:15:30.040' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (19, 2, 4, CAST(N'2023-03-20T14:16:00.040' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (20, 2, 5, CAST(N'2023-03-20T14:30:30.040' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (21, 3, 2, CAST(N'2023-03-20T15:00:51.363' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (22, 3, 3, CAST(N'2023-03-20T15:01:51.363' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (23, 3, 4, CAST(N'2023-03-20T15:16:51.363' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (24, 3, 5, CAST(N'2023-03-20T15:17:12.363' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (25, 3, 6, CAST(N'2023-03-20T15:17:30.363' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (26, 4, 6, CAST(N'2023-03-20T15:09:15.123' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (27, 2, 6, CAST(N'2023-03-20T13:59:00.040' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (28, 1, 6, CAST(N'2023-03-20T14:32:10.000' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (29, 5, 1, CAST(N'2023-03-21T10:19:53.940' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (30, 6, 1, CAST(N'2023-03-21T10:27:42.357' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (31, 6, 2, CAST(N'2023-03-21T10:27:57.307' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (32, 6, 3, CAST(N'2023-03-21T10:27:57.323' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (33, 6, 4, CAST(N'2023-03-21T10:27:57.327' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (34, 7, 1, CAST(N'2023-03-21T10:29:39.877' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (35, 7, 2, CAST(N'2023-03-21T10:29:44.627' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (36, 7, 3, CAST(N'2023-03-21T10:29:44.630' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (37, 7, 4, CAST(N'2023-03-21T10:29:44.633' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (38, 7, 5, CAST(N'2023-03-21T10:30:35.380' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (39, 8, 1, CAST(N'2023-03-21T14:03:15.207' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (40, 8, 2, CAST(N'2023-03-21T14:03:28.303' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (41, 8, 3, CAST(N'2023-03-21T14:03:28.320' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (42, 8, 4, CAST(N'2023-03-21T14:03:28.327' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (43, 8, 5, CAST(N'2023-03-21T14:04:18.920' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (44, 9, 1, CAST(N'2023-03-21T15:38:46.550' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (45, 9, 2, CAST(N'2023-03-21T15:38:54.620' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (46, 9, 3, CAST(N'2023-03-21T15:38:54.627' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (47, 9, 4, CAST(N'2023-03-21T15:38:54.630' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (48, 10, 1, CAST(N'2023-03-21T15:40:26.040' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (49, 10, 2, CAST(N'2023-03-21T15:40:28.700' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (50, 10, 3, CAST(N'2023-03-21T15:40:28.700' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (51, 10, 4, CAST(N'2023-03-21T15:40:28.703' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (52, 11, 1, CAST(N'2023-03-21T15:43:00.383' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (53, 12, 1, CAST(N'2023-03-21T15:43:26.977' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (54, 12, 2, CAST(N'2023-03-21T15:43:29.083' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (55, 12, 3, CAST(N'2023-03-21T15:43:29.090' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (56, 12, 4, CAST(N'2023-03-21T15:43:29.093' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (57, 12, 5, CAST(N'2023-03-21T15:43:41.920' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (58, 13, 1, CAST(N'2023-03-21T16:15:08.510' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (59, 13, 2, CAST(N'2023-03-21T16:15:17.677' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (60, 13, 3, CAST(N'2023-03-21T16:15:17.683' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (61, 13, 4, CAST(N'2023-03-21T16:15:17.683' AS DateTime))
INSERT [dbo].[OrderSchedules] ([Id], [OrderId], [StatusId], [MarkTime]) VALUES (62, 13, 5, CAST(N'2023-03-21T16:15:51.263' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderSchedules] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatues] ON 

INSERT [dbo].[OrderStatues] ([Id], [Status]) VALUES (1, N'訂單建立')
INSERT [dbo].[OrderStatues] ([Id], [Status]) VALUES (2, N'餐點準備中')
INSERT [dbo].[OrderStatues] ([Id], [Status]) VALUES (3, N'餐點完成待配送')
INSERT [dbo].[OrderStatues] ([Id], [Status]) VALUES (4, N'配送中')
INSERT [dbo].[OrderStatues] ([Id], [Status]) VALUES (5, N'配送到達')
INSERT [dbo].[OrderStatues] ([Id], [Status]) VALUES (6, N'訂單完成')
INSERT [dbo].[OrderStatues] ([Id], [Status]) VALUES (9, N'配送失敗')
SET IDENTITY_INSERT [dbo].[OrderStatues] OFF
GO
SET IDENTITY_INSERT [dbo].[Pays] ON 

INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (5, 1, 91, 917, 4900, 15876, CAST(N'2023-01-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (17, 1, 92, 736, 4900, 14468, CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (18, 1, 93, 744, 4900, 14572, CAST(N'2022-05-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (19, 1, 91, 728, 4900, 14364, CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (20, 1, 100, 800, 4900, 15300, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (21, 1, 110, 880, 4900, 16340, CAST(N'2022-08-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (22, 1, 90, 720, 4900, 14260, CAST(N'2022-09-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (23, 1, 70, 560, 2400, 9680, CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (24, 1, 50, 400, 2400, 7600, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (25, 1, 92, 736, 4900, 14468, CAST(N'2022-12-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (26, 1, 40, 320, 0, 4160, CAST(N'2022-03-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (27, 3, 92, 736, 4900, 14468, CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (28, 3, 93, 744, 4900, 14572, CAST(N'2022-05-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (29, 3, 91, 728, 4900, 14364, CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (30, 3, 100, 800, 4900, 15300, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (31, 3, 110, 880, 4900, 16340, CAST(N'2022-08-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (32, 3, 90, 720, 4900, 14260, CAST(N'2022-09-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (33, 3, 70, 560, 2400, 9680, CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (34, 3, 50, 400, 2400, 7600, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (35, 3, 92, 736, 4900, 14468, CAST(N'2022-12-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (36, 3, 40, 320, 0, 4160, CAST(N'2022-03-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (37, 4, 92, 736, 4900, 14468, CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (38, 4, 93, 744, 4900, 14572, CAST(N'2022-05-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (39, 4, 91, 728, 4900, 14364, CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (40, 4, 100, 800, 4900, 15300, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (41, 4, 110, 880, 4900, 16340, CAST(N'2022-08-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (42, 4, 90, 720, 4900, 14260, CAST(N'2022-09-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (43, 4, 70, 560, 2400, 9680, CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (44, 4, 50, 400, 2400, 7600, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (45, 4, 92, 736, 4900, 14468, CAST(N'2022-12-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (46, 4, 40, 320, 0, 4160, CAST(N'2022-03-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (47, 5, 92, 736, 4900, 14468, CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (48, 5, 93, 744, 4900, 14572, CAST(N'2022-05-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (49, 5, 91, 728, 4900, 14364, CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (50, 5, 100, 800, 4900, 15300, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (51, 5, 110, 880, 4900, 16340, CAST(N'2022-08-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (52, 5, 90, 720, 4900, 14260, CAST(N'2022-09-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (53, 5, 70, 560, 2400, 9680, CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (54, 5, 50, 400, 2400, 7600, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (55, 5, 92, 736, 4900, 14468, CAST(N'2022-12-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (56, 5, 40, 320, 0, 4160, CAST(N'2022-03-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (57, 6, 92, 736, 4900, 14468, CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (58, 6, 93, 744, 4900, 14572, CAST(N'2022-05-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (59, 6, 91, 728, 4900, 14364, CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (60, 6, 100, 800, 4900, 15300, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (61, 6, 110, 880, 4900, 16340, CAST(N'2022-08-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (62, 6, 90, 720, 4900, 14260, CAST(N'2022-09-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (63, 6, 70, 560, 2400, 9680, CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (64, 6, 50, 400, 2400, 7600, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (65, 6, 92, 736, 4900, 14468, CAST(N'2022-12-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (66, 6, 40, 320, 0, 4160, CAST(N'2022-03-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (67, 7, 92, 736, 4900, 14468, CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (68, 7, 93, 744, 4900, 14572, CAST(N'2022-05-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (69, 7, 91, 728, 4900, 14364, CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (70, 7, 100, 800, 4900, 15300, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (71, 7, 110, 880, 4900, 16340, CAST(N'2022-08-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (72, 7, 90, 720, 4900, 14260, CAST(N'2022-09-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (73, 7, 70, 560, 2400, 9680, CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (74, 7, 50, 400, 2400, 7600, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (75, 7, 92, 736, 4900, 14468, CAST(N'2022-12-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (76, 7, 40, 320, 0, 4160, CAST(N'2022-03-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (77, 9, 92, 736, 4900, 14468, CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (78, 9, 93, 744, 4900, 14572, CAST(N'2022-05-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (79, 9, 91, 728, 4900, 14364, CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (80, 9, 100, 800, 4900, 15300, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (81, 9, 110, 880, 4900, 16340, CAST(N'2022-08-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (82, 9, 90, 720, 4900, 14260, CAST(N'2022-09-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (83, 9, 70, 560, 2400, 9680, CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (84, 9, 50, 400, 2400, 7600, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (85, 9, 92, 736, 4900, 14468, CAST(N'2022-12-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (86, 9, 40, 320, 0, 4160, CAST(N'2022-03-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (87, 10, 92, 736, 4900, 14468, CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (88, 10, 93, 744, 4900, 14572, CAST(N'2022-05-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (89, 10, 91, 728, 4900, 14364, CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (90, 10, 100, 800, 4900, 15300, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (91, 10, 110, 880, 4900, 16340, CAST(N'2022-08-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (92, 10, 90, 720, 4900, 14260, CAST(N'2022-09-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (93, 10, 70, 560, 2400, 9680, CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (94, 10, 50, 400, 2400, 7600, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (95, 10, 92, 736, 4900, 14468, CAST(N'2022-12-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (96, 10, 40, 320, 0, 4160, CAST(N'2022-03-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (97, 11, 92, 736, 4900, 14468, CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (98, 11, 93, 744, 4900, 14572, CAST(N'2022-05-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (99, 11, 91, 728, 4900, 14364, CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (100, 11, 100, 800, 4900, 15300, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (101, 11, 110, 880, 4900, 16340, CAST(N'2022-08-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (102, 11, 90, 720, 4900, 14260, CAST(N'2022-09-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (103, 11, 70, 560, 2400, 9680, CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (104, 11, 50, 400, 2400, 7600, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (105, 11, 92, 736, 4900, 14468, CAST(N'2022-12-01' AS Date))
INSERT [dbo].[Pays] ([Id], [DeliveryDriversId], [DeliveryCount], [TotalMilage], [Bouns], [TotalPay], [SettlementMonth]) VALUES (106, 11, 40, 320, 0, 4160, CAST(N'2022-03-01' AS Date))
SET IDENTITY_INSERT [dbo].[Pays] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcessingStatues] ON 

INSERT [dbo].[ProcessingStatues] ([Id], [Status]) VALUES (1, N'待處理')
INSERT [dbo].[ProcessingStatues] ([Id], [Status]) VALUES (2, N'處理中')
INSERT [dbo].[ProcessingStatues] ([Id], [Status]) VALUES (3, N'已處理')
SET IDENTITY_INSERT [dbo].[ProcessingStatues] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCustomizationItems] ON 

INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (1, 2, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (2, 2, N'加咖哩', 20)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (3, 3, N'加肉', 30)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (4, 3, N'加湯', 15)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (6, 3, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (7, 4, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (8, 4, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (9, 5, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (10, 5, N'加麵', 20)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (11, 8, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (12, 8, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (13, 9, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (14, 9, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (15, 15, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (16, 15, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (17, 15, N'加肉片', 40)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (18, 16, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (19, 16, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (22, 17, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (23, 17, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (24, 17, N'加肉片', 40)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (25, 18, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (26, 18, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (27, 19, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (28, 19, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (29, 19, N'加肉片', 40)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (30, 20, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (31, 20, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (32, 20, N'加肉片', 40)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (33, 22, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (34, 28, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (35, 28, N'加麵', 20)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (36, 28, N'加肉片', 40)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (37, 30, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (38, 30, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (39, 30, N'加肉片', 30)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (40, 33, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (41, 33, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (42, 33, N'加肉片', 30)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (43, 37, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (47, 37, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (49, 59, N'加麵', 20)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (50, 59, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (51, 59, N'加蛋', 20)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (52, 60, N'加麵', 20)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (53, 60, N'加蛋', 20)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (54, 60, N'加辣', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (57, 61, N'加胡椒', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (58, 6, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (59, 6, N'加咖哩', 20)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (60, 6, N'炸蝦一隻', 50)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (61, 8, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (62, 8, N'配菜增量', 30)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (63, 8, N'附湯', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (64, 8, N'加蛋', 15)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (65, 9, N'加飯', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (66, 9, N'配菜增量', 30)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (67, 9, N'附湯', 0)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (68, 9, N'加蛋', 15)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (69, 10, N'千島醬', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (70, 10, N'和風醬', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (71, 10, N'番茄醬', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (72, 11, N'千島醬', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (73, 11, N'和風醬', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (74, 11, N'番茄醬', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (75, 12, N'火腿', 30)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (76, 12, N'洋蔥', 15)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (77, 14, N'玉米粒', 10)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (78, 14, N'沙拉蛋', 30)
INSERT [dbo].[ProductCustomizationItems] ([Id], [ProuctId], [ItemName], [UnitPrice]) VALUES (79, 14, N'紅蘿蔔', 10)
SET IDENTITY_INSERT [dbo].[ProductCustomizationItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (2, 2, N'豬肉咖哩', N'豬肉咖哩2023313162947.jpg', N'含有豬肉', 1, 150)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (3, 2, N'雞排咖哩', N'雞排咖哩2023313162156.jpg', N'雞排咖哩', 1, 150)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (4, 3, N'炙燒牛五花', N'炙燒牛五花2023314154127.jpg', N'牛五花精選牛身上排骨的前段部位の肉， 肥瘦均勻、肉度統一， 肉質軟嫩，牛肉的油脂香味直衝你的腦門。  把泡菜和牛五花一把包裹起來， 一口吞， 滿嘴都是過癮的滋味。', 1, 125)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (5, 4, N'羊肉炒麵', N'羊肉炒麵2023314154522.jpg', NULL, 0, 2)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (6, 2, N'炸蝦咖哩', N'炸蝦咖哩2023313163025.jpg', N'含蝦子', 1, 185)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (7, 2, N'玉子燒', N'玉子燒202331316315.jpg', N'含雞蛋', 1, 30)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (8, 2, N'鹽烤秋刀魚定食', N'鹽烤秋刀魚定食2023313163152.jpg', NULL, 1, 150)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (9, 2, N'炸竹筴魚定食', N'炸竹筴魚定食2023313163246.jpg', NULL, 0, 170)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (10, 1, N'經典凱薩', N'經典凱薩202332011014.jpg', N'含基底生菜，水煮嫩雞胸, 帕瑪森起司, 麵包丁, 番茄, 小黃瓜及凱薩醬。', 1, 239)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (11, 1, N'沙拉', N'沙拉202331819550.jpg', NULL, 1, 139)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (12, 1, N'捲餅', N'捲餅20233181995.jpg', NULL, 1, 139)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (14, 1, N'低GI鮭魚沙拉', N'低GI鮭魚沙拉202331819953.jpg', N'含基底生菜，煙燻鮭魚， 蘋果，小黃瓜，芹菜，洋蔥及無糖優格醬。', 1, 249)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (15, 3, N'炙燒牛五花丼', N'炙燒牛五花丼2023318185554.jpg', N'使用美國牛五花 搭配特製烤肉醬', 1, 155)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (16, 3, N'鹽焗油雞丼飯', N'鹽焗油雞丼飯2023318185648.jpg', N'鹽焗油雞丼飯是一道以雞肉為主要材料的料理，具有濃郁的香氣和美味的口感。', 1, 155)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (17, 3, N'特選松阪豬丼', N'特選松阪豬丼2023318185950.jpg', N'特選松阪豬丼是一道使用頂級松阪豬肉片為主要材料的料理，肉質嫩滑多汁，口感鮮美，是日本傳統美食之一。', 1, 175)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (18, 3, N'蒲燒鯛魚丼', N'蒲燒鯛魚丼202331818593.jpg', N'蒲燒鯛魚丼以鯛魚為主要材料，配上特殊的蒲燒醬汁製作而成。', 1, 135)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (19, 3, N'招牌豬五花丼', N'招牌豬五花丼202331819126.jpg', N'使用台灣豬五花 搭配特製烤肉醬', 1, 150)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (20, 3, N'海鹽豬五花丼', N'海鹽豬五花丼202331819225.jpg', N'使用台灣豬五花 搭配科克蘭玫瑰鹽', 1, 150)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (22, 3, N'鹽烤鯖魚飯', N'鹽烤鯖魚飯202331819338.jpg', N'使用挪威鯖魚 優質魚油 含豐富營養素', 1, 150)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (23, 6, N'蕃茄香麻猴頭菇寬麵', N'蕃茄香麻猴頭菇寬麵2023318193152.jpg', NULL, 1, 260)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (24, 6, N'何首烏樹寶湯', N'何首烏樹寶湯2023318193255.jpg', NULL, 1, 150)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (25, 5, N'茶碗蒸', N'茶碗蒸2023318192137.jpg', NULL, 1, 80)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (28, 4, N'牛肉炒麵', N'牛肉炒麵202331819307.jpg', NULL, 1, 100)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (29, 6, N'何首烏樹寶湯', N'何首烏樹寶湯2023318193452.jpg', NULL, 1, 130)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (30, 7, N'牛肉丼飯', N'牛肉丼飯202331819370.jpg', NULL, 1, 120)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (33, 7, N'豬肉丼飯', N'豬肉丼飯2023318193633.jpg', NULL, 1, 100)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (34, 8, N'大麥克', N'大麥克2023318193830.jpg', NULL, 1, 115)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (35, 8, N'嫩煎鷄腿堡', N'嫩煎鷄腿堡2023318193935.jpg', NULL, 1, 130)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (36, 5, N'鮪魚壽司', N'鮪魚壽司202331819287.jpg', N'鮪魚、米飯', 1, 40)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (37, 7, N'海鮮丼飯', N'海鮮丼飯2023318193556.jpg', NULL, 1, 200)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (38, 8, N'雙層牛肉吉事堡', N'雙層牛肉吉事堡202331819396.jpg', NULL, 1, 120)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (39, 8, N'麥香鷄', N'麥香鷄202331819404.jpg', NULL, 1, 100)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (40, 9, N'大麥克', N'大麥克2023318194138.jpg', NULL, 1, 115)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (41, 9, N'嫩煎鷄腿堡', N'嫩煎鷄腿堡2023318194155.jpg', NULL, 1, 130)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (42, 9, N'雙層牛肉吉事堡', N'雙層牛肉吉事堡2023318194212.jpg', NULL, 1, 120)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (43, 9, N'麥香鷄', N'麥香鷄2023318194229.jpg', NULL, 1, 100)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (44, 10, N'大麥克', N'大麥克202331819438.jpg', NULL, 1, 115)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (45, 10, N'嫩煎鷄腿堡', N'嫩煎鷄腿堡2023318194324.jpg', NULL, 1, 130)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (46, 10, N'雙層牛肉吉事堡', N'雙層牛肉吉事堡2023318194340.jpg', NULL, 1, 120)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (48, 10, N'麥香鷄', N'麥香鷄2023319224556.jpg', NULL, 1, 100)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (49, 11, N'雙層牛肉吉事堡', N'雙層牛肉吉事堡2023319224645.jpg', NULL, 1, 120)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (50, 11, N'麥香鷄', N'麥香鷄2023319224657.jpg', NULL, 1, 100)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (51, 11, N'嫩煎鷄腿堡', N'嫩煎鷄腿堡2023319224711.jpg', NULL, 1, 130)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (52, 11, N'大麥克', N'大麥克2023319224725.jpg', NULL, 1, 115)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (53, 12, N'麥香鷄', N'麥香鷄2023319224756.jpg', NULL, 1, 100)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (54, 12, N'雙層牛肉吉事堡', N'雙層牛肉吉事堡202331922489.jpg', NULL, 1, 120)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (55, 12, N'嫩煎鷄腿堡', N'嫩煎鷄腿堡2023319224825.jpg', NULL, 1, 130)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (56, 12, N'大麥克', N'大麥克2023319224842.jpg', NULL, 1, 115)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (57, 13, N'招牌咖哩飯', N'豬肉咖哩2023319224944.jpg', NULL, 1, 100)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (58, 14, N'招牌咖哩飯', N'招牌咖哩飯2023319225140.jpg', NULL, 1, 100)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (59, 73, N'香煎鷄腿排', N'香煎鷄腿排2023319225613.jpg', NULL, 1, 170)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (60, 73, N'黑胡椒牛排', N'黑胡椒牛排2023319225634.jpg', NULL, 1, 180)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (61, 73, N'玉米濃湯', N'玉米濃湯20233192308.jpg', NULL, 1, 60)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (62, 28, N'豬五花', N'豬五花202331923849.jpg', NULL, 1, 150)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (63, 28, N'牛五花', N'牛五花202331923926.jpg', NULL, 1, 180)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (64, 28, N'生蠔', N'生蠔2023319231053.jpg', NULL, 1, 150)
INSERT [dbo].[Products] ([Id], [StoreId], [ProductName], [Photo], [ProductContent], [Status], [UnitPrice]) VALUES (67, 81, N'大麥克', N'大麥克2023321163138.jpg', NULL, 0, 100)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[QA] ON 

INSERT [dbo].[QA] ([Id], [CategoryId], [Title], [Answer]) VALUES (1, 1, N'訂單沒有送達?', N'如果 App 顯示外送合作夥伴已完成配送服務，而您卻沒有收到訂單，請點選「與我們聯繫」選項，並提供訂單細節，我們會立即提供協助。  如果行程未顯示完成狀態，建議您直接與外送合作夥伴聯繫。外送合作夥伴上路後，您可透過以下方式與外送合作夥伴聯絡： 1. 在訂單追蹤畫面的地圖中點選「聯絡」。 2. 選擇撥打電話或傳送簡訊。')
INSERT [dbo].[QA] ([Id], [CategoryId], [Title], [Answer]) VALUES (2, 2, N'無法登入', N'如果您基於任何其他原因無法登入帳戶，請通知我們。也請提供一些額外資訊，好讓我們確認您的身分。這有助於確保您的帳戶安全。')
INSERT [dbo].[QA] ([Id], [CategoryId], [Title], [Answer]) VALUES (3, 1, N'查看我的訂單狀態', N'選擇目前的訂單來檢視目前訂單狀態')
INSERT [dbo].[QA] ([Id], [CategoryId], [Title], [Answer]) VALUES (4, 1, N'變更我的外送地址', N'為了保持餐點的品質和確保所有用戶順利取得餐點，當您輸入配送地址時，建議先輸入配送地址的［市／區／街／號］，並於地址下方的［新增外送備註］欄位輸入完整地址與相關的資料，讓合作夥伴可以準確的進行配送。')
INSERT [dbo].[QA] ([Id], [CategoryId], [Title], [Answer]) VALUES (5, 1, N'訂單的配送時間比預期長', N'下訂單後所顯示為預估訂單抵達時間，其中包含準備訂單、外送合作夥伴領取訂單及配送的時間。  商家和合作外送夥伴會盡其所能在預估時間內將訂單配送到您所在位置。請注意，依照商家的忙碌程度、訂購數目的多寡 (大型訂單需要較長的準備時間)、交通路況及其他外在因素，實際送達時間可能會有所異動。')
INSERT [dbo].[QA] ([Id], [CategoryId], [Title], [Answer]) VALUES (6, 1, N'為什麼我沒收到訂單餐點，系統仍向我收款？', N'當合作外送夥伴抵達外送地址時，他們會嘗試聯絡顧客，也會通知顧客合作外送夥伴曾嘗試聯絡。此外，合作外送夥伴會在外送地址等候一段時間。  如果在這之後合作外送夥伴仍無法完成外送，會通知顧客外送未成功完成。 所有嘗試聯絡的相關記錄都會顯示。  若是經過上述多次通知，合作外送夥伴仍無法完成外送，系統便會向您收取訂單費用。')
INSERT [dbo].[QA] ([Id], [CategoryId], [Title], [Answer]) VALUES (7, 2, N'我的帳戶有一筆不明扣款', N'不明扣款也有可能是小額的預先授權扣款。這筆費用實際上不會從您的帳戶中扣除，但可能會顯示為「待處理」。所有預先授權扣款通常會在幾個工作天內撤銷，具體時間取決於您往來銀行的政策。預先授權扣款有助防範未經授權而使用卡片的詐騙行為。')
INSERT [dbo].[QA] ([Id], [CategoryId], [Title], [Answer]) VALUES (8, 2, N'更新已儲存的地址', N'您在帳戶中最多可儲存 2 個地址，以便快速選取外送地點。')
INSERT [dbo].[QA] ([Id], [CategoryId], [Title], [Answer]) VALUES (9, 2, N'我認為自己的帳戶被盜用', N'如果您懷疑有人未經授權存取或使用您的 Uber Eats 帳戶，您的帳戶可能已遭到入侵。  受到入侵的帳戶將出現以下狀況： - 您的帳戶有非您下訂的訂單 - 您的帳戶中有非您預約或下訂的訂單明細 - 您的帳戶資訊在您不知情的情況下遭到變更 - 您的帳戶被收取不明款項（非銀行授權驗證費） - 無法登入您的帳戶 - 應用程式無法找到您用於登入的電子郵件地')
INSERT [dbo].[QA] ([Id], [CategoryId], [Title], [Answer]) VALUES (10, 2, N'忘記密碼', N'點選下方連結以重設密碼。您會收到一封電子郵件，裡面附有可建立新密碼的專屬連結。提醒您，請勿將密碼告訴他人')
INSERT [dbo].[QA] ([Id], [CategoryId], [Title], [Answer]) VALUES (11, 3, N'如何下訂單？', N'若要下訂單：  選擇您想訂購的商家。 將商品加入購物車。 點選「查看購物車」，接著點選「前往結帳」。 檢查您的外送詳細資訊。 點選「一鍵下訂單」。')
INSERT [dbo].[QA] ([Id], [CategoryId], [Title], [Answer]) VALUES (12, 3, N'我可以在同一份訂單中訂購多樣商品，或向多個商家訂購商品嗎？', N'您可以向同一個商家訂購多樣商品，但不能將不同商家的商品加入同一份訂單中。  不過，如有意訂購不同商家的商品，您可以先下一份訂單，並在等候訂單送達的同時繼續訂購其他商家的商品。請注意，每份訂單都包含個別外送費。')
SET IDENTITY_INSERT [dbo].[QA] OFF
GO
SET IDENTITY_INSERT [dbo].[QACategory] ON 

INSERT [dbo].[QACategory] ([Id], [Name], [Displayorder]) VALUES (1, N'訂單問題', 1)
INSERT [dbo].[QACategory] ([Id], [Name], [Displayorder]) VALUES (2, N'帳號與付款', 2)
INSERT [dbo].[QACategory] ([Id], [Name], [Displayorder]) VALUES (3, N'外送基本須知', 3)
SET IDENTITY_INSERT [dbo].[QACategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([Id], [FirstName], [LastName], [Account], [EncryptedPassword], [Title], [Role], [RegistrationTime], [Photo], [Email], [birthday]) VALUES (1, N'Gordon', N'Ramsay', N'gordan123', N'123', N'chef', N'Administrator', CAST(N'2020-10-14' AS Date), NULL, N'gordan@gmail.com', CAST(N'1971-05-02' AS Date))
INSERT [dbo].[Staffs] ([Id], [FirstName], [LastName], [Account], [EncryptedPassword], [Title], [Role], [RegistrationTime], [Photo], [Email], [birthday]) VALUES (2, N'John', N'Cena', N'johncena123', N'123', N'PM', N'1', CAST(N'2002-08-14' AS Date), NULL, N'johncena@gmail.com', CAST(N'1974-01-05' AS Date))
INSERT [dbo].[Staffs] ([Id], [FirstName], [LastName], [Account], [EncryptedPassword], [Title], [Role], [RegistrationTime], [Photo], [Email], [birthday]) VALUES (4, N'Davie', N'504', N'davie123', N'123', N'bassist', N'PowerUser', CAST(N'2014-11-05' AS Date), NULL, N'davie@gmail.com', CAST(N'1989-03-20' AS Date))
INSERT [dbo].[Staffs] ([Id], [FirstName], [LastName], [Account], [EncryptedPassword], [Title], [Role], [RegistrationTime], [Photo], [Email], [birthday]) VALUES (5, N'Elon', N'Musk', N'elonmusk@gmail.com', N'123', N'CEO', N'1', CAST(N'2023-01-12' AS Date), NULL, N'elonmusk@gmail.com', CAST(N'1990-06-15' AS Date))
SET IDENTITY_INSERT [dbo].[Staffs] OFF
GO
SET IDENTITY_INSERT [dbo].[StoreBusinessHour] ON 

INSERT [dbo].[StoreBusinessHour] ([Id], [StoreId], [OpeningTime], [ClosingTime], [OpeningDays]) VALUES (1, 1, CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[StoreBusinessHour] ([Id], [StoreId], [OpeningTime], [ClosingTime], [OpeningDays]) VALUES (2, 1, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[StoreBusinessHour] OFF
GO
SET IDENTITY_INSERT [dbo].[StoreCategories] ON 

INSERT [dbo].[StoreCategories] ([Id], [CategoryName], [CategoryContent]) VALUES (1, N'日式', N'販賣日式料理，例如壽司、生魚片、章魚燒、大阪燒...等等')
INSERT [dbo].[StoreCategories] ([Id], [CategoryName], [CategoryContent]) VALUES (2, N'雲泰', N'販賣雲南及泰式料理，例如米干、椒麻雞、打拋飯、炒河粉...等等')
INSERT [dbo].[StoreCategories] ([Id], [CategoryName], [CategoryContent]) VALUES (3, N'飲料', N'手搖杯、咖啡廳')
INSERT [dbo].[StoreCategories] ([Id], [CategoryName], [CategoryContent]) VALUES (4, N'美式', N'漢堡、美式炸雞')
INSERT [dbo].[StoreCategories] ([Id], [CategoryName], [CategoryContent]) VALUES (5, N'甜點', N'鬆餅、蛋糕等等')
INSERT [dbo].[StoreCategories] ([Id], [CategoryName], [CategoryContent]) VALUES (6, N'便當', N'能吃飽的東西')
INSERT [dbo].[StoreCategories] ([Id], [CategoryName], [CategoryContent]) VALUES (7, N'義式', N'義大利麵、炸雞')
INSERT [dbo].[StoreCategories] ([Id], [CategoryName], [CategoryContent]) VALUES (8, N'咖哩', N'含印度、日式咖哩')
INSERT [dbo].[StoreCategories] ([Id], [CategoryName], [CategoryContent]) VALUES (10, N'台式', N'在地小吃、炒飯炒麵等等')
SET IDENTITY_INSERT [dbo].[StoreCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[StorePrincipals] ON 

INSERT [dbo].[StorePrincipals] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Gender], [Birthday], [Email], [Account], [Password], [RegistrationTime]) VALUES (1, 2, N'一里', N'後藤', N'0986147537', 0, CAST(N'2005-02-21' AS Date), N'bocchi@gmail.com', N'bocchi123', N'123', CAST(N'2021-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[StorePrincipals] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Gender], [Birthday], [Email], [Account], [Password], [RegistrationTime]) VALUES (2, 2, N'郁代', N'喜多', N'0976248236', 0, CAST(N'2006-04-21' AS Date), N'kita@gmail.com', N'kita123', N'123', CAST(N'2023-01-07T16:58:32.683' AS DateTime))
INSERT [dbo].[StorePrincipals] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Gender], [Birthday], [Email], [Account], [Password], [RegistrationTime]) VALUES (3, 2, N'省瑞', N'都', N'0913365629', 1, CAST(N'2000-12-09' AS Date), N'gutierrez5086@gmail.com', N'gutierrez123', N'123', CAST(N'2023-03-01T00:31:26.167' AS DateTime))
INSERT [dbo].[StorePrincipals] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Gender], [Birthday], [Email], [Account], [Password], [RegistrationTime]) VALUES (4, 2, N'汶銨', N'熊', N'0970024575', 1, CAST(N'1995-02-09' AS Date), N'reyes1550@gmail.com', N'reyes1550', N'123', CAST(N'2023-03-01T00:33:00.797' AS DateTime))
INSERT [dbo].[StorePrincipals] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Gender], [Birthday], [Email], [Account], [Password], [RegistrationTime]) VALUES (5, 2, N'靖凱', N'熊', N'0936515916', 1, CAST(N'2000-03-08' AS Date), N'alexandra4820@icloud.com', N'alexandra4820', N'123', CAST(N'2023-03-01T00:33:58.500' AS DateTime))
INSERT [dbo].[StorePrincipals] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Gender], [Birthday], [Email], [Account], [Password], [RegistrationTime]) VALUES (6, 2, N'點哥', N'甜', N'0915616562', 1, CAST(N'1989-01-04' AS Date), N'sweet123@sweet.com', N'sweet123', N'123', CAST(N'2023-03-02T14:33:40.633' AS DateTime))
INSERT [dbo].[StorePrincipals] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Gender], [Birthday], [Email], [Account], [Password], [RegistrationTime]) VALUES (7, 2, N'料姐', N'飲', N'0925658256', 0, CAST(N'1996-06-01' AS Date), N'drink123@drink.com', N'drink123', N'123', CAST(N'2023-03-02T14:34:31.937' AS DateTime))
INSERT [dbo].[StorePrincipals] ([Id], [AccountStatusId], [FirstName], [LastName], [Phone], [Gender], [Birthday], [Email], [Account], [Password], [RegistrationTime]) VALUES (8, 2, N'著做', N'坐', N'0951731564', 0, CAST(N'1972-03-09' AS Date), N'sit123@gmail.com', N'sit123', N'123', CAST(N'2023-03-02T14:55:38.413' AS DateTime))
SET IDENTITY_INSERT [dbo].[StorePrincipals] OFF
GO
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (1, 1, N'ChopChop碎沙拉', N'桃園市中壢區新生路283號', N'034250250', N'ChopChop碎沙拉202333165232320桃園市中壢區新生路283號.jpg', 24.9637772, 121.2207113)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (2, 1, N'樹太郎', N'桃園市中壢區廣安街12號', N'034270669', N'樹太郎202331112010320桃園市中壢區廣安街12號.jpg', 24.958028, 121.223527)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (3, 2, N'Boujee 佐-烤肉飯', N'桃園市中壢區新生路三段12號', N'0976795200', N'Boujee 佐-烤肉飯202331944228桃園市中壢區新生路三段12號.jpg', 24.987389, 121.22218)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (4, 1, N'阿郭炒麵', N'桃園市平鎮區金陵路43號', N'0987654321', N'阿郭炒麵202333111180435447568.jpeg', 24.9493413, 121.2209273)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (5, 2, N'坐著做。壽司本館', N'桃園市中壢區愛國路60巷15弄4號', N'0989025064', N'坐著做。壽司本館202333111180335447568.jpg', 24.9610593, 121.2190844)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (6, 1, N'小樹日和', N'桃園市中壢區中山東路四段62號', N'034387780', N'小樹日和202333111180335455568.jpg', 24.9359208, 121.2537393)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (7, 1, N'坐著做。海鮮丼飯專門店', N'桃園市中壢區九和一街18號2樓', N'034220605', N'坐著做。海鮮丼飯專門店202333111180335445168.jpg', 24.9616133, 121.2209938)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (8, 2, N'麥當勞-中壢中央餐廳', N'麥當勞-中壢中央餐廳2023331111803354203320桃園市中壢區復興路57號', N'034270449', N'麥當勞-中壢中央餐廳20233692942320桃園市中壢區復興路57號.jpg', 24.9568961, 121.2230068)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (9, 3, N'麥當勞-中壢中正二餐廳', N'桃園市中壢區中正路93號1~2樓', N'034270448', N'麥當勞-中壢中正二餐廳2023313135550桃園市中壢區中正路93號1~2樓.jpg', 24.9545017, 121.2210877)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (10, 3, N'麥當勞-中壢中原餐廳', N'桃園市中壢區中北路200號中原大學', N'034270447', N'麥當勞-中壢中原餐廳202338114547320桃園市中壢區中北路200號中原大學.jpg', 24.9590148, 121.2389816)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (11, 3, N'麥當勞-中壢環中東餐廳', N'桃園市中壢區元化路357號號 B1', N'034270446', N'麥當勞-中壢環中東餐廳202333111180335420320桃園市中壢區元化路357號.jpg', 24.9493079, 121.2323916)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (12, 3, N'麥當勞-中壢家樂福餐廳', N'桃園市中壢區中山東路二段510號1樓 1F', N'034270445', N'麥當勞中壢家樂福餐廳202333111180335320桃園市中壢區中山東路二段510號1樓.jpg', 24.9471796, 121.2424537)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (13, 1, N'樹小狼咖哩', N'新竹市東區埔頂三路32號', N'0912345678', N'樹小狼咖哩20233111016新竹市東區埔頂三路32號.jpg', 24.790177, 121.012704)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (14, 2, N'小狼咖哩', N'新竹市東區埔頂三路33號', N'0918845678', N'小狼咖哩202333111039新竹市東區埔頂三路33號.jpg', 24.789901, 121.012336)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (15, 3, N'麥當勞-中壢崇光餐廳', N'桃園市中壢區元化路357號號 B1', N'03-4270445', N'麥當勞-中壢崇光餐廳202333111180320桃園市中壢區元化路357號號 B1.jpg', 24.962346, 121.22362)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (16, 7, N'麻古茶坊-中壢新生店', N'桃園市中壢區新生路105號', N'03-4271608', N'麻古茶坊-中壢中正店2023332143559桃園市中壢區新生路105號.jpg', 24.9594483, 121.194952)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (17, 6, N'王子神谷おうじかみや-中壢店', N'桃園市中壢區九和六街6號', N'0966829787', N'王子神谷おうじかみや-中壢店2023332143648桃園市中壢區九和六街6號.jpg', 24.9650185, 121.2213483)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (18, 3, N'パパ漢堡(88 Burger)', N'桃園市中壢區長江路134號', N'03-4226583', N'パパ漢堡(88 Burger)2023332145034桃園市中壢區長江路134號.jpg', 24.957789, 121.2260961)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (19, 4, N'鰻慢來-炭烤鰻魚專門店', N'桃園市中壢區大同路16號', N'03-4225544', N'鰻慢來-炭烤鰻魚專門店2023332145212320桃園市中壢區大同路16號.jpg', 24.9588508, 121.2219381)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (20, 5, N'Lucky you 福滿滿', N'桃園市中壢區大同路48號', N'03-4268662', N'Lucky you 福滿滿2023332145342320桃園市中壢區大同路48號.jpg', 24.9583966, 121.2215567)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (21, 1, N'Poffee Canteen', N'桃園市中壢區元化路125巷32號', N'03-4238435', N'Poffee Canteen202333314620320桃園市中壢區元化路125巷32號.jpg', 24.9592374, 121.2266679)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (23, 4, N'紅蜻蜓咖啡館', N'桃園市中壢區永安北路189號', N'03-4805903', N'紅蜻蜓咖啡館2023318194624桃園市中壢區永安北路189號.jpg', 24.965073, 121.224666)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (24, 4, N'八方雲集餐廳', N'桃園市中壢區中北路123巷18號', N'03-4908093', N'八方雲集餐廳2023318194756桃園市中壢區中北路123巷18號.jpg', 24.971292, 121.223537)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (25, 3, N'小飛象麵包店', N'桃園市中壢區內定十八街56號', N'03-4627213', N'小飛象麵包店202331819496桃園市中壢區內定十八街56號.jpg', 24.966382, 121.223134)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (27, 2, N'情人橋茶坊', N'桃園市中壢區南昌路219巷68號', N'03-4658902', N'情人橋茶坊2023318194943桃園市中壢區南昌路219巷68號.jpg', 24.969097, 121.215243)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (28, 6, N'水牛城燒烤 ', N'桃園市中壢區中興北路62巷28號', N'03-4210137', N'水牛城燒烤 202331819515桃園市中壢區中興北路62巷28號.jpg', 24.969636, 121.224824)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (29, 7, N'千雲麵屋', N'桃園市中壢區永泰街49巷41號', N'03-4616231', N'千雲麵屋2023318195522桃園市中壢區永泰街49巷41號.jpg', 24.961499, 121.218454)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (30, 6, N'春水堂飲品店', N'桃園市中壢區安興路83號', N'03-4669301', N'春水堂飲品店2023318195548桃園市中壢區安興路83號.jpg', 24.974572, 121.224364)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (31, 2, N'阿姨小吃店', N'桃園市中壢區興仁路178號', N'03-4216890', N'阿姨小吃店2023318195628桃園市中壢區興仁路178號.jpg', 24.973241, 121.219177)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (32, 5, N'炸雞大獅', N'桃園市中壢區東和路39巷6號 ', N'03-4210957', N'炸雞大獅2023318195836桃園市中壢區東和路39巷6號 .jpg', 24.969738, 121.212693)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (73, 1, N'豪小子平價牛排館', N'320桃園市中壢區中美路二段140號', N'034270302', N'豪小子平價牛排館202331916178320桃園市中壢區中美路二段140號.jpg', 24.960400633558024, 121.22089766369044)
INSERT [dbo].[Stores] ([Id], [StorePrincipalId], [StoreName], [Address], [ContactNumber], [Photo], [Latitude], [Longitude]) VALUES (81, 1, N'Boujee 佐-烤肉飯123', N'320桃園市中壢區大同路48號', N'034268662', N'Boujee 佐-烤肉飯12320233321163043320桃園市中壢區大同路48號.jpg', 24.958507, 121.2233428)
SET IDENTITY_INSERT [dbo].[Stores] OFF
GO
SET IDENTITY_INSERT [dbo].[StoresCategoriesLists] ON 

INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (1, 2, 1)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (2, 3, 2)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (5, 2, 8)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (6, 1, 4)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (7, 4, 10)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (8, 5, 1)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (9, 6, 2)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (10, 6, 10)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (11, 7, 1)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (12, 8, 4)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (13, 9, 4)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (14, 10, 4)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (15, 11, 4)
INSERT [dbo].[StoresCategoriesLists] ([Id], [StoreId], [CategoryId]) VALUES (16, 12, 4)
SET IDENTITY_INSERT [dbo].[StoresCategoriesLists] OFF
GO
ALTER TABLE [dbo].[BenefitStandard] ADD  CONSTRAINT [DF_BenefitStandard_Selecred]  DEFAULT ((0)) FOR [Selected]
GO
ALTER TABLE [dbo].[DeliveryDrivers] ADD  CONSTRAINT [DF_DeliveryDrivers_AccountStatusId]  DEFAULT ((1)) FOR [AccountStatusId]
GO
ALTER TABLE [dbo].[DeliveryDrivers] ADD  CONSTRAINT [DF_DeliveryDrivers_WorkStatuseId]  DEFAULT ((1)) FOR [WorkStatuseId]
GO
ALTER TABLE [dbo].[DeliveryDrivers] ADD  CONSTRAINT [DF_DeliveryDrivers_RegistrationTime]  DEFAULT (getdate()) FOR [RegistrationTime]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_AccountStatusId]  DEFAULT ((1)) FOR [AccountStatusId]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_RegistrationTime]  DEFAULT (getdate()) FOR [RegistrationTime]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Milage]  DEFAULT ((0)) FOR [Milage]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_CreateMark]  DEFAULT ((1)) FOR [CreateMark]
GO
ALTER TABLE [dbo].[Pays] ADD  CONSTRAINT [DF_Pays_DeliveryCount]  DEFAULT ((0)) FOR [DeliveryCount]
GO
ALTER TABLE [dbo].[Pays] ADD  CONSTRAINT [DF_Pays_TotalMilage]  DEFAULT ((0)) FOR [TotalMilage]
GO
ALTER TABLE [dbo].[Pays] ADD  CONSTRAINT [DF_Pays_ShareProfit]  DEFAULT ((0)) FOR [Bouns]
GO
ALTER TABLE [dbo].[Pays] ADD  CONSTRAINT [DF_Pays_TotalPay]  DEFAULT ((0)) FOR [TotalPay]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Staffs] ADD  CONSTRAINT [DF_Staffs_EncryptedPassword]  DEFAULT ((0)) FOR [EncryptedPassword]
GO
ALTER TABLE [dbo].[Staffs] ADD  CONSTRAINT [DF_CustomerServices_Permissions]  DEFAULT ((1)) FOR [Role]
GO
ALTER TABLE [dbo].[StorePrincipals] ADD  CONSTRAINT [DF_StorePrincipals_AccountStatusId]  DEFAULT ((1)) FOR [AccountStatusId]
GO
ALTER TABLE [dbo].[StorePrincipals] ADD  CONSTRAINT [DF_StorePrincipals_RegistrationTime]  DEFAULT (getdate()) FOR [RegistrationTime]
GO
ALTER TABLE [dbo].[StoreWallet] ADD  CONSTRAINT [DF_StoreWallet_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[AccountAddress]  WITH CHECK ADD  CONSTRAINT [FK_AccountAddress_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[AccountAddress] CHECK CONSTRAINT [FK_AccountAddress_Members]
GO
ALTER TABLE [dbo].[AppealRecord]  WITH CHECK ADD  CONSTRAINT [FK_AppealRecord_ComplaintStatus] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[AppealRecord] CHECK CONSTRAINT [FK_AppealRecord_ComplaintStatus]
GO
ALTER TABLE [dbo].[AppealRecord]  WITH CHECK ADD  CONSTRAINT [FK_AppealRecord_ComplaintType] FOREIGN KEY([ComplaintId])
REFERENCES [dbo].[ComplaintType] ([Id])
GO
ALTER TABLE [dbo].[AppealRecord] CHECK CONSTRAINT [FK_AppealRecord_ComplaintType]
GO
ALTER TABLE [dbo].[BenefitStandard]  WITH CHECK ADD  CONSTRAINT [FK_BenefitStandard_BenefitStandard] FOREIGN KEY([Id])
REFERENCES [dbo].[BenefitStandard] ([Id])
GO
ALTER TABLE [dbo].[BenefitStandard] CHECK CONSTRAINT [FK_BenefitStandard_BenefitStandard]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Carts] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Carts]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_ProductCustomizationItems] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ProductCustomizationItems] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_ProductCustomizationItems]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Members]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Stores]
GO
ALTER TABLE [dbo].[ComplaintType]  WITH CHECK ADD  CONSTRAINT [FK_ComplaintType_ComplaintType] FOREIGN KEY([Id])
REFERENCES [dbo].[ComplaintType] ([Id])
GO
ALTER TABLE [dbo].[ComplaintType] CHECK CONSTRAINT [FK_ComplaintType_ComplaintType]
GO
ALTER TABLE [dbo].[CreditCards]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[CreditCards] CHECK CONSTRAINT [FK_CreditCard_Members]
GO
ALTER TABLE [dbo].[DeliveryDrivers]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryDrivers_DeliveryDrivers] FOREIGN KEY([Id])
REFERENCES [dbo].[DeliveryDrivers] ([Id])
GO
ALTER TABLE [dbo].[DeliveryDrivers] CHECK CONSTRAINT [FK_DeliveryDrivers_DeliveryDrivers]
GO
ALTER TABLE [dbo].[DeliveryDrivers]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryDrivers_DeliveryDriversAccountStatues] FOREIGN KEY([AccountStatusId])
REFERENCES [dbo].[AccountStatues] ([Id])
GO
ALTER TABLE [dbo].[DeliveryDrivers] CHECK CONSTRAINT [FK_DeliveryDrivers_DeliveryDriversAccountStatues]
GO
ALTER TABLE [dbo].[DeliveryDrivers]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryDrivers_DeliveryDriverWorkStatuses] FOREIGN KEY([WorkStatuseId])
REFERENCES [dbo].[DeliveryDriverWorkStatuses] ([Id])
GO
ALTER TABLE [dbo].[DeliveryDrivers] CHECK CONSTRAINT [FK_DeliveryDrivers_DeliveryDriverWorkStatuses]
GO
ALTER TABLE [dbo].[DeliveryViolationRecords]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryViolationRecords_DeliveryDrivers] FOREIGN KEY([DeliveryDriversId])
REFERENCES [dbo].[DeliveryDrivers] ([Id])
GO
ALTER TABLE [dbo].[DeliveryViolationRecords] CHECK CONSTRAINT [FK_DeliveryViolationRecords_DeliveryDrivers]
GO
ALTER TABLE [dbo].[DeliveryViolationRecords]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryViolationRecords_DeliveryViolationLists] FOREIGN KEY([ViolationId])
REFERENCES [dbo].[DeliveryViolationTypes] ([Id])
GO
ALTER TABLE [dbo].[DeliveryViolationRecords] CHECK CONSTRAINT [FK_DeliveryViolationRecords_DeliveryViolationLists]
GO
ALTER TABLE [dbo].[DeliveryViolationRecords]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryViolationRecords_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[DeliveryViolationRecords] CHECK CONSTRAINT [FK_DeliveryViolationRecords_Orders]
GO
ALTER TABLE [dbo].[DriverCancellationRecords]  WITH CHECK ADD  CONSTRAINT [FK_CancellationRecords_Cancellations] FOREIGN KEY([CancellationId])
REFERENCES [dbo].[DriverCancellations] ([Id])
GO
ALTER TABLE [dbo].[DriverCancellationRecords] CHECK CONSTRAINT [FK_CancellationRecords_Cancellations]
GO
ALTER TABLE [dbo].[DriverCancellationRecords]  WITH CHECK ADD  CONSTRAINT [FK_CancellationRecords_DeliveryDrivers] FOREIGN KEY([DeliveryDriversId])
REFERENCES [dbo].[DeliveryDrivers] ([Id])
GO
ALTER TABLE [dbo].[DriverCancellationRecords] CHECK CONSTRAINT [FK_CancellationRecords_DeliveryDrivers]
GO
ALTER TABLE [dbo].[DriverCancellationRecords]  WITH CHECK ADD  CONSTRAINT [FK_DriverCancellationRecords_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[DriverCancellationRecords] CHECK CONSTRAINT [FK_DriverCancellationRecords_Orders]
GO
ALTER TABLE [dbo].[Favourites]  WITH CHECK ADD  CONSTRAINT [FK_Favourites_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Favourites] CHECK CONSTRAINT [FK_Favourites_Members]
GO
ALTER TABLE [dbo].[Favourites]  WITH CHECK ADD  CONSTRAINT [FK_Favourites_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([Id])
GO
ALTER TABLE [dbo].[Favourites] CHECK CONSTRAINT [FK_Favourites_Stores]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_MemberAccountStatues] FOREIGN KEY([AccountStatusId])
REFERENCES [dbo].[AccountStatues] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_MemberAccountStatues]
GO
ALTER TABLE [dbo].[MemberViolationRecords]  WITH CHECK ADD  CONSTRAINT [FK_MemberViolationRecord_MemberViolationList] FOREIGN KEY([ViolationId])
REFERENCES [dbo].[MemberViolationTypes] ([Id])
GO
ALTER TABLE [dbo].[MemberViolationRecords] CHECK CONSTRAINT [FK_MemberViolationRecord_MemberViolationList]
GO
ALTER TABLE [dbo].[MemberViolationRecords]  WITH CHECK ADD  CONSTRAINT [FK_MemberViolationRecords_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[MemberViolationRecords] CHECK CONSTRAINT [FK_MemberViolationRecords_Orders]
GO
ALTER TABLE [dbo].[MemberViolationRecords]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[MemberViolationRecords] CHECK CONSTRAINT [FK_Table_1_Members]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_ProductCustomizationItems] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ProductCustomizationItems] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_ProductCustomizationItems]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_DeliveryDrivers] FOREIGN KEY([DeliveryDriversId])
REFERENCES [dbo].[DeliveryDrivers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_DeliveryDrivers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Members]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Stores]
GO
ALTER TABLE [dbo].[OrderSchedules]  WITH CHECK ADD  CONSTRAINT [FK_OrderSchedules_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderSchedules] CHECK CONSTRAINT [FK_OrderSchedules_Orders]
GO
ALTER TABLE [dbo].[OrderSchedules]  WITH CHECK ADD  CONSTRAINT [FK_OrderSchedules_OrderStatues] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OrderStatues] ([Id])
GO
ALTER TABLE [dbo].[OrderSchedules] CHECK CONSTRAINT [FK_OrderSchedules_OrderStatues]
GO
ALTER TABLE [dbo].[Pays]  WITH CHECK ADD  CONSTRAINT [FK_Pays_DeliveryDrivers] FOREIGN KEY([DeliveryDriversId])
REFERENCES [dbo].[DeliveryDrivers] ([Id])
GO
ALTER TABLE [dbo].[Pays] CHECK CONSTRAINT [FK_Pays_DeliveryDrivers]
GO
ALTER TABLE [dbo].[ProductCustomizationItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderCustomizationItems_Products] FOREIGN KEY([ProuctId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductCustomizationItems] CHECK CONSTRAINT [FK_OrderCustomizationItems_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_ProductInformations_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_ProductInformations_Stores]
GO
ALTER TABLE [dbo].[QA]  WITH CHECK ADD  CONSTRAINT [FK_QA_QACategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[QACategory] ([Id])
GO
ALTER TABLE [dbo].[QA] CHECK CONSTRAINT [FK_QA_QACategory]
GO
ALTER TABLE [dbo].[QACategory]  WITH CHECK ADD  CONSTRAINT [FK_QACategory_QACategory] FOREIGN KEY([Id])
REFERENCES [dbo].[QACategory] ([Id])
GO
ALTER TABLE [dbo].[QACategory] CHECK CONSTRAINT [FK_QACategory_QACategory]
GO
ALTER TABLE [dbo].[StoreBusinessHour]  WITH CHECK ADD  CONSTRAINT [FK_StoreBusinessHour_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([Id])
GO
ALTER TABLE [dbo].[StoreBusinessHour] CHECK CONSTRAINT [FK_StoreBusinessHour_Stores]
GO
ALTER TABLE [dbo].[StoreCancellationRecords]  WITH CHECK ADD  CONSTRAINT [FK_StoreCancellationRecords_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[StoreCancellationRecords] CHECK CONSTRAINT [FK_StoreCancellationRecords_Orders]
GO
ALTER TABLE [dbo].[StoreCancellationRecords]  WITH CHECK ADD  CONSTRAINT [FK_StoreCancellationRecords_StoreCancellations] FOREIGN KEY([CancellationId])
REFERENCES [dbo].[StoreCancellationTypes] ([Id])
GO
ALTER TABLE [dbo].[StoreCancellationRecords] CHECK CONSTRAINT [FK_StoreCancellationRecords_StoreCancellations]
GO
ALTER TABLE [dbo].[StoreCancellationRecords]  WITH CHECK ADD  CONSTRAINT [FK_StoreCancellationRecords_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([Id])
GO
ALTER TABLE [dbo].[StoreCancellationRecords] CHECK CONSTRAINT [FK_StoreCancellationRecords_Stores]
GO
ALTER TABLE [dbo].[StorePrincipals]  WITH CHECK ADD  CONSTRAINT [FK_StorePrincipals_StoreAccountStatues] FOREIGN KEY([AccountStatusId])
REFERENCES [dbo].[AccountStatues] ([Id])
GO
ALTER TABLE [dbo].[StorePrincipals] CHECK CONSTRAINT [FK_StorePrincipals_StoreAccountStatues]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FK_Store_StorePrincipal] FOREIGN KEY([StorePrincipalId])
REFERENCES [dbo].[StorePrincipals] ([Id])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FK_Store_StorePrincipal]
GO
ALTER TABLE [dbo].[StoresCategoriesLists]  WITH CHECK ADD  CONSTRAINT [FK_StoresCategoriesList_StoreCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[StoreCategories] ([Id])
GO
ALTER TABLE [dbo].[StoresCategoriesLists] CHECK CONSTRAINT [FK_StoresCategoriesList_StoreCategories]
GO
ALTER TABLE [dbo].[StoresCategoriesLists]  WITH CHECK ADD  CONSTRAINT [FK_StoresCategoriesList_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([Id])
GO
ALTER TABLE [dbo].[StoresCategoriesLists] CHECK CONSTRAINT [FK_StoresCategoriesList_Stores]
GO
ALTER TABLE [dbo].[StoreViolationRecords]  WITH CHECK ADD  CONSTRAINT [FK_StoreViolationRecord_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([Id])
GO
ALTER TABLE [dbo].[StoreViolationRecords] CHECK CONSTRAINT [FK_StoreViolationRecord_Store]
GO
ALTER TABLE [dbo].[StoreViolationRecords]  WITH CHECK ADD  CONSTRAINT [FK_StoreViolationRecord_StoreViolationList] FOREIGN KEY([ViolationId])
REFERENCES [dbo].[StoreViolationTypes] ([Id])
GO
ALTER TABLE [dbo].[StoreViolationRecords] CHECK CONSTRAINT [FK_StoreViolationRecord_StoreViolationList]
GO
ALTER TABLE [dbo].[StoreViolationRecords]  WITH CHECK ADD  CONSTRAINT [FK_StoreViolationRecords_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[StoreViolationRecords] CHECK CONSTRAINT [FK_StoreViolationRecords_Orders]
GO
ALTER TABLE [dbo].[StoreWallet]  WITH CHECK ADD  CONSTRAINT [FK_StoreWallet_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([Id])
GO
ALTER TABLE [dbo].[StoreWallet] CHECK CONSTRAINT [FK_StoreWallet_Stores]
GO
USE [master]
GO
ALTER DATABASE [FoodDelivery] SET  READ_WRITE 
GO
