.open ddlPractice.sqlite

-- switching on referential integrity rules ( foreign key rules )
PRAGMA foreign_keys = ON;

-- delete the table so it can be created
DROP TABLE IF EXISTS appearance;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS SalesStaff;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS appearance;


-- create PARNETS table 

CREATE TABLE contacts (
    contactsID INTEGER PRIMARY KEY NOT NULL,
    fname VARCHAR(25),
    lname VARCHAR(25),
    email VARCHAR(40) CHECK ( email LIKE '%@%'),
    phone CHAR(11)
);


-- inserts data into table 
INSERT INTO contacts (fname, lname, email, phone)
VALUES ('harley','boyd','hazbaz@gmail.com',07754662427),
('lauryn','boyd','lauryn@gmail.com',06543214567),
('stu','boyd','stu@gmail.com',03443433433);

CREATE TABLE appearance (
    appearanceID INTEGER PRIMARY KEY NOT NULL,
    haircolour VARCHAR(20) CHECK (haircolour IN ('black','brown','green','blonde') ), 
    wearglasses BOOLEAN ,
    contactsID INTEGER,
    FOREIGN KEY (contactsID) REFERENCES contacts
);

INSERT INTO appearance (haircolour, wearglasses, contactsID)
VALUES ('brown',TRUE, 1),
('blonde',TRUE, 2),
('brown',FALSE, 3);

CREATE TABLE SalesStaff (
    employeeID INTEGER PRIMARY KEY NOT NULL,
    salesPerson VARCHAR(25),
    salesOffice VARCHAR(25),
    officeNumber CHAR(10),
    customer1 VARCHAR(15),
    customer2 VARCHAR(15),
    customer3 VARCHAR(15)
);

INSERT INTO SalesStaff (employeeID,salesPerson,salesOffice,officeNumber,customer1,customer2,customer3)
VALUES (1003,'Mary Smith','chicago',3125551212,'Ford','gm',NULL),
(1004,'John Hunt','New york',2125551212,'dell','hp','apple'),
(1005,'Martin hap','chicago',3125551212,'boeing',NULL,NULL);

CREATE TABLE student (
    studentID INTEGER PRIMARY KEY NOT NULL,
    fname VARCHAR(25),
    major VARCHAR(25),
    numberofCredit VARCHAR(5)
);

INSERT INTO student ( studentID,fname,major,numberofCredit)
VALUES (111,'kirsten','accounting',152),
(222,'eve','IS',138),
(333,'zoe','IS',138),
(444,'Ben','accounting',152);

CREATE TABLE employees (
    employeeID VARCHAR PRIMARY KEY NOT NULL,
    fname VARCHAR(25),
    jobcode CHAR(3),
    job VARCHAR(25),
    statecode CHAR(2),
    homestate VARCHAR(25)
);

