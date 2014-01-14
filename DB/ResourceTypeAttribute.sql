USE [eResource Scheduler]
GO

/****** Object:  Table [dbo].[ResourceTypeAttribute]    Script Date: 01/09/2014 12:52:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ResourceTypeAttribute](
	[Id] INT IDENTITY PRIMARY KEY,
	[ResourceTypeId] INT NULL,
	[Name] [nvarchar](max) NULL,
	[Last_Updated] [datetime] NULL,
	[Is_Deleted] INT NULL,
	[ModifiedBy] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

INSERT INTO dbo.ResourceTypeAttribute
(
	ResourceTypeId,
	Name,
	Last_Updated,
	Is_Deleted,
	ModifiedBy
)
SELECT 
      [ResourceTypeId]
      ,[Name]
      ,[Last_Updated]
      ,[Is_Deleted]
      ,[ModifiedBy]
  FROM [eResource Scheduler].[dbo].[ResourceTypeAttributeCopy]
  GROUP BY
	ResourceTypeId,
	Name,
	Last_Updated,
	Is_Deleted,
	ModifiedBy

GO

