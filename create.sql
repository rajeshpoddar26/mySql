-- Welcome to the MySQL monitor.  Commands end with ; or \g.
-- Your MySQL connection id is 1132
-- Server version: 8.0.29 MySQL Community Server - GPL

-- Copyright (c) 2000, 2022, Oracle and/or its affiliates.

-- Oracle is a registered trademark of Oracle Corporation and/or its
-- affiliates. Other names may be trademarks of their respective
-- owners.

-- Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| earth              |
| ecommerce          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> USE earth;
Database changed
mysql> SHOW TABLES;
+-----------------+
| Tables_in_earth |
+-----------------+
| block           |
| country         |
| district        |
| state           |
| village         |
+-----------------+
5 rows in set (0.00 sec)

mysql> SHOW country;
mysql> SELECT * FROM earth.country;
+-----------+-------------+
| countryId | countryName |
+-----------+-------------+
| a1        | India       |
| a2        | Pakistan    |
| a3        | Srilanka    |
| a4        | Bangladesh  |
| a5        | Nepal       |
+-----------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT state FROM earth;
mysql> SELECT state from earth.state;
ERROR 1054 (42S22): Unknown column 'state' in 'field list'
mysql> SELECT * from earth.state;
Empty set (0.00 sec)

mysql> DESCRIPTION state;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESCRIPTION state' at line 1
mysql> DESCRIPTION state FROM earth;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESCRIPTION state FROM earth' at line 1
mysql> DESCRIPTION earth.state;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESCRIPTION earth.state' at line 1
mysql> DESCRIPTION earth.state;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESCRIPTION earth.state' at line 1
mysql> DESCRIPTION earth.state;DESCRIBE earth.state;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESCRIPTION earth.state' at line 1
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| stateId   | varchar(50)  | NO   | PRI | NULL    |       |
| stateName | varchar(100) | NO   |     | NULL    |       |
| countryId | varchar(50)  | NO   | MUL | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> DESCRIPTION earth.state;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESCRIPTION earth.state' at line 1
mysql> DESCRIBE earth.state;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| stateId   | varchar(50)  | NO   | PRI | NULL    |       |
| stateName | varchar(100) | NO   |     | NULL    |       |
| countryId | varchar(50)  | NO   | MUL | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> INSERT INTO earth.state(stateId, stateName, countryId)
    -> values('s1', 'Bihar','A1');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM earth.state;
+---------+-----------+-----------+
| stateId | stateName | countryId |
+---------+-----------+-----------+
| s1      | Bihar     | A1        |
+---------+-----------+-----------+
1 row in set (0.00 sec)

mysql> INSERT INTO earth.state(stateId, stateName, countryId) VALUES('s2', 'Karnataka', 'a1');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO earth.state(stateId, stateName, countryId) VALUES('s2', 'Hydrabad', 'z1');
ERROR 1062 (23000): Duplicate entry 's2' for key 'state.PRIMARY'
mysql> INSERT INTO earth.state(stateId, stateName, countryId) VALUES('s2', 'Hydrabad', 'a1');
ERROR 1062 (23000): Duplicate entry 's2' for key 'state.PRIMARY'
mysql> INSERT INTO earth.state(stateId, stateName, countryId) VALUES('s3', 'Hydrabad', 'z1');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`earth`.`state`, CONSTRAINT `state_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`))
mysql> INSERT INTO earth.state(stateId, stateName, countryId) VALUES('s3', 'Hydrabad', 'a1');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT state from earth;
ERROR 1146 (42S02): Table 'earth.earth' doesn't exist
mysql> SELECT state from earth.state;
ERROR 1054 (42S22): Unknown column 'state' in 'field list'
mysql> SELECT * from earth.state;
+---------+-----------+-----------+
| stateId | stateName | countryId |
+---------+-----------+-----------+
| s1      | Bihar     | A1        |
| s2      | Karnataka | a1        |
| s3      | Hydrabad  | a1        |
+---------+-----------+-----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM eart.district;
ERROR 1049 (42000): Unknown database 'eart'
mysql> SELECT * FROM eart.district;
ERROR 1049 (42000): Unknown database 'eart'
mysql> SELECT * FROM earth.district;
Empty set (0.00 sec)

mysql> DESCRIBE earth.district;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| districtId   | varchar(50)  | NO   | PRI | NULL    |       |
| districtName | varchar(100) | NO   |     | NULL    |       |
| stateId      | varchar(50)  | NO   | MUL | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> INSERT INTO earth.district VALUES('d1', 'Begusarai', 's1');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO earth.district VALUES('d2', 'Patna', 's1'), ('d3', 'Darbhanga','s1');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO earth.district
    -> VALUES
    -> ('d4','Bangalore','s2'),
    -> ('d5', 'BTM-Layout', s2),
    -> ('d6', 'Mangalore', 's2');
