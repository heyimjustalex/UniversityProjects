USE DW_fire_police_vsmall

GO
-- CREATE TABLE TO BULK LOAD FROM CSV
If (object_id('dbo.FaultTemp_T2') is not null) DROP TABLE dbo.FaultTemp_T2;
CREATE TABLE FaultTemp_T2(id_fault INT PRIMARY KEY,
   vin_number VARCHAR(40),
   registration_number VARCHAR(40),
   date_send TEXT,
   date_fixed TEXT,
   milage INT,
   car_element_name VARCHAR(50) NOT NULL,
   fault_severity INT,
   price INT,
   komentarz VARCHAR(100))
GO

BULK INSERT FaultTemp_T2
    FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\Other_data_sources\Small\MechanicReportT2.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ';',
        ROWTERMINATOR = '0x0A',
        TABLOCK
    )
go

-- TRANSFORM TABLE ETL

CREATE VIEW etlFault_T2 AS
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
	END AS price
FROM
	FaultTemp_T2
go



-- GROUPED TABLE

If (object_id('dbo.Fault_final_T2') is not null) DROP TABLE dbo.Fault_final_T2;
CREATE TABLE Fault_final_T2(
id_fault INT IDENTITY(1,1),
car_element_name VARCHAR(50),
fault_severity VARCHAR(10),
price VARCHAR(10))

GO

INSERT INTO DW_fire_police_vsmall.dbo.Fault_final_T2 (
	car_element_name,
	fault_severity,
	price)
SELECT
	car_element_name,
	fault_severity,
	price
FROM
	etlFault_T2 group by car_element_name,fault_severity,price

--SELECT * FROM DW_fire_police_vsmall.dbo.Fault_final_T2

--MERGE TO DATA WAREHOUSE
MERGE INTO Fault AS TARGET_T
USING Fault_final_T2 AS SOURCE_T
ON  SOURCE_T.id_fault = TARGET_T.id_fault
AND SOURCE_T.car_element_name= TARGET_T.car_element_name
AND SOURCE_T.fault_severity = TARGET_T.fault_severity
AND SOURCE_T.price = TARGET_T.price
WHEN NOT MATCHED 
THEN INSERT VALUES(SOURCE_T.car_element_name, SOURCE_T.fault_severity,SOURCE_T.price);

DROP VIEW etlFault_T2;
DROP TABLE FaultTemp_T2;


SELECT * FROM DW_fire_police_vsmall.dbo.Fault