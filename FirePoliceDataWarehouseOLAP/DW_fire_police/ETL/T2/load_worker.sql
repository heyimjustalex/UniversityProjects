USE DW_fire_police_vsmall
--W przypadku b³êdu z "Pesel_check2"
--ALTER TABLE DW_fire_police_vsmall.dbo.Worker
--DROP CONSTRAINT PESEL_CHECK2

GO
If (object_id('dbo.WorkerTempT1') is not null) DROP TABLE dbo.WorkerTempT1;
CREATE TABLE WorkerTempT1(
   id INT IDENTITY(1,1),
   pesel VARCHAR(11) NOT NULL,
   name VARCHAR(40) NOT NULL,
   surname VARCHAR(50),   
   sex VARCHAR(10) CHECK(sex IN('K','M')),
   join_date DATE NOT NULL,
   birth_date DATE NOT NULL,
   job_name VARCHAR(40) NOT NULL)
GO

If (object_id('dbo.WorkerTempT2') is not null) DROP TABLE dbo.WorkerTempT2;
CREATE TABLE WorkerTempT2(
	id INT IDENTITY(1,1),
   pesel VARCHAR(11) NOT NULL,
   name VARCHAR(40) NOT NULL,
   surname VARCHAR(50),   
   sex VARCHAR(10) CHECK(sex IN('K','M')),
   join_date DATE NOT NULL,
   birth_date DATE NOT NULL,
   job_name VARCHAR(40) NOT NULL)
GO

INSERT INTO DW_fire_police_vsmall.dbo.WorkerTempT1(
	pesel,
	name,
	surname,
	sex,
	join_date,
	birth_date,
	job_name)
SELECT
	pesel,
	name,
	surname,
	sex,
	join_date,
	birth_date,
	job_name
FROM
	RDB_fire_police_vsmall_T1.dbo.Worker



go

INSERT INTO DW_fire_police_vsmall.dbo.WorkerTempT2(
	pesel,
	name,
	surname,
	sex,
	join_date,
	birth_date,
	job_name)
SELECT
	pesel,
	name,
	surname,
	sex,
	join_date,
	birth_date,
	job_name
FROM
	RDB_fire_police_vsmall_T2.dbo.Worker

go


If (object_id('dbo.newWorkers') is not null) DROP TABLE dbo.newWorkers;
CREATE TABLE newWorkers(
   pesel_new VARCHAR(11) NOT NULL,
   pesel_old VARCHAR(11),
   name VARCHAR(40) NOT NULL,
   surname VARCHAR(50),   
   sex VARCHAR(10) CHECK(sex IN('K','M')),
   join_date DATE NOT NULL,
   birth_date DATE NOT NULL,
   job_name VARCHAR(40) NOT NULL)
GO

--SELECT NEWWORKERS
INSERT INTO DW_fire_police_vsmall.dbo.newWorkers(
	pesel_new,
	pesel_old,
	name,
	surname,
	sex,
	join_date,
	birth_date,
	job_name)
	
	SELECT 
	WorkerTempT2.pesel,
	WorkerTempT1.pesel,
	WorkerTempT2.name,
	WorkerTempT2.surname,
	WorkerTempT2.sex,
	WorkerTempT2.join_date,
	WorkerTempT2.birth_date,
	WorkerTempT2.job_name	
	FROM WorkerTempT2 
	LEFT JOIN WorkerTempT1
	ON WorkerTempT2.pesel=WorkerTempT1.pesel
	WHERE WorkerTempT1.pesel IS NULL;





-- TABLE FOR CHANGED WORKERS
If (object_id('dbo.changed_surname_Workers') is not null) DROP TABLE dbo.changed_surname_Workers;
CREATE TABLE changed_surname_Workers(
   pesel VARCHAR(11) NOT NULL,
   name VARCHAR(40) NOT NULL,
   surname VARCHAR(50),   
   sex VARCHAR(10) CHECK(sex IN('K','M')),
   join_date DATE NOT NULL,
   birth_date DATE NOT NULL,
   job_name VARCHAR(40) NOT NULL)
