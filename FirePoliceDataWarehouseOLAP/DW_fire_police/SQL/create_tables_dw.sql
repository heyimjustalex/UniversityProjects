USE DW_fire_police_vsmall

create table Worker(
   id_worker int IDENTITY(1,1) PRIMARY KEY,
   pesel VARCHAR(12) CONSTRAINT PESEL_CHECK2 CHECK(pesel LIKE '^\d{11}$') ,   
   name VARCHAR(40) NOT NULL,
   surname VARCHAR(40),   
   sex VARCHAR(10) NOT NULL,
   how_old VARCHAR(10) NOT NULL,
   job_name VARCHAR(20) NOT NULL,
   experience VARCHAR(20) NOT NULL,
   is_up_to_date VARCHAR(3) NOT NULL
   
);

create table Vehicle(
	id_vehicle INT IDENTITY(1,1) PRIMARY KEY,
	vin_number VARCHAR(40),	
	brand_name VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	size VARCHAR(10) NOT NULL CHECK (size IN('SMALL', 'MEDIUM', 'BIG','LARGE')),
	registration_number VARCHAR(40),
	how_old VARCHAR(10) NULL CHECK (how_old IN('OLD', 'MEDIUM', 'NEW')),
	departures_number VARCHAR(15) NOT NULL, 

);

create table Time(
	id_time INT IDENTITY(1,1) PRIMARY KEY,	
	hours VARCHAR(10) NOT NULL,
	minutes VARCHAR(10) NOT NULL

);

create table Date(
	id_date INT IDENTITY(1,1) PRIMARY KEY,	
	year VARCHAR(10) NOT NULL,
	month VARCHAR(10) NOT NULL,
	day VARCHAR(10) NOT NULL

);


create table Intervention_type(
	id_intervention_type INT IDENTITY(1,1) PRIMARY KEY,	
	name VARCHAR(20) NOT NULL,
	severity VARCHAR(10) NOT NULL CHECK (severity IN('LOW', 'MEDIUM', 'HIGH','CRITICAL')),

);

create table Location(
   id_location INT IDENTITY(1,1) PRIMARY KEY, 
   name VARCHAR(50) NOT NULL,
   region VARCHAR(40) NOT NULL,
   district INT,
   closest_city VARCHAR(40) NOT NULL,
    
);

create table Fault(
   id_fault INT IDENTITY(1,1) PRIMARY KEY, 
   car_element_name VARCHAR(50) NOT NULL,
   fault_severity VARCHAR(10) NOT NULL CHECK (fault_severity IN('LOW', 'MEDIUM', 'HIGH','CRITICAL')),
   price VARCHAR(10) NOT NULL CHECK (price IN ('LOW', 'MEDIUM', 'BIG','LARGE'))
    
);

create table FACT_vehicle_inspection(
   id_vehicle_vin INT NOT NULL REFERENCES Vehicle(id_vehicle) ON UPDATE CASCADE ON DELETE CASCADE,
   id_fault INT NOT NULL  REFERENCES Fault(id_fault) ON UPDATE CASCADE ON DELETE CASCADE,
   id_facility_location INT NOT NULL REFERENCES Location(id_location) ON UPDATE CASCADE ON DELETE CASCADE,
   id_date_of_visit_at_mechanics INT NOT NULL REFERENCES Date(id_date) ON UPDATE CASCADE ON DELETE CASCADE,
   days_fix_duration int NOT NULL,
   cost float NOT NULL,

);
GO
ALTER TABLE FACT_vehicle_inspection
    ADD CONSTRAINT pk_FACT_vehicle_inspection PRIMARY KEY (id_vehicle_vin,id_fault,id_facility_location, id_date_of_visit_at_mechanics)
GO

create table FACT_crew_on_intervention(
	id_fact_crew_on_intervention INT PRIMARY KEY IDENTITY(1,1), 
	id_intervention_type INT NOT NULL REFERENCES Intervention_type(id_intervention_type),
	id_vehicle_vin INT NOT NULL REFERENCES Vehicle(id_vehicle) ,
    id_departure_location INT NOT NULL REFERENCES Location(id_location) ,
    id_facility_location INT NOT NULL REFERENCES Location(id_location),
    id_date_of_intervention INT NOT NULL REFERENCES Date(id_date) ,
    id_time_of_intervention INT NOT NULL REFERENCES Time(id_time),
    id_notification INT NOT NULL,
    time_since_notification INT NOT NULL, 
    days_intervention_duration INT NOT NULL,
    time_intervention_duration INT NOT NULL,
    number_of_impacted_people INT NOT NULL,
    number_of_dead_people INT NOT NULL,
    success_of_intervention INT NOT NULL 
);


create table FACT_Worker_in_action(

   id_crew INT NOT NULL REFERENCES FACT_crew_on_intervention(id_fact_crew_on_intervention) , 
   worker_pesel_number INT NOT NULL REFERENCES Worker(id_worker) 
   
 
);

GO
ALTER TABLE FACT_Worker_in_action
    ADD CONSTRAINT pk_composite_worker_in_action PRIMARY KEY (id_crew,worker_pesel_number)
GO
