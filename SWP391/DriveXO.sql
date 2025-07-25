USE [master]
GO
/****** Object:  Database [DriveXO]    Script Date: 7/10/2025 9:35:02 AM ******/
CREATE DATABASE [DriveXO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DriveXO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DriveXO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DriveXO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DriveXO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DriveXO] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DriveXO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DriveXO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DriveXO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DriveXO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DriveXO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DriveXO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DriveXO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DriveXO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DriveXO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DriveXO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DriveXO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DriveXO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DriveXO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DriveXO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DriveXO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DriveXO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DriveXO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DriveXO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DriveXO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DriveXO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DriveXO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DriveXO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DriveXO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DriveXO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DriveXO] SET  MULTI_USER 
GO
ALTER DATABASE [DriveXO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DriveXO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DriveXO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DriveXO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DriveXO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DriveXO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DriveXO] SET QUERY_STORE = ON
GO
ALTER DATABASE [DriveXO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DriveXO]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[car_id] [int] NOT NULL,
	[car_name] [varchar](255) NOT NULL,
	[car_brand] [varchar](255) NOT NULL,
	[model] [varchar](255) NOT NULL,
	[car_price] [decimal](10, 2) NOT NULL,
	[car_year] [date] NOT NULL,
	[car_img] [varchar](255) NULL,
	[car_stock] [int] NOT NULL,
	[car_odo] [decimal](10, 2) NULL,
	[fuel_type] [varchar](255) NULL,
	[displacement] [decimal](10, 2) NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[car_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarAppointment]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarAppointment](
	[car_appointment_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[car_id] [int] NULL,
	[ca_date] [datetime] NOT NULL,
	[ca_note] [nvarchar](255) NULL,
	[ca_status] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[car_appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[count_item] [int] NOT NULL,
	[cart_price] [decimal](15, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[part_id] [int] NOT NULL,
	[cart_id] [int] NOT NULL,
	[pt_order_quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[part_id] ASC,
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] NOT NULL,
	[category_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[comment_text] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[order_price] [decimal](10, 2) NOT NULL,
	[order_status] [varchar](255) NOT NULL,
	[order_date] [datetime] NOT NULL,
	[payment_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[order_detail_id] [int] NOT NULL,
	[order_id] [int] NULL,
	[part_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[total_price] [decimal](20, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Part]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Part](
	[part_id] [int] NOT NULL,
	[part_name] [varchar](255) NOT NULL,
	[part_brand] [varchar](255) NOT NULL,
	[car_model] [varchar](255) NOT NULL,
	[description] [nvarchar](255) NULL,
	[part_img] [varchar](255) NULL,
	[part_stock] [int] NOT NULL,
	[part_price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[part_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] NOT NULL,
	[payment_method] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] NOT NULL,
	[role_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[service_id] [int] NOT NULL,
	[service_name] [varchar](255) NOT NULL,
	[service_description] [nvarchar](255) NULL,
	[service_price] [decimal](10, 2) NOT NULL,
	[estimate_time] [datetime] NOT NULL,
	[service_img] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceSchedule]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceSchedule](
	[service_schedule_id] [int] NOT NULL,
	[service_id] [int] NULL,
	[user_id] [int] NULL,
	[ss_date] [datetime] NOT NULL,
	[ss_note] [nvarchar](255) NULL,
	[ss_status] [varchar](255) NOT NULL,
	[car_info] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[service_schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/10/2025 9:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[address] [nvarchar](255) NULL,
	[role_id] [int] NULL,
	[user_status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[CarAppointment]  WITH CHECK ADD FOREIGN KEY([car_id])
REFERENCES [dbo].[Car] ([car_id])
GO
ALTER TABLE [dbo].[CarAppointment]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD FOREIGN KEY([cart_id])
REFERENCES [dbo].[Cart] ([cart_id])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD FOREIGN KEY([part_id])
REFERENCES [dbo].[Part] ([part_id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([payment_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([part_id])
REFERENCES [dbo].[Part] ([part_id])
GO
ALTER TABLE [dbo].[ServiceSchedule]  WITH CHECK ADD FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[ServiceSchedule]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
USE [master]
GO
ALTER DATABASE [DriveXO] SET  READ_WRITE 
GO
