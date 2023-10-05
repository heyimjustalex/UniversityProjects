USE DW_fire_police_vsmall

GO
If (object_id('dbo.FaultTemp') is not null) DROP TABLE dbo.FaultTemp;
CREATE TABLE FaultTemp(id_fault INT PRIMARY KEY,
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

BULK INSERT FaultTemp
    FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\Other_data_sources\Small\MechanicReportT1.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ';',
        ROWTERMINATOR = '0x0A',
        TABLOCK
    )
go

CREATE VIEW etlFault AS
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
	FaultTemp
go

INSERT INTO DW_fire_police_vsmall.dbo.Fault (
	car_element_name,
	fault_severity,
	price)
SELECT
	car_element_name,
	fault_severity,
	price
FROM
	etlFault group by car_element_name,fault_severity,price


DROP VIEW etlFault
DROP TABLE dbo.FaultTemp

SELECT * FROM DW_fire_police_vsmall.dbo.Fault