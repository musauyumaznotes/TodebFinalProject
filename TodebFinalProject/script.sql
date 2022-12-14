USE [HousingEstate]
GO
/****** Object:  Table [dbo].[HouseHoldTypes]    Script Date: 14.08.2022 16:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseHoldTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HoldType] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_HouseHoldTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blocks]    Script Date: 14.08.2022 16:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blocks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[NumberOfFloors] [varchar](3) NULL,
	[HaveAElevator] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Blocks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.08.2022 16:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[NationalIdentityNumber] [varchar](11) NULL,
	[Email] [varchar](75) NULL,
	[HaveAVehicle] [bit] NULL,
	[LicensePlate] [varchar](15) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartments]    Script Date: 14.08.2022 16:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LandlordId] [int] NULL,
	[HouseUserId] [int] NULL,
	[HouseHoldTypeId] [int] NULL,
	[BlockId] [int] NULL,
	[Floor] [varchar](2) NULL,
	[ApartmentNumber] [varchar](3) NULL,
	[Status] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Apartments_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ApartmentViews]    Script Date: 14.08.2022 16:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApartmentViews]
AS
SELECT a.Id, b.Name AS Block, a.ApartmentNumber, a.Floor, a.Status, h.HoldType, u.FirstName + ' ' + u.LastName AS UserName
FROM     dbo.Apartments AS a INNER JOIN
                  dbo.Users AS u ON u.Id = a.HouseUserId INNER JOIN
                  dbo.Blocks AS b ON b.Id = a.BlockId INNER JOIN
                  dbo.HouseHoldTypes AS h ON h.Id = a.HouseHoldTypeId
GO
/****** Object:  Table [dbo].[ApartmentDetails]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentDetails](
	[Id] [int] NOT NULL,
	[ApartmentDetails] [varchar](500) NULL,
	[NumberOfRooms] [varchar](2) NULL,
	[SquareMeterOfTheHouse] [varchar](3) NULL,
	[HaveABalcony] [bit] NULL,
	[HaveEnSuiteBathroom] [bit] NULL,
 CONSTRAINT [PK_ApartmentDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ApartmentDetailViews]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApartmentDetailViews]
AS
SELECT a.Id, b.Name AS Block, a.ApartmentNumber, a.Floor, a.Status, h.HoldType, u.FirstName + ' ' + u.LastName AS UserName, ad.ApartmentDetails, ad.NumberOfRooms, ad.SquareMeterOfTheHouse, ad.HaveABalcony, 
                  ad.HaveEnSuiteBathroom
FROM     dbo.ApartmentDetails AS ad INNER JOIN
                  dbo.Apartments AS a ON a.Id = ad.Id INNER JOIN
                  dbo.Users AS u ON u.Id = a.HouseUserId INNER JOIN
                  dbo.Blocks AS b ON b.Id = a.BlockId INNER JOIN
                  dbo.HouseHoldTypes AS h ON h.Id = a.HouseHoldTypeId
GO
/****** Object:  Table [dbo].[Phones]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PhoneNumber] [varchar](20) NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApartmentId] [int] NULL,
	[TotalBill] [money] NULL,
	[AmountOfUsage] [decimal](18, 3) NULL,
	[UnitPrice] [money] NULL,
	[DueDate] [datetime] NULL,
	[IsItPaid] [bit] NULL,
	[PaymentDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElectricBills]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElectricBills](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_ElectricBills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[HouseElectricBillViews]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[HouseElectricBillViews]
as
select e.Id,bl.Name,a.ApartmentNumber,a.Id ApartmentId,(u.FirstName+' '+u.LastName)FullName,p.PhoneNumber,u.Email,b.TotalBill,b.AmountOfUsage,b.DueDate,b.IsItPaid,b.PaymentDate from Bills b
inner join ElectricBills e on e.Id = b.Id
inner join Apartments a on a.Id = b.ApartmentId
inner join Blocks bl on bl.Id = a.BlockId
inner join Users u on u.Id = a.HouseUserId
inner join Phones p on u.Id = p.UserId
GO
/****** Object:  Table [dbo].[WaterBills]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WaterBills](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_WaterBills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[HouseWaterBillViews]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[HouseWaterBillViews]
as
select w.Id,bl.Name,a.ApartmentNumber,a.Id ApartmentId,(u.FirstName+' '+u.LastName)FullName,p.PhoneNumber,u.Email,b.TotalBill,b.AmountOfUsage,b.DueDate,b.IsItPaid,b.PaymentDate from Bills b
inner join WaterBills w on w.Id = b.Id
inner join Apartments a on a.Id = b.ApartmentId
inner join Blocks bl on bl.Id = a.BlockId
inner join Users u on u.Id = a.HouseUserId
inner join Phones p on u.Id = p.UserId
GO
/****** Object:  Table [dbo].[GasBills]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GasBills](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_GasBills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[HouseGasBillViews]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[HouseGasBillViews]
as
select g.Id,bl.Name,a.ApartmentNumber,a.Id ApartmentId,(u.FirstName+' '+u.LastName)FullName,p.PhoneNumber,u.Email,b.TotalBill,b.AmountOfUsage,b.DueDate,b.IsItPaid,b.PaymentDate from Bills b
inner join GasBills g on g.Id = b.Id
inner join Apartments a on a.Id = b.ApartmentId
inner join Blocks bl on bl.Id = a.BlockId
inner join Users u on u.Id = a.HouseUserId
inner join Phones p on u.Id = p.UserId
GO
/****** Object:  View [dbo].[UserInformationViews]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserInformationViews]
AS
SELECT u.Id, u.FirstName + ' ' + u.LastName AS FullName, u.NationalIdentityNumber, u.Email, u.HaveAVehicle, u.LicensePlate, p.PhoneNumber
FROM     dbo.Users AS u INNER JOIN
                  dbo.Phones AS p ON p.Id = u.Id
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NULL,
	[ReceiverId] [int] NULL,
	[Content] [varchar](1000) NULL,
	[IsItRead] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MessageInformationViews]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MessageInformationViews]
AS
SELECT m.Id, u.FirstName + ' ' + u.LastName AS Sender, us.FirstName + ' ' + us.LastName AS Receiver, m.[Content], m.IsItRead, m.CreatedAt AS TimeToSend
FROM     dbo.Messages AS m INNER JOIN
                  dbo.Users AS u ON u.Id = m.SenderId INNER JOIN
                  dbo.Users AS us ON us.Id = m.ReceiverId
GO
/****** Object:  Table [dbo].[Apartments23]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartments23](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LandlordId] [int] NULL,
	[HouseUserId] [int] NULL,
	[HouseHoldTypeId] [int] NULL,
	[BlockId] [int] NULL,
	[Floor] [varchar](3) NULL,
	[ApartmentNumber] [varchar](3) NULL,
	[Status] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Apartments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dues]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApartmentId] [int] NULL,
	[Price] [money] NULL,
	[DueDate] [datetime] NULL,
	[IsItPaid] [bit] NULL,
	[PaymentDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Dues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Landlords]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Landlords](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_Landlords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessees]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessees](
	[Id] [int] NOT NULL,
	[ContractTerm] [varchar](3) NULL,
 CONSTRAINT [PK_Lessees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPasswords]    Script Date: 14.08.2022 16:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPasswords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PasswordSalt] [binary](500) NULL,
	[PasswordHash] [binary](500) NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_UserPasswords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (1, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (2, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (3, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (4, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (5, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (6, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (7, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (8, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (9, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (10, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (11, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (12, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (13, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (14, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (15, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (16, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (17, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (18, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (19, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (20, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (21, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (22, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (23, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (24, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (25, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (26, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (27, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (28, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (29, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (30, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (31, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (32, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (33, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (34, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (35, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (36, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (37, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (38, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (39, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (40, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (41, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (42, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (43, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (44, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (45, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (46, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (47, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (48, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (49, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (50, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (51, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (52, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (53, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (54, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (55, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (56, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (57, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (58, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (59, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (60, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (61, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (62, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (63, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (64, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (65, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (66, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (67, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (68, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (69, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (70, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (71, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (72, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (73, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (74, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (75, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (76, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (77, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (78, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (79, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (80, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (81, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (82, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (83, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (84, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (85, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (86, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (87, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (88, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (89, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (90, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (91, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (92, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (93, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (94, N'3+1 Lüx Daire 120 m2 Balkonlu Ebeveyn Banyosu Mevcuttur Kombilidir', N'3', N'120', 1, 1)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (95, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
INSERT [dbo].[ApartmentDetails] ([Id], [ApartmentDetails], [NumberOfRooms], [SquareMeterOfTheHouse], [HaveABalcony], [HaveEnSuiteBathroom]) VALUES (96, N'2+1 Lüx Daire 100 m2 Balkonlu Kombilidir', N'2', N'100', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Apartments] ON 

INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (1, 1, 69, 1, 1, N'1', N'1', 1, 1, CAST(N'2022-08-08T13:48:08.520' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (2, 2, 70, 1, 1, N'1', N'2', 1, 1, CAST(N'2022-08-08T13:48:08.560' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (3, 3, 3, 2, 1, N'1', N'3', 1, 1, CAST(N'2022-08-08T13:48:08.597' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (4, 4, 4, 2, 1, N'1', N'4', 1, 1, CAST(N'2022-08-08T13:48:08.630' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (5, 5, 5, 1, 1, N'2', N'5', 1, 1, CAST(N'2022-08-08T13:48:08.667' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (6, 6, 6, 1, 1, N'2', N'6', 1, 1, CAST(N'2022-08-08T13:48:08.700' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (7, 7, 7, 2, 1, N'2', N'7', 1, 1, CAST(N'2022-08-08T13:48:08.730' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (8, 8, 8, 2, 1, N'2', N'8', 1, 1, CAST(N'2022-08-08T13:48:08.763' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (9, 9, 9, 1, 1, N'3', N'9', 1, 1, CAST(N'2022-08-08T13:48:08.800' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (10, 10, 10, 1, 1, N'3', N'10', 1, 1, CAST(N'2022-08-08T13:48:08.833' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (11, 11, 11, 2, 1, N'3', N'11', 1, 1, CAST(N'2022-08-08T13:48:08.870' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (12, 12, 12, 2, 1, N'3', N'12', 1, 1, CAST(N'2022-08-08T13:48:08.903' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (13, 13, 13, 1, 1, N'4', N'13', 1, 1, CAST(N'2022-08-08T13:48:08.937' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (14, 15, 15, 1, 1, N'4', N'14', 1, 1, CAST(N'2022-08-08T13:48:08.973' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (15, 14, 14, 2, 1, N'4', N'15', 1, 1, CAST(N'2022-08-08T13:48:09.007' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (16, 16, 16, 2, 1, N'4', N'16', 1, 1, CAST(N'2022-08-08T13:48:09.040' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (17, 17, 17, 1, 1, N'5', N'17', 1, 1, CAST(N'2022-08-08T13:48:09.077' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (18, 18, 18, 1, 1, N'5', N'18', 1, 1, CAST(N'2022-08-08T13:48:09.110' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (19, 19, 19, 2, 1, N'5', N'19', 1, 1, CAST(N'2022-08-08T13:48:09.143' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (20, 20, 20, 2, 1, N'5', N'20', 1, 1, CAST(N'2022-08-08T13:48:09.177' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (21, 21, 21, 1, 1, N'6', N'21', 1, 1, CAST(N'2022-08-08T13:48:09.210' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (22, 1, 68, 1, 1, N'6', N'22', 1, 1, CAST(N'2022-08-08T13:48:09.247' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (23, 1, 67, 2, 1, N'6', N'23', 1, 1, CAST(N'2022-08-08T13:48:09.280' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (24, 2, 66, 2, 1, N'6', N'24', 1, 1, CAST(N'2022-08-08T13:48:09.313' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (25, 22, 22, 1, 2, N'1', N'1', 1, 1, CAST(N'2022-08-08T13:48:09.347' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (26, 23, 23, 1, 2, N'1', N'2', 1, 1, CAST(N'2022-08-08T13:48:09.380' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (27, 24, 24, 2, 2, N'1', N'3', 1, 1, CAST(N'2022-08-08T13:48:09.413' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (28, 25, 25, 2, 2, N'1', N'4', 1, 1, CAST(N'2022-08-08T13:48:09.447' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (29, 26, 26, 1, 2, N'2', N'5', 1, 1, CAST(N'2022-08-08T13:48:09.480' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (30, 27, 27, 1, 2, N'2', N'6', 1, 1, CAST(N'2022-08-08T13:48:09.517' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (31, 28, 28, 2, 2, N'2', N'7', 1, 1, CAST(N'2022-08-08T13:48:09.550' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (32, 29, 29, 2, 2, N'2', N'8', 1, 1, CAST(N'2022-08-08T13:48:09.583' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (33, 30, 30, 1, 2, N'3', N'9', 1, 1, CAST(N'2022-08-08T13:48:09.617' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (34, 31, 31, 1, 2, N'3', N'10', 1, 1, CAST(N'2022-08-08T13:48:09.650' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (35, 32, 32, 2, 2, N'3', N'11', 1, 1, CAST(N'2022-08-08T13:48:09.687' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (36, 33, 33, 2, 2, N'3', N'12', 1, 1, CAST(N'2022-08-08T13:48:09.717' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (37, 34, 34, 1, 2, N'4', N'13', 1, 1, CAST(N'2022-08-08T13:48:09.753' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (38, 35, 35, 1, 2, N'4', N'14', 1, 1, CAST(N'2022-08-08T13:48:09.787' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (39, 36, 36, 2, 2, N'4', N'15', 1, 1, CAST(N'2022-08-08T13:48:09.820' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (40, 37, 37, 2, 2, N'4', N'16', 1, 1, CAST(N'2022-08-08T13:48:09.853' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (41, 38, 38, 1, 2, N'5', N'17', 1, 1, CAST(N'2022-08-08T13:48:09.887' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (42, 39, 39, 1, 2, N'5', N'18', 1, 1, CAST(N'2022-08-08T13:48:09.920' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (43, 40, 40, 2, 2, N'5', N'19', 1, 1, CAST(N'2022-08-08T13:48:09.953' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (44, 41, 41, 2, 2, N'5', N'20', 1, 1, CAST(N'2022-08-08T13:48:09.987' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (45, 42, 42, 1, 2, N'6', N'21', 1, 1, CAST(N'2022-08-08T13:48:10.020' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (46, 43, 43, 1, 2, N'6', N'22', 1, 1, CAST(N'2022-08-08T13:48:10.053' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (47, 44, 44, 2, 2, N'6', N'23', 1, 1, CAST(N'2022-08-08T13:48:10.090' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (48, 45, 45, 2, 2, N'6', N'24', 1, 1, CAST(N'2022-08-08T13:48:10.130' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (49, 46, 46, 1, 3, N'1', N'1', 1, 1, CAST(N'2022-08-08T13:48:10.167' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (50, 47, 47, 1, 3, N'1', N'2', 1, 1, CAST(N'2022-08-08T13:48:10.203' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (51, 48, 48, 2, 3, N'1', N'3', 1, 1, CAST(N'2022-08-08T13:48:10.240' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (52, 49, 49, 2, 3, N'1', N'4', 1, 1, CAST(N'2022-08-08T13:48:10.273' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (53, 50, 50, 1, 3, N'2', N'5', 1, 1, CAST(N'2022-08-08T13:48:10.310' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (54, 51, 51, 1, 3, N'2', N'6', 1, 1, CAST(N'2022-08-08T13:48:10.340' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (55, 52, 52, 2, 3, N'2', N'7', 1, 1, CAST(N'2022-08-08T13:48:10.373' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (56, 53, 53, 2, 3, N'2', N'8', 1, 1, CAST(N'2022-08-08T13:48:10.410' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (57, 54, 54, 1, 3, N'3', N'9', 1, 1, CAST(N'2022-08-08T13:48:10.440' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (58, 55, 55, 1, 3, N'3', N'10', 1, 1, CAST(N'2022-08-08T13:48:10.473' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (59, 56, 56, 2, 3, N'3', N'11', 1, 1, CAST(N'2022-08-08T13:48:10.510' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (60, 57, 57, 2, 3, N'3', N'12', 1, 1, CAST(N'2022-08-08T13:48:10.540' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (61, 58, 58, 1, 3, N'4', N'13', 1, 1, CAST(N'2022-08-08T13:48:10.577' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (62, 59, 59, 1, 3, N'4', N'14', 1, 1, CAST(N'2022-08-08T13:48:10.610' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (63, 60, 60, 2, 3, N'4', N'15', 1, 1, CAST(N'2022-08-08T13:48:10.643' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (64, 61, 61, 2, 3, N'4', N'16', 1, 1, CAST(N'2022-08-08T13:48:10.677' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (65, 62, 62, 1, 3, N'5', N'17', 1, 1, CAST(N'2022-08-08T13:48:10.710' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (66, 63, 63, 1, 3, N'5', N'18', 1, 1, CAST(N'2022-08-08T13:48:10.743' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (67, 64, 64, 2, 3, N'5', N'19', 1, 1, CAST(N'2022-08-08T13:48:10.777' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (68, 65, 65, 2, 3, N'5', N'20', 1, 1, CAST(N'2022-08-08T13:48:10.810' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (69, 1, 71, 1, 3, N'6', N'21', 1, 1, CAST(N'2022-08-08T13:48:10.843' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (70, 1, 72, 1, 3, N'6', N'22', 1, 1, CAST(N'2022-08-08T13:48:10.877' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (71, 1, 73, 2, 3, N'6', N'23', 1, 1, CAST(N'2022-08-08T13:48:10.910' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (72, 2, 74, 2, 3, N'6', N'24', 1, 1, CAST(N'2022-08-08T13:48:10.943' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (73, 2, 75, 1, 4, N'1', N'1', 1, 1, CAST(N'2022-08-08T13:48:10.977' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (74, 2, 76, 1, 4, N'1', N'2', 1, 1, CAST(N'2022-08-08T13:48:11.010' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (75, 47, 77, 2, 4, N'1', N'3', 1, 1, CAST(N'2022-08-08T13:48:11.043' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (76, 39, 78, 2, 4, N'1', N'4', 1, 1, CAST(N'2022-08-08T13:48:11.080' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (77, 29, 79, 1, 4, N'2', N'5', 1, 1, CAST(N'2022-08-08T13:48:11.113' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (78, 19, 80, 1, 4, N'2', N'6', 1, 1, CAST(N'2022-08-08T13:48:11.147' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (79, 23, 81, 2, 4, N'2', N'7', 1, 1, CAST(N'2022-08-08T13:48:11.180' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (80, 33, 82, 2, 4, N'2', N'8', 1, 1, CAST(N'2022-08-08T13:48:11.213' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (81, 65, 83, 1, 4, N'3', N'9', 1, 1, CAST(N'2022-08-08T13:48:11.247' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (82, 48, 84, 1, 4, N'3', N'10', 1, 1, CAST(N'2022-08-08T13:48:11.280' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (83, 44, 85, 2, 4, N'3', N'11', 1, 1, CAST(N'2022-08-08T13:48:11.310' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (84, 36, 86, 2, 4, N'3', N'12', 1, 1, CAST(N'2022-08-08T13:48:11.347' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (85, 43, 87, 1, 4, N'4', N'13', 1, 1, CAST(N'2022-08-08T13:48:11.380' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (86, 13, 88, 1, 4, N'4', N'14', 1, 1, CAST(N'2022-08-08T13:48:11.413' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (87, 53, 89, 2, 4, N'4', N'15', 1, 1, CAST(N'2022-08-08T13:48:11.447' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (88, 1, 90, 2, 4, N'4', N'16', 1, 1, CAST(N'2022-08-08T13:48:11.480' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (89, 2, 2, 1, 4, N'5', N'17', 1, 1, CAST(N'2022-08-08T13:48:11.513' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (90, 1, 1, 1, 4, N'5', N'18', 1, 1, CAST(N'2022-08-08T13:48:11.547' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (91, 1, 91, 2, 4, N'5', N'19', 1, 1, CAST(N'2022-08-08T13:48:11.580' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (92, 2, 92, 2, 4, N'5', N'20', 0, 1, CAST(N'2022-08-08T13:48:11.613' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (93, NULL, NULL, 1, 4, N'6', N'21', 1, 1, CAST(N'2022-08-08T13:48:11.647' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (94, NULL, NULL, 1, 4, N'6', N'22', 0, 1, CAST(N'2022-08-08T13:48:11.680' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (95, NULL, NULL, 2, 4, N'6', N'23', 0, 1, CAST(N'2022-08-08T13:48:11.713' AS DateTime))
INSERT [dbo].[Apartments] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (96, NULL, NULL, 2, 4, N'6', N'24', 0, 1, CAST(N'2022-08-08T13:48:11.747' AS DateTime))
SET IDENTITY_INSERT [dbo].[Apartments] OFF
GO
SET IDENTITY_INSERT [dbo].[Apartments23] ON 

INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (1, 1, 1, 1, 1, N'1', N'1', 1, 1, CAST(N'2022-08-08T10:00:01.863' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (2, NULL, NULL, 1, 1, N'1', N'2', 0, 1, CAST(N'2022-08-08T10:00:10.797' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (3, NULL, NULL, 2, 1, N'1', N'3', 0, 1, CAST(N'2022-08-08T10:00:28.293' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (4, NULL, NULL, 2, 1, N'1', N'4', 0, 1, CAST(N'2022-08-08T10:00:30.057' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (5, NULL, NULL, 1, 1, N'2', N'5', 0, 1, CAST(N'2022-08-08T10:00:50.850' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (6, NULL, NULL, 1, 1, N'2', N'6', 0, 1, CAST(N'2022-08-08T10:00:51.413' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (7, NULL, NULL, 2, 1, N'2', N'7', 0, 1, CAST(N'2022-08-08T10:00:52.443' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (8, NULL, NULL, 2, 1, N'2', N'8', 0, 1, CAST(N'2022-08-08T10:00:53.410' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (9, NULL, NULL, 1, 1, N'3', N'9', 0, 1, CAST(N'2022-08-08T10:01:09.687' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (10, NULL, NULL, 1, 1, N'3', N'10', 0, 1, CAST(N'2022-08-08T10:01:11.077' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (11, NULL, NULL, 2, 1, N'3', N'11', 0, 1, CAST(N'2022-08-08T10:01:11.940' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (12, NULL, NULL, 2, 1, N'3', N'12', 0, 1, CAST(N'2022-08-08T10:01:12.660' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (13, NULL, NULL, 1, 1, N'4', N'13', 0, 1, CAST(N'2022-08-08T10:01:13.937' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (14, NULL, NULL, 1, 1, N'4', N'14', 0, 1, CAST(N'2022-08-08T10:01:15.260' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (15, NULL, NULL, 2, 1, N'4', N'15', 0, 1, CAST(N'2022-08-08T10:01:16.137' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (16, NULL, NULL, 2, 1, N'4', N'16', 0, 1, CAST(N'2022-08-08T10:01:17.193' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (17, NULL, NULL, 1, 1, N'5', N'17', 0, 1, CAST(N'2022-08-08T10:01:18.713' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (18, NULL, NULL, 1, 1, N'5', N'18', 0, 1, CAST(N'2022-08-08T10:01:19.683' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (19, NULL, NULL, 2, 1, N'5', N'19', 0, 1, CAST(N'2022-08-08T10:01:20.740' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (20, NULL, NULL, 2, 1, N'5', N'20', 0, 1, CAST(N'2022-08-08T10:01:21.510' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (21, NULL, NULL, 1, 1, N'6', N'21', 0, 1, CAST(N'2022-08-08T10:01:22.257' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (22, NULL, NULL, 1, 1, N'6', N'22', 0, 1, CAST(N'2022-08-08T10:01:23.117' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (23, NULL, NULL, 2, 1, N'6', N'23', 0, 1, CAST(N'2022-08-08T10:01:24.310' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (24, NULL, NULL, 2, 1, N'6', N'24', 0, 1, CAST(N'2022-08-08T10:01:25.910' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (25, NULL, NULL, 1, 2, N'1', N'1', 0, 1, CAST(N'2022-08-08T10:06:30.870' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (26, NULL, NULL, 1, 2, N'1', N'2', 0, 1, CAST(N'2022-08-08T10:06:31.710' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (27, NULL, NULL, 2, 2, N'1', N'3', 0, 1, CAST(N'2022-08-08T10:06:32.353' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (28, NULL, NULL, 2, 2, N'1', N'4', 0, 1, CAST(N'2022-08-08T10:06:33.520' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (29, NULL, NULL, 1, 2, N'2', N'5', 0, 1, CAST(N'2022-08-08T10:06:34.350' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (30, NULL, NULL, 1, 2, N'2', N'6', 0, 1, CAST(N'2022-08-08T10:06:35.113' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (31, NULL, NULL, 2, 2, N'2', N'7', 0, 1, CAST(N'2022-08-08T10:06:35.923' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (32, NULL, NULL, 2, 2, N'2', N'8', 0, 1, CAST(N'2022-08-08T10:06:36.710' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (33, NULL, NULL, 1, 2, N'3', N'9', 0, 1, CAST(N'2022-08-08T10:06:37.450' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (34, NULL, NULL, 1, 2, N'3', N'10', 0, 1, CAST(N'2022-08-08T10:06:38.210' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (35, NULL, NULL, 2, 2, N'3', N'11', 0, 1, CAST(N'2022-08-08T10:06:39.110' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (36, NULL, NULL, 2, 2, N'3', N'12', 0, 1, CAST(N'2022-08-08T10:06:40.117' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (37, NULL, NULL, 1, 2, N'4', N'13', 0, 1, CAST(N'2022-08-08T10:06:40.990' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (38, NULL, NULL, 1, 2, N'4', N'14', 0, 1, CAST(N'2022-08-08T10:06:41.767' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (39, NULL, NULL, 2, 2, N'4', N'15', 0, 1, CAST(N'2022-08-08T10:06:43.093' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (40, NULL, NULL, 2, 2, N'4', N'16', 0, 1, CAST(N'2022-08-08T10:06:44.050' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (41, NULL, NULL, 1, 2, N'5', N'17', 0, 1, CAST(N'2022-08-08T10:06:45.023' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (42, NULL, NULL, 1, 2, N'5', N'18', 0, 1, CAST(N'2022-08-08T10:06:45.880' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (43, NULL, NULL, 2, 2, N'5', N'19', 0, 1, CAST(N'2022-08-08T10:06:46.973' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (44, NULL, NULL, 2, 2, N'5', N'20', 0, 1, CAST(N'2022-08-08T10:06:48.350' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (45, NULL, NULL, 1, 2, N'6', N'21', 0, 1, CAST(N'2022-08-08T10:06:50.077' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (46, NULL, NULL, 1, 2, N'6', N'22', 0, 1, CAST(N'2022-08-08T10:06:51.003' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (47, NULL, NULL, 2, 2, N'6', N'23', 0, 1, CAST(N'2022-08-08T10:06:52.330' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (48, NULL, NULL, 2, 2, N'6', N'24', 0, 1, CAST(N'2022-08-08T10:06:54.040' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (49, NULL, NULL, 1, 3, N'1', N'1', 0, 1, CAST(N'2022-08-08T10:07:16.927' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (50, NULL, NULL, 1, 3, N'1', N'2', 0, 1, CAST(N'2022-08-08T10:07:20.797' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (51, NULL, NULL, 2, 3, N'1', N'3', 0, 1, CAST(N'2022-08-08T10:07:21.680' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (52, NULL, NULL, 2, 3, N'1', N'4', 0, 1, CAST(N'2022-08-08T10:07:22.517' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (53, NULL, NULL, 1, 3, N'2', N'5', 0, 1, CAST(N'2022-08-08T10:07:23.437' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (54, NULL, NULL, 1, 3, N'2', N'6', 0, 1, CAST(N'2022-08-08T10:07:24.463' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (55, NULL, NULL, 2, 3, N'2', N'7', 0, 1, CAST(N'2022-08-08T10:07:27.020' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (56, NULL, NULL, 2, 3, N'2', N'8', 0, 1, CAST(N'2022-08-08T10:07:27.867' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (57, NULL, NULL, 1, 3, N'3', N'9', 0, 1, CAST(N'2022-08-08T10:07:28.720' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (58, NULL, NULL, 1, 3, N'3', N'10', 0, 1, CAST(N'2022-08-08T10:07:29.650' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (59, NULL, NULL, 2, 3, N'3', N'11', 0, 1, CAST(N'2022-08-08T10:07:30.630' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (60, NULL, NULL, 2, 3, N'3', N'12', 0, 1, CAST(N'2022-08-08T10:07:31.923' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (61, NULL, NULL, 1, 3, N'4', N'13', 0, 1, CAST(N'2022-08-08T10:07:33.100' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (62, NULL, NULL, 1, 3, N'4', N'14', 0, 1, CAST(N'2022-08-08T10:07:34.253' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (63, NULL, NULL, 2, 3, N'4', N'15', 0, 1, CAST(N'2022-08-08T10:07:35.283' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (64, NULL, NULL, 2, 3, N'4', N'16', 0, 1, CAST(N'2022-08-08T10:07:36.323' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (65, NULL, NULL, 1, 3, N'5', N'17', 0, 1, CAST(N'2022-08-08T10:07:37.327' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (66, NULL, NULL, 1, 3, N'5', N'18', 0, 1, CAST(N'2022-08-08T10:07:38.373' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (67, NULL, NULL, 2, 3, N'5', N'19', 0, 1, CAST(N'2022-08-08T10:07:39.290' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (68, NULL, NULL, 2, 3, N'5', N'20', 0, 1, CAST(N'2022-08-08T10:07:40.857' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (69, NULL, NULL, 1, 3, N'6', N'21', 0, 1, CAST(N'2022-08-08T10:07:42.150' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (70, NULL, NULL, 1, 3, N'6', N'22', 0, 1, CAST(N'2022-08-08T10:07:43.300' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (71, NULL, NULL, 2, 3, N'6', N'23', 0, 1, CAST(N'2022-08-08T10:07:44.600' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (72, NULL, NULL, 2, 3, N'6', N'24', 0, 1, CAST(N'2022-08-08T10:07:45.953' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (73, NULL, NULL, 1, 4, N'1', N'1', 0, 1, CAST(N'2022-08-08T10:07:51.510' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (74, NULL, NULL, 1, 4, N'1', N'2', 0, 1, CAST(N'2022-08-08T10:07:52.300' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (75, NULL, NULL, 2, 4, N'1', N'3', 0, 1, CAST(N'2022-08-08T10:07:53.090' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (76, NULL, NULL, 2, 4, N'1', N'4', 0, 1, CAST(N'2022-08-08T10:07:54.087' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (77, NULL, NULL, 1, 4, N'2', N'5', 0, 1, CAST(N'2022-08-08T10:07:54.893' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (78, NULL, NULL, 1, 4, N'2', N'6', 0, 1, CAST(N'2022-08-08T10:07:55.790' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (79, NULL, NULL, 2, 4, N'2', N'7', 0, 1, CAST(N'2022-08-08T10:07:57.433' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (80, NULL, NULL, 2, 4, N'2', N'8', 0, 1, CAST(N'2022-08-08T10:07:58.180' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (81, NULL, NULL, 1, 4, N'3', N'9', 0, 1, CAST(N'2022-08-08T10:07:58.953' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (82, NULL, NULL, 1, 4, N'3', N'10', 0, 1, CAST(N'2022-08-08T10:07:59.940' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (83, NULL, NULL, 2, 4, N'3', N'11', 0, 1, CAST(N'2022-08-08T10:08:01.003' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (84, NULL, NULL, 2, 4, N'3', N'12', 0, 1, CAST(N'2022-08-08T10:08:02.060' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (85, NULL, NULL, 1, 4, N'4', N'13', 0, 1, CAST(N'2022-08-08T10:08:02.973' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (86, NULL, NULL, 1, 4, N'4', N'14', 0, 1, CAST(N'2022-08-08T10:08:03.917' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (87, NULL, NULL, 2, 4, N'4', N'15', 0, 1, CAST(N'2022-08-08T10:08:04.873' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (88, NULL, NULL, 2, 4, N'4', N'16', 0, 1, CAST(N'2022-08-08T10:08:05.807' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (89, NULL, NULL, 1, 4, N'5', N'17', 0, 1, CAST(N'2022-08-08T10:08:06.830' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (90, NULL, NULL, 1, 4, N'5', N'18', 0, 1, CAST(N'2022-08-08T10:08:07.853' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (91, NULL, NULL, 2, 4, N'5', N'19', 0, 1, CAST(N'2022-08-08T10:08:08.887' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (92, NULL, NULL, 2, 4, N'5', N'20', 0, 1, CAST(N'2022-08-08T10:08:10.343' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (93, NULL, NULL, 1, 4, N'6', N'21', 0, 1, CAST(N'2022-08-08T10:08:11.437' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (94, NULL, NULL, 1, 4, N'6', N'22', 0, 1, CAST(N'2022-08-08T10:08:12.660' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (95, NULL, NULL, 2, 4, N'6', N'23', 0, 1, CAST(N'2022-08-08T10:08:13.893' AS DateTime))
INSERT [dbo].[Apartments23] ([Id], [LandlordId], [HouseUserId], [HouseHoldTypeId], [BlockId], [Floor], [ApartmentNumber], [Status], [IsActive], [CreatedAt]) VALUES (96, NULL, NULL, 2, 4, N'6', N'24', 0, 1, CAST(N'2022-08-08T10:08:14.990' AS DateTime))
SET IDENTITY_INSERT [dbo].[Apartments23] OFF
GO
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (1, 1, 367.4600, CAST(183.730 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-13T03:40:56.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.840' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (2, 2, 535.9200, CAST(267.960 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-16T00:22:00.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.847' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (3, 3, 387.4000, CAST(193.700 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-20T00:07:30.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (4, 4, 279.4200, CAST(139.710 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-13T15:36:01.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (5, 5, 219.3200, CAST(109.660 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-15T11:10:27.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (6, 6, 475.8200, CAST(237.910 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-18T04:04:13.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (7, 7, 322.7200, CAST(161.360 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T01:02:07.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (8, 8, 190.2600, CAST(95.130 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-18T10:08:46.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (9, 9, 239.6200, CAST(119.810 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-12T04:10:11.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (10, 10, 415.8000, CAST(207.900 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-17T10:40:05.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (11, 11, 469.0800, CAST(234.540 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-18T13:57:57.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (12, 12, 310.7400, CAST(155.370 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-18T01:02:48.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (13, 13, 206.2400, CAST(103.120 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-19T21:01:29.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (14, 14, 211.0400, CAST(105.520 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-18T04:17:29.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (15, 15, 544.1600, CAST(272.080 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T12:29:11.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (16, 16, 404.9800, CAST(202.490 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-13T06:17:42.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (17, 17, 238.0800, CAST(119.040 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-12T11:39:50.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (18, 18, 234.2400, CAST(117.120 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-14T22:18:22.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (19, 19, 39.2600, CAST(19.630 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-12T10:15:34.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (20, 20, 429.9000, CAST(214.950 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-20T12:44:31.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.850' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (21, 21, 166.4800, CAST(83.240 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-17T14:25:36.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.853' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (22, 22, 464.9400, CAST(232.470 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-16T16:14:11.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.853' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (23, 23, 35.2200, CAST(17.610 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-19T15:12:36.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.853' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (24, 24, 49.2800, CAST(24.640 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-14T03:25:31.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.853' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (25, 25, 220.0000, CAST(110.000 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-12T16:45:50.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.853' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (26, 26, 576.5400, CAST(288.270 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-18T13:21:40.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.853' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (27, 27, 552.7400, CAST(276.370 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-13T10:48:26.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.853' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (28, 28, 456.3200, CAST(228.160 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-13T18:20:26.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.853' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (29, 29, 382.4600, CAST(191.230 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-14T16:10:54.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.857' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (30, 30, 528.0000, CAST(264.000 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-14T01:35:40.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.857' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (31, 31, 503.0200, CAST(251.510 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-19T04:46:21.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.857' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (32, 32, 260.5400, CAST(130.270 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-15T00:23:13.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.857' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (33, 33, 259.3000, CAST(129.650 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-14T20:37:00.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.857' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (34, 34, 434.8000, CAST(217.400 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-15T19:04:59.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.857' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (35, 35, 195.6600, CAST(97.830 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-19T22:04:59.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.857' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (36, 36, 130.0400, CAST(65.020 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-15T15:26:49.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.857' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (37, 37, 324.3800, CAST(162.190 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-19T19:30:39.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.857' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (38, 38, 281.3800, CAST(140.690 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-19T16:03:57.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.857' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (39, 39, 344.7800, CAST(172.390 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-18T12:45:19.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.857' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (40, 40, 477.1200, CAST(238.560 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-12T19:44:33.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (41, 41, 117.5800, CAST(58.790 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-17T11:31:09.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (42, 42, 386.6000, CAST(193.300 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-19T13:47:28.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (43, 43, 301.4200, CAST(150.710 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-15T00:52:05.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (44, 44, 303.0800, CAST(151.540 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-20T10:29:37.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (45, 45, 248.3000, CAST(124.150 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-14T11:39:00.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (46, 46, 131.5800, CAST(65.790 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-15T15:16:38.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (47, 47, 438.2600, CAST(219.130 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T16:39:43.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (48, 48, 168.8200, CAST(84.410 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-17T11:27:47.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (49, 49, 521.1600, CAST(260.580 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-20T04:48:19.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (50, 50, 405.3400, CAST(202.670 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-17T23:59:50.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (51, 51, 321.0000, CAST(160.500 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T08:45:44.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (52, 52, 135.5800, CAST(67.790 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T03:52:20.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (53, 53, 238.8000, CAST(119.400 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-20T20:27:18.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (54, 54, 32.4200, CAST(16.210 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-20T19:19:52.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (55, 55, 533.4800, CAST(266.740 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-15T19:11:36.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (56, 56, 76.0800, CAST(38.040 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-18T22:06:25.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (57, 57, 427.9400, CAST(213.970 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T10:45:33.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.860' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (58, 58, 248.2000, CAST(124.100 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-18T14:27:08.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (59, 59, 491.1400, CAST(245.570 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-19T04:55:02.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (60, 60, 362.8200, CAST(181.410 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T12:41:08.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (61, 61, 4.6800, CAST(2.340 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-12T22:26:59.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (62, 62, 257.4000, CAST(128.700 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T21:36:46.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (63, 63, 198.1600, CAST(99.080 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-20T03:43:35.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (64, 64, 87.1600, CAST(43.580 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-20T00:54:30.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (65, 65, 68.7400, CAST(34.370 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-16T09:34:27.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (66, 66, 559.7200, CAST(279.860 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-18T14:28:08.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (67, 67, 173.5800, CAST(86.790 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-18T00:16:10.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (68, 68, 90.0000, CAST(45.000 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-12T04:23:53.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (69, 69, 394.6200, CAST(197.310 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-13T00:45:32.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (70, 70, 142.5400, CAST(71.270 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-16T20:05:00.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.863' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (71, 71, 386.0200, CAST(193.010 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-12T14:24:49.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (72, 72, 5.7200, CAST(2.860 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-15T13:36:23.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (73, 73, 467.2000, CAST(233.600 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-17T19:41:37.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (74, 74, 591.5200, CAST(295.760 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T13:45:17.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (75, 75, 47.9200, CAST(23.960 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T11:52:33.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (76, 76, 322.1800, CAST(161.090 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-17T05:36:57.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (77, 77, 211.6000, CAST(105.800 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-16T05:11:44.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (78, 78, 481.7600, CAST(240.880 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T09:21:36.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (79, 79, 273.3600, CAST(136.680 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-13T17:00:18.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (80, 80, 318.0600, CAST(159.030 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-12T17:23:20.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (81, 81, 172.2200, CAST(86.110 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-16T02:15:38.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (82, 82, 14.9800, CAST(7.490 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T04:18:33.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (83, 83, 345.5400, CAST(172.770 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-17T20:23:41.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (84, 84, 165.7400, CAST(82.870 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-13T10:58:54.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (85, 85, 576.4200, CAST(288.210 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-18T14:55:00.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (86, 86, 255.6200, CAST(127.810 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-16T22:39:16.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (87, 87, 510.9400, CAST(255.470 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T23:33:07.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (88, 88, 315.4800, CAST(157.740 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-11T12:16:12.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (89, 89, 121.3000, CAST(60.650 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-20T20:29:07.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (90, 90, 12.2200, CAST(6.110 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-12T06:41:03.000' AS DateTime), 1, CAST(N'2022-08-12T00:00:00.000' AS DateTime), 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (91, 91, 228.5600, CAST(114.280 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-13T06:52:59.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (92, 92, 245.5400, CAST(122.770 AS Decimal(18, 3)), 2.0000, CAST(N'2022-08-16T15:33:39.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-11T20:30:26.867' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (185, 1, 288.7950, CAST(192.530 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T17:50:45.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.920' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (186, 2, 207.9750, CAST(138.650 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-20T22:33:39.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.930' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (187, 3, 117.1650, CAST(78.110 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T03:26:09.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.930' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (188, 4, 423.0000, CAST(282.000 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-18T12:48:12.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.930' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (189, 5, 265.9200, CAST(177.280 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-14T08:32:34.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.930' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (190, 6, 199.1100, CAST(132.740 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T03:32:35.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.930' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (191, 7, 292.1400, CAST(194.760 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T01:53:37.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.930' AS DateTime))
GO
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (192, 8, 421.7400, CAST(281.160 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-14T16:34:42.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.930' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (193, 9, 242.8800, CAST(161.920 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T21:01:42.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.930' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (194, 10, 449.8350, CAST(299.890 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-17T16:11:21.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.930' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (195, 11, 179.4750, CAST(119.650 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-14T05:29:22.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.930' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (196, 12, 125.7300, CAST(83.820 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-13T12:22:39.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.930' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (197, 13, 101.7300, CAST(67.820 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-17T23:12:33.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.930' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (198, 14, 174.6000, CAST(116.400 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-13T09:15:23.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (199, 15, 162.3300, CAST(108.220 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-19T06:58:12.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (200, 16, 316.5600, CAST(211.040 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-13T05:12:57.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (201, 17, 299.8500, CAST(199.900 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-18T04:49:36.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (202, 18, 387.6000, CAST(258.400 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-14T05:25:16.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (203, 19, 364.4850, CAST(242.990 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-21T21:12:22.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (204, 20, 331.5150, CAST(221.010 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-13T19:57:49.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (205, 21, 79.0050, CAST(52.670 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-17T07:45:20.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (206, 22, 273.5400, CAST(182.360 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-17T19:44:55.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (207, 23, 129.9450, CAST(86.630 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T07:57:34.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (208, 24, 214.2300, CAST(142.820 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-14T17:07:45.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (209, 25, 325.6650, CAST(217.110 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-13T13:58:53.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (210, 26, 376.2900, CAST(250.860 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-20T19:13:36.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (211, 27, 438.5100, CAST(292.340 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-19T08:46:41.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.933' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (212, 28, 322.0500, CAST(214.700 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-14T22:44:35.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.937' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (213, 29, 119.5050, CAST(79.670 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-21T22:47:12.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.937' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (214, 30, 112.4700, CAST(74.980 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-13T01:17:28.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.937' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (215, 31, 217.3050, CAST(144.870 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-21T22:48:23.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.937' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (216, 32, 36.0750, CAST(24.050 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T05:49:57.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.937' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (217, 33, 188.1300, CAST(125.420 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-17T22:48:18.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.937' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (218, 34, 427.6950, CAST(285.130 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-20T09:15:59.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.937' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (219, 35, 381.3750, CAST(254.250 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-20T13:19:56.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.937' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (220, 36, 364.7700, CAST(243.180 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-13T23:14:22.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.937' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (221, 37, 282.1500, CAST(188.100 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-21T02:24:06.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.937' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (222, 38, 98.7600, CAST(65.840 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-13T21:05:12.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.937' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (223, 39, 71.3850, CAST(47.590 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-18T22:09:54.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (224, 40, 397.3350, CAST(264.890 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T21:30:14.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (225, 41, 332.1150, CAST(221.410 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-13T18:23:59.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (226, 42, 382.7850, CAST(255.190 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-15T10:23:41.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (227, 43, 139.5900, CAST(93.060 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-19T00:49:10.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (228, 44, 232.2300, CAST(154.820 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-18T01:13:58.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (229, 45, 84.4050, CAST(56.270 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T12:22:20.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (230, 46, 87.8100, CAST(58.540 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-18T04:12:35.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (231, 47, 380.3850, CAST(253.590 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-18T11:09:23.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (232, 48, 162.6300, CAST(108.420 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-17T01:17:44.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (233, 49, 328.0200, CAST(218.680 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T13:35:43.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (234, 50, 30.8100, CAST(20.540 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T23:42:45.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (235, 51, 257.2200, CAST(171.480 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T15:50:54.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (236, 52, 371.6700, CAST(247.780 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-18T05:02:01.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (237, 53, 145.2900, CAST(96.860 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-14T15:44:47.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (238, 54, 84.2550, CAST(56.170 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T17:00:39.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (239, 55, 308.7150, CAST(205.810 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T03:56:15.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (240, 56, 70.8300, CAST(47.220 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-19T23:07:02.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (241, 57, 68.3550, CAST(45.570 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-17T08:12:37.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.940' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (242, 58, 435.0150, CAST(290.010 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-19T07:24:00.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.943' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (243, 59, 105.0900, CAST(70.060 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T22:03:07.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.943' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (244, 60, 36.9750, CAST(24.650 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-18T09:24:46.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.943' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (245, 61, 424.7850, CAST(283.190 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-15T12:37:42.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.943' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (246, 62, 420.0600, CAST(280.040 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T14:44:33.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.943' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (247, 63, 386.0700, CAST(257.380 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-13T23:14:18.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.943' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (248, 64, 46.6200, CAST(31.080 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-17T06:27:18.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.943' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (249, 65, 298.1850, CAST(198.790 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-14T23:07:46.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.943' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (250, 66, 220.9950, CAST(147.330 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-15T04:37:25.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.943' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (251, 67, 216.0150, CAST(144.010 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T10:42:58.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (252, 68, 324.2700, CAST(216.180 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T17:37:48.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (253, 69, 378.6150, CAST(252.410 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T08:35:34.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (254, 70, 101.4000, CAST(67.600 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-21T05:05:58.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (255, 71, 267.4650, CAST(178.310 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-20T16:24:52.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (256, 72, 125.1150, CAST(83.410 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T20:01:26.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (257, 73, 137.9250, CAST(91.950 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-19T22:39:09.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (258, 74, 297.0600, CAST(198.040 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-15T07:48:03.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (259, 75, 391.4400, CAST(260.960 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T04:24:30.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (260, 76, 120.4350, CAST(80.290 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-18T05:18:07.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (261, 77, 395.3700, CAST(263.580 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-17T01:09:51.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (262, 78, 383.4150, CAST(255.610 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T14:40:06.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (263, 79, 115.7250, CAST(77.150 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T22:40:17.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (264, 80, 216.2400, CAST(144.160 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-17T19:07:22.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.947' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (265, 81, 159.8850, CAST(106.590 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T08:27:34.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.950' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (266, 82, 160.9800, CAST(107.320 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-14T07:16:52.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.950' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (267, 83, 96.1950, CAST(64.130 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-15T02:40:30.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.950' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (268, 84, 225.2100, CAST(150.140 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-17T08:03:44.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.950' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (269, 85, 214.9950, CAST(143.330 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-19T15:20:17.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.950' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (270, 86, 402.5700, CAST(268.380 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-21T02:03:44.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.950' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (271, 87, 111.9450, CAST(74.630 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-16T04:05:12.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.950' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (272, 88, 373.3950, CAST(248.930 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-19T10:37:28.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.950' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (273, 89, 99.6150, CAST(66.410 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T17:30:02.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.950' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (274, 90, 276.7800, CAST(184.520 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-12T00:24:09.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.950' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (275, 91, 448.8750, CAST(299.250 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-20T14:20:46.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.950' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (276, 92, 369.3750, CAST(246.250 AS Decimal(18, 3)), 1.5000, CAST(N'2022-08-19T22:52:32.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:43:49.950' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (277, 1, 37.0000, CAST(37.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-14T12:37:18.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.163' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (278, 2, 16.0000, CAST(16.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T19:06:14.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.170' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (279, 3, 12.0000, CAST(12.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T07:03:13.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.173' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (280, 4, 35.0000, CAST(35.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T14:30:46.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.173' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (281, 5, 17.0000, CAST(17.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T05:17:16.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.173' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (282, 6, 30.0000, CAST(30.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-20T06:47:56.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.173' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (283, 7, 37.0000, CAST(37.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T14:56:39.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.173' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (284, 8, 32.0000, CAST(32.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T22:44:28.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.173' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (285, 9, 38.0000, CAST(38.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-21T23:53:34.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.173' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (286, 10, 41.0000, CAST(41.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-12T08:07:54.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.173' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (287, 11, 44.0000, CAST(44.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-19T14:28:29.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.173' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (288, 12, 26.0000, CAST(26.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T01:28:30.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.173' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (289, 13, 25.0000, CAST(25.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T19:58:48.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.173' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (290, 14, 1.0000, CAST(1.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-18T21:05:32.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.173' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (291, 15, 22.0000, CAST(22.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-17T15:23:57.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.177' AS DateTime))
GO
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (292, 16, 7.0000, CAST(7.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-18T00:55:14.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.177' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (293, 17, 44.0000, CAST(44.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-14T12:55:39.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.177' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (294, 18, 2.0000, CAST(2.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T05:26:37.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.177' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (295, 19, 43.0000, CAST(43.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T02:29:53.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.177' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (296, 20, 15.0000, CAST(15.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-21T00:26:29.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.177' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (297, 21, 22.0000, CAST(22.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-19T15:08:16.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.177' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (298, 22, 30.0000, CAST(30.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-19T02:09:20.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.177' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (299, 23, 24.0000, CAST(24.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T16:32:48.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.177' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (300, 24, 48.0000, CAST(48.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T12:50:30.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.177' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (301, 25, 17.0000, CAST(17.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-20T22:57:08.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.177' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (302, 26, 24.0000, CAST(24.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T04:38:45.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.180' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (303, 27, 31.0000, CAST(31.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-17T03:22:22.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.180' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (304, 28, 48.0000, CAST(48.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T22:01:57.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.180' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (305, 29, 18.0000, CAST(18.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-17T18:24:58.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.180' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (306, 30, 17.0000, CAST(17.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T07:23:12.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.180' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (307, 31, 39.0000, CAST(39.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-20T15:39:08.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.180' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (308, 32, 5.0000, CAST(5.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T07:34:51.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.180' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (309, 33, 50.0000, CAST(50.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-19T00:28:29.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.180' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (310, 34, 12.0000, CAST(12.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-12T06:45:03.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.180' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (311, 35, 33.0000, CAST(33.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T00:19:22.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.180' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (312, 36, 32.0000, CAST(32.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T15:51:08.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.180' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (313, 37, 23.0000, CAST(23.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T03:35:24.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.180' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (314, 38, 11.0000, CAST(11.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-14T22:38:42.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.183' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (315, 39, 45.0000, CAST(45.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-14T18:43:43.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.183' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (316, 40, 39.0000, CAST(39.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-20T17:51:30.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.183' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (317, 41, 4.0000, CAST(4.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-15T20:03:28.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.183' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (318, 42, 34.0000, CAST(34.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-20T03:39:54.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.183' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (319, 43, 2.0000, CAST(2.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-21T19:16:59.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.183' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (320, 44, 46.0000, CAST(46.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-17T06:37:42.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.183' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (321, 45, 43.0000, CAST(43.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-17T09:25:10.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.183' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (322, 46, 48.0000, CAST(48.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T12:20:27.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.183' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (323, 47, 45.0000, CAST(45.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-14T02:13:21.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.183' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (324, 48, 43.0000, CAST(43.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-21T04:21:58.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.183' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (325, 49, 5.0000, CAST(5.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-12T08:20:45.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.183' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (326, 50, 44.0000, CAST(44.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-17T06:27:48.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (327, 51, 38.0000, CAST(38.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-12T16:26:31.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (328, 52, 29.0000, CAST(29.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T00:48:07.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (329, 53, 1.0000, CAST(1.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-21T08:41:31.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (330, 54, 47.0000, CAST(47.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-21T01:28:39.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (331, 55, 29.0000, CAST(29.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-17T23:16:46.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (332, 56, 17.0000, CAST(17.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-12T07:08:49.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (333, 57, 47.0000, CAST(47.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-19T06:13:03.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (334, 58, 45.0000, CAST(45.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T06:31:23.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (335, 59, 42.0000, CAST(42.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-20T22:46:53.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (336, 60, 14.0000, CAST(14.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-14T02:08:46.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (337, 61, 41.0000, CAST(41.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-20T09:11:43.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (338, 62, 34.0000, CAST(34.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-12T21:03:02.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (339, 63, 39.0000, CAST(39.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-12T02:28:09.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (340, 64, 22.0000, CAST(22.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T15:56:28.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (341, 65, 20.0000, CAST(20.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-21T09:14:31.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.187' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (342, 66, 26.0000, CAST(26.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-12T02:21:16.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (343, 67, 43.0000, CAST(43.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T01:30:13.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (344, 68, 4.0000, CAST(4.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-19T23:50:47.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (345, 69, 12.0000, CAST(12.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-12T05:23:49.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (346, 70, 26.0000, CAST(26.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-15T16:46:53.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (347, 71, 34.0000, CAST(34.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-14T02:19:02.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (348, 72, 4.0000, CAST(4.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-19T02:05:44.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (349, 73, 31.0000, CAST(31.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-21T19:22:21.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (350, 74, 8.0000, CAST(8.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-17T08:54:06.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (351, 75, 28.0000, CAST(28.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T18:39:59.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (352, 76, 35.0000, CAST(35.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-17T10:07:11.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (353, 77, 3.0000, CAST(3.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-21T20:04:02.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (354, 78, 48.0000, CAST(48.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-15T14:52:23.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (355, 79, 30.0000, CAST(30.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-21T08:10:48.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (356, 80, 17.0000, CAST(17.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-14T21:09:11.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (357, 81, 3.0000, CAST(3.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-20T08:20:23.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (358, 82, 27.0000, CAST(27.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T11:36:38.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (359, 83, 25.0000, CAST(25.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-19T20:14:58.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (360, 84, 36.0000, CAST(36.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-15T11:38:48.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (361, 85, 31.0000, CAST(31.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-14T07:39:21.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (362, 86, 26.0000, CAST(26.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-13T17:31:43.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (363, 87, 39.0000, CAST(39.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-16T13:38:03.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (364, 88, 45.0000, CAST(45.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-19T21:27:35.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (365, 89, 15.0000, CAST(15.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-17T12:57:16.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (366, 90, 10.0000, CAST(10.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-21T02:14:48.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (367, 91, 35.0000, CAST(35.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-15T04:28:10.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
INSERT [dbo].[Bills] ([Id], [ApartmentId], [TotalBill], [AmountOfUsage], [UnitPrice], [DueDate], [IsItPaid], [PaymentDate], [IsActive], [CreatedAt]) VALUES (368, 92, 29.0000, CAST(29.000 AS Decimal(18, 3)), 1.0000, CAST(N'2022-08-15T01:32:14.000' AS DateTime), 0, NULL, 1, CAST(N'2022-08-12T17:49:14.190' AS DateTime))
SET IDENTITY_INSERT [dbo].[Bills] OFF
GO
SET IDENTITY_INSERT [dbo].[Blocks] ON 

INSERT [dbo].[Blocks] ([Id], [Name], [NumberOfFloors], [HaveAElevator], [IsActive], [CreatedAt]) VALUES (1, N'A Blok', N'6', 1, 1, CAST(N'2022-08-08T13:46:28.020' AS DateTime))
INSERT [dbo].[Blocks] ([Id], [Name], [NumberOfFloors], [HaveAElevator], [IsActive], [CreatedAt]) VALUES (2, N'B Blok', N'6', 1, 1, CAST(N'2022-08-08T13:46:28.067' AS DateTime))
INSERT [dbo].[Blocks] ([Id], [Name], [NumberOfFloors], [HaveAElevator], [IsActive], [CreatedAt]) VALUES (3, N'C Blok', N'6', 1, 1, CAST(N'2022-08-08T13:46:28.103' AS DateTime))
INSERT [dbo].[Blocks] ([Id], [Name], [NumberOfFloors], [HaveAElevator], [IsActive], [CreatedAt]) VALUES (4, N'D Blok', N'6', 1, 1, CAST(N'2022-08-08T13:46:28.137' AS DateTime))
SET IDENTITY_INSERT [dbo].[Blocks] OFF
GO
INSERT [dbo].[ElectricBills] ([Id]) VALUES (1)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (2)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (3)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (4)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (5)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (6)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (7)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (8)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (9)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (10)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (11)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (12)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (13)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (14)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (15)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (16)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (17)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (18)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (19)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (20)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (21)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (22)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (23)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (24)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (25)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (26)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (27)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (28)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (29)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (30)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (31)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (32)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (33)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (34)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (35)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (36)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (37)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (38)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (39)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (40)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (41)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (42)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (43)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (44)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (45)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (46)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (47)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (48)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (49)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (50)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (51)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (52)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (53)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (54)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (55)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (56)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (57)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (58)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (59)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (60)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (61)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (62)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (63)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (64)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (65)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (66)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (67)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (68)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (69)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (70)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (71)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (72)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (73)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (74)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (75)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (76)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (77)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (78)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (79)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (80)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (81)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (82)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (83)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (84)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (85)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (86)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (87)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (88)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (89)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (90)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (91)
INSERT [dbo].[ElectricBills] ([Id]) VALUES (92)
GO
INSERT [dbo].[GasBills] ([Id]) VALUES (277)
INSERT [dbo].[GasBills] ([Id]) VALUES (278)
INSERT [dbo].[GasBills] ([Id]) VALUES (279)
INSERT [dbo].[GasBills] ([Id]) VALUES (280)
INSERT [dbo].[GasBills] ([Id]) VALUES (281)
INSERT [dbo].[GasBills] ([Id]) VALUES (282)
INSERT [dbo].[GasBills] ([Id]) VALUES (283)
INSERT [dbo].[GasBills] ([Id]) VALUES (284)
INSERT [dbo].[GasBills] ([Id]) VALUES (285)
INSERT [dbo].[GasBills] ([Id]) VALUES (286)
INSERT [dbo].[GasBills] ([Id]) VALUES (287)
INSERT [dbo].[GasBills] ([Id]) VALUES (288)
INSERT [dbo].[GasBills] ([Id]) VALUES (289)
INSERT [dbo].[GasBills] ([Id]) VALUES (290)
INSERT [dbo].[GasBills] ([Id]) VALUES (291)
INSERT [dbo].[GasBills] ([Id]) VALUES (292)
INSERT [dbo].[GasBills] ([Id]) VALUES (293)
INSERT [dbo].[GasBills] ([Id]) VALUES (294)
INSERT [dbo].[GasBills] ([Id]) VALUES (295)
INSERT [dbo].[GasBills] ([Id]) VALUES (296)
INSERT [dbo].[GasBills] ([Id]) VALUES (297)
INSERT [dbo].[GasBills] ([Id]) VALUES (298)
INSERT [dbo].[GasBills] ([Id]) VALUES (299)
INSERT [dbo].[GasBills] ([Id]) VALUES (300)
INSERT [dbo].[GasBills] ([Id]) VALUES (301)
INSERT [dbo].[GasBills] ([Id]) VALUES (302)
INSERT [dbo].[GasBills] ([Id]) VALUES (303)
INSERT [dbo].[GasBills] ([Id]) VALUES (304)
INSERT [dbo].[GasBills] ([Id]) VALUES (305)
INSERT [dbo].[GasBills] ([Id]) VALUES (306)
INSERT [dbo].[GasBills] ([Id]) VALUES (307)
INSERT [dbo].[GasBills] ([Id]) VALUES (308)
INSERT [dbo].[GasBills] ([Id]) VALUES (309)
INSERT [dbo].[GasBills] ([Id]) VALUES (310)
INSERT [dbo].[GasBills] ([Id]) VALUES (311)
INSERT [dbo].[GasBills] ([Id]) VALUES (312)
INSERT [dbo].[GasBills] ([Id]) VALUES (313)
INSERT [dbo].[GasBills] ([Id]) VALUES (314)
INSERT [dbo].[GasBills] ([Id]) VALUES (315)
INSERT [dbo].[GasBills] ([Id]) VALUES (316)
INSERT [dbo].[GasBills] ([Id]) VALUES (317)
INSERT [dbo].[GasBills] ([Id]) VALUES (318)
INSERT [dbo].[GasBills] ([Id]) VALUES (319)
INSERT [dbo].[GasBills] ([Id]) VALUES (320)
INSERT [dbo].[GasBills] ([Id]) VALUES (321)
INSERT [dbo].[GasBills] ([Id]) VALUES (322)
INSERT [dbo].[GasBills] ([Id]) VALUES (323)
INSERT [dbo].[GasBills] ([Id]) VALUES (324)
INSERT [dbo].[GasBills] ([Id]) VALUES (325)
INSERT [dbo].[GasBills] ([Id]) VALUES (326)
INSERT [dbo].[GasBills] ([Id]) VALUES (327)
INSERT [dbo].[GasBills] ([Id]) VALUES (328)
INSERT [dbo].[GasBills] ([Id]) VALUES (329)
INSERT [dbo].[GasBills] ([Id]) VALUES (330)
INSERT [dbo].[GasBills] ([Id]) VALUES (331)
INSERT [dbo].[GasBills] ([Id]) VALUES (332)
INSERT [dbo].[GasBills] ([Id]) VALUES (333)
INSERT [dbo].[GasBills] ([Id]) VALUES (334)
INSERT [dbo].[GasBills] ([Id]) VALUES (335)
INSERT [dbo].[GasBills] ([Id]) VALUES (336)
INSERT [dbo].[GasBills] ([Id]) VALUES (337)
INSERT [dbo].[GasBills] ([Id]) VALUES (338)
INSERT [dbo].[GasBills] ([Id]) VALUES (339)
INSERT [dbo].[GasBills] ([Id]) VALUES (340)
INSERT [dbo].[GasBills] ([Id]) VALUES (341)
INSERT [dbo].[GasBills] ([Id]) VALUES (342)
INSERT [dbo].[GasBills] ([Id]) VALUES (343)
INSERT [dbo].[GasBills] ([Id]) VALUES (344)
INSERT [dbo].[GasBills] ([Id]) VALUES (345)
INSERT [dbo].[GasBills] ([Id]) VALUES (346)
INSERT [dbo].[GasBills] ([Id]) VALUES (347)
INSERT [dbo].[GasBills] ([Id]) VALUES (348)
INSERT [dbo].[GasBills] ([Id]) VALUES (349)
INSERT [dbo].[GasBills] ([Id]) VALUES (350)
INSERT [dbo].[GasBills] ([Id]) VALUES (351)
INSERT [dbo].[GasBills] ([Id]) VALUES (352)
INSERT [dbo].[GasBills] ([Id]) VALUES (353)
INSERT [dbo].[GasBills] ([Id]) VALUES (354)
INSERT [dbo].[GasBills] ([Id]) VALUES (355)
INSERT [dbo].[GasBills] ([Id]) VALUES (356)
INSERT [dbo].[GasBills] ([Id]) VALUES (357)
INSERT [dbo].[GasBills] ([Id]) VALUES (358)
INSERT [dbo].[GasBills] ([Id]) VALUES (359)
INSERT [dbo].[GasBills] ([Id]) VALUES (360)
INSERT [dbo].[GasBills] ([Id]) VALUES (361)
INSERT [dbo].[GasBills] ([Id]) VALUES (362)
INSERT [dbo].[GasBills] ([Id]) VALUES (363)
INSERT [dbo].[GasBills] ([Id]) VALUES (364)
INSERT [dbo].[GasBills] ([Id]) VALUES (365)
INSERT [dbo].[GasBills] ([Id]) VALUES (366)
INSERT [dbo].[GasBills] ([Id]) VALUES (367)
INSERT [dbo].[GasBills] ([Id]) VALUES (368)
GO
SET IDENTITY_INSERT [dbo].[HouseHoldTypes] ON 

INSERT [dbo].[HouseHoldTypes] ([Id], [HoldType], [IsActive], [CreatedAt]) VALUES (1, N'3+1', 1, CAST(N'2022-08-08T13:45:16.763' AS DateTime))
INSERT [dbo].[HouseHoldTypes] ([Id], [HoldType], [IsActive], [CreatedAt]) VALUES (2, N'2+1', 1, CAST(N'2022-08-08T13:45:16.817' AS DateTime))
INSERT [dbo].[HouseHoldTypes] ([Id], [HoldType], [IsActive], [CreatedAt]) VALUES (3, N'1+1', 1, CAST(N'2022-08-08T13:45:16.850' AS DateTime))
INSERT [dbo].[HouseHoldTypes] ([Id], [HoldType], [IsActive], [CreatedAt]) VALUES (4, N'1+0', 1, CAST(N'2022-08-08T13:45:16.880' AS DateTime))
INSERT [dbo].[HouseHoldTypes] ([Id], [HoldType], [IsActive], [CreatedAt]) VALUES (5, N'2+0', 1, CAST(N'2022-08-08T13:45:16.910' AS DateTime))
SET IDENTITY_INSERT [dbo].[HouseHoldTypes] OFF
GO
INSERT [dbo].[Landlords] ([Id]) VALUES (1)
INSERT [dbo].[Landlords] ([Id]) VALUES (2)
INSERT [dbo].[Landlords] ([Id]) VALUES (3)
INSERT [dbo].[Landlords] ([Id]) VALUES (4)
INSERT [dbo].[Landlords] ([Id]) VALUES (5)
INSERT [dbo].[Landlords] ([Id]) VALUES (6)
INSERT [dbo].[Landlords] ([Id]) VALUES (7)
INSERT [dbo].[Landlords] ([Id]) VALUES (8)
INSERT [dbo].[Landlords] ([Id]) VALUES (9)
INSERT [dbo].[Landlords] ([Id]) VALUES (10)
INSERT [dbo].[Landlords] ([Id]) VALUES (11)
INSERT [dbo].[Landlords] ([Id]) VALUES (12)
INSERT [dbo].[Landlords] ([Id]) VALUES (13)
INSERT [dbo].[Landlords] ([Id]) VALUES (14)
INSERT [dbo].[Landlords] ([Id]) VALUES (15)
INSERT [dbo].[Landlords] ([Id]) VALUES (16)
INSERT [dbo].[Landlords] ([Id]) VALUES (17)
INSERT [dbo].[Landlords] ([Id]) VALUES (18)
INSERT [dbo].[Landlords] ([Id]) VALUES (19)
INSERT [dbo].[Landlords] ([Id]) VALUES (20)
INSERT [dbo].[Landlords] ([Id]) VALUES (21)
INSERT [dbo].[Landlords] ([Id]) VALUES (22)
INSERT [dbo].[Landlords] ([Id]) VALUES (23)
INSERT [dbo].[Landlords] ([Id]) VALUES (24)
INSERT [dbo].[Landlords] ([Id]) VALUES (25)
INSERT [dbo].[Landlords] ([Id]) VALUES (26)
INSERT [dbo].[Landlords] ([Id]) VALUES (27)
INSERT [dbo].[Landlords] ([Id]) VALUES (28)
INSERT [dbo].[Landlords] ([Id]) VALUES (29)
INSERT [dbo].[Landlords] ([Id]) VALUES (30)
INSERT [dbo].[Landlords] ([Id]) VALUES (31)
INSERT [dbo].[Landlords] ([Id]) VALUES (32)
INSERT [dbo].[Landlords] ([Id]) VALUES (33)
INSERT [dbo].[Landlords] ([Id]) VALUES (34)
INSERT [dbo].[Landlords] ([Id]) VALUES (35)
INSERT [dbo].[Landlords] ([Id]) VALUES (36)
INSERT [dbo].[Landlords] ([Id]) VALUES (37)
INSERT [dbo].[Landlords] ([Id]) VALUES (38)
INSERT [dbo].[Landlords] ([Id]) VALUES (39)
INSERT [dbo].[Landlords] ([Id]) VALUES (40)
INSERT [dbo].[Landlords] ([Id]) VALUES (41)
INSERT [dbo].[Landlords] ([Id]) VALUES (42)
INSERT [dbo].[Landlords] ([Id]) VALUES (43)
INSERT [dbo].[Landlords] ([Id]) VALUES (44)
INSERT [dbo].[Landlords] ([Id]) VALUES (45)
INSERT [dbo].[Landlords] ([Id]) VALUES (46)
INSERT [dbo].[Landlords] ([Id]) VALUES (47)
INSERT [dbo].[Landlords] ([Id]) VALUES (48)
INSERT [dbo].[Landlords] ([Id]) VALUES (49)
INSERT [dbo].[Landlords] ([Id]) VALUES (50)
INSERT [dbo].[Landlords] ([Id]) VALUES (51)
INSERT [dbo].[Landlords] ([Id]) VALUES (52)
INSERT [dbo].[Landlords] ([Id]) VALUES (53)
INSERT [dbo].[Landlords] ([Id]) VALUES (54)
INSERT [dbo].[Landlords] ([Id]) VALUES (55)
INSERT [dbo].[Landlords] ([Id]) VALUES (56)
INSERT [dbo].[Landlords] ([Id]) VALUES (57)
INSERT [dbo].[Landlords] ([Id]) VALUES (58)
INSERT [dbo].[Landlords] ([Id]) VALUES (59)
INSERT [dbo].[Landlords] ([Id]) VALUES (60)
INSERT [dbo].[Landlords] ([Id]) VALUES (61)
INSERT [dbo].[Landlords] ([Id]) VALUES (62)
INSERT [dbo].[Landlords] ([Id]) VALUES (63)
INSERT [dbo].[Landlords] ([Id]) VALUES (64)
INSERT [dbo].[Landlords] ([Id]) VALUES (65)
GO
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (66, N'15')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (67, N'18')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (68, N'4')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (69, N'14')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (70, N'28')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (71, N'48')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (72, N'35')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (73, N'47')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (74, N'30')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (75, N'21')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (76, N'12')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (77, N'3')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (78, N'16')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (79, N'18')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (80, N'16')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (81, N'15')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (82, N'14')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (83, N'12')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (84, N'12')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (85, N'12')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (86, N'12')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (87, N'15')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (88, N'14')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (89, N'10')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (90, N'10')
INSERT [dbo].[Lessees] ([Id], [ContractTerm]) VALUES (91, N'10')
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [IsItRead], [IsActive], [CreatedAt]) VALUES (1, 1, 2, N'Merhabalar', 1, 1, CAST(N'2022-08-13T12:33:27.767' AS DateTime))
INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [IsItRead], [IsActive], [CreatedAt]) VALUES (2, 1, 1, N'Gerçekten bu ay ödemelerimiz çok', 1, 0, CAST(N'2022-08-13T12:58:23.633' AS DateTime))
INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [IsItRead], [IsActive], [CreatedAt]) VALUES (3, 69, 1, N'Merhaba Bu ayki kirayı hesabınıza yatırdım Musa Bey İyi Günler', 0, 0, CAST(N'2022-08-13T13:16:02.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Phones] ON 

INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (1, 1, N'+905457652650', 1, CAST(N'2022-08-09T12:48:21.720' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (2, 2, N'+905357654347', 1, CAST(N'2022-08-11T20:47:37.230' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (5, 3, N'+56 817 844 0526', 1, CAST(N'2022-08-11T20:47:55.447' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (6, 4, N'+7 907 957 5108', 1, CAST(N'2022-08-11T20:47:55.480' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (7, 5, N'+55 503 131 0321', 1, CAST(N'2022-08-11T20:47:55.513' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (8, 6, N'+62 997 480 3248', 1, CAST(N'2022-08-11T20:47:55.547' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (9, 7, N'+62 321 801 6739', 1, CAST(N'2022-08-11T20:47:55.577' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (10, 8, N'+1 517 571 0334', 1, CAST(N'2022-08-11T20:47:55.610' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (11, 9, N'+46 933 907 4305', 1, CAST(N'2022-08-11T20:47:55.640' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (12, 10, N'+86 422 973 6277', 1, CAST(N'2022-08-11T20:47:55.670' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (13, 11, N'+48 792 157 6035', 1, CAST(N'2022-08-11T20:47:55.703' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (14, 12, N'+33 399 857 1237', 1, CAST(N'2022-08-11T20:47:55.737' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (15, 13, N'+55 897 365 7977', 1, CAST(N'2022-08-11T20:47:55.777' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (16, 14, N'+66 773 528 5560', 1, CAST(N'2022-08-11T20:47:55.810' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (17, 15, N'+33 821 937 1161', 1, CAST(N'2022-08-11T20:47:55.840' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (18, 16, N'+62 694 226 8081', 1, CAST(N'2022-08-11T20:47:55.870' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (19, 17, N'+420 497 863 7474', 1, CAST(N'2022-08-11T20:47:55.903' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (20, 18, N'+62 972 817 8798', 1, CAST(N'2022-08-11T20:47:55.940' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (21, 19, N'+30 797 152 2402', 1, CAST(N'2022-08-11T20:47:55.970' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (22, 20, N'+86 997 579 4899', 1, CAST(N'2022-08-11T20:47:56.003' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (23, 21, N'+86 769 645 0809', 1, CAST(N'2022-08-11T20:47:56.037' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (24, 22, N'+420 560 763 6622', 1, CAST(N'2022-08-11T20:47:56.070' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (25, 23, N'+1 824 367 8022', 1, CAST(N'2022-08-11T20:47:56.100' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (26, 24, N'+7 615 295 4543', 1, CAST(N'2022-08-11T20:47:56.133' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (27, 25, N'+48 347 102 7645', 1, CAST(N'2022-08-11T20:47:56.163' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (28, 26, N'+998 738 258 4721', 1, CAST(N'2022-08-11T20:47:56.197' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (29, 27, N'+44 243 104 2128', 1, CAST(N'2022-08-11T20:47:56.230' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (30, 28, N'+63 914 746 5594', 1, CAST(N'2022-08-11T20:47:56.263' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (31, 29, N'+63 254 126 2059', 1, CAST(N'2022-08-11T20:47:56.297' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (32, 30, N'+63 505 776 7431', 1, CAST(N'2022-08-11T20:47:56.327' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (33, 31, N'+261 106 486 0954', 1, CAST(N'2022-08-11T20:47:56.360' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (34, 32, N'+51 266 915 9772', 1, CAST(N'2022-08-11T20:47:56.390' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (35, 33, N'+66 513 960 3056', 1, CAST(N'2022-08-11T20:47:56.423' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (36, 34, N'+86 475 765 9513', 1, CAST(N'2022-08-11T20:47:56.453' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (37, 35, N'+46 672 554 8089', 1, CAST(N'2022-08-11T20:47:56.487' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (38, 36, N'+48 261 525 5236', 1, CAST(N'2022-08-11T20:47:56.523' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (39, 37, N'+86 229 557 4720', 1, CAST(N'2022-08-11T20:47:56.553' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (40, 38, N'+55 920 956 3253', 1, CAST(N'2022-08-11T20:47:56.587' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (41, 39, N'+389 511 818 3205', 1, CAST(N'2022-08-11T20:47:56.617' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (42, 40, N'+62 453 713 7956', 1, CAST(N'2022-08-11T20:47:56.650' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (43, 41, N'+33 858 569 6412', 1, CAST(N'2022-08-11T20:47:56.680' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (44, 42, N'+86 473 316 4848', 1, CAST(N'2022-08-11T20:47:56.713' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (45, 43, N'+963 577 583 8214', 1, CAST(N'2022-08-11T20:47:56.750' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (46, 44, N'+54 844 624 9453', 1, CAST(N'2022-08-11T20:47:56.780' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (47, 45, N'+55 755 725 3519', 1, CAST(N'2022-08-11T20:47:56.810' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (48, 46, N'+48 790 744 2904', 1, CAST(N'2022-08-11T20:47:56.843' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (49, 47, N'+66 874 317 3929', 1, CAST(N'2022-08-11T20:47:56.873' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (50, 48, N'+27 111 697 2842', 1, CAST(N'2022-08-11T20:47:56.907' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (51, 49, N'+241 824 657 5733', 1, CAST(N'2022-08-11T20:47:56.937' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (52, 50, N'+351 897 750 0060', 1, CAST(N'2022-08-11T20:47:56.970' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (53, 51, N'+371 412 363 3220', 1, CAST(N'2022-08-11T20:47:57.007' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (54, 52, N'+389 609 179 8252', 1, CAST(N'2022-08-11T20:47:57.037' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (55, 53, N'+504 540 524 1607', 1, CAST(N'2022-08-11T20:47:57.067' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (56, 54, N'+1 297 670 3871', 1, CAST(N'2022-08-11T20:47:57.100' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (57, 55, N'+226 776 240 2552', 1, CAST(N'2022-08-11T20:47:57.130' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (58, 56, N'+62 178 298 9854', 1, CAST(N'2022-08-11T20:47:57.163' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (59, 57, N'+48 326 786 3579', 1, CAST(N'2022-08-11T20:47:57.193' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (60, 58, N'+267 142 260 9312', 1, CAST(N'2022-08-11T20:47:57.227' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (61, 59, N'+591 366 219 1441', 1, CAST(N'2022-08-11T20:47:57.260' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (62, 60, N'+63 269 271 4472', 1, CAST(N'2022-08-11T20:47:57.293' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (63, 61, N'+86 912 630 7587', 1, CAST(N'2022-08-11T20:47:57.323' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (64, 62, N'+63 748 418 9001', 1, CAST(N'2022-08-11T20:47:57.357' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (65, 63, N'+33 520 273 7637', 1, CAST(N'2022-08-11T20:47:57.387' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (66, 64, N'+62 663 281 1541', 1, CAST(N'2022-08-11T20:47:57.420' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (67, 65, N'+86 437 593 5809', 1, CAST(N'2022-08-11T20:47:57.450' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (68, 66, N'+236 166 603 5457', 1, CAST(N'2022-08-11T20:47:57.480' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (69, 67, N'+49 917 195 5865', 1, CAST(N'2022-08-11T20:47:57.517' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (70, 68, N'+62 956 473 8719', 1, CAST(N'2022-08-11T20:47:57.550' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (71, 69, N'+27 224 722 6479', 1, CAST(N'2022-08-11T20:47:57.580' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (72, 70, N'+86 977 576 0048', 1, CAST(N'2022-08-11T20:47:57.610' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (73, 71, N'+380 480 634 2421', 1, CAST(N'2022-08-11T20:47:57.643' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (74, 72, N'+86 652 645 3819', 1, CAST(N'2022-08-11T20:47:57.673' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (75, 73, N'+351 345 824 2928', 1, CAST(N'2022-08-11T20:47:57.707' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (76, 74, N'+48 816 390 3098', 1, CAST(N'2022-08-11T20:47:57.737' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (77, 75, N'+351 568 910 1913', 1, CAST(N'2022-08-11T20:47:57.770' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (78, 76, N'+504 840 524 3420', 1, CAST(N'2022-08-11T20:47:57.803' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (79, 77, N'+62 352 734 9077', 1, CAST(N'2022-08-11T20:47:57.833' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (80, 78, N'+86 190 104 4593', 1, CAST(N'2022-08-11T20:47:57.867' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (81, 79, N'+55 258 888 2955', 1, CAST(N'2022-08-11T20:47:57.900' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (82, 80, N'+57 510 970 7217', 1, CAST(N'2022-08-11T20:47:57.930' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (83, 81, N'+46 966 296 8697', 1, CAST(N'2022-08-11T20:47:57.963' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (84, 82, N'+81 319 848 5104', 1, CAST(N'2022-08-11T20:47:57.997' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (85, 83, N'+98 938 553 3390', 1, CAST(N'2022-08-11T20:47:58.030' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (86, 84, N'+55 287 116 7843', 1, CAST(N'2022-08-11T20:47:58.063' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (87, 85, N'+976 353 897 6854', 1, CAST(N'2022-08-11T20:47:58.093' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (88, 86, N'+57 808 855 5234', 1, CAST(N'2022-08-11T20:47:58.127' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (89, 87, N'+63 792 904 2317', 1, CAST(N'2022-08-11T20:47:58.160' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (90, 88, N'+86 702 855 2657', 1, CAST(N'2022-08-11T20:47:58.190' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (91, 89, N'+57 588 211 4982', 1, CAST(N'2022-08-11T20:47:58.223' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (92, 90, N'+905069632145', 1, CAST(N'2022-08-11T20:47:58.260' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (93, 91, N'+63 807 586 1526', 1, CAST(N'2022-08-11T20:47:58.290' AS DateTime))
INSERT [dbo].[Phones] ([Id], [UserId], [PhoneNumber], [IsActive], [CreatedAt]) VALUES (94, 92, N'+905069632145', 1, CAST(N'2022-08-11T20:47:58.323' AS DateTime))
SET IDENTITY_INSERT [dbo].[Phones] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (1, N'Musa', N'Uyumaz', N'12345678910', N'musa.uyumaz73@gmail.com', 1, N'26 HS 689', 1, CAST(N'2022-08-09T12:47:50.600' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (2, N'Serhat', N'Uyumaz', N'17371594850', N'serhatuyumaz@gmail.com', 1, N'26 SRH 410', 1, CAST(N'2022-08-11T08:54:19.547' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (3, N'Camélia', N'Baily', N'67520305802', N'abaily1@amazon.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:19.673' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (4, N'Miléna', N'Louis', N'46375167396', N'glouis2@phoca.cz', 0, NULL, 1, CAST(N'2022-08-11T08:54:19.717' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (5, N'Sòng', N'MacPaike', N'78687816498', N'smacpaike3@nydailynews.com', 1, N'43 HG 136', 1, CAST(N'2022-08-11T08:54:19.757' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (6, N'Mélina', N'Knighton', N'76690161464', N'aknighton4@marriott.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:19.800' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (7, N'Tán', N'Frapwell', N'73924862316', N'tfrapwell5@symantec.com', 1, N'74 HK 549', 1, CAST(N'2022-08-11T08:54:19.840' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (8, N'Chloé', N'Dessant', N'88341431240', N'ldessant6@fema.gov', 0, NULL, 1, CAST(N'2022-08-11T08:54:19.883' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (9, N'Illustrée', N'Pues', N'88210618586', N'cpues7@wiley.com', 1, N'54 AAP 145', 1, CAST(N'2022-08-11T08:54:19.920' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (10, N'Marie-thérèse', N'Sommerlie', N'83513005084', N'nsommerlie8@artisteer.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:19.957' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (11, N'Lorène', N'Airth', N'78432675690', N'aairth9@techcrunch.com', 1, N'73 ART 96', 1, CAST(N'2022-08-11T08:54:19.993' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (12, N'Cécilia', N'Creavin', N'33424355840', N'mcreavina@sina.com.cn', 1, N'03 AAB 1007', 1, CAST(N'2022-08-11T08:54:20.030' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (13, N'Danièle', N'Phaup', N'74710993338', N'gphaupb@cocolog-nifty.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.063' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (14, N'Wá', N'Goulbourne', N'28772299098', N'egoulbournec@sfgate.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.097' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (15, N'Intéressant', N'Janczak', N'70521666402', N'ejanczakd@soup.io', 1, N'34 AOP 456', 1, CAST(N'2022-08-11T08:54:20.133' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (16, N'Lauréna', N'Jeacop', N'83307953830', N'jjeacope@bravesites.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.170' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (17, N'Véronique', N'Antonias', N'72556012840', N'aantoniasf@merriam-webster.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.203' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (18, N'Angélique', N'Siverns', N'81020072712', N'bsivernsg@wix.com', 1, N'26 OOP 147', 1, CAST(N'2022-08-11T08:54:20.240' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (19, N'Mélodie', N'Crudge', N'19008351610', N'mcrudgeh@cornell.edu', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.277' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (20, N'Réservés', N'Sweatland', N'16416136572', N'esweatlandi@last.fm', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.310' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (21, N'Noémie', N'Flacknoe', N'49521169788', N'vflacknoej@studiopress.com', 1, N'80 AKL 7896', 1, CAST(N'2022-08-11T08:54:20.347' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (22, N'Gösta', N'Rein', N'85602663434', N'creink@soup.io', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.400' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (23, N'Simplifiés', N'Grayshon', N'40605505242', N'jgrayshonl@so-net.ne.jp', 1, N'06 AY 7987', 1, CAST(N'2022-08-11T08:54:20.447' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (24, N'Françoise', N'Aslam', N'88774971114', N'laslamm@flickr.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.480' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (25, N'Yóu', N'Blythin', N'14406876438', N'kblythinn@geocities.jp', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.517' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (26, N'Cécilia', N'Veregan', N'35232070368', N'jveregano@foxnews.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.550' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (27, N'Mylène', N'Vaudre', N'13436016090', N'hvaudrep@ask.com', 1, N'08 ACB 896', 1, CAST(N'2022-08-11T08:54:20.587' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (28, N'Pò', N'Antoniou', N'67646284330', N'wantoniouq@reuters.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.620' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (29, N'Audréanne', N'MacGorley', N'14857688792', N'amacgorleyr@arstechnica.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.657' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (30, N'Göran', N'Uzielli', N'28176743136', N'huziellis@guardian.co.uk', 1, N'26 AEK 453', 1, CAST(N'2022-08-11T08:54:20.693' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (31, N'Bérangère', N'Debell', N'37391855158', N'fdebellt@ed.gov', 1, N'26 SN 719', 1, CAST(N'2022-08-11T08:54:20.727' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (32, N'Polat', N'Alemdar', N'35487509034', N'polatalemdar@gmail.com', 1, N'34 PLT 34', 1, CAST(N'2022-08-11T08:54:20.763' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (33, N'Stévina', N'Dacre', N'27178401948', N'pdacrev@angelfire.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.797' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (34, N'Bérengère', N'Raynton', N'17325216314', N'arayntonw@myspace.com', 1, N'34 ADH 34', 1, CAST(N'2022-08-11T08:54:20.833' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (35, N'Mårten', N'Creed', N'10708260726', N'ccreedx@google.it', 1, N'34 MB 34', 1, CAST(N'2022-08-11T08:54:20.870' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (36, N'Rachèle', N'Brownsall', N'40903243840', N'tbrownsally@infoseek.co.jp', 1, N'41 HG 896', 1, CAST(N'2022-08-11T08:54:20.903' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (37, N'Zhì', N'Jouandet', N'65201584248', N'ejouandetz@zdnet.com', 1, N'47 HF 963', 1, CAST(N'2022-08-11T08:54:20.940' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (38, N'Zoé', N'Callacher', N'31115794622', N'rcallacher10@mit.edu', 0, NULL, 1, CAST(N'2022-08-11T08:54:20.973' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (39, N'Åke', N'Colicot', N'63972348922', N'ecolicot11@opera.com', 1, N'34 AAB 36', 1, CAST(N'2022-08-11T08:54:21.010' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (40, N'Angèle', N'Masterman', N'32504690776', N'bmasterman12@amazon.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.043' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (41, N'Faîtes', N'Borrie', N'84624440580', N'tborrie13@slashdot.org', 1, N'81 AAG 366', 1, CAST(N'2022-08-11T08:54:21.077' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (42, N'Yénora', N'Bouttell', N'55461132330', N'mbouttell14@umich.edu', 1, N'01 AKT 63', 1, CAST(N'2022-08-11T08:54:21.110' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (43, N'Estève', N'Senescall', N'71386183974', N'jsenescall15@cbc.ca', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.147' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (44, N'Intéressant', N'Tarbath', N'23076008820', N'mtarbath16@liveinternet.ru', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.183' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (45, N'Alizée', N'Hatz', N'55641832602', N'whatz17@forbes.com', 1, N'02 ALK 365', 1, CAST(N'2022-08-11T08:54:21.220' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (46, N'Judicaël', N'Lensch', N'42124735308', N'mlensch18@networksolutions.com', 1, N'46 ACZ 145', 1, CAST(N'2022-08-11T08:54:21.253' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (47, N'Erwéi', N'Pilipets', N'64599463348', N'gpilipets19@domainmarket.com', 1, N'34 HS 7366', 1, CAST(N'2022-08-11T08:54:21.287' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (48, N'Börje', N'Reeds', N'79336274560', N'greeds1a@tripod.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.323' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (49, N'Cléopatre', N'Seers', N'83744836454', N'dseers1b@gravatar.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.357' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (50, N'Dà', N'Kleinpeltz', N'59876876880', N'gkleinpeltz1c@europa.eu', 1, N'34 UF 2409', 1, CAST(N'2022-08-11T08:54:21.393' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (51, N'Anaé', N'Meldon', N'13366721768', N'cmeldon1d@state.gov', 1, N'34 NS 95', 1, CAST(N'2022-08-11T08:54:21.427' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (52, N'Mà', N'Cogger', N'81635503964', N'scogger1e@themeforest.net', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.460' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (53, N'Françoise', N'Baggarley', N'60662041412', N'jbaggarley1f@ucsd.edu', 1, N'09 TF 856', 1, CAST(N'2022-08-11T08:54:21.497' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (54, N'Maï', N'Leas', N'55112346518', N'nleas1g@scribd.com', 1, N'34 BOP 76', 1, CAST(N'2022-08-11T08:54:21.530' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (55, N'Célestine', N'Novelli', N'49537393326', N'nnovelli1h@woothemes.com', 1, N'06 GKN 62', 1, CAST(N'2022-08-11T08:54:21.567' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (56, N'Ráo', N'Brettle', N'12242197878', N'ebrettle1i@adobe.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.600' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (57, N'Yè', N'Cumo', N'15159064996', N'ecumo1j@flickr.com', 1, N'34 VG 743', 1, CAST(N'2022-08-11T08:54:21.633' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (58, N'Adélie', N'Checci', N'56141195164', N'ochecci1k@fastcompany.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.670' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (59, N'Véronique', N'Teese', N'40900910466', N'bteese1l@over-blog.com', 1, N'34 DB 0233', 1, CAST(N'2022-08-11T08:54:21.703' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (60, N'Gaïa', N'Ungerer', N'69429168870', N'bungerer1m@businessinsider.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.740' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (61, N'Méng', N'Korba', N'56212158282', N'akorba1n@stanford.edu', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.777' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (62, N'Dorothée', N'Ahrens', N'78349945928', N'kahrens1o@godaddy.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.810' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (63, N'Miléna', N'Boughtflower', N'26775208744', N'lboughtflower1p@usda.gov', 1, N'35 VD 591', 1, CAST(N'2022-08-11T08:54:21.847' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (64, N'Pénélope', N'Hoodspeth', N'52814798910', N'thoodspeth1q@about.me', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.880' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (65, N'Aimée', N'Stowe', N'59124561924', N'rstowe1r@digg.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.917' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (66, N'Amélie', N'O''Monahan', N'23259756038', N'eomonahan1s@creativecommons.org', 1, N'10 BBA 59', 1, CAST(N'2022-08-11T08:54:21.950' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (67, N'Andréa', N'Strut', N'27967903884', N'kstrut1t@facebook.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:21.987' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (68, N'Eléonore', N'Arblaster', N'16088336879', N'rarblaster1u@opera.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.020' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (69, N'Salomé', N'Sikorski', N'63894644358', N'fsikorski1v@abc.net.au', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.057' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (70, N'Thérèsa', N'Werner', N'23351271372', N'hwerner1w@yale.edu', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.090' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (71, N'Östen', N'Carass', N'68480337686', N'bcarass1x@seesaa.net', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.127' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (72, N'Léane', N'Peile', N'47192456310', N'dpeile1y@ucoz.ru', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.160' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (73, N'Naéva', N'Pischel', N'86741518386', N'rpischel1z@shutterfly.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.197' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (74, N'Märta', N'Bacon', N'78271635920', N'lbacon20@usgs.gov', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.230' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (75, N'Pélagie', N'Doughill', N'17516408290', N'ddoughill21@weebly.com', 1, N'06 ERL 35', 1, CAST(N'2022-08-11T08:54:22.263' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (76, N'Léana', N'Tod', N'57360622962', N'btod22@gnu.org', 1, N'34 BK 7751', 1, CAST(N'2022-08-11T08:54:22.297' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (77, N'Gérald', N'Fellow', N'69729841693', N'efellow23@elegantthemes.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.330' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (78, N'Laurélie', N'Sparkwell', N'15321323998', N'tsparkwell24@gravatar.com', 1, N'48 DJ 2801', 1, CAST(N'2022-08-11T08:54:22.367' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (79, N'Táng', N'Hare', N'63262135288', N'bhare25@elpais.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.403' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (80, N'Tú', N'Burder', N'66527293720', N'cburder26@senate.gov', 1, N'34 ARS 44', 1, CAST(N'2022-08-11T08:54:22.437' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (81, N'Clémentine', N'Reis', N'35149999072', N'jreis27@jigsy.com', 1, N'34 TC 155', 1, CAST(N'2022-08-11T08:54:22.470' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (82, N'Mahélie', N'Rye', N'24917070966', N'lrye28@g.co', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.503' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (83, N'Yóu', N'Marton', N'69917873658', N'jmarton29@apache.org', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.540' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (84, N'Kallisté', N'Bullar', N'47361937044', N'wbullar2a@wikipedia.org', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.573' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (85, N'Maëlann', N'Jozef', N'80297838866', N'sjozef2b@wikispaces.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.610' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (86, N'Mårten', N'Fasler', N'51352625622', N'gfasler2c@craigslist.org', 1, N'04 NR 0746', 1, CAST(N'2022-08-11T08:54:22.643' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (87, N'Anaël', N'Pelham', N'76253111280', N'bpelham2d@altervista.org', 1, N'34 RR 092', 1, CAST(N'2022-08-11T08:54:22.680' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (88, N'Médiamass', N'MacMychem', N'32358929568', N'amacmychem2e@tmall.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.713' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (89, N'Pò', N'Clewer', N'31689647656', N'sclewer2f@goo.ne.jp', 1, N'10 ZC 0034', 1, CAST(N'2022-08-11T08:54:22.750' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (90, N'Göran', N'Cloney', N'65454584774', N'gcloney2g@cbc.ca', 1, N'01 BJK 08', 1, CAST(N'2022-08-11T08:54:22.783' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (91, N'Fèi', N'Evershed', N'58879887656', N'cevershed2h@instagram.com', 0, NULL, 1, CAST(N'2022-08-11T08:54:22.820' AS DateTime))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [NationalIdentityNumber], [Email], [HaveAVehicle], [LicensePlate], [IsActive], [CreatedAt]) VALUES (92, N'Ali', N'Yılmaz', N'63256347896', N'aliyilmaz@gmail.com', 0, NULL, 1, CAST(N'2022-08-11T17:05:09.487' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[WaterBills] ([Id]) VALUES (185)
INSERT [dbo].[WaterBills] ([Id]) VALUES (186)
INSERT [dbo].[WaterBills] ([Id]) VALUES (187)
INSERT [dbo].[WaterBills] ([Id]) VALUES (188)
INSERT [dbo].[WaterBills] ([Id]) VALUES (189)
INSERT [dbo].[WaterBills] ([Id]) VALUES (190)
INSERT [dbo].[WaterBills] ([Id]) VALUES (191)
INSERT [dbo].[WaterBills] ([Id]) VALUES (192)
INSERT [dbo].[WaterBills] ([Id]) VALUES (193)
INSERT [dbo].[WaterBills] ([Id]) VALUES (194)
INSERT [dbo].[WaterBills] ([Id]) VALUES (195)
INSERT [dbo].[WaterBills] ([Id]) VALUES (196)
INSERT [dbo].[WaterBills] ([Id]) VALUES (197)
INSERT [dbo].[WaterBills] ([Id]) VALUES (198)
INSERT [dbo].[WaterBills] ([Id]) VALUES (199)
INSERT [dbo].[WaterBills] ([Id]) VALUES (200)
INSERT [dbo].[WaterBills] ([Id]) VALUES (201)
INSERT [dbo].[WaterBills] ([Id]) VALUES (202)
INSERT [dbo].[WaterBills] ([Id]) VALUES (203)
INSERT [dbo].[WaterBills] ([Id]) VALUES (204)
INSERT [dbo].[WaterBills] ([Id]) VALUES (205)
INSERT [dbo].[WaterBills] ([Id]) VALUES (206)
INSERT [dbo].[WaterBills] ([Id]) VALUES (207)
INSERT [dbo].[WaterBills] ([Id]) VALUES (208)
INSERT [dbo].[WaterBills] ([Id]) VALUES (209)
INSERT [dbo].[WaterBills] ([Id]) VALUES (210)
INSERT [dbo].[WaterBills] ([Id]) VALUES (211)
INSERT [dbo].[WaterBills] ([Id]) VALUES (212)
INSERT [dbo].[WaterBills] ([Id]) VALUES (213)
INSERT [dbo].[WaterBills] ([Id]) VALUES (214)
INSERT [dbo].[WaterBills] ([Id]) VALUES (215)
INSERT [dbo].[WaterBills] ([Id]) VALUES (216)
INSERT [dbo].[WaterBills] ([Id]) VALUES (217)
INSERT [dbo].[WaterBills] ([Id]) VALUES (218)
INSERT [dbo].[WaterBills] ([Id]) VALUES (219)
INSERT [dbo].[WaterBills] ([Id]) VALUES (220)
INSERT [dbo].[WaterBills] ([Id]) VALUES (221)
INSERT [dbo].[WaterBills] ([Id]) VALUES (222)
INSERT [dbo].[WaterBills] ([Id]) VALUES (223)
INSERT [dbo].[WaterBills] ([Id]) VALUES (224)
INSERT [dbo].[WaterBills] ([Id]) VALUES (225)
INSERT [dbo].[WaterBills] ([Id]) VALUES (226)
INSERT [dbo].[WaterBills] ([Id]) VALUES (227)
INSERT [dbo].[WaterBills] ([Id]) VALUES (228)
INSERT [dbo].[WaterBills] ([Id]) VALUES (229)
INSERT [dbo].[WaterBills] ([Id]) VALUES (230)
INSERT [dbo].[WaterBills] ([Id]) VALUES (231)
INSERT [dbo].[WaterBills] ([Id]) VALUES (232)
INSERT [dbo].[WaterBills] ([Id]) VALUES (233)
INSERT [dbo].[WaterBills] ([Id]) VALUES (234)
INSERT [dbo].[WaterBills] ([Id]) VALUES (235)
INSERT [dbo].[WaterBills] ([Id]) VALUES (236)
INSERT [dbo].[WaterBills] ([Id]) VALUES (237)
INSERT [dbo].[WaterBills] ([Id]) VALUES (238)
INSERT [dbo].[WaterBills] ([Id]) VALUES (239)
INSERT [dbo].[WaterBills] ([Id]) VALUES (240)
INSERT [dbo].[WaterBills] ([Id]) VALUES (241)
INSERT [dbo].[WaterBills] ([Id]) VALUES (242)
INSERT [dbo].[WaterBills] ([Id]) VALUES (243)
INSERT [dbo].[WaterBills] ([Id]) VALUES (244)
INSERT [dbo].[WaterBills] ([Id]) VALUES (245)
INSERT [dbo].[WaterBills] ([Id]) VALUES (246)
INSERT [dbo].[WaterBills] ([Id]) VALUES (247)
INSERT [dbo].[WaterBills] ([Id]) VALUES (248)
INSERT [dbo].[WaterBills] ([Id]) VALUES (249)
INSERT [dbo].[WaterBills] ([Id]) VALUES (250)
INSERT [dbo].[WaterBills] ([Id]) VALUES (251)
INSERT [dbo].[WaterBills] ([Id]) VALUES (252)
INSERT [dbo].[WaterBills] ([Id]) VALUES (253)
INSERT [dbo].[WaterBills] ([Id]) VALUES (254)
INSERT [dbo].[WaterBills] ([Id]) VALUES (255)
INSERT [dbo].[WaterBills] ([Id]) VALUES (256)
INSERT [dbo].[WaterBills] ([Id]) VALUES (257)
INSERT [dbo].[WaterBills] ([Id]) VALUES (258)
INSERT [dbo].[WaterBills] ([Id]) VALUES (259)
INSERT [dbo].[WaterBills] ([Id]) VALUES (260)
INSERT [dbo].[WaterBills] ([Id]) VALUES (261)
INSERT [dbo].[WaterBills] ([Id]) VALUES (262)
INSERT [dbo].[WaterBills] ([Id]) VALUES (263)
INSERT [dbo].[WaterBills] ([Id]) VALUES (264)
INSERT [dbo].[WaterBills] ([Id]) VALUES (265)
INSERT [dbo].[WaterBills] ([Id]) VALUES (266)
INSERT [dbo].[WaterBills] ([Id]) VALUES (267)
INSERT [dbo].[WaterBills] ([Id]) VALUES (268)
INSERT [dbo].[WaterBills] ([Id]) VALUES (269)
INSERT [dbo].[WaterBills] ([Id]) VALUES (270)
INSERT [dbo].[WaterBills] ([Id]) VALUES (271)
INSERT [dbo].[WaterBills] ([Id]) VALUES (272)
INSERT [dbo].[WaterBills] ([Id]) VALUES (273)
INSERT [dbo].[WaterBills] ([Id]) VALUES (274)
INSERT [dbo].[WaterBills] ([Id]) VALUES (275)
INSERT [dbo].[WaterBills] ([Id]) VALUES (276)
GO
ALTER TABLE [dbo].[Apartments] ADD  CONSTRAINT [DF_Apartments_IsActive_1]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Apartments] ADD  CONSTRAINT [DF_Apartments_CreatedAt_1]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Apartments23] ADD  CONSTRAINT [DF_Apartments_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Apartments23] ADD  CONSTRAINT [DF_Apartments_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Bills] ADD  CONSTRAINT [DF_Bills_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Bills] ADD  CONSTRAINT [DF_Bills_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Blocks] ADD  CONSTRAINT [DF_Blocks_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Blocks] ADD  CONSTRAINT [DF_Blocks_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Dues] ADD  CONSTRAINT [DF_Dues_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Dues] ADD  CONSTRAINT [DF_Dues_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[HouseHoldTypes] ADD  CONSTRAINT [DF_HouseHoldTypes_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[HouseHoldTypes] ADD  CONSTRAINT [DF_HouseHoldTypes_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_IsItRead]  DEFAULT ((0)) FOR [IsItRead]
GO
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Phones] ADD  CONSTRAINT [DF_Phones_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Phones] ADD  CONSTRAINT [DF_Phones_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ApartmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentDetails_Apartments] FOREIGN KEY([Id])
REFERENCES [dbo].[Apartments] ([Id])
GO
ALTER TABLE [dbo].[ApartmentDetails] CHECK CONSTRAINT [FK_ApartmentDetails_Apartments]
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_Blocks] FOREIGN KEY([BlockId])
REFERENCES [dbo].[Blocks] ([Id])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_Blocks]
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_HouseHoldTypes] FOREIGN KEY([HouseHoldTypeId])
REFERENCES [dbo].[HouseHoldTypes] ([Id])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_HouseHoldTypes]
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_Landlords] FOREIGN KEY([LandlordId])
REFERENCES [dbo].[Landlords] ([Id])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_Landlords]
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_Users] FOREIGN KEY([HouseUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_Users]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Apartments] FOREIGN KEY([ApartmentId])
REFERENCES [dbo].[Apartments] ([Id])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Apartments]
GO
ALTER TABLE [dbo].[Dues]  WITH CHECK ADD  CONSTRAINT [FK_Dues_Apartments] FOREIGN KEY([ApartmentId])
REFERENCES [dbo].[Apartments] ([Id])
GO
ALTER TABLE [dbo].[Dues] CHECK CONSTRAINT [FK_Dues_Apartments]
GO
ALTER TABLE [dbo].[ElectricBills]  WITH CHECK ADD  CONSTRAINT [FK_ElectricBills_Bills] FOREIGN KEY([Id])
REFERENCES [dbo].[Bills] ([Id])
GO
ALTER TABLE [dbo].[ElectricBills] CHECK CONSTRAINT [FK_ElectricBills_Bills]
GO
ALTER TABLE [dbo].[GasBills]  WITH CHECK ADD  CONSTRAINT [FK_GasBills_Bills] FOREIGN KEY([Id])
REFERENCES [dbo].[Bills] ([Id])
GO
ALTER TABLE [dbo].[GasBills] CHECK CONSTRAINT [FK_GasBills_Bills]
GO
ALTER TABLE [dbo].[Landlords]  WITH CHECK ADD  CONSTRAINT [FK_Landlords_Users] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Landlords] CHECK CONSTRAINT [FK_Landlords_Users]
GO
ALTER TABLE [dbo].[Lessees]  WITH CHECK ADD  CONSTRAINT [FK_Lessees_Users] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Lessees] CHECK CONSTRAINT [FK_Lessees_Users]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users] FOREIGN KEY([SenderId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users1] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users1]
GO
ALTER TABLE [dbo].[Phones]  WITH CHECK ADD  CONSTRAINT [FK_Phones_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Phones] CHECK CONSTRAINT [FK_Phones_Users]
GO
ALTER TABLE [dbo].[WaterBills]  WITH CHECK ADD  CONSTRAINT [FK_WaterBills_Bills] FOREIGN KEY([Id])
REFERENCES [dbo].[Bills] ([Id])
GO
ALTER TABLE [dbo].[WaterBills] CHECK CONSTRAINT [FK_WaterBills_Bills]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ad"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 310
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 304
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 674
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "h"
            Begin Extent = 
               Top = 679
               Left = 48
               Bottom = 842
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ApartmentDetailViews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ApartmentDetailViews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 304
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "h"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 674
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ApartmentViews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ApartmentViews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "m"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 304
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "us"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 304
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MessageInformationViews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MessageInformationViews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "u"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 304
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserInformationViews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserInformationViews'
GO
