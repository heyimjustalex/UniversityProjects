# FirePolice-Data_warehouse

It's a university project which consists of few stages

1. Specify bussiness requirements, and the topic you want to model. In this case it's fire police
2. Make 2 data sources - RDB and Excel sheet
3. Write Python Data Generator for both sources with two time stamps T1 and T2
4. Specify buissnes questions that your data warehouse will answer 
5. Design data warehouse and implement it
6. Load data with ETL and TSQL from both sources to data warehouse
7. Create KPI with Microsoft Analysis Services
8. Create charts in Power BI


# How to set it up

1. If you want to generate data yourself use DataGenerator and if you just want to load RDB with data you can use SMALL or BIG dataset from this link -> https://drive.google.com/drive/folders/1i3inRVgsG2Xb42joXDK9f2wlyVnH7XbQ?usp=sharing (big data sets with milions of rows might generate HOURS!!)
2. Create RDB and load data with these scripts -> RDB_fire_police/SQL/
3. Create DW with these scripts DW_fire_police/SQL/create_tables_dw.sql
4. Now you can load sample DW data (DW_fire_police/SampleData/) with DW_fire_police/SQL/bulk_load_dw.sql OR use ETL process to collect data from RDB and Excel
5. Use FirePolice-Data_warehouse/DW_fire_police/Implementation_VS2017/ to browse cubes and make sql queries with "Browse" 

## DW PROJECT VS
![obraz](https://user-images.githubusercontent.com/21158649/146068374-c3575fdd-8ea6-41d0-85f0-4cc86987281b.png)

## DATA GENERATOR

![obraz](https://user-images.githubusercontent.com/21158649/146068530-9e2bd008-98ac-4903-8a9a-dc1b1ab1f20d.png)

## KPI
![Screenshot_856](https://user-images.githubusercontent.com/21158649/154797867-bf4fd7f6-9762-4acc-afc0-9bbae2cd9986.png)


## POWER BI CHARTS
![Screenshot_855](https://user-images.githubusercontent.com/21158649/154797822-047c6651-14af-489b-8bbb-ed4b550c5c5c.png)
![Screenshot_857](https://user-images.githubusercontent.com/21158649/154797845-c11ad37a-c7f5-4236-8461-330c1e8dce96.png)
