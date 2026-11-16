-- CREATE DATABASE --
create database if not exists EmployeeDB;
-- USE DATABASE --
use EmployeeDB;

-- CREATE TABLES EMPLYOEEs, DEPARTMENTs AND LOCATION --

/* DEPARTMENT TABLE AND ATTRIBUTES
| COLUMN 			| TYPE 			| CONSTRAINTS |
| department_id 	| int 			| PK 		  |
| department_name 	| varchar(100) 	| 			  |
*/
create table department (
	department_id int,
    department_name varchar(100),
    primary key (department_id)
);
desc department;

/* LOCATION TABLE AND ATTRIBUTES
| COLUMN 		| TYPE 			| CONSTRAINTS |
| location_id 	| int 			| PK 		  |
| location_name | varchar(30) 	| 			  |
*/
create table location(
	location_id int,
    location_name varchar(30),
    primary key (location_id)
);
desc location;
/* EMPLOYEES TABLE AND ATTRIBUTES
| COLUMN		| TYPE 			| CONSTRAINTS |
| employee_id 	| int 			| PK 		  |
| employee_name | varchar(50) 	|			  |
| gender 		| enum(m,f) 	|			  |
| age 			| int 			|			  |
| hire_date 	| date 			|			  |
| designation 	| varchar(100) 	|			  |
| salary 		| decimal (10,2)| 			  |
| department_id | int 			| FK		  |
| location_id   | int 			| FK 		  |
*/
create table employees (
	employee_id int,
    employee_name varchar(50),
    gender int,
    age int,
    hire_date date,
    designation varchar(100),
    salary decimal(10,2),
    department_id int,
    location_id int,
    primary key (employee_id),
    foreign key (department_id) references department(department_id),
    foreign key (location_id) references location(location_id)
);
desc employees;

/* ADD COLUMN => EMAIL TO EMPLOYEES TABLE => Add a new column named "email" 
to the Employees table to store employee email addresses 
*/
alter table employees add column email varchar(100);

/* MODIFY COLUMN => DESIGNATION IN EMPLOYEES TABLE => Modify the data type of 
the "designation" column in the Employees table to support a wider range of values:
*/
alter table employees modify designation varchar(300);

/* DROP COLUMN => AGE FROM EMPLOYEES TABLE => Drop the “age” column from the Employees table
*/
alter table employees drop column age;
desc employees;

/* RENAME COLUMN => HIRE_DATE TO DATE_OF_JOINING => Rename the “hire_date” column to “date_of_joining” in 
employees table
*/
alter table employees change hire_date date_of_joining date;
desc employees;

/*Rename the "Departments" table to "Departments_Info":
*/
rename table department to departments_info;
desc departments_info;

/*Rename the "Location" table to "Locations":
*/
rename table location to locations;

/*Table Truncation (TRUNCATE):
● Truncate the Employees table
*/
truncate table employees;

/*
Database & Table Dropping (DROP):
● Drop the Employees table and then the “employee” database.
*/
drop table employees;
drop database employeedb;

/*
DATABASE RECREATION WITH PROVIDED SCHEMA AND CONSTRAINTS:
*/
-- CREATE DATABASE --
create database if not exists EmployeeDB;
-- USE DATABASE --
use EmployeeDB;

-- CREATE TABLES EMPLYOEEs, DEPARTMENTs AND LOCATION with CONSTRAINTS--

-- DEPARTMENT TABLE WITH CONSTRAINTS --
/*
Ensure that the "department_id" uniquely identifies each department.
Set up constraints on the "department_name" to avoid duplicate and null
entries.
*/
/* DEPARTMENT TABLE AND ATTRIBUTES
| COLUMN 			| TYPE 			| CONSTRAINTS	   |
| department_id 	| int 			| PK , Unique	   |
| department_name 	| varchar(100) 	| not null, Unique |
*/

create table department (
	department_id int unique,
    department_name varchar(100) not null unique,
    primary key (department_id)
);

-- LOCATION TABLE WITH CONSTRAINTS --
/*
Establish a mechanism to automatically generate unique identifiers for each location, ensuring that they are incremented sequentially.
Implement constraints to prevent the insertion of null and duplicate locations.
*/
/* LOCATION TABLE AND ATTRIBUTES
| COLUMN 		| TYPE 			| CONSTRAINTS		 |
| location_id 	| int 			| PK , autoincrement |
| location_name | varchar(30) 	| not null, unique	 |
*/
create table location(
	location_id int auto_increment,
    location_name varchar(30) not null unique,
    primary key (location_id)
);

-- EMPLOYEE TABLE WITH CONSTRAINTS -- 
/*
| COLUMN		| TYPE 			| CONSTRAINTS			|
| employee_id 	| int 			| PK, unique 			|
| employee_name | varchar(50) 	| not null				|
| gender 		| enum(m,f) 	|			 			|
| age 			| int 			| check (age>=18)		|
| hire_date 	| date 			| default(current_date) |
| designation 	| varchar(100) 	|			  			|
| salary 		| decimal (10,2)| 			  			|
| department_id | int 			| FK		  			|
| location_id   | int 			| FK 		  			|
*/
create table employees (
	employee_id int unique,
    employee_name varchar(50) not null,
    gender enum('M','F'),
    age int check(age>=18) ,
    hire_date date default(current_date()) ,
    designation varchar(100),
    salary decimal(10,2),
    department_id int,
    location_id int,
    primary key (employee_id),
    foreign key (department_id) references department(department_id),
    foreign key (location_id) references location(location_id)
);