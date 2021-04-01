/****** Object:  StoredProcedure [dbo].[JenkinsTestTable_load]    Script Date: 3/29/2021 3:09:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[JenkinsTestTable_load]
as
BEGIN

     insert into dbo.JenkinsTestTable (SiteID,
	VehicleTypeDescription,
	VehicleTypeGroupID,
	IsActive,
	LastUpdate,
	LastUserID,
	RowGUID) 
select SiteID,
	VehicleTypeDescription,
	VehicleTypeGroupID,
	IsActive,
	LastUpdate,
	LastUserID,
	RowGUID
from dbo.tblVehicleType 
     
END

GO
