USE [FirstAspNetMvcWeb]
GO
/****** Object:  Table [dbo].[About]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
	[MetaTitle] [nchar](10) NULL,
	[Descriptions] [nchar](10) NULL,
	[Image] [nchar](10) NULL,
	[Details] [nchar](10) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Descriptions] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [int] NULL,
	[Details] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[CountViews] [int] NULL,
	[Tags] [int] NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleCategory]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[ParentID] [int] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ArticleCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleTag]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleTag](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_ArticleTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ArticleID] [bigint] NOT NULL,
	[TagID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[GroupID] [varchar](50) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nchar](11) NULL,
	[Address] [nvarchar](250) NULL,
	[Content] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [nvarchar](150) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](150) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Descriptions] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludeVAT] [bit] NULL,
	[Quantity] [int] NULL,
	[CategoryID] [int] NULL,
	[Details] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[CountViews] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[ParentID] [int] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlideHome]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlideHome](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](100) NULL,
	[Descriptions] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SlideHome] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [nvarchar](50) NULL,
	[Name] [nvarchar](250) NULL,
	[Type] [nvarchar](250) NULL,
	[Value] [nvarchar](250) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[GroupID] [varchar](50) NULL,
	[Name] [nvarchar](150) NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nchar](11) NULL,
	[Address] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Avatar] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 5/23/2018 01:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Status]) VALUES (1, N'<div class="contact_info_title">Phone</div>
<div class="contact_info_text">+38 068 005 3570</div>', 1)
INSERT [dbo].[Contact] ([ID], [Content], [Status]) VALUES (2, N'<div class="contact_info_title">Email</div>
<div class="contact_info_text">fastsales@gmail.com</div>
', 1)
INSERT [dbo].[Contact] ([ID], [Content], [Status]) VALUES (3, N'<div class="contact_info_title">Địa chỉ</div>
<div class="contact_info_text">02 Tô Ký, Công viên Phần mềm Quang Trung, Quận 12, TpHCM</div>
', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
INSERT [dbo].[Credential] ([GroupID], [RoleID]) VALUES (N'ADMIN', N'ADD_USER')
INSERT [dbo].[Credential] ([GroupID], [RoleID]) VALUES (N'ADMIN', N'EDIT_USER')
INSERT [dbo].[Credential] ([GroupID], [RoleID]) VALUES (N'ADMIN', N'VIEW_USER')
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Email], [Phone], [Address], [Content], [CreatedDate], [Status]) VALUES (1, N'dssda', N'phanthainguyen304@gmail.com', N'09360671647', NULL, N'Xin chào', NULL, NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Email], [Phone], [Address], [Content], [CreatedDate], [Status]) VALUES (2, N'dssda', N'phanthainguyen304@gmail.com', N'09360671647', NULL, N'zxcxzc', NULL, NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Email], [Phone], [Address], [Content], [CreatedDate], [Status]) VALUES (3, N'dssda', N'phanthainguyen304@gmail.com', N'09360671647', NULL, N'xin chào', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'/', 1, N'_seft', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Giới thiệu', N'About', 2, N'_seft', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Bài viết', N'Article', 3, N'_seft', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Liên hệ', N'Contact', 4, N'_seft', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'PC & Laptop', N'pc-laptop', 1, N'_seft', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Camera', N'camera', 2, N'_seft', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Điện thoại', N'dien-thoai', 3, N'_seft', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (8, N'TV', N'ti-vi', 4, N'_seft', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (9, N'Tủ lạnh', N'tu-lanh', 5, N'_seft', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Main menu')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Catagory menu')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Details], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [MetaDescriptions], [MetaKeywords], [Status], [TopHot], [CountViews]) VALUES (1, N'Galaxy J5 Prime', N'Galaxy J5 Prime', N'Galaxy J5 Prime - sản phẩm mới', N'banner_product-20180522214804.png', NULL, CAST(5000000 AS Decimal(18, 0)), NULL, 1, 100, 1, N'Galaxy J5 Prime - sản phẩm mới -chi tiết', CAST(N'2018-05-22T21:48:04.260' AS DateTime), NULL, N'admin', NULL, N'Galaxy J5 Prime - sản phẩm mới -chi tiết', N'Galaxy J5 Prime - sản phẩm mới -chi tiết', 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Details], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [MetaDescriptions], [MetaKeywords], [Status], [TopHot], [CountViews]) VALUES (2, N'LUNA Smartphone', N'LUNA Smartphone', N'LUNA Smartphone', N'featured_4-20180522232345.png', NULL, CAST(4000000 AS Decimal(18, 0)), NULL, 1, 20, 1, N'LUNA Smartphone', CAST(N'2018-05-22T23:23:45.953' AS DateTime), NULL, N'admin', NULL, N'LUNA Smartphone', N'LUNA Smartphone', 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Details], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [MetaDescriptions], [MetaKeywords], [Status], [TopHot], [CountViews]) VALUES (3, N'Samsung J330F', N'Samsung J330F', N'Samsung J330F', N'featured_6-20180522232520.png', NULL, CAST(6500000 AS Decimal(18, 0)), NULL, 1, 50, 1, N'Samsung J330F', CAST(N'2018-05-22T23:25:20.833' AS DateTime), NULL, N'admin', NULL, N'Samsung J330F', N'Samsung J330F', 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Details], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [MetaDescriptions], [MetaKeywords], [Status], [TopHot], [CountViews]) VALUES (4, N'Nokia 3310 (2017)', N'Nokia 3310 (2017)', N'Nokia 3310 (2017)', N'new_6-20180522232635.jpg', NULL, CAST(4000000 AS Decimal(18, 0)), NULL, 1, 20, 1, N'Nokia 3310 (2017)', CAST(N'2018-05-22T23:26:35.690' AS DateTime), NULL, N'admin', NULL, N'Nokia 3310 (2017)', N'Nokia 3310 (2017)', 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Details], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [MetaDescriptions], [MetaKeywords], [Status], [TopHot], [CountViews]) VALUES (5, N'Lenovo IdeaPad', N'Lenovo IdeaPad', N'Lenovo IdeaPad', N'featured_7-20180523002706.png', NULL, CAST(10000000 AS Decimal(18, 0)), NULL, 1, 20, 2, N'Galaxy J5 Prime - sản phẩm mới -chi tiết', CAST(N'2018-05-23T00:27:06.367' AS DateTime), NULL, N'admin', NULL, N'Lenovo IdeaPad', N'Lenovo IdeaPad', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [SeoTitle], [MetaKeywords], [MetaDescriptions], [ParentID], [DisplayOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [ShowOnHome]) VALUES (1, N'Điện thoại', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-05-23T00:04:11.003' AS DateTime), NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [SeoTitle], [MetaKeywords], [MetaDescriptions], [ParentID], [DisplayOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [ShowOnHome]) VALUES (2, N'PC & Laptop', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-05-23T00:04:22.757' AS DateTime), NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [SeoTitle], [MetaKeywords], [MetaDescriptions], [ParentID], [DisplayOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [ShowOnHome]) VALUES (3, N'Ti vi', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-05-23T00:04:31.390' AS DateTime), NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [SeoTitle], [MetaKeywords], [MetaDescriptions], [ParentID], [DisplayOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [ShowOnHome]) VALUES (4, N'Tủ lạnh', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-05-23T00:04:37.070' AS DateTime), NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [SeoTitle], [MetaKeywords], [MetaDescriptions], [ParentID], [DisplayOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [ShowOnHome]) VALUES (5, N'Máy giặt', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-05-23T00:04:42.843' AS DateTime), NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_ARTICLE', N'Thêm bài')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_PRODUCT', N'Thêm sp')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_USER', N'Thêm user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_ARTICLE', N'Xóa bài')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_PRODUCT', N'Xóa sp')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', N'Xóa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_ARTICLE', N'Sửa bài')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_PRODUCT', N'Sửa sp')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', N'Sửa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem user')
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Email], [Phone], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Avatar], [Status]) VALUES (1, N'admin', N'admin', N'ADMIN', N'Nguyên', N'admin@tnfan.vn', N'0936071647 ', N'DHT26', CAST(N'2018-05-20T15:38:08.173' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'1', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Email], [Phone], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Avatar], [Status]) VALUES (6, N'ptnguyen', N'ptnguyen', N'MEMBER', NULL, N'abc@ac.vn', N'09360671647', N'2efd  df', CAST(N'2018-05-21T00:30:12.180' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Email], [Phone], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Avatar], [Status]) VALUES (13, N'user102', N'user102', N'MEMBER', NULL, N'123@tma.com.vn', N'0909090909 ', NULL, CAST(N'2018-05-22T09:58:40.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'1', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Email], [Phone], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Avatar], [Status]) VALUES (14, N'user103', N'user103', N'MEMBER', NULL, N'234@tma.com.vn', N'0908070605 ', NULL, CAST(N'2018-05-22T09:59:01.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'1', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Email], [Phone], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Avatar], [Status]) VALUES (15, N'user104', N'user104', N'MEMBER', NULL, N'member@tma.com.vn', N'0903070598 ', NULL, CAST(N'2018-05-22T09:59:31.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'1', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Admin')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MOD', N'Mode')
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ArticleCategory] ADD  CONSTRAINT [DF_ArticleCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ArticleCategory] ADD  CONSTRAINT [DF_ArticleCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ArticleCategory] ADD  CONSTRAINT [DF_ArticleCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Footer] ADD  CONSTRAINT [DF_Footer_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[SlideHome] ADD  CONSTRAINT [DF_SlideHome_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[SlideHome] ADD  CONSTRAINT [DF_SlideHome_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SlideHome] ADD  CONSTRAINT [DF_SlideHome_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [GroupID]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Status]  DEFAULT ((1)) FOR [Avatar]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Status_1]  DEFAULT ((0)) FOR [Status]
GO
