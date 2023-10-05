use DW_fire_police_vsmall
GO

create table temporary_COI_T2(
	id INT IDENTITY(1,1),
	id_intervention INT,
	id_intervention_type INT, 
	vehicle_vin VARCHAR(40),
	id_veh INT,
	id_departure_location INT,
	id_facility_location INT,
	date_of_intervention date, 
	id_date_of_intervention INT,
	id_time_of_intervention INT,
	time_of_intervention time, 
	id_notification INT, 
	time_since_notification INT, 
	days_intervention_duration INT,
	time_intervention_duration INT,
	number_of_impacted_people INT, 
	number_of_dead_people INT, 
	success_of_intervention INT 


);

--INSERT DATA THAT YOU CAN INSERT

INSERT INTO temporary_COI_T2(id_notification,id_intervention,vehicle_vin,date_of_intervention,time_of_intervention) 
SELECT id_notification,intervention_id,id_vehicle,date_intervention_start,time_intervention_start
FROM RDB_fire_police_vsmall_T2.dbo.Crew_on_intervention;

DECLARE @row_num int;
SELECT @row_num = COUNT (*) FROM temporary_COI_T2

DECLARE @i int;
SET @i = 1;
--SET @row_num = 1000;
PRINT(@row_num);

-- MAIN LOOP

