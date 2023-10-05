USE DW_fire_police_vsmall

GO
If (object_id('dbo.InterventionType_T2') is not null) DROP TABLE dbo.InterventionType_T2;
CREATE TABLE InterventionTypeTemp_T2(
   code INT IDENTITY(1,1),
   name VARCHAR(40),
   severity INT);
GO

INSERT INTO InterventionTypeTemp_T2(name,severity) 
SELECT name,severity FROM RDB_fire_police_vsmall_T2.dbo.Intervention_type;

GO

CREATE VIEW etlInterventionType_View_T2 AS
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
	InterventionTypeTemp_T2
go

If (object_id('dbo.InterventionTypeTemp_T2_Final') is not null) DROP TABLE DW_fire_police_vsmall.dbo.InterventionTypeTemp_T2_Final;
CREATE TABLE InterventionTypeTemp_T2_Final(
   code INT IDENTITY(1,1),
   name VARCHAR(20),
   severity VARCHAR(10));
GO

INSERT INTO DW_fire_police_vsmall.dbo.InterventionTypeTemp_T2_Final(	
	name,
	severity)
SELECT
	
	name,
	severity 
FROM
	etlInterventionType_View_T2
GROUP BY name,severity

GO

MERGE INTO Intervention_type AS TARGET_T
USING DW_fire_police_vsmall.dbo.InterventionTypeTemp_T2_Final AS SOURCE_T
ON  SOURCE_T.name = TARGET_T.name
AND SOURCE_T.severity= TARGET_T.severity

WHEN NOT MATCHED 
THEN INSERT VALUES(SOURCE_T.name,SOURCE_T.severity);





DROP VIEW etlInterventionType_View_T2
DROP TABLE InterventionTypeTemp_T2

SELECT * FROM DW_fire_police_vsmall.dbo.Intervention_type