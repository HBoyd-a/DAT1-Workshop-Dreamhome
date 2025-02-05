.open music.sqlite
DROP TABLE IF EXISTS track;
DROP TABLE IF EXISTS artist;

-- switching on referential integrity rules ( foreign key rules )
PRAGMA foreign_keys = ON;


CREATE TABLE artist (
    artistid INTEGER PRIMARY KEY NOT NULL,
    artistname VARCHAR(40)
);

CREATE TABLE track (
    trackid INTEGER,
    trackname VARCHAR(40),
    trackartist INTEGER,
    FOREIGN KEY (trackartist) REFERENCES artist(artistid) ON DELETE CASCADE
);

INSERT INTO artist (artistname)
VALUES ('Dean Martin'),
('Frank Sinatra');

INSERT INTO track (trackid,trackname,trackartist) VALUES
(11,'Thats Amore',1),
(12,'Christmas Blues',1),
(13,'My way',2);

--SELECT * FROM artist;

--1 - FOREIGN KEY CONTRAINT
--INSERT INTO track(trackid,trackname,trackartist) 
--VALUES (14,'Mr.Bojangles',3)

--2 - Works
INSERT INTO track (trackid,trackname,trackartist)
VALUES (14,'Mr.Bojangles',NULL);

-- 3 - DONT WORK
--UPDATE track (trackid,trackname,trackartist)
--SET trackartist = 3 WHERE trackname = 'Mr. Bojangles';

--4 
INSERT INTO artist VALUES(3, 'Sammy Davis Jr.');
UPDATE track SET trackartist = 3 WHERE trackname = 'Mr. Bojangles';
