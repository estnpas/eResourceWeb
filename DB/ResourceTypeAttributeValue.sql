USE [eResource Scheduler]
GO

/****** Object:  Table [dbo].[ResourceTypeAttributeValue]    Script Date: 01/09/2014 12:52:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ResourceTypeAttributeValue](
	[AttributeValueId] INT IDENTITY PRIMARY KEY,
	[AttributeId] INT NULL,
	[AttributeValue] [nvarchar](max) NULL,
	[Last_Updated] [datetime] NULL,
	[Is_Deleted] INT NULL,
	[ModifiedBy] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

INSERT INTO dbo.ResourceTypeAttributeValue
(
	AttributeId,
	AttributeValue,
	Last_Updated,
	Is_Deleted,
	ModifiedBy
)
SELECT 
       [AttributeId]
      ,[AttributeValue]
      ,[Last_Updated]
      ,[Is_Deleted]
      ,[ModifiedBy]
  FROM [eResource Scheduler].[dbo].[ResourceTypeAttributeValueCopy]
  GROUP BY
	AttributeId,
	AttributeValue,
	Last_Updated,
	Is_Deleted,
	ModifiedBy

GO

