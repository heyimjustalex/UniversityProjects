USE DW_fire_police_vsmall

GO
If (object_id('dbo.LocationTemp') is not null) DROP TABLE dbo.LocationTemp;
CREATE TABLE LocationTemp(
   id_location INT IDENTITY(1,1) PRIMARY KEY,
   name VARCHAR(50),
   region VARCHAR(40),
   district VARCHAR(10),
   closest_city VARCHAR(40));
GO

INSERT INTO LocationTemp (name,region,district,closest_city) 
SELECT 'LocationOfFirepolice',f.region,f.district,f.city 
FROM RDB_fire_police_vsmall_T1.dbo.Facility AS f;

SELECT * FROM RDB_fire_police_vsmall_T1.dbo.Facility

INSERT INTO LocationTemp (name,region,closest_city) 
SELECT 'LocationOfIntervention',region,closest_city 
FROM RDB_fire_police_vsmall_T1.dbo.Intervention;

SELECT * FROM RDB_fire_police_vsmall_T1.dbo.Intervention
SELECT name,region,district,closest_city FROM LocationTemp GROUP BY name,region,district,closest_city

INSERT INTO DW_fire_police_vsmall.dbo.Location (
	name,
	region,
	district,
	closest_city
	)
SELECT name,region,district,closest_city FROM LocationTemp GROUP BY name,region,district,closest_city



DROP TABLE dbo.LocationTemp

SELECT * FROM DW_fire_police_vsmall.dbo.Location 