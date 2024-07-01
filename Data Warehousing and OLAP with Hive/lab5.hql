


use csc572;

set hive.cli.print.header=true;



CREATE TABLE csc572.drivers ( driverId INT, name STRING, ssn BIGINT, location STRING, certified STRING, wageplan STRING) COMMENT 'drivers' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE TBLPROPERTIES('skip.header.line.count'='1');

CREATE TABLE csc572.timesheet ( driverId INT, week INT, hours_logged INT, miles_logged INT) COMMENT 'timesheet' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE TBLPROPERTIES('skip.header.line.count'='1');

CREATE TABLE csc572.truck_event ( driverId INT, truckId INT, eventTime STRING, eventType STRING, longitude DOUBLE, latitude DOUBLE, eventKey STRING, CorrelationId DOUBLE, driverName STRING, routeId BIGINT, routeName STRING, eventDate STRING) COMMENT 'timesheet' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE TBLPROPERTIES('skip.header.line.count'='1');

show tables;



DESCRIBE csc572.drivers;

DESCRIBE csc572.timesheet;

DESCRIBE csc572.truck_event;



LOAD DATA LOCAL INPATH '/home/data/CSC572ADC/datasets/Truck-IoT/drivers.csv' INTO TABLE csc572.drivers;

LOAD DATA LOCAL INPATH '/home/data/CSC572ADC/datasets/Truck-IoT/timesheet.csv' INTO TABLE csc572.timesheet;

LOAD DATA LOCAL INPATH '/home/data/CSC572ADC/datasets/Truck-IoT/truck_event_text_partition.csv' INTO TABLE csc572.truck_event;



SELECT * FROM csc572.drivers LIMIT 5;

SELECT * FROM csc572.TIMESHEET LIMIT 5;

SELECT * FROM csc572.truck_event LIMIT 5;



SELECT COUNT(*) FROM csc572.drivers;

SELECT COUNT(*) FROM csc572.TIMESHEET;

SELECT COUNT(*) FROM csc572.truck_event;



SELECT driverid, eventType, count(*) FROM csc572.truck_event GROUP BY driverId, eventType;


SELECT driverId, count(*) FROM csc572.truck_event GROUP BY driverid;


SELECT driverid, eventType, count(*) AS total FROM csc572.truck_event GROUP BY driverId, eventType UNION ALL SELECT driverid, null as eventType, count(*) AS total FROM csc572.truck_event GROUP BY driverid;


SELECT driverId, eventType, count(*) AS occurrence FROM csc572.truck_event GROUP BY driverId, eventType GROUPING SETS ((driverId, eventType), driverId);



SELECT driverId, eventType, COUNT(*) AS occurrence FROM csc572.truck_event GROUP BY driverId, eventType WITH ROLLUP;



SELECT driverId, eventType, COUNT(*) AS occurrence FROM csc572.truck_event GROUP BY driverId, eventType WITH CUBE;
