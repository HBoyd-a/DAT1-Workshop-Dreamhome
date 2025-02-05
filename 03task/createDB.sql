.open ddlPractice.sqlite


DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS voter;

-- switching on referential integrity rules ( foreign key rules )
PRAGMA foreign_keys = ON;

CREATE TABLE contacts (
    contactID INTEGER PRIMARY KEY NOT NULL,
    fname VARCHAR(25) NOT NULL,
    lname VARCHAR(25) NOT NULL,
    email VARCHAR(25),
    phone CHAR(11) NOT NULL CHECK (LENGTH(phone) >= 10)
);

CREATE TABLE products (
    productID INTEGER PRIMARY KEY NOT NULL,
    productname VARCHAR(25),
    listprice DECIMAL(10,2) NOT NULL CHECK (listprice >=0),
    discount DECIMAL(10,2) NOT NULL CHECK (discount >=0),
    CHECK (listprice >= discount)
    --contactID INTEGER,
    --FOREIGN KEY (contactID) REFERENCES contacts
);

CREATE TABLE voter (
    voterID INTEGER PRIMARY KEY NOT NULL,
    name VARCHAR(25),
    age INTEGER CHECK (age >= 18),
    dob DATE
);


