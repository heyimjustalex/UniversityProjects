use DW_fire_police_vsmall
GO

DECLARE @today_date date;
SET @today_date = '2022-01-01';
DECLARE @row_num int;
SELECT @row_num = COUNT (*) FROM RDB_fire_police_vsmall_T1.dbo.Vehicle;


create table temporary_vehicle(
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

INSERT INTO temporary_vehicle(vin_number,brand_name, model,size,registration_number, departures_number,date_of_production) 
SELECT RDB_Vehicle.vin_number, RDB_Vehicle.brand_name, RDB_Vehicle.model,RDB_Vehicle.size, RDB_Vehicle.registration_number,RDB_Vehicle.departures_number,RDB_Vehicle.date_of_production
FROM RDB_fire_police_vsmall_T1.dbo.Vehicle AS RDB_Vehicle;

SELECT * FROM RDB_fire_police_vsmall_T1.dbo.Vehicle
--INSERT INTO temporary_vehicle(vin_number,date_of_production) VALUES ('12433252345','2020-01-01');
--INSERT INTO temporary_vehicle(vin_number,date_of_production) VALUES ('124332523455','2005-01-01');

DECLARE @i int;
SET @i = 1;

while @i < @row_num+1
BEGIN

	DECLARE @vin_number_temp VARCHAR(40);
	DECLARE @id_temp int;
	DECLARE @year_date_subtracted int;
	DECLARE @date_temporary date;
	DECLARE @how_old_years int;

	--select single row
	SELECT @vin_number_temp = [vin_number],@id_temp = [id],@date_temporary=[date_of_production] 
	FROM temporary_vehicle 
	WHERE id = @i;

	--calc number of years
	SELECT @year_date_subtracted = YEAR(@today_date) -  YEAR(@date_temporary);
	--PRINT @date_temporary;


	--SET enum
	IF(@year_date_subtracted < 8 )
	begin
		update temporary_vehicle
		set how_old = 'NEW'
		where id = @i;
	end

	ELSE IF(@year_date_subtracted >=8 AND @year_date_subtracted <= 20)
	begin
		update temporary_vehicle
		set how_old = 'MEDIUM'
		where id = @i;
	end

	ELSE
	begin
		update temporary_vehicle
		set how_old = 'OLD'
		where id = @i;
	end
	

	SET @i = @i +1;
	
END;

--Insert to Vehicle Table
INSERT INTO dbo.Vehicle(vin_number,brand_name, model,size,registration_number,how_old,departures_number)
SELECT vin_number, brand_name,model,size, registration_number,how_old,departures_number
FROM  temporary_vehicle;

--drop temporary table
--DROP TABLE temporary_vehicle;

SELECT * FROM DW_fire_police_vsmall.dbo.Vehicle