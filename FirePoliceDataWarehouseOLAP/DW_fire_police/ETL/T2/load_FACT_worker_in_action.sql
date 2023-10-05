USE DW_fire_police_vsmall
--ALTER TABLE DW_fire_police_vsmall.dbo.FACT_Worker_in_action
	--DROP CONSTRAINT PESEL_CHECK4
	
create table temporary_WIA_T2(
	id INT IDENTITY(1,1),
	id_crew int,
	worker_pesel_number VARCHAR(12),
	id_worker int
	);

INSERT INTO temporary_WIA_T2(	
id_crew,
	worker_pesel_number)
SELECT 
	id_crew,
	worker_pesel_number

FROM
RDB_fire_police_vsmall_T2.dbo.Worker_in_action;

DECLARE @row_num int;
SELECT @row_num = COUNT (*) FROM temporary_WIA_T2;

DECLARE @i int;
SET @i = 1;



while @i < @row_num+1
BEGIN	

DECLARE @current_pesel VARCHAR(12);
DECLARE @id_worker INT;

	SELECT @current_pesel = worker_pesel_number FROM temporary_WIA_T2 WHERE id = @i;	
	SELECT @id_worker = id_worker FROM DW_fire_police_vsmall.dbo.Worker 
	WHERE pesel = @current_pesel AND DW_fire_police_vsmall.dbo.Worker.is_up_to_date='Yes';

	UPDATE temporary_WIA_T2 SET id_worker =@id_worker WHERE id = @i;

	SET @i = @i +1;
	
END


SELECT id_crew,id_worker FROM temporary_WIA_T2;


MERGE INTO DW_fire_police_vsmall.dbo.FACT_Worker_in_action AS TARGET_T
USING temporary_WIA_T2 AS SOURCE_T
ON  SOURCE_T.id_crew = TARGET_T.id_crew
AND SOURCE_T.id_worker = TARGET_T.worker_pesel_number
WHEN NOT MATCHED 
THEN INSERT VALUES(SOURCE_T.id_crew, SOURCE_T.id_worker);


--DROP TABLE temporary_WIA_T2;