USE [eResource Scheduler]
GO

/****** Object:  Table [dbo].[ResourceTypeMaster]    Script Date: 01/09/2014 12:52:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ResourceTypeMaster](
	[Id] INT IDENTITY PRIMARY KEY,
	[Name] [nvarchar](max) NULL,
	[IsHuman] INT NULL,
	[Last_Updated] [datetime] NULL,
	[Is_Deleted] INT NULL,
	[ModifiedBy] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

INSERT INTO dbo.ResourceTypeMaster
	(
			Name,
			IsHuman,
			Last_Updated,
			Is_Deleted,
			ModifiedBy
	)
SELECT 
      [Name]
      ,[IsHuman]
      ,[Last_Updated]
      ,[Is_Deleted]
      ,[ModifiedBy]
  FROM [eResource Scheduler].[dbo].[ResourceTypeMasterCopy]
  GROUP BY 
	Name,
	IsHuman,
	Last_Updated,
	Is_Deleted,
	ModifiedBy


GO