ERROR 1054 (42S22): Unknown column 's2' in 'field list'
mysql> ('d5', 'BTM-Layout', 's2');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''d5', 'BTM-Layout', 's2')' at line 1
mysql> INSERT INTO earth.district
    -> values(
    -> ('d4', 'Bangalore', 's2'),
    -> ('d5', 'BTM-Layout', 's2'),
    -> ('d6', 'Mangalore', 's2');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 5
mysql> INSERT INTO earth.district
    ->     -> VALUES
    ->     -> ('d4','Bangalore','s2'),
    -> ('d5','BTM-Layout', 's2');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> VALUES
    -> ('d4','Bangalore','s2'),
('d5','BTM-Layout', 's2')' at line 2
mysql> INSERT INTO earth.district
    -> VALUES
    -> ('d4','Bangalore','s2'),
    -> ('d5', 'BTM-Layout', 's2'),
    -> ('d6', 'Mangalore', 's2');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM eart.district;
ERROR 1049 (42000): Unknown database 'eart'
mysql> SELECT * FROM earth.district;
+------------+--------------+---------+
| districtId | districtName | stateId |
+------------+--------------+---------+
| d1         | Begusarai    | s1      |
| d2         | Patna        | s1      |
| d3         | Darbhanga    | s1      |
| d4         | Bangalore    | s2      |
| d5         | BTM-Layout   | s2      |
| d6         | Mangalore    | s2      |
+------------+--------------+---------+
6 rows in set (0.00 sec)

mysql> DIS Block;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DIS Block' at line 1
mysql> DIS earth.block;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DIS earth.block' at line 1
mysql> DISCRIBE earth.block;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DISCRIBE earth.block' at line 1
mysql> DESCRIBE earth.block;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| blockId    | varchar(50)  | NO   | PRI | NULL    |       |
| blockName  | varchar(100) | NO   |     | NULL    |       |
| districtId | varchar(50)  | NO   | MUL | NULL    |       |
+------------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> INSERT INTO earth.block    VALUES    ('b1', 'Bakhri','d1'),    ('b2', 'kauraha','d1'),    ('b3', 'Golghar','d2' ),    ('b4', 'Golghar','d2' ),    ('b5','Dara','d3'),('b6','Panpata','d4'),    ('b7', 'Thubrahali','d5' ),    ('b8','Yelanka','d6');
Query OK, 8 rows affected (0.00 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM earth.block;
+---------+------------+------------+
| blockId | blockName  | districtId |
+---------+------------+------------+
| b1      | Bakhri     | d1         |
| b2      | kauraha    | d1         |
| b3      | Golghar    | d2         |
| b4      | Golghar    | d2         |
| b5      | Dara       | d3         |
| b6      | Panpata    | d4         |
| b7      | Thubrahali | d5         |
| b8      | Yelanka    | d6         |
+---------+------------+------------+
8 rows in set (0.00 sec)

mysql> INSERT INTO earth.village    VALUES    ('v1', 'Parihara','b1'),    ('v2', 'malkua','b1'),    ('v3', 'dibara','b2' ),    ('v4', 'hardiya','b2' ),    ('v5','haldar','b3'),('v6','malhar','b4'),    ('v7', 'panaha','b5' ),    ('v8','kankata','b6'),    ('v9','kundalhali','b7'),    ('v10','harnaka','b8')    ;
Query OK, 10 rows affected (0.00 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM earth.block;
+---------+------------+------------+
| blockId | blockName  | districtId |
+---------+------------+------------+
| b1      | Bakhri     | d1         |
| b2      | kauraha    | d1         |
| b3      | Golghar    | d2         |
| b4      | Golghar    | d2         |
| b5      | Dara       | d3         |
| b6      | Panpata    | d4         |
| b7      | Thubrahali | d5         |
| b8      | Yelanka    | d6         |
+---------+------------+------------+
8 rows in set (0.00 sec)

mysql> select * FROM earth.village;
+-----------+-------------+---------+
| villageId | villageName | blockId |
+-----------+-------------+---------+
| v1        | Parihara    | b1      |
| v10       | harnaka     | b8      |
| v2        | malkua      | b1      |
| v3        | dibara      | b2      |
| v4        | hardiya     | b2      |
| v5        | haldar      | b3      |
| v6        | malhar      | b4      |
| v7        | panaha      | b5      |
| v8        | kankata     | b6      |
| v9        | kundalhali  | b7      |
+-----------+-------------+---------+
10 rows in set (0.00 sec)