# UniversityProjects

All of the most university projects/exercises I made during my studies at Gdansk University of Technology and Aarhus University. These are not big enough to have it's own repository.

## Films database

It's a university project made from scratch in MS SQL Studio. Docs is in Polish, but there is RDB diagram in English. Database simulates imdb.com or filmweb.com and it present information about films, authors etc.

### RDB Scheme

![scheme](https://user-images.githubusercontent.com/21158649/136659021-a1867ebe-92be-415e-b6e2-a0b0cb6c446e.PNG)

## JavaRMI

A complete client/server example that uses Java RMI's capabilities to load and to execute user-defined tasks at runtime. The server in the example implements a generic compute engine, which the client uses to compute the value of PI.<br/>
The configuration settings in the scripts corresponds to the network topology shown below.
<br/> <br/>
![network topology](./JavaRMI/topology.png)
<br/>
<br/>

### Support for for cross-compilation

The Java 9 compiler introduced a new command-line option, --release. This option automatically configures the compiler to produce class files that will link against an implementation of the given platform version. For the platforms predefined in javac, --release N is equivalent to -source N -target N -bootclasspath <bootclasspath-from-N>.

## FlaskMedApp

There are two projects inside, that are the same project written with differnet technologies. It's a simple Flask REST API medical app with ORM and migrations and templates. It focused at using ORM and database migrations mechanism.

### First project: Flask FlaskMedApp

Used technologies Python/Flask/SQLAlchemy/Postgres/Docker

### Second project: Ruby

Used technologies Docker/Ruby/Postgres/PGAdmin/Rake to migrate DB

## Python Digit Recognition

University project that compares 3 AI algoritms - KNN, SVM and Neural Network to recognize digits. The report contains time and accuracy comparition. YOU HAVE TO DOWNLAOD MNIST TRAIN SET IN ORDER TO RUN THIS PROGRAM -> https://drive.google.com/drive/folders/14z27e-5IZca01eqqVYopxcmTbi84J7i5?usp=sharing

### Heatmap for confusion matrix (k=5, metric Chebyshev)

![heatmap](https://user-images.githubusercontent.com/21158649/136658618-11632255-b278-48fb-8c4a-88ac6bb87821.PNG)

## DockerExercises

Docker exercises for the Docker mini-course I created for PING science club at GUT.

## CleanCodeExercises

Clean code exercises for the Clean code mini-course I created for PING science club at GUT.

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

## LagrangeAndSpline

Project made with numpy and pyplot

Project that compares Lagrange and Spline interpolation using data from http://www.geocontext.org

### Generated polynomials

![pol1](https://user-images.githubusercontent.com/21158649/120111215-5f580000-c171-11eb-8844-8ceb72f861b1.PNG)
![obraz](https://user-images.githubusercontent.com/21158649/120111242-78f94780-c171-11eb-922a-1c6d7b6e0b1a.png)

## MACD-SIGNAL-EMA

It's a project that uses Python - pyplot, numpy and pandas.
It loads Yahoo CSV stock files, takes closing stocks value per day, and then calculates EMA, SMA to get MACD, Signal and Histogram.

Then it draws plots of original closing stock value, MACD, Signal and Histogram.

### Apple stocks

![obraz](https://user-images.githubusercontent.com/21158649/115968374-f8bf4100-a537-11eb-8a54-8d4213be0331.png)

### Tesla stocks

![obraz](https://user-images.githubusercontent.com/21158649/115968397-15f40f80-a538-11eb-90e6-31a779378530.png)

## LowestNumWithNDivs

It's a mini-project written in Haskell in a purely functional way and
it's supposed to find lowest natural number x which has m <= n divisors.<br/>

For instance:<br/>
for n=16, x will be x=120m, because 120 is the first number that has m=16 divisors

## CombinatoricsAlgorithms

Small single-class project that prints:

- combinations
- variations
- permutations of a list

Uses some recursive algorithms

## BigNumberCPP

It's a mini-project, which was about creating a console calculator to add and subtract numbers of any length. It was supposed to be written without using STL, strings or vector. Just pure char arr and algorithmical operations.

Uses "windows.h" to clear console (delete "System("cls") if compliling on Linux).

## StructuresImplementationsCPP

Basic data structures (list, queue, 2-way-list etc.) implemented with C++

## Frontend_next_angular

Next-js and angular exercises, code snippets.
