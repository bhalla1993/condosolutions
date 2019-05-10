DROP DATABASE IF exists nationwidecondosolutions;
CREATE DATABASE IF NOT EXISTS nationwidecondosolutions;
use nationwidecondosolutions;

CREATE TABLE USER(
ID int NOT NULL PRIMARY KEY auto_increment,
USERNAME varchar(100) NOT NULL,
PASSWORD varchar(100) NOT NULL,
FIRST_NAME varchar(50),
LAST_NAME varchar(50),
SEX varchar(1),
DATE_OF_BIRTH date,
EMAIL varchar(250),
PHONE varchar(50),
ADDRESS text,
UNIQUE(USERNAME)
);

ALTER TABLE USER ADD COLUMN CREATION_DATE timestamp default current_timestamp;
ALTER TABLE USER ADD COLUMN UPDATION_DATE timestamp;
ALTER TABLE USER ADD COLUMN ACTIVATE varchar(1) DEFAULT 'Y';

insert into USER values(1,'shiva','shiva123','Shiva','Bhalla','M','2019-05-01','shiva.bhalla@gmail.com','4379878669','Brampton',now(),now(),'Y');
insert into USER values(2,'adm','admin123','Admin','','M','2019-05-01','admin@gmail.com','4379878669','Markham',now(),now(),'Y');

CREATE TABLE USER_SHIFT_LOGS(
ID int NOT NULL PRIMARY KEY auto_increment,
START_TIME varchar(50),
END_TIME varchar(50),
RELIEVED varchar(50),
RELIEVED_BY varchar(50),
EQUIPMENTS varchar(50),
CREATION_DATE timestamp default current_timestamp,
UPDATION_DATE timestamp,
USER_ID varchar(50),
LOGS text
);

CREATE TABLE LOCATIONS(
ID int NOT NULL PRIMARY KEY auto_increment,
LOCATION_NAME varchar(100),
LOCATION_ADDRESS varchar(200),
CREATION_DATE timestamp default current_timestamp,
UPDATION_DATE timestamp,
IS_SUPERVISOR varchar(1) default "N"
);

CREATE TABLE LOCATION_USER_MAPPING(
ID int NOT NULL PRIMARY KEY auto_increment,
LOCATION_ID int, 
USER_ID varchar(100)
);