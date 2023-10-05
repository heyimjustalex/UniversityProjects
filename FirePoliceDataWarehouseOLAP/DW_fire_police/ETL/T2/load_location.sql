USE DW_fire_police_vsmall

GO
If (object_id('dbo.LocationTemp_T2') is not null) DROP TABLE dbo.LocationTemp_T2;
CREATE TABLE LocationTemp_T2(
   id_location INT IDENTITY(1,1) PRIMARY KEY,
   name VARCHAR(50),
   region VARCHAR(40),
   district VARCHAR(10),
   closest_city VARCHAR(40));
GO

INSERT INTO LocationTemp_T2 (name,region,district,closest_city) 
SELECT 'LocationOfFirepolice',f.region,f.district,f.city 
FROM RDB_fire_police_vsmall_T2.dbo.Facility AS f;

SELECT * FROM RDB_fire_police_vsmall_T2.dbo.Facility

INSERT INTO LocationTemp_T2 (name,region,closest_city) 
SELECT 'LocationOfIntervention',region,closest_city 
FROM RDB_fire_police_vsmall_T2.dbo.Intervention;

--SELECT * FROM RDB_fire_police_vsmall_T2.dbo.Intervention
--SELECT name,region,district,closest_city FROM LocationTemp_T2 GROUP BY name,region,district,closest_city

If (object_id('dbo.LocationTemp_T2_Final') is not null) DROP TABLE dbo.LocationTemp_T2_Final;
CREATE TABLE LocationTemp_T2_Final(
   id_location INT IDENTITY(1,1) PRIMARY KEY,
   name VARCHAR(50),
   region VARCHAR(40),
   district VARCHAR(10),
   closest_city VARCHAR(40));
GO


INSERT INTO DW_fire_police_vsmall.dbo.LocationTemp_T2_Final (
	name,
	region,
	district,
	closest_city
	)
SELECT name,region,district,closest_city FROM LocationTemp_T2 GROUP BY name,region,district,closest_city

--MERGE TO DATA WAREHOUSE
MERGE INTO DW_fire_police_vsmall.dbo.Location AS TARGET_T
USING LocationTemp_T2_Final AS SOURCE_T
ON  SOURCE_T.id_location = TARGET_T.id_location
AND SOURCE_T.name= TARGET_T.name
AND SOURCE_T.region = TARGET_T.region
AND SOURCE_T.district = TARGET_T.district
AND SOURCE_T.closest_city = TARGET_T.closest_city
WHEN NOT MATCHED 
THEN INSERT VALUES(SOURCE_T.name, SOURCE_T.region,SOURCE_T.district,SOURCE_T.closest_city);




DROP TABLE dbo.LocationTemp_T2

SELECT * FROM DW_fire_police_vsmall.dbo.Location 