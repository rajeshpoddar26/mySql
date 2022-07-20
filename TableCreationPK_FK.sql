-- CREATE SCHEMA/DATABASE
CREATE SCHEMA COUNTRY;
CREATE database earth;

-- DROP SCHEMA/DATABASE
DROP SCHEMA COUNTRY;
DROP DATABASE DEMO;

-- SHOW DATABASES 
SHOW DATABASES;

-- USE SCHEMA/DATABASE
USE earth;

-- CREATE TABLE
CREATE TABLE city (
	cityId varchar(50),
    cityName varchar(100),
    countryId varchar(50)
);
-- DROP TABLE 
DROp TABLE city;

-- CREATE TABLE
CREATE TABLE country (
	countryId varchar(50),
    countryName varchar(100)  
);
CREATE TABLE state (
	stateId varchar(50),
    stateName varchar(100),  
    cityId varchar(50)
);
CREATE TABLE district (
	districtId varchar(50),
    districtName varchar(100) ,
    stateId varchar(50)
);
CREATE TABLE block (
	blockId varchar(50),
    blockName varchar(100), 
    districtId varchar(50)
);
CREATE TABLE village (
	villageId varchar(50),
    villageName varchar(100),
    blockId varchar(50)
);

-- SHOW TABLE 
SELECT * FROM earth.country;
SELECT * FROM earth.state;
SELECT * FROM earth.district;
SELECT * FROM earth.block;
SELECT * FROM earth.village;

-- DROP COLUM FROM TABLE
ALTER TABLE earth.state
DROP COLUMN cityId;

-- DESCRIBE  field type 
DESCRIBE earth.country;
DESCRIBE earth.state;
DESCRIBE earth.district;
DESCRIBE earth.block;
DESCRIBE earth.village;

-- adding a new column in existing table
ALTER TABLE earth.state ADD countryId varchar(50); 

-- INSERT INTO TABLE
INSERT INTO earth.country
 VALUES('a1', 'India');
 
 INSERT INTO earth.country
 VALUES
 ('a2', 'Pakistan'),
 ('a3', 'Srilanka');
 
INSERT INTO earth.country(
	countryId, countryName
)
 VALUES
 ('a4', 'Bangladesh'),
 ('a5', 'Nepal')
 ;
 -- constraint
 -- To create a PRIMARY KEY constraint on the "ID" column when the table is already created
 
 -- Country
ALTER TABLE earth.country ADD PRIMARY KEY (countryId);
UPDATE earth.country SET countryName=0 WHERE countryName IS NULL;
-- FIRST SET COLUMN NAME TO NULL THEN PROCEED
ALTER TABLE earth.country MODIFY countryName varchar(100) NOT NULL;

-- STATE
ALTER TABLE earth.state ADD PRIMARY KEY (stateId);
UPDATE earth.state SET stateName=0 WHERE stateName IS NULL;
ALTER TABLE earth.state MODIFY stateName varchar(100) NOT NULL;
ALTER TABLE earth.state MODIFY countryId varchar(50) NOT NULL;

-- District
ALTER TABLE earth.district ADD PRIMARY KEY (districtId);
UPDATE earth.district SET districtName=0 WHERE districtName IS NULL;
ALTER TABLE earth.district MODIFY districtName varchar(100) NOT NULL;
ALTER TABLE earth.district MODIFY stateId varchar(50) NOT NULL;

-- Block
 ALTER TABLE earth.block ADD PRIMARY KEY (blockId);
UPDATE earth.block SET blockName=0 WHERE blockName IS NULL;
ALTER TABLE earth.block MODIFY blockName varchar(100) NOT NULL;
ALTER TABLE earth.block MODIFY districtId varchar(50) NOT NULL;

-- Village
ALTER TABLE earth.village ADD PRIMARY KEY (villageId);
ALTER TABLE earth.village MODIFY blockId varchar(50) NOT NULL;


-- DROP a PRIMARY KEY Constraint
ALTER TABLE earth.country DROP PRIMARY KEY;

-- ADD FORIGN KEY ON EXISTING TABLE
ALTER TABLE earth.state 
ADD FOREIGN KEY (countryId) REFERENCES earth.country(countryId);
ALTER TABLE earth.district 
ADD FOREIGN KEY (stateId) REFERENCES earth.state(stateId);
ALTER TABLE earth.block 
ADD FOREIGN KEY (districtId) REFERENCES earth.district(districtId);
ALTER TABLE earth.village 
ADD FOREIGN KEY (blockId) REFERENCES earth.block(blockId);
 
 -- ----------------------------------------------------------------- --
 -- DUMMY table with all fields at th same time
CREATE TABLE DUMMY (
	ummyId varchar(50) NOT NULL,
    dummyName varchar(100) NOT NULL, 
    mummyId varchar(100) NOT NULL,
    primary key(ummyId),
    FOREIGN KEY (mummyId) REFERENCES earth.mummy(mummyId)
    );
    CREATE TABLE mummy (
	mummyId varchar(50) NOT NULL,
    dummyName varchar(100) NOT NULL, 
    primary key(mummyId)
    );
describe earth.mummy;
describe earth.dummy;
 
 
 

 
















