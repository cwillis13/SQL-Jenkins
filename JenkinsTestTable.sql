USE [BLAH]
GO

/****** Object:  Table [dbo].[JenkinsTestTable]    Script Date: 3/29/2021 3:14:01 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JenkinsTestTable](
	[VehicleTypeID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NOT NULL,
	[VehicleTypeDescription] [varchar](20) NOT NULL,
	[VehicleTypeGroupID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastUpdate] [datetime] NULL,
	[LastUserID] [int] NULL,
	[RowGUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_JenkinsTestTable] PRIMARY KEY NONCLUSTERED 
(
	[VehicleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
