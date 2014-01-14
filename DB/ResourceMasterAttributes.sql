USE [eResource Scheduler]
GO

/****** Object:  Table [dbo].[ResourceMasterAttributes]    Script Date: 01/09/2014 12:52:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ResourceMasterAttributes](
	[Id] INT IDENTITY PRIMARY KEY,
	[ResourceId] INT NULL,
	[AttributeId] INT NULL,
	[AttributeValueId] INT NULL,
	[Last_Updated] [datetime] NULL,
	[Is_Deleted] INT NULL,
	[ModifiedBy] [nvarchar](255) NULL
) ON [PRIMARY]

INSERT INTO dbo.ResourceMasterAttributes
	(
			ResourceId,
			AttributeId,
			AttributeValueId,
			Last_Updated,
			Is_Deleted,
			ModifiedBy
	)
SELECT
       [ResourceId]
      ,[AttributeId]
      ,[AttributeValueId]
      ,[Last_Updated]
      ,[Is_Deleted]
      ,[ModifiedBy]
  FROM [eResource Scheduler].[dbo].[ResourceMasterAttributesCopy]
  GROUP BY 
		ResourceId,
		AttributeId,
		AttributeValueId,
		Last_Updated,
		Is_Deleted,
		ModifiedBy

GO

