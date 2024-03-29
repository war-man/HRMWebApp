CREATE TABLE [dbo].[Users](
	[Username] [nvarchar](50) NOT NULL,
	[Salt] [nvarchar](50) NULL,
	[Password] [nvarchar](200) NULL,
	[FullName] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[Gender] [nvarchar](5) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[EditedAt] [datetime] NULL,
	[EditedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[AuthorityGroups](
	[Id] [nvarchar](50) NOT NULL,
	[AuthorityGroupName] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.AuthorityGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[UserAuthorities](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[AuthorityGroupId] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[EditedAt] [datetime] NULL,
	[EditedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.UserAuthorities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Payslip](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PayslipMonth] [int] NOT NULL,
	[PayslipYear] [int] NOT NULL,
	[LuongCung] [float] NULL,
	[PhuCap] [float] NULL,
	[ThucLinh] [float] NULL,
 CONSTRAINT [PK_Payslip_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT [dbo].[Users] ([Username], [Salt], [Password], [FullName], [Phone], [Address], [Gender], [Status], [CreatedAt], [CreatedBy], [EditedAt], [EditedBy]) VALUES (N'administrator', N'taUBl', N'cd1ed6520e68b8921b318cad5a9c0c81', N'Administrator', N'', N'', N'Nam', 1, CAST(N'2021-03-01 00:00:00.000' AS DateTime), N'Administrator', NULL, NULL)
INSERT [dbo].[Users] ([Username], [Salt], [Password], [FullName], [Phone], [Address], [Gender], [Status], [CreatedAt], [CreatedBy], [EditedAt], [EditedBy]) VALUES (N'hien', N'taUBl', N'cd1ed6520e68b8921b318cad5a9c0c81', N'Hiển', N'', N'', N'Nam', 1, CAST(N'2021-03-01 00:00:00.000' AS DateTime), N'Administrator', NULL, NULL)
INSERT [dbo].[Users] ([Username], [Salt], [Password], [FullName], [Phone], [Address], [Gender], [Status], [CreatedAt], [CreatedBy], [EditedAt], [EditedBy]) VALUES (N'khanh', N'taUBl', N'cd1ed6520e68b8921b318cad5a9c0c81', N'Khánh', N'', N'', N'Nam', 1, CAST(N'2021-03-01 00:00:00.000' AS DateTime), N'Administrator', NULL, NULL)

INSERT [dbo].[AuthorityGroups] ([Id], [AuthorityGroupName]) VALUES (N'Admin', N'Quyền quản trị')
INSERT [dbo].[AuthorityGroups] ([Id], [AuthorityGroupName]) VALUES (N'CreateUser', N'Quyền tạo tài khoản')
INSERT [dbo].[AuthorityGroups] ([Id], [AuthorityGroupName]) VALUES (N'UploadPayslip', N'Quyền tải lên bảng lương')
INSERT [dbo].[AuthorityGroups] ([Id], [AuthorityGroupName]) VALUES (N'ViewPayslip', N'Quyền xem bảng lương')
SET IDENTITY_INSERT [dbo].[UserAuthorities] ON 

INSERT [dbo].[UserAuthorities] ([Id], [Username], [AuthorityGroupId], [CreatedAt], [CreatedBy], [EditedAt], [EditedBy]) VALUES (1, N'administrator', N'Admin', CAST(N'2021-03-01 00:00:00.000' AS DateTime), N'Administrator', NULL, NULL)
INSERT [dbo].[UserAuthorities] ([Id], [Username], [AuthorityGroupId], [CreatedAt], [CreatedBy], [EditedAt], [EditedBy]) VALUES (2, N'khanh', N'CreateUser', CAST(N'2021-03-01 00:00:00.000' AS DateTime), N'Administrator', NULL, NULL)
INSERT [dbo].[UserAuthorities] ([Id], [Username], [AuthorityGroupId], [CreatedAt], [CreatedBy], [EditedAt], [EditedBy]) VALUES (6, N'khanh', N'UploadPayslip', CAST(N'2021-03-01 00:00:00.000' AS DateTime), N'Administrator', NULL, NULL)
INSERT [dbo].[UserAuthorities] ([Id], [Username], [AuthorityGroupId], [CreatedAt], [CreatedBy], [EditedAt], [EditedBy]) VALUES (7, N'khanh', N'ViewPayslip', CAST(N'2021-03-01 00:00:00.000' AS DateTime), N'Administrator', NULL, NULL)
INSERT [dbo].[UserAuthorities] ([Id], [Username], [AuthorityGroupId], [CreatedAt], [CreatedBy], [EditedAt], [EditedBy]) VALUES (8, N'hien', N'ViewPayslip', CAST(N'2021-03-01 00:00:00.000' AS DateTime), N'Administrator', NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserAuthorities] OFF

ALTER DATABASE [HRM] SET  READ_WRITE 
GO
