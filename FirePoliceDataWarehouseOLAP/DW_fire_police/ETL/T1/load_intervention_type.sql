USE DW_fire_police_vsmall

GO
If (object_id('dbo.InterventionTypeTemp') is not null) DROP TABLE dbo.InterventionTypeTemp;
CREATE TABLE InterventionTypeTemp(
   code INT IDENTITY(1,1),
   name VARCHAR(40),
   severity INT);
GO


INSERT INTO InterventionTypeTemp(name,severity) 
SELECT name,severity FROM RDB_fire_police_vsmall_T1.dbo.Intervention_type;

GO

If (object_id('dbo.Intervention_type_NOT_GROUPED') is not null) DROP TABLE dbo.Intervention_type_NOT_GROUPED;
CREATE TABLE Intervention_type_NOT_GROUPED(
   code INT IDENTITY(1,1),
   name VARCHAR(40),
   severity VARCHAR(10));
GO


CREATE VIEW etlInterventionType_View AS
SELECT
	name,
	CASE 
		WHEN severity = 10 THEN 'CRITICAL'
		WHEN severity > 6 THEN 'HIGH'
		WHEN severity> 3 THEN 'MEDIUM'
		WHEN severity > 0 THEN 'LOW'
		ELSE 'NONE'
	END AS severity
	
FROM
	InterventionTypeTemp
go

INSERT INTO DW_fire_police_vsmall.dbo.Intervention_type_NOT_GROUPED(	
	name,
	severity)
SELECT
	
	name,
	severity
FROM
	etlInterventionType_View
GO


-- Insert GROUPED VALUES
INSERT INTO DW_fire_police_vsmall.dbo.Intervention_type(	
	name,
	severity)
SELECT	
	name,
	severity
FROM
	etlInterventionType_View

GROUP BY name,severity


DROP VIEW etlInterventionType_View
DROP TABLE InterventionTypeTemp

SELECT * FROM DW_fire_police_vsmall.dbo.Intervention_type