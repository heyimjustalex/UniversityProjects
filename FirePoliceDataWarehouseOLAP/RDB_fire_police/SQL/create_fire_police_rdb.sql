USE RDB_fire_police_vsmall_T2

create table Facility(
   code VARCHAR(10) CONSTRAINT CODE_CHECK1 CHECK(code LIKE '^[A-Z][A-Z][A-Z][0-9][0-9][0-9]$') PRIMARY KEY, 
   name VARCHAR(50) NOT NULL,
   region VARCHAR(40) NOT NULL,
   city VARCHAR(40) NOT NULL,
   district INT NOT NULL,
   x_coordinate FLOAT ,
   y_coordinate FLOAT 
 
);

create table Dispatcher(
   pesel VARCHAR(12) CONSTRAINT PESEL_CHECK1 CHECK(pesel LIKE '^\d{11}$') PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   surname VARCHAR(50) NOT NULL,
   sex VARCHAR(10) NOT NULL,
   join_date DATE NOT NULL,
   birth_date DATE NOT NULL
 
);
create table Caller(
   id INT PRIMARY KEY IDENTITY(1,1), 
   name VARCHAR(50) NOT NULL,
   surname VARCHAR(50) NOT NULL,
   sex VARCHAR(10) NOT NULL,
   report VARCHAR(300) NOT NULL,
   x_coordinate FLOAT ,
   y_coordinate FLOAT ,
   phone_number VARCHAR(40)
 
);


create table Ticket(
   id INT PRIMARY KEY IDENTITY(1,1),
   caller_id INT REFERENCES Caller(id) ON UPDATE CASCADE ON DELETE CASCADE, 
   dispatcher_pesel_number VARCHAR(12) CONSTRAINT PESEL_CHECK3 CHECK(dispatcher_pesel_number LIKE '^\d{11}$') REFERENCES Dispatcher(pesel) ON UPDATE CASCADE ON DELETE CASCADE,
   date_start DATE NOT NULL,
   time_start TIME NOT NULL,
   date_end DATE NOT NULL,
   time_end TIME NOT NULL,
   urgency_level INT CHECK (urgency_level BETWEEN 0 AND 10) NOT NULL,
   report TEXT


); 

create table Worker(
   pesel VARCHAR(12) CONSTRAINT PESEL_CHECK2 CHECK(pesel LIKE '^\d{11}$') PRIMARY KEY,
   code_facility VARCHAR(10) CONSTRAINT CODE_CHECK2 CHECK(code_facility LIKE '^[A-Z][A-Z][A-Z][0-9][0-9][0-9]$') REFERENCES Facility(code) ON UPDATE CASCADE ON DELETE CASCADE,
   
   name VARCHAR(40) NOT NULL,
   surname VARCHAR(50),   
   sex VARCHAR(10) NOT NULL,
   join_date DATE NOT NULL,
   birth_date DATE NOT NULL,
   job_name VARCHAR(40) NOT NULL
);

create table Vehicle(
	vin_number VARCHAR(40) PRIMARY KEY,
	code_facility VARCHAR(10) CONSTRAINT CODE_CHECK3 CHECK(code_facility LIKE '^[A-Z][A-Z][A-Z]-[0-9][0-9][0-9]$') REFERENCES Facility(code) ON UPDATE CASCADE ON DELETE CASCADE,
	brand_name VARCHAR(40),
	model VARCHAR(40),
	size VARCHAR(30) CHECK (size IN('SMALL', 'MEDIUM', 'BIG','LARGE')) ,
	registration_number VARCHAR(40),
	date_of_production date,
	departures_number INT,
	milage INT
);

create table Intervention(
	id INT PRIMARY KEY IDENTITY(1,1),
	number_of_impacted_people INT NOT NULL,
	number_of_dead_people INT NOT NULL,
	closest_city VARCHAR(40) NOT NULL,
	region VARCHAR (40) NOT NULL,
	x_coordinate FLOAT ,
    y_coordinate FLOAT ,
	time_intervention_start TIME,
	time_intervention_end TIME,
	date_intervention_start TIME,
	date_intervention_end TIME
);

create table Intervention_type(
   code INT PRIMARY KEY IDENTITY(1,1),
   intervention_id INT REFERENCES Intervention(id) ON UPDATE CASCADE ON DELETE CASCADE, 
   name VARCHAR(40),
   severity INT CHECK (severity BETWEEN 0 AND 10) NOT NULL
   
 
);
create table Notification(
    id INT PRIMARY KEY IDENTITY(1,1),
    code_facility VARCHAR(10) CONSTRAINT CODE_CHECK4 CHECK(code_facility LIKE '^[A-Z][A-Z][A-Z][0-9][0-9][0-9]$') REFERENCES Facility(code) ON UPDATE NO ACTION ON DELETE NO ACTION,
	id_ticket INT REFERENCES Ticket(id) ON UPDATE CASCADE ON DELETE CASCADE,
	date_start DATE NOT NULL,
    date_end DATE NOT NULL,
	time_start TIME NOT NULL,
    time_end TIME NOT NULL,	
	city VARCHAR(40) NOT NULL,
	region VARCHAR(40) NOT NULL
);

create table Crew_on_intervention(
   id_action_crew INT PRIMARY KEY IDENTITY(1,1),
   intervention_id INT REFERENCES Intervention(id) ON UPDATE CASCADE ON DELETE CASCADE, 
   id_vehicle VARCHAR(40) REFERENCES Vehicle(vin_number) ON UPDATE CASCADE ON DELETE CASCADE,
   id_notification INT REFERENCES Notification(id) ON UPDATE CASCADE ON DELETE CASCADE,
   commander_pesel VARCHAR(20) NOT NULL,
   date_intervention_start DATE NOT NULL,
   date_intervention_end DATE NOT NULL, 
   report TEXT NOT NULL,
   time_intervention_start TIME NOT NULL,
   time_intervention_end TIME NOT NULL,
   date_arrive_at_dest DATE NOT NULL,    
   time_arrive_at_dest TIME NOT NULL    
);


create table Worker_in_action(
   id_action_crew INT PRIMARY KEY IDENTITY(1,1),
   id_crew INT REFERENCES Crew_on_intervention(id_action_crew) ON UPDATE CASCADE ON DELETE CASCADE, 
   worker_pesel_number VARCHAR(12) CONSTRAINT PESEL_CHECK4 CHECK(worker_pesel_number LIKE '^\d{11}$') REFERENCES Worker(pesel)   
   
 
);





