
USE DW_fire_police_sample_data
BULK INSERT Time
FROM 'C:\Users\root\Desktop\fire_police_git\DW_fire_police\SampleData\Time.csv'
WITH 
(
    FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '0x0A',
    TABLOCK
);



BULK INSERT Worker
FROM 'C:\Users\root\Desktop\fire_police_git\DW_fire_police\SampleData\Worker.csv'
WITH (
    FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '0x0A',
    TABLOCK
);


BULK INSERT Vehicle
FROM 'C:\Users\root\Desktop\fire_police_git\DW_fire_police\SampleData\Vehicle.csv'
WITH (
    FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '0x0A',
    TABLOCK
);


BULK INSERT Date
FROM 'C:\Users\root\Desktop\fire_police_git\DW_fire_police\SampleData\Date.csv'
WITH 
(
	FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '0x0A',
    TABLOCK
);

BULK INSERT Location
FROM 'C:\Users\root\Desktop\fire_police_git\DW_fire_police\SampleData\Location.csv'
WITH 
(
	FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '0x0A',
    TABLOCK
);


BULK INSERT Intervention_type
FROM 'C:\Users\root\Desktop\fire_police_git\DW_fire_police\SampleData\Intervention_type.csv'
WITH 
(
	FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '0x0A',
    TABLOCK
);


BULK INSERT Fault
FROM 'C:\Users\root\Desktop\fire_police_git\DW_fire_police\SampleData\Fault.csv'
WITH 
(
	FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '0x0A',
    TABLOCK
);



BULK INSERT FACT_vehicle_inspection
FROM 'C:\Users\root\Desktop\fire_police_git\DW_fire_police\SampleData\FACT_vehicle_inspection.csv'
WITH 
(
	FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '0x0A',
    TABLOCK
);

BULK INSERT FACT_Worker_in_action
FROM 'C:\Users\root\Desktop\fire_police_git\DW_fire_police\SampleData\FACT_Worker_in_action.csv'
WITH 
(
	FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '0x0A',
    TABLOCK
);


BULK INSERT FACT_crew_on_intervention
FROM 'C:\Users\root\Desktop\fire_police_git\DW_fire_police\SampleData\FACT_crew_on_intervention.csv'
WITH 
(
	FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '0x0A',
    TABLOCK
);