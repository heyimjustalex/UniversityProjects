USE DW_fire_police_vsmall

GO
If (object_id('dbo.MechanicTmp') is not null) DROP TABLE dbo.MechanicTmp;
CREATE TABLE MechanicTmp(id_fault INT PRIMARY KEY,
   vin_number VARCHAR(40),
   registration_number VARCHAR(40),
   date_send DATE,
   date_fixed DATE,
   milage INT,
   car_element_name VARCHAR(50) NOT NULL,
   fault_severity INT,
   price INT,
   komentarz VARCHAR(100))
GO

BULK INSERT MechanicTmp
    FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\Other_data_sources\Small\MechanicReportT2.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ';',
        ROWTERMINATOR = '0x0A',
        TABLOCK
    )
go

GO
CREATE TABLE code_and_location(
	code VARCHAR(6), 
	region VARCHAR(40) NOT NULL,
	city VARCHAR(40) NOT NULL)
GO
--Pobieranie tablicy dekoduj¹cej code
INSERT INTO code_and_location (code,region,city) 
SELECT code,region,city
FROM RDB_fire_police_vsmall_T1.dbo.Facility
go
--Widok pomocniczy
CREATE VIEW etlMechanic AS
SELECT
	id_fault,
	car_element_name,
	CASE 
		WHEN fault_severity = 10 THEN 'CRITICAL'
		WHEN fault_severity > 6 THEN 'HIGH'
		WHEN fault_severity > 3 THEN 'MEDIUM'
		WHEN fault_severity > 0 THEN 'LOW'
		ELSE 'NONE'
	END AS fault_severity,

	CASE
		WHEN price > 9000 THEN 'LARGE'
		WHEN price > 6000 THEN 'BIG'
		WHEN price > 3000 THEN 'MEDIUM'
		WHEN price > 0 THEN 'LOW'
		ELSE 'NONE'
	END AS priceType
FROM
	MechanicTmp
go


create table tempInspection(
	id_vehicle_vin int,
	id_fault int,
	id_facility_location int,
	id_date_of_visit_at_mechanics int,
	days_fix_duration int,
	cost float
	);

	SELECT * FROM etlMechanic

INSERT INTO tempInspection(
	id_vehicle_vin,
	id_fault,
	id_facility_location,
	id_date_of_visit_at_mechanics,
	days_fix_duration,
	cost)
SELECT
    DWVehicle.id_vehicle,
	Fault.id_fault,
	Location.id_location as id_facility_location,
	Date.id_date as id_date_of_visit_at_mechanics,
	DATEDIFF(DAY, date_send,date_fixed)+1 as IloscDni,
	MechanicTmp.price as cost
FROM 
	MechanicTmp 
	--pojazd
	INNER JOIN DW_fire_police_vsmall.dbo.Vehicle as DWVehicle ON DWVehicle.vin_number = MechanicTmp.vin_number
	--lokalizacja
	INNER JOIN RDB_fire_police_vsmall_T1.dbo.Vehicle ON MechanicTmp.vin_number = Vehicle.vin_number
	INNER JOIN RDB_fire_police_vsmall_T1.dbo.Facility ON RDB_fire_police_vsmall_T1.dbo.Vehicle.code_facility = Facility.code
	INNER JOIN DW_fire_police_vsmall.dbo.Location ON Location.closest_city = Facility.city and Location.region = Facility.region and Location.name = 'LocationOfFirepolice'
	--usterka
	INNER JOIN DW_fire_police_vsmall.dbo.etlMechanic ON MechanicTmp.id_fault = etlMechanic.id_fault 
	INNER JOIN DW_fire_police_vsmall.dbo.Fault ON etlMechanic.priceType = Fault.price AND etlMechanic.fault_severity = Fault.fault_severity AND etlMechanic.car_element_name = Fault.car_element_name
	--data
	INNER JOIN DW_fire_police_vsmall.dbo.Date ON Date.year = year(date_send) AND Date.month = month(date_send) AND Date.day= day(date_send);




MERGE INTO  DW_fire_police_vsmall.dbo.FACT_vehicle_inspection AS TARGET_FACT
USING tempInspection AS SOURCE_FACT
ON  SOURCE_FACT.id_vehicle_vin= TARGET_FACT.id_vehicle_vin
AND SOURCE_FACT.id_fault = TARGET_FACT.id_fault
AND SOURCE_FACT.id_facility_location = TARGET_FACT.id_facility_location
AND SOURCE_FACT.id_date_of_visit_at_mechanics= TARGET_FACT.id_date_of_visit_at_mechanics
AND SOURCE_FACT.days_fix_duration = TARGET_FACT.days_fix_duration
AND SOURCE_FACT.cost = TARGET_FACT.cost
WHEN NOT MATCHED 
THEN INSERT VALUES
(
SOURCE_FACT.id_vehicle_vin, 
SOURCE_FACT.id_fault, 
SOURCE_FACT.id_facility_location, 
SOURCE_FACT.id_date_of_visit_at_mechanics, 
SOURCE_FACT.days_fix_duration,
SOURCE_FACT.cost);



DROP TABLE code_and_location
DROP TABLE dbo.MechanicTmp
DROP VIEW etlMechanic
DROP TABLE tempInspection
--SELECT vin_number,code_facility FROM RDB_fire_police_vsmall_T1.dbo.Vehicle
--SELECT code,city FROM RDB_fire_police_vsmall_T1.dbo.Facility

SELECT * FROM DW_fire_police_vsmall.dbo.FACT_vehicle_inspection

