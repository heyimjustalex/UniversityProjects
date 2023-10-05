USE filmsDB

create table Film(
   id_film INT PRIMARY KEY IDENTITY(1,1), 
   title VARCHAR(50) NOT NULL,
   duration FLOAT CHECK (duration BETWEEN 1 AND 800),
   coutry_of_production VARCHAR(40),
   year_of_production INT CHECK (year_of_production BETWEEN 1885 AND 3000),
   category VARCHAR(40),
 
);

create table Reviewer(
   id_reviewer INT PRIMARY KEY IDENTITY(1,1),
   email VARCHAR(50) NOT NULL CHECK (email LIKE '%_@__%.__%') ,
   nickname VARCHAR(30) NOT NULL,
   pass_hash VARCHAR(40) NOT NULL,
   reviews_num INT
 
);

create table Review(
   id_review INT PRIMARY KEY IDENTITY(1,1),
   id_reviewer INT REFERENCES REVIEWER ON UPDATE CASCADE ON DELETE CASCADE,
   id_film INT REFERENCES FILM ON UPDATE CASCADE ON DELETE CASCADE,
   stars_num INT CHECK (stars_num BETWEEN 1 AND 5),
   rev_contents VARCHAR(1000),
   rev_date DATE
  
);

create table Person(
   id_person INT PRIMARY KEY IDENTITY(1,1),
   name VARCHAR(40),
   surname VARCHAR(50)
  
 
);
create table Reward(
   id_reward INT PRIMARY KEY IDENTITY(1,1),
   reward_name VARCHAR(40),
   organisation VARCHAR(60)
  
 
);

create table FunctionProfession(
   id_function INT PRIMARY KEY IDENTITY(1,1),
   profession VARCHAR(40),
   
);

create table Person_func_per_film(
   id_person_func_per_film INT PRIMARY KEY IDENTITY(1,1),
   id_film INT REFERENCES Film ON UPDATE CASCADE ON DELETE CASCADE,
   id_function INT REFERENCES FunctionProfession ON UPDATE CASCADE ON DELETE CASCADE,
   id_person INT REFERENCES Person ON UPDATE CASCADE ON DELETE CASCADE
  
);


create table Awarding(
   id_reward INT  REFERENCES Reward ON UPDATE CASCADE ON DELETE CASCADE,
   id_function_of_person INT REFERENCES Person_func_per_film ON UPDATE CASCADE ON DELETE CASCADE,   
   awarding_year INT CHECK (awarding_year BETWEEN 1895 AND 3000) ,
   PRIMARY KEY(id_reward, id_function_of_person)
  
);

create table Additional_information(
   id_additional_inf INT PRIMARY KEY IDENTITY(1,1),
   id_function_per_film INT REFERENCES Person_func_per_film ON UPDATE CASCADE ON DELETE CASCADE,
   attrib_name VARCHAR(1000),
   attrib_value VARCHAR(1000)
  
);