while @i < @row_num+1
BEGIN
	DECLARE @facility_location_code VARCHAR(10);
	DECLARE @current_id_notification INT;
	DECLARE @current_id_intervention INT;
	DECLARE @id_intervention_type INT;
	DECLARE @number_of_impacted_people INT;
	DECLARE @number_of_dead_people INT;
	DECLARE @time_notification_start time;
	DECLARE @time_intervention_start time;
	DECLARE @date_notification_start date;
	DECLARE @date_intervention_start date;
	DECLARE @date_intervention_end date;
	DECLARE @time_intervention_end time;


	--select id_notification from temp table
	SELECT @current_id_notification=[id_notification] 
	FROM temporary_COI_T2
	WHERE id = @i;
		
	--select single row from RDB Notifcation to determine which facitlity does id_notification relate to
	
	SELECT 
	@facility_location_code = [code_facility],
	@time_notification_start=time_start,
	@date_notification_start=date_start
	FROM RDB_fire_police_vsmall_T2.dbo.Notification
	WHERE id = @current_id_notification;
	
	DECLARE @facility_closest_city VARCHAR(40);
	DECLARE @facility_region VARCHAR(40);	
	DECLARE @facility_district INT;
	DECLARE @facility_name VARCHAR(50);
	SET @facility_name = 'LocationOfFirePolice'

	--SELECT FACILITY LOCATION THAT CORRESPONDS TO THE CURRENT NOTIFICAITON
	SELECT 
	@facility_closest_city = city,
	@facility_region=region,
	@facility_district=district
	FROM RDB_fire_police_vsmall_T2.dbo.Facility
	WHERE code = @facility_location_code;

	

	-- SELECT FALCILITY LOCATION FROM DW.LOCATION THAT CORRESPONDS TO RDB.FACLITIY 
	DECLARE @facility_id_location INT;
	SELECT TOP 1 @facility_id_location  = id_location FROM DW_fire_police_vsmall.dbo.Location
	WHERE closest_city = @facility_closest_city AND
	region = @facility_region AND
	district = @facility_district AND
	name =  @facility_name;


	--PRINT(@facility_location_code)
	--SELECT departure location
	

	
	--select id_intervention from temp table
	SELECT @current_id_intervention=[id_intervention] 
	FROM temporary_COI_T2
	WHERE id = @i;

	DECLARE @departure_closest_city VARCHAR(40);
	DECLARE @departure_region VARCHAR(40);
	DECLARE @departure_name VARCHAR(40);
	SET @departure_name = 'LocationOfIntervention';

	-- SELECT LOCATION FROM RDB
	SELECT @departure_closest_city = closest_city, @departure_region = region 
	FROM RDB_fire_police_vsmall_T2.dbo.Intervention
	WHERE id = @current_id_intervention;
	

	-- MAP RDB LOCATION INTERVENTION TO LOCATION DEPARTURE DW
	DECLARE @departure_id_location INT;
	SELECT TOP 1 @departure_id_location = id_location FROM DW_fire_police_vsmall.dbo.Location
	WHERE closest_city = @departure_closest_city AND
	region = @departure_region AND
	name = @departure_name;

	--SELECT CURRENT ID_INTERVENTION TYPE THAT CORRESPONDS TO ID_INTERVENTIONS
	
	DECLARE @name_intervention_type VARCHAR(40);
	DECLARE @severity_intervention_type VARCHAR(10);
	DECLARE @dw_id_intervention_type INT;

	SELECT @id_intervention_type=[code] 
	FROM RDB_fire_police_vsmall_T2.dbo.Intervention_type
	WHERE code = @current_id_intervention;

	-- get name and severity of intervention type
	SELECT @name_intervention_type = name, @severity_intervention_type = severity 
	FROM DW_fire_police_vsmall.dbo.Intervention_type_NOT_GROUPED
	WHERE code = @id_intervention_type;
	
	SELECT @dw_id_intervention_type = id_intervention_type
	FROM DW_fire_police_vsmall.dbo.Intervention_type
	WHERE name = @name_intervention_type AND severity = @severity_intervention_type

	--CALCULATE MEASURES

	--SELECT TIME/DATE OF CURRENT ACTION
	SELECT 
	@time_intervention_start = time_intervention_start, 
	@date_intervention_start = date_intervention_start, 
	@date_intervention_end = date_intervention_end,
	@time_intervention_end = time_intervention_end
	FROM RDB_fire_police_vsmall_T2.dbo.Crew_on_intervention
	WHERE  id_action_crew = @i;


		DECLARE @id_veh INT;
	DECLARE @temp_vin VARCHAR(40);
	SELECT @temp_vin=temporary_COI_T2.vehicle_vin FROM temporary_COI_T2 WHERE id = @i;

	SELECT 
	@id_veh = Vehicle.id_vehicle
	FROM DW_fire_police_vsmall.dbo.Vehicle,temporary_COI_T2
	WHERE DW_fire_police_vsmall.dbo.Vehicle.vin_number = @temp_vin;




	--COMBINE DATES WITH TIME
	DECLARE @combined_intervention_datetime_start DATETIME;
	DECLARE @combined_notification_datetime_start DATETIME;
	DECLARE @combined_intervention_datetime_end DATETIME;

	SELECT @combined_intervention_datetime_start = CAST(CONCAT(@date_intervention_start, ' ', @time_intervention_start) AS datetime2(0));
	SELECT @combined_notification_datetime_start = CAST(CONCAT(@date_notification_start, ' ', @time_notification_start) AS datetime2(0));
	SELECT @combined_intervention_datetime_end = CAST(CONCAT(@date_intervention_end, ' ', @time_intervention_end) AS datetime2(0));



	--CALCULATE DIFFERENCE BEETWEEN INTERVENTION AND NOTIFICATION -> MEASURE TIME SINCE NOTIFICATION
	DECLARE @dateDiffDay INT;
	DECLARE @dateDiffMinute INT;	
	DECLARE @time_since_notification INT;


	SELECT @dateDiffMinute = DATEDIFF(MINUTE, @combined_notification_datetime_start ,@combined_intervention_datetime_start);
	SET @time_since_notification = @dateDiffMinute;
	
	--CALCULATE DIFFERENCE BEETWEEN INTERVENTION_START AND INTERVENTION_END -> MEASURE TIME INTERVENTION DURATION
	SELECT @dateDiffDay = DATEDIFF(DAY, @combined_intervention_datetime_start ,@combined_intervention_datetime_end);
	SELECT @dateDiffMinute = DATEDIFF(MINUTE, @combined_intervention_datetime_start ,@combined_intervention_datetime_end);
	
	DECLARE @days_intervention_duration INT;
	SET @days_intervention_duration=@dateDiffDay;		

	DECLARE @time_intervention_duration INT;	
	SET @time_intervention_duration = @dateDiffMinute;  


	--FIND DATES IN DIMENSION TABLES
	DECLARE @hours INT;
	SET @hours = DATEPART(HOUR,@time_intervention_start);
	DECLARE @minutes INT;
	SET @minutes = DATEPART(MINUTE,@time_intervention_start);
	DECLARE @id_time INT;
	DECLARE @id_date INT;

	SELECT @id_time=id_time FROM DW_fire_police_vsmall.dbo.Time
	WHERE hours = @hours AND minutes=@minutes;

	DECLARE @years INT;
	SET @years = DATEPART(YEAR,@date_intervention_start);
	DECLARE @months INT;
	SET @months = DATEPART(MONTH,@date_intervention_start);
	DECLARE @days INT;
	SET @days = DATEPART(DAY,@date_intervention_start);


	SELECT @id_date=id_date FROM DW_fire_police_vsmall.dbo.Date
	WHERE year = @years AND month=@months AND day = @days;

	-- GET NUMBER OF IMPACTED AND DEAD PEOPLE CORRESPODING TO CURRENT INTERVENTION
	
	DECLARE @no_of_impacted_ppl INT;	
	DECLARE @no_of_dead_ppl INT;	
	
	SELECT 
	@no_of_impacted_ppl = number_of_impacted_people, 
	@no_of_dead_ppl = number_of_dead_people
	FROM RDB_fire_police_vsmall_T2.dbo.Intervention 
	WHERE id = @current_id_intervention;


	--CALCUALTE SUCCESS 
	DECLARE @success_of_intervention INT;

	IF @time_since_notification < 15
	BEGIN
		SET @success_of_intervention = 5;
	END
	ELSE IF @time_since_notification >=15 AND @time_since_notification < 30
	BEGIN
		SET @success_of_intervention = 4;
	END
	ELSE IF @time_since_notification >=30 AND @time_since_notification < 60
	BEGIN
		SET @success_of_intervention = 3;
	END
	ELSE IF @time_since_notification >=60 AND @time_since_notification < 180
	BEGIN
		SET @success_of_intervention = 2;
	END
	ELSE IF @time_since_notification >=180
	BEGIN
		SET @success_of_intervention = 1;
	END


	UPDATE temporary_COI_T2
	SET 
	id_intervention_type = @dw_id_intervention_type, 
	id_departure_location = @departure_id_location,
	id_facility_location = @facility_id_location,
	id_time_of_intervention = @id_time,
	id_date_of_intervention = @id_date,
	time_since_notification = @time_since_notification,
	days_intervention_duration = @days_intervention_duration,
	time_intervention_duration = @time_intervention_duration,
	number_of_impacted_people = @no_of_impacted_ppl,
	number_of_dead_people = @no_of_dead_ppl,
	success_of_intervention = @success_of_intervention,
	id_veh = @id_veh
	

	WHERE  id = @i;

	SET @i = @i +1;
	
	
