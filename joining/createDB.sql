.open license.sqlite
.mode box
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS drivers;
DROP TABLE IF EXISTS vehicles;

CREATE TABLE vehicles (
    vehicleid INTEGER PRIMARY KEY NOT NULL,
    odoreading INTEGER,
    name TEXT
);

CREATE TABLE drivers (
    driverid INTEGER PRIMARY KEY NOT NULL,
    age INTEGER,
    car INTEGER,
    FOREIGN KEY (car) REFERENCES vehicles(vehicleid)
);

INSERT INTO vehicles (odoreading, name)
VALUES (15000,'ford focus'),
(85000,'honda civic'),
(250000,'toyota camry'),
(5500,'tesla model 3'),
(120000,'chevrolet silverado'),
(35000,'bmw x5');

INSERT INTO drivers ( age, car)
VALUES (35,3),
(28,1),
(52,5),
(22,4);

-- inner join - willl return only the rows where there is a matching entry in both tables. eg drivers associated with the vehicle.
SELECT 
    d.driverid AS Driver_ID, 
    d.age AS Driver_Age, 
    v.name AS Vehicle_Name, 
    v.odoreading AS Vehicle_Odometer
FROM drivers d
INNER JOIN vehicles v ON d.car = v.vehicleid;

-- left outer join - ensures that even drivers without an assigned vehicle (those whose carid does not match any vehicleid) will be included, with NULL values for the vehicle-related columns.

SELECT *
FROM
    vehicles v
INNER  JOIN 
    drivers  d 
ON v.vehicleid = d.car;

SELECT *
FROM
    vehicles v
LEFT OUTER JOIN 
    drivers  d 
ON v.vehicleid = d.car;

