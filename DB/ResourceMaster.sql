USE [eResource Scheduler]
GO

/****** Object:  Table [dbo].[ResourceMasterCopy]    Script Date: 01/09/2014 12:24:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ResourceMaster](
	[ResourceId] INT IDENTITY PRIMARY KEY,
	[ResourceName] [nvarchar](max) NULL,
	[TypeId] INT NULL,
	[ManagerId] INT NULL,
	[Status] INT NULL,
	[DesignationId] INT NULL,
	[RegionId] INT NULL,
	[OfficeId] INT NULL,
	[DepartmentId] INT NULL,
	[TeamId] INT NULL,
	[Email] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[StartDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[Phone] [nvarchar](max) NULL,
	[TimeSheetApproval] INT NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[Last_Updated] [datetime] NULL,
	[Is_Deleted] INT NULL,
	[ModifiedBy] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

insert into dbo.ResourceMaster (
		ResourceName,
		TypeId,
		ManagerId,
		Status,
		DesignationId,
		RegionId,
		OfficeId,
		DepartmentId,
		TeamId,
		Email,
		Notes,
		StartDate,
		TerminationDate,
		Phone,
		TimeSheetApproval,
		UpdatedBy,
		UpdateDate,
		Last_Updated,
		Is_Deleted,
		ModifiedBy)
	SELECT 	ResourceName,
		TypeId,
		ManagerId,
		Status,
		DesignationId,
		RegionId,
		OfficeId,
		DepartmentId,
		TeamId,
		Email,
		Notes,
		StartDate,
		TerminationDate,
		Phone,
		TimeSheetApproval,
		UpdatedBy,
		UpdateDate,
		Last_Updated,
		Is_Deleted,
		ModifiedBy
	FROM dbo.ResourceMasterCopy
	WHERE ModifiedBy is NOT NULL
	GROUP BY 
		ResourceName,
		TypeId,
		ManagerId,
		Status,
		DesignationId,
		RegionId,
		OfficeId,
		DepartmentId,
		TeamId,
		Email,
		Notes,
		StartDate,
		TerminationDate,
		Phone,
		TimeSheetApproval,
		UpdatedBy,
		UpdateDate,
		Last_Updated,
		Is_Deleted,
		ModifiedBy

GO

