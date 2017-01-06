USE [DevERP]
GO
/****** Object:  Table [dbo].[tbl_EmployeeEntry]    Script Date: 18-11-2016 00:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_EmployeeEntry](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [varchar](50) NOT NULL,
	[EmployeeIdBangla] [nchar](50) NULL,
	[DepartmentId] [varchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[Grade] [int] NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[FirstNameBangla] [nchar](500) NULL,
	[LastNameBangla] [nchar](500) NULL,
	[ShortName] [varchar](50) NULL,
	[AdditionalId] [varchar](50) NULL,
	[FatherName] [varchar](100) NULL,
	[MotherName] [varchar](100) NULL,
	[DateOfBirth] [date] NULL,
	[PlaceOfBirth] [varchar](100) NULL,
	[Gender] [varchar](10) NULL,
	[BloodGroup] [varchar](3) NULL,
	[Nationality] [varchar](20) NULL,
	[NationalIdCardNo] [varchar](20) NULL,
	[NationalIdCardNoBangla] [nchar](200) NULL,
	[Religion] [varchar](10) NULL,
	[Hobbies] [varchar](max) NULL,
	[MaritialStatus] [varchar](20) NULL,
	[MarriageDate] [date] NULL,
	[PresentAddress] [varchar](max) NULL,
	[ParmanentAddress] [varchar](max) NULL,
	[ParmanentAddressBangla] [nchar](1000) NULL,
	[OfficialPhone] [varchar](15) NULL,
	[PersonalPhone] [varchar](15) NULL,
	[OfficialEmail] [varchar](320) NULL,
	[PersonalEmail] [varchar](320) NULL,
	[UserId] [int] NULL,
	[AttendenceCardId] [varchar](50) NULL,
	[AttendenceCardIdBangla] [nchar](50) NULL,
	[FingerPrintId] [varchar](50) NULL,
	[EmployeePicture] [image] NULL,
	[DigitalSignature] [image] NULL,
	[GrossSalary] [int] NOT NULL,
	[BasicSalary] [int] NULL,
	[HouseRent] [int] NULL,
	[MedicalSupport] [int] NULL,
	[ConvanceSupport] [int] NULL,
	[FoodSupport] [int] NULL,
	[OverTimeRate] [float] NULL,
	[JoiningDate] [date] NULL,
	[JoiningDateBangla] [nchar](100) NULL,
	[LineId] [int] NULL,
	[CatagoryId] [int] NULL,
	[EntryOrDate] [date] NULL,
 CONSTRAINT [PK_tbl_EmployeeEntry] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ProductionInfo]    Script Date: 18-11-2016 00:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ProductionInfo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductionDate] [date] NULL,
	[EmpId] [varchar](50) NULL,
	[ProductId] [int] NULL,
	[Quantity] [float] NULL,
	[Rate] [decimal](18, 0) NULL,
	[TotalRate] [decimal](18, 0) NULL,
	[InputDate] [date] NULL,
	[InputBy] [varchar](50) NULL,
	[UpdateDate] [date] NULL,
	[UpdateBy] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_ProductionInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ProductName]    Script Date: 18-11-2016 00:02:19 ******/
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
/****** Object:  Table [dbo].[tbl_ProductSize]    Script Date: 18-11-2016 00:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ProductSize](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductSize] [varchar](50) NULL,
	[Rate] [decimal](18, 0) NULL,
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
/****** Object:  Table [dbo].[tbl_ProductType]    Script Date: 18-11-2016 00:02:19 ******/
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
ALTER TABLE [dbo].[tbl_EmployeeEntry] ADD  CONSTRAINT [DF_tbl_EmployeeEntry_EntryOrDate]  DEFAULT (getdate()) FOR [EntryOrDate]
GO