GO

-- SELECT CHANGED WORKERS 
GO
INSERT INTO DW_fire_police_vsmall.dbo.changed_surname_Workers(
	pesel,
	name,
	surname,
	sex,
	join_date,
	birth_date,
	job_name)
	
	SELECT 
	WorkerTempT2.pesel,
	WorkerTempT2.name,
	WorkerTempT2.surname,
	WorkerTempT2.sex,
	WorkerTempT2.join_date,
	WorkerTempT2.birth_date,
	WorkerTempT2.job_name	
	FROM WorkerTempT2 
	INNER JOIN WorkerTempT1
	ON WorkerTempT2.pesel=WorkerTempT1.pesel
	WHERE WorkerTempT2.surname != WorkerTempT1.surname
GO
GO	
	-- MAKE OLD PEOPLE RECORDS NOT UP TO DATE
	UPDATE DW_fire_police_vsmall.dbo.Worker
	SET is_up_to_date = 'No'
	WHERE pesel IN (SELECT pesel FROM DW_fire_police_vsmall.dbo.changed_surname_Workers);
GO
	--CREATE VIEW FOR CHANGED SURNAME WORKERS
	   	
GO
CREATE VIEW etl_changed_surname_Workers AS
SELECT
    pesel,
	name,
	surname,
	sex,
	CASE
		WHEN year('2021') - year(birth_date) > 45 THEN 'SENIOR'
		WHEN year('2021') - year(birth_date) > 20 THEN 'MID'
		WHEN year('2021') - year(birth_date) > 0 THEN 'JUNIOR'
		ELSE 'NONE'
	END	as how_old,
	job_name,
	CASE
	    WHEN year('2021') - year(join_date) > 3 THEN 'SENIOR'
		WHEN year('2021') - year(join_date) >= 2 THEN 'MID'
		WHEN year('2021') - year(join_date) > 0 THEN 'JUNIOR'
		ELSE 'NONE'
	END	as experience,

	'yes' as is_up_to_date
FROM
    changed_surname_Workers
GO

-- INSERT CHANGED SURNAME WORKERS
INSERT INTO DW_fire_police_vsmall.dbo.Worker(
	pesel,
	name,
	surname,
	sex,
	how_old,
	job_name,
	experience,
	is_up_to_date)
SELECT
	pesel,
	name,
	surname,
	sex,
	how_old,
	job_name,
	experience,
	is_up_to_date
FROM
	etl_changed_surname_Workers

	-- CREATE VIEW FOR NEW WORKERS

GO
	CREATE VIEW etl_new_Workers AS
SELECT
    pesel_new,
	name,
	surname,
	sex,
	CASE
		WHEN year('2021') - year(birth_date) > 45 THEN 'SENIOR'
		WHEN year('2021') - year(birth_date) > 20 THEN 'MID'
		WHEN year('2021') - year(birth_date) > 0 THEN 'JUNIOR'
		ELSE 'NONE'
	END	as how_old,
	job_name,
	CASE
	    WHEN year('2021') - year(join_date) > 3 THEN 'SENIOR'
		WHEN year('2021') - year(join_date) >= 2 THEN 'MID'
		WHEN year('2021') - year(join_date) > 0 THEN 'JUNIOR'
		ELSE 'NONE'
	END	as experience,

	'yes' as is_up_to_date
FROM
    newWorkers
go
-- INSERT NEW WORKERS

INSERT INTO DW_fire_police_vsmall.dbo.Worker(
	pesel,
	name,
	surname,
	sex,
	how_old,
	job_name,
	experience,
	is_up_to_date)
SELECT
	pesel_new,
	name,
	surname,
	sex,
	how_old,
	job_name,
	experience,
	is_up_to_date
FROM
	 etl_new_Workers

