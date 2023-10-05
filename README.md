﻿# UniversityProjects

All of the most university projects/exercises I made during my studies at Gdansk University of Technology and Aarhus University. These are not big enough to have it's own repository.

## BigNumberCPP

It's a mini-project, which was about creating a console calculator to add and subtract numbers of any length. It was supposed to be written without using STL, strings or vector. Just pure char arr and algorithmical operations.

Uses "windows.h" to clear console (delete "System("cls") if compliling on Linux).

## CleanCodeExercises

Clean code exercises for the Clean code mini-course I created for PING science club at GUT.

## CombinatoricsAlgorithms

Small single-class project that prints:

- combinations
- variations
- permutations of a list

Uses some recursive algorithms


## DistributedLabs - Distributed and pervasive systems labs

### Ex 1.1

•Client:  
• Reads address and port number of the server service from command line  
• Reads two numbers from standard input and sends them to the server  
• Receives and prints the response from the server  
• Server:  
• Reads the port number of the service from command line  
• Prints address and port number of the connecting clients  
• Receives two integers from each client, computes the sum and sends back the  
response with the result  
• You have to handle the possible exceptions  
•Develop both an iterative and a multi-threaded version of the server

### Ex 1.2

•Service to book theatre tickets  
•Assumptions: a single show, a single type of ticket  
•It must be developed as a concurrent server  
•Issue: you mustn’t sell more than the available tickets  
•You have to create the classes necessary for the multi-thread  
communication, and a class ‘‘Reservations’’ with a method without  
parameters that check if there are free seats:  
• If there are, it returns the number of the reserved seat  
• If there are not, it returns zero  
•Check if the synchronization problems are solved by using  
Thread.sleep()

### Ex 2.1

A veterinarian has a waiting room that can contain only dogs and cats  
• A cat can’t enter in the waiting room if there is already a dog or a cat  
• A dog can’t enter in the waiting room if there is a cat  
• There can’t be more than four dogs together  
•The animals stay in the waiting room for a random interval of time  
•The animals that can’t enter in the waiting room have to wait as  
necessary  
•The problem must be solved by using synchronized, wait and notify  
• You have to develop two methods: enterRoom and exitRoom  
• Each animal is represented by a randomly generated thread from which you  
will call these methods

### Ex 2.2

Build a chat service through sockets  
•Each user writes the messages to be sent with the keyboard  
•The communication is asynchronous: each user can send  
messagges indipendently from the other users  
•The threads must communicate through a shared buffer  
•Two variations:

1. Chat between only two users (one is the server, the other is the  
   client)
2. Chat-room: a server receives connections from several users and  
   forwards the messages to all the participants


### Ex 4.1 - REST
Exercise: Rest Dictionary
• Create a REST service that allows managing a words dictionary. It should
enable the user to: <br/>
• Enter a word and its definition <br/>
• Change the definition of a word <br/>
• Given a word, view its definition. <br/>
• Delete a word <br/>
• Manage errors with appropriate HTTP responses (word already entered, the word does not exist,...) <br/>
• Pay attention to synchronization problems! <br/>
• One way to test a REST server on the fly is by using tools like Advanced REST <br/>
Client (plugin for Chrome)


### Ex 4.2 - MQTT

• Create 3 processes that simulate a temperature sensor that every 5 seconds publishes a random temperature value (between 18 and 22 degrees) to the topic “home/sensors/temp” <br/>
• Create a process that subscribes to the topic “home/sensors/temp” and computes the average of the last 5 sensors measurements. If that average temperature exceeds 20 degrees, it sends a message to the topic “home/controllers/temp” thatsignals to turn off the heaters. Otherwise, it signals to turn them on. <br/>
• Create one process that simulates a heater which subscribes to the topic “home/controllers/temp” and that prints in the console when it turns on or off. <br/>


## DockerExercises

Docker exercises for the Docker mini-course I created for PING science club at GUT.

## FilmsDatabase

It's a university project made from scratch in MS SQL Studio. Docs is in Polish, but there is RDB diagram in English. Database simulates imdb.com or filmweb.com and it present information about films, authors etc.

### RDB Scheme

![scheme](https://user-images.githubusercontent.com/21158649/136659021-a1867ebe-92be-415e-b6e2-a0b0cb6c446e.PNG)

## FirePoliceDataWarehouseOLAP

It's a university project which consists of few stages

1. Specify bussiness requirements, and the topic you want to model. In this case it's fire police
2. Make 2 data sources - RDB and Excel sheet
3. Write Python Data Generator for both sources with two time stamps T1 and T2
4. Specify buissnes questions that your data warehouse will answer 
5. Design data warehouse and implement it
6. Load data with ETL and TSQL from both sources to data warehouse
7. Create KPI with Microsoft Analysis Services
8. Create charts in Power BI


### How to set it up

1. If you want to generate data yourself use DataGenerator and if you just want to load RDB with data you can use SMALL or BIG dataset from this link -> https://drive.google.com/drive/folders/1i3inRVgsG2Xb42joXDK9f2wlyVnH7XbQ?usp=sharing (big data sets with milions of rows might generate HOURS!!)
2. Create RDB and load data with these scripts -> RDB_fire_police/SQL/
3. Create DW with these scripts DW_fire_police/SQL/create_tables_dw.sql
4. Now you can load sample DW data (DW_fire_police/SampleData/) with DW_fire_police/SQL/bulk_load_dw.sql OR use ETL process to collect data from RDB and Excel
5. Use FirePolice-Data_warehouse/DW_fire_police/Implementation_VS2017/ to browse cubes and make sql queries with "Browse" 

### DW PROJECT VS
![obraz](https://user-images.githubusercontent.com/21158649/146068374-c3575fdd-8ea6-41d0-85f0-4cc86987281b.png)

### DATA GENERATOR

![obraz](https://user-images.githubusercontent.com/21158649/146068530-9e2bd008-98ac-4903-8a9a-dc1b1ab1f20d.png)

### KPI
![Screenshot_856](https://user-images.githubusercontent.com/21158649/154797867-bf4fd7f6-9762-4acc-afc0-9bbae2cd9986.png)


### POWER BI CHARTS
![Screenshot_855](https://user-images.githubusercontent.com/21158649/154797822-047c6651-14af-489b-8bbb-ed4b550c5c5c.png)
![Screenshot_857](https://user-images.githubusercontent.com/21158649/154797845-c11ad37a-c7f5-4236-8461-330c1e8dce96.png)


## FlaskMedApp

There are two projects inside, that are the same project written with differnet technologies. It's a simple Flask REST API medical app with ORM and migrations and templates. It focused at using ORM and database migrations mechanism.

### First project: Flask FlaskMedApp

Used technologies Python/Flask/SQLAlchemy/Postgres/Docker

### Second project: Ruby

Used technologies Docker/Ruby/Postgres/PGAdmin/Rake to migrate DB

## FrontendNextAngular

Next-js and angular exercises, code snippets.


## JacobiGaussLU

Project made with numpy and pyplot

Project that generates matrix A and vector B and tries to find X using differnt methods:

- Jacobi
- Gauss-Seidl
- LU factorization

You can save the chosen matrix by using function write_matrix_to_file()

### Plot

![plot](./JacobiGaussLU/plot.png)

### Time in seconds that it takes to solve N equations with an Algorithm

![obraz](https://user-images.githubusercontent.com/21158649/115966650-e7256b80-a52e-11eb-9b2f-fa8f848514a8.png)

## JavaRMI

A complete client/server example that uses Java RMI's capabilities to load and to execute user-defined tasks at runtime. The server in the example implements a generic compute engine, which the client uses to compute the value of PI.<br/>
The configuration settings in the scripts corresponds to the network topology shown below.
<br/> <br/>
![network topology](./JavaRMI/topology.png)
<br/>
<br/>

### Support for for cross-compilation

The Java 9 compiler introduced a new command-line option, --release. This option automatically configures the compiler to produce class files that will link against an implementation of the given platform version. For the platforms predefined in javac, --release N is equivalent to -source N -target N -bootclasspath <bootclasspath-from-N>.

## LagrangeAndSpline

Project made with numpy and pyplot

Project that compares Lagrange and Spline interpolation using data from http://www.geocontext.org

### Generated polynomials

![pol1](https://user-images.githubusercontent.com/21158649/120111215-5f580000-c171-11eb-8844-8ceb72f861b1.PNG)
![obraz](https://user-images.githubusercontent.com/21158649/120111242-78f94780-c171-11eb-922a-1c6d7b6e0b1a.png)



## LowestNumWithNDivs

It's a mini-project written in Haskell in a purely functional way and
it's supposed to find lowest natural number x which has m <= n divisors.<br/>

For instance:<br/>
for n=16, x will be x=120m, because 120 is the first number that has m=16 divisors


## MACDSignalEMA

It's a project that uses Python - pyplot, numpy and pandas.
It loads Yahoo CSV stock files, takes closing stocks value per day, and then calculates EMA, SMA to get MACD, Signal and Histogram.

Then it draws plots of original closing stock value, MACD, Signal and Histogram.

### Apple stocks

![obraz](https://user-images.githubusercontent.com/21158649/115968374-f8bf4100-a537-11eb-8a54-8d4213be0331.png)

### Tesla stocks

![obraz](https://user-images.githubusercontent.com/21158649/115968397-15f40f80-a538-11eb-90e6-31a779378530.png)


## MicroserviceCoachFootballer

Microservice Java Spring app with one-to-many relationship and relational DB.


## NextJsProjectWithGymAPI - Fitness Web App with Next.js Version 13 and NextAuth

This repository contains the code for a fitness web app built with Next.js version 13, utilizing the NextAuth authentication approach and App Router. The app communicates with a backend API hosted at https://afefitness2023.azurewebsites.net/swagger/index.html, which is documented using Swagger.

### Technology Requirements

- Next.js v13: The web app is built using the latest version of Next.js to leverage its features and improvements.

- NextAuth: Authentication is implemented using NextAuth, providing a secure and customizable authentication solution.

- App Router: The app uses Next.js App Router for efficient client-side navigation.

- Public Cloud Deployment: The app is deployed to a public cloud platform, such as Vercel, ensuring accessibility and scalability.

### Functional Requirements

- User Authentication

  - Users can log in securely using the authentication flow provided by NextAuth.

- Manager Operations

  - Managers can create new users (personal trainers) through the app.

- Personal Trainer Operations

  - Personal trainers can create new users (clients) associated with their account.
  - They can create a new workout program for a specific client.
  - Personal trainers can add new exercises to a workout program, specifying the exercise name, description, number of sets, and repetitions or duration.

- Dashboard for Personal Trainer

  - Personal trainers can view a list of workout programs
  - They can view the details of a specific workout program.
  - Personal trainers can see a list of clients associated with their account.

- Client Operations
  - Clients can view their assigned workout program.
  - If a client has more than one program, the app displays a list of programs, allowing the client to select the program to be displayed.


## ProcessMiningDataAnalysis
  
### Description of the case study

The case study describes the process of treatment sepsis in a hospital environment. It is a condition which is triggered by the body’s reaction to an infection. By analyzing this log, effective diagnosis of the condition and treatment may be improved. Moreover, stating optimal process management is crucial for enhancing speed of the process and therefore patient survival rate and minimizing potential negative outcomes for the patient's health. The knowledge one get’s by analyzing the log could be applied in hospitals all over the world.

![Untitled](https://github.com/user-attachments/assets/c534a2bb-3761-48e9-a04e-a93ceafedbd1)


### Conclusions
After in-depth log analysis it can be stated that overall there is not much difference between cases of patients who need to return to the ER and those who don’t - it may be due to the medical nature of the data and the fact that sepsis has no one, easily defined course.  This finding suggests a need for standardizing reaction protocols as part of the operational objectives to ensure a consistent treatment process, potentially reducing the variability in patient outcomes. 
The patient treatment could be improved by ensuring regular testing and follow-up examinations, especially with long stay durations. Moreover, reducing the number of patients returning to the hospital would minimize the cost of treatment.

### More information in the report in the folder




## PythonDigitRecognition

University project that compares 3 AI algoritms - KNN, SVM and Neural Network to recognize digits. The report contains time and accuracy comparition. YOU HAVE TO DOWNLAOD MNIST TRAIN SET IN ORDER TO RUN THIS PROGRAM -> https://drive.google.com/drive/folders/14z27e-5IZca01eqqVYopxcmTbi84J7i5?usp=sharing

### Heatmap for confusion matrix (k=5, metric Chebyshev)

![heatmap](https://user-images.githubusercontent.com/21158649/136658618-11632255-b278-48fb-8c4a-88ac6bb87821.PNG)


## SoftwareDesign-DesignPatterns

### Week 1
Modifications from points 4,5,6 are commented in //EX4 //EX5 //EX6 manner. Relevant files regarding changes are: Player.cs, Color.cs, Game.cs

There is also static class Colors not included in the diagram. The Simulation class is just to generate players, deck and start game.

![800|371536574_288213467289224_5117261151531558073_n](https://github.com/heyimjustalex/SoftwareDesign/assets/21158649/2fde04f5-e269-4639-b247-0da39b5727ff)

### Week 2

SRP and OCP modifications of code.

SRP

- Modified ReportGenerator class - splitting two responsibilites (Generating report, and low-level "compiling")
- Created Interface IReportFormater that is used by ReportGeneratorClient
- Implemented interface into two seperate formats NameFirstFormat and SalaryFirstFormat

OCP
![800|UML2](https://github.com/heyimjustalex/SoftwareDesign/assets/21158649/6bc58537-f6fb-4e03-9838-b3c56dd172ec)

- abstract class Report Formater has generic method that can accept List<T> and print Type.Properties
- abstract class Report Formater accepts method to modify how output is printed
- IReportFormater is implemented by abstract class ReportFormater
- abstract class ReportFormater is implemented in the specific formats (AgeLastFormat,NameFirstFormat, SalaryFirstFormat)
- (AgeLastFormat,NameFirstFormat, SalaryFirstFormat) use IFunctionFormater
- IFunctionFormater is implemented by concrete formaters (FieldLastFormater : IFunctionFormater)

All of these modifications result in OCP:
- If I want to make new Format i just inherit from ReportFormater (as long as there is just one field to be modified)
- If I want to make new fields of Employee it does not affect anything except for Employee Constructors (look at TestClassFieldThatMakesThisSolutionOCP example field)
- If I want to make new Entity (except for Employee) it would not be hard (I would need to change IReportFormater to accept more generic type, but ReportFormater is already generic and able to print all class fields) 


### Week 7

Exercise: Observer pattern

Over the hills and far away…
In these exercises, you will work with the observer design pattern.
Tinky-Winky, Dipsy, La-la and Po live over the hills and far away.
They have not yet learned how to tell time, but fortunately, there is a big “telephone” in the neighborhood, which tells
them when to wake up, have dinner, and watch television and when to say tubbie-bye-bye.

**Exercise 1: (Design)**
Create a UML class diagram where you:
• Define the methods and properties of the teletubbies.
• Define the methods and properties of the big telephone.
• Use the observer pattern to let the tubbies know when to have dinner etc.
Explain your design to one or two of your fellow students.

**Exercise 2: (Implementation)**
Implement your design as a Console application.
Control the telephone from the main() method and have the tubbies write to the console, when they know that they
should do something new.

**Pull Observer implementation**

![Pull](./SoftwareDesign-DesignPattern/Week%207/ObserverTeletubbiesPull/class.PNG)

**Push Observer implementation**

![Push](./SoftwareDesign-DesignPattern/Week%207/ObserverTeletubbiesPush/class_uml.PNG)

### Week 8

**Exercise 1: Observer Generic implementation**

![Push](./SoftwareDesign-DesignPattern/Week%208/ObserverGeneric/class.PNG)

**Exercise 2: Observer generic Stock implementation**

In this exercise, you will design a stock trading system in which stocks values are continuously updated and
in which you can buy and sell stocks. Through this, you will get familiar with the use of the GoF Observer
pattern.

The situation: You are to design and implement a system, which consists of a number of parts:
• Stocks, which live a life of their own. Their values are periodically updated, and when this happens,
a Portfolio must be informed of the changes.
• A Portfolio, which keeps track of the currently owned stocks (stock name, amount of stocks and
value) and the total stock value.
• A Portfolio Display, which is used to output information on the currently held portfolio.

**Exercise 2.1:**
Considering the GoF Observer pattern, what is/are the subject(s), and what is/are the observer(s) in the
stock trading system?
Which variant of GoF Observer is applicable – or would you rather create your own?

**Exercise 2.2:**
Design a system in which Stocks may be added to a Portfolio, which should then automatically be notified if
the value of the Stock changes. When this happens, the Portfolio Display should make sure that the stocks
in the portfolio are printed to screen.
Changing stock values could be done from a command line interface, e.g. VESTAS 570.50 or GOOGLE:
943.29.
Create a design document, with a short description of your design and design choices and the class
diagram(s) and sequence diagram(s) you need to explain your design (at least one of each).

**Exercise 2.3:**
Implement and test your system. As always, remember that any changes to the design discovered during
implementation and/or test must be reflected in the design documentation (class diagram etc.)

**Exercise 2.4:**
Revise your system so that the stocks have a life of their own: They should update their values (e.g. within
the range +/- 5%) at regular intervals.

**Exercise 2.5 (optional):**
Create a market from which it is possible to buy and sell stocks.


## StructuresImplementationsCPP

Basic data structures (list, queue, 2-way-list etc.) implemented with C++
