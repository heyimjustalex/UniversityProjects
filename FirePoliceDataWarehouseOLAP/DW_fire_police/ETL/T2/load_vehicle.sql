use DW_fire_police_vsmall

If (object_id('dbo.temporary_vehicle_T2') is not null) DROP TABLE dbo.temporary_vehicle_T2;
create table temporary_vehicle_T2(
	id INT IDENTITY(1,1),
	vin_number varchar(40), 
	brand_name VARCHAR(40),
	model VARCHAR(40),	
	size VARCHAR(30) CHECK (size IN('SMALL', 'MEDIUM', 'BIG','LARGE')),
	registration_number VARCHAR(40),
	how_old VARCHAR(10) CHECK (how_old IN('OLD', 'MEDIUM', 'NEW')),
	date_of_production date,
	departures_number VARCHAR(15)

);
GO

INSERT INTO temporary_vehicle_T2(vin_number,brand_name, model,size,registration_number, departures_number,date_of_production) 
SELECT RDB_Vehicle.vin_number, RDB_Vehicle.brand_name, RDB_Vehicle.model,RDB_Vehicle.size, RDB_Vehicle.registration_number,RDB_Vehicle.departures_number,RDB_Vehicle.date_of_production
FROM RDB_fire_police_vsmall_T2.dbo.Vehicle AS RDB_Vehicle;



DECLARE @today_date date;
SET @today_date = '2022-01-01';

DECLARE @row_num_T2 int;
SELECT @row_num_T2 = COUNT (*) FROM RDB_fire_police_vsmall_T2.dbo.Vehicle;


DECLARE @i int;
SET @i = 1;

while @i < @row_num_T2+1
BEGIN

	DECLARE @vin_number_temp_T2 VARCHAR(40);
	DECLARE @id_temp_T2  int;
	DECLARE @year_date_subtracted_T2  int;
	DECLARE @date_temporary_T2  date;
	DECLARE @how_old_years_T2  int;

	--select single row

	SELECT @vin_number_temp_T2  = [vin_number],@id_temp_T2  = [id],@date_temporary_T2 =[date_of_production] 
	FROM temporary_vehicle_T2 
	WHERE id = @i;

	--calc number of years
	SELECT @year_date_subtracted_T2  = YEAR(@today_date) -  YEAR(@date_temporary_T2 );

	--SET enum T1
	IF(@year_date_subtracted_T2  < 8 )
	begin
		update temporary_vehicle_T2 
		set how_old = 'NEW'
		where id = @i;
	end

	ELSE IF(@year_date_subtracted_T2   >=8 AND @year_date_subtracted_T2   <= 20)
	begin
		update temporary_vehicle_T2 
		set how_old = 'MEDIUM'
		where id = @i;
	end

	ELSE
	begin
		update temporary_vehicle_T2 
		set how_old = 'OLD'
		where id = @i;
	end
	

	SET @i = @i +1;
	
END;

SELECT * FROM temporary_vehicle_T2;

MERGE INTO Vehicle AS TARGET_T
USING temporary_vehicle_T2 AS SOURCE_T
ON  SOURCE_T.vin_number = TARGET_T.vin_number
AND SOURCE_T.brand_name= TARGET_T.brand_name
AND SOURCE_T.model = TARGET_T.model
AND SOURCE_T.size = TARGET_T.size
AND SOURCE_T.registration_number= TARGET_T.registration_number
AND SOURCE_T.how_old = TARGET_T.how_old
AND SOURCE_T.departures_number = TARGET_T.departures_number

WHEN NOT MATCHED 
THEN INSERT VALUES(SOURCE_T.vin_number, SOURCE_T.brand_name, SOURCE_T.model,SOURCE_T.size , 
SOURCE_T.registration_number, SOURCE_T.how_old, SOURCE_T.departures_number);


--drop temporary table
--DROP TABLE temporary_vehicle_T1;

SELECT * FROM DW_fire_police_vsmall.dbo.Vehicle