END;

-- MERGE FROM TEMPORARY TO TABLE OF FACTS

MERGE INTO DW_fire_police_vsmall.dbo.FACT_crew_on_intervention AS TARGET_T
USING temporary_COI_T2 AS SOURCE_T
ON
	SOURCE_T.id_intervention_type  =  TARGET_T.id_intervention_type
AND SOURCE_T.id_veh =				  TARGET_T.id_vehicle_vin	
AND SOURCE_T.id_departure_location =	  TARGET_T.id_departure_location
AND SOURCE_T.id_facility_location =	  TARGET_T.id_facility_location
AND SOURCE_T.id_date_of_intervention = TARGET_T.id_date_of_intervention
AND SOURCE_T.id_time_of_intervention = TARGET_T.id_time_of_intervention 
AND SOURCE_T.id_notification = 		  TARGET_T.id_notification
AND SOURCE_T.time_since_notification = TARGET_T.time_since_notification   
AND SOURCE_T.days_intervention_duration = TARGET_T.days_intervention_duration
AND SOURCE_T.time_intervention_duration =TARGET_T.time_intervention_duration
AND SOURCE_T.number_of_impacted_people = TARGET_T.number_of_impacted_people 
AND SOURCE_T.number_of_dead_people = TARGET_T.number_of_dead_people
AND SOURCE_T.success_of_intervention = TARGET_T.success_of_intervention  

WHEN NOT MATCHED 
THEN INSERT VALUES(SOURCE_T.id_intervention_type,SOURCE_T.id_veh,SOURCE_T.id_departure_location,SOURCE_T.id_facility_location,SOURCE_T.id_date_of_intervention,
SOURCE_T.id_time_of_intervention,SOURCE_T.id_notification,SOURCE_T.time_since_notification,SOURCE_T.days_intervention_duration,SOURCE_T.time_intervention_duration,
SOURCE_T.number_of_impacted_people,SOURCE_T.number_of_dead_people,SOURCE_T.success_of_intervention);
--SEE RESULTS AND DROP TEMP
SELECT * FROM temporary_COI_T2;
--DROP TABLE temporary_COI_T2;

SELECT * FROM DW_fire_police_vsmall.dbo.FACT_crew_on_intervention