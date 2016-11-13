USE [master]
GO
/****** Object:  Database [DevERP]    Script Date: 14-11-2016 01:56:23 ******/
CREATE DATABASE [DevERP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DevERP', FILENAME = N'E:\SQL\MSSQL11.SQLEXPRESS\MSSQL\DATA\DevERP.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DevERP_log', FILENAME = N'E:\SQL\MSSQL11.SQLEXPRESS\MSSQL\DATA\DevERP_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DevERP] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DevERP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DevERP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DevERP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DevERP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DevERP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DevERP] SET ARITHABORT OFF 
GO
ALTER DATABASE [DevERP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DevERP] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DevERP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DevERP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DevERP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DevERP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DevERP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DevERP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DevERP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DevERP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DevERP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DevERP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DevERP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DevERP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DevERP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DevERP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DevERP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DevERP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DevERP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DevERP] SET  MULTI_USER 
GO
ALTER DATABASE [DevERP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DevERP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DevERP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DevERP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DevERP', N'ON'
GO
USE [DevERP]
GO
/****** Object:  StoredProcedure [dbo].[UserAllInformation]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UserAllInformation] @loginId int 
as
select l.loginId,l.userName,l.password,u.userInfoId,u.name,u.email,u.phone,u.image,u.designation from Login as l join UserInfo as u on l.loginId=u.loginId where l.loginId = @loginId



GO
/****** Object:  Table [dbo].[Bank]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank](
	[bankId] [int] IDENTITY(1,1) NOT NULL,
	[bankName] [varchar](50) NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[bankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[itemId] [int] IDENTITY(1,1) NOT NULL,
	[itemName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[loginId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](30) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[type] [varchar](1) NOT NULL,
	[status] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[loginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Party]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Party](
	[partyId] [int] IDENTITY(1,1) NOT NULL,
	[partyName] [varchar](50) NOT NULL,
	[partyMobile] [varchar](15) NULL,
	[partyAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Party] PRIMARY KEY CLUSTERED 
(
	[partyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubItem]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubItem](
	[subItemId] [int] IDENTITY(1,1) NOT NULL,
	[subItemName] [varchar](50) NOT NULL,
	[itemId] [int] NOT NULL,
 CONSTRAINT [PK_SubItem] PRIMARY KEY CLUSTERED 
(
	[subItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ProductName]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ProductName](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProdectName] [varchar](50) NULL,
	[ProductTypeId] [int] NULL,
 CONSTRAINT [PK_tbl_ProductName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ProductSize]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ProductSize](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductSize] [varchar](50) NULL,
	[ProductNameId] [int] NULL,
	[ProductTypeId] [int] NULL,
	[FullProductName] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_ProductSize] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ProductType]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ProductType](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transactions](
	[transactionId] [int] IDENTITY(1,1) NOT NULL,
	[transactionDate] [date] NOT NULL,
	[itemId] [int] NOT NULL,
	[subItemId] [int] NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[transactionCatagory] [varchar](7) NOT NULL,
	[partyId] [int] NULL,
	[transactionType] [varchar](6) NOT NULL,
	[bankId] [int] NULL,
	[remarks] [varchar](200) NULL,
	[chequeStatus] [varchar](7) NULL,
	[lastModify] [datetime] NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[userInfoId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](20) NULL,
	[image] [varchar](50) NULL,
	[designation] [varchar](30) NULL,
	[entryDate] [date] NULL,
	[loginId] [int] NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[userInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[GetAllTransaction]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[GetAllTransaction] as
select t.transactionId,t.transactionDate,t.itemId,i.itemName,t.subItemId,s.subItemName,t.amount,t.transactionCatagory,
t.partyId,p.partyName,t.transactionType,t.bankId,b.bankName,t.remarks,t.chequeStatus,t.lastModify
from Transactions as t left outer join Item as i 
on t.itemId=i.itemId left outer join SubItem as s 
on t.subItemId=s.subItemId left outer join Bank as b 
on t.bankId=b.bankId left outer join Party as p 
on t.partyId=p.partyId


GO
/****** Object:  View [dbo].[GetPassTransaction]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetPassTransaction] as
select * from transactions 
where transactionType ='cash' 
or (transactionType='cheque' and chequeStatus='Pass')

GO
ALTER TABLE [dbo].[Login] ADD  CONSTRAINT [DF_Login_tbl_type]  DEFAULT ('d') FOR [type]
GO
ALTER TABLE [dbo].[Login] ADD  CONSTRAINT [DF_Login_tbl_status]  DEFAULT ('u') FOR [status]
GO
ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF_Transaction_lastModify]  DEFAULT (getdate()) FOR [lastModify]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_image]  DEFAULT ('0.jpg') FOR [image]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_entryDate]  DEFAULT (getdate()) FOR [entryDate]
GO
ALTER TABLE [dbo].[SubItem]  WITH CHECK ADD  CONSTRAINT [FK_SubItem_Item] FOREIGN KEY([itemId])
REFERENCES [dbo].[Item] ([itemId])
GO
ALTER TABLE [dbo].[SubItem] CHECK CONSTRAINT [FK_SubItem_Item]
GO
/****** Object:  Trigger [dbo].[UpdateChequeStatus]    Script Date: 14-11-2016 01:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[UpdateChequeStatus]
on [dbo].[Transactions]
after insert
as 
Declare @TransactionId int,
@TransactionType varchar(6)

Set @TransactionId = (select top 1 transactionId from inserted)
Set @TransactionType = (select top 1 transactionType from inserted)

if(@TransactionType='cheque')
begin
update transactions set chequeStatus = 'Pending' where transactionId = @TransactionId
end


GO
USE [master]
GO
ALTER DATABASE [DevERP] SET  READ_WRITE 
GO
