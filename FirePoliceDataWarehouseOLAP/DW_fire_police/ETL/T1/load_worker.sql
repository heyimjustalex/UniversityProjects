USE DW_fire_police_vsmall
--W przypadku b³êdu z "Pesel_check2"
ALTER TABLE DW_fire_police_vsmall.dbo.Worker
   DROP CONSTRAINT PESEL_CHECK2

GO
If (object_id('dbo.WorkerTemp') is not null) DROP TABLE dbo.WorkerTemp;
CREATE TABLE WorkerTemp(
   pesel VARCHAR(11) NOT NULL,
   name VARCHAR(40) NOT NULL,
   surname VARCHAR(50),   
   sex VARCHAR(10) CHECK(sex IN('K','M')),
   join_date DATE NOT NULL,
   birth_date DATE NOT NULL,
   job_name VARCHAR(40) NOT NULL)
GO

INSERT INTO DW_fire_police_vsmall.dbo.WorkerTemp(
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
CREATE VIEW etlWorker AS
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
    WorkerTemp 
go

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
	etlWorker

SELECT * FROM RDB_fire_police_big_T1.dbo.Worker
DROP VIEW etlWorker
DROP TABLE dbo.WorkerTemp
SELECT * FROM DW_fire_police_vsmall.dbo.Worker

