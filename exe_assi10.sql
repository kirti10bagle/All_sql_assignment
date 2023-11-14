-- ASSIGNMENT 10
create database peopledb;
use peopledb;
-- table PEOPLE: containing unique ID and corresponding names.
CREATE TABLE PEOPLE (id INTEGER primary key, name varchar(50));

INSERT INTO PEOPLE VALUES(1, "A");
INSERT INTO PEOPLE VALUES(2, "B");
INSERT INTO PEOPLE VALUES(3, "C");
INSERT INTO PEOPLE VALUES(4, "D");

-- ADDRESS: containing the history of address information of each ID.
CREATE TABLE ADDRESS (id INTEGER PRIMARY key, address varchar(50), updatedate date,
FOREIGN KEY (ID) REFERENCES PEOPLE(ID) );

INSERT INTO ADDRESS VALUES(1, "address-1-1", "2016-01-01");
INSERT INTO ADDRESS VALUES(1, "address-1-2", "2016-09-02");
INSERT INTO ADDRESS VALUES(2, "address-2-1", "2015-11-01");
INSERT INTO ADDRESS VALUES(3, "address-3-1", "2016-12-01");
INSERT INTO ADDRESS VALUES(3, "address-3-2", "2014-09-11");
INSERT INTO ADDRESS VALUES(3, "address-3-3", "2015-01-01");
INSERT INTO ADDRESS VALUES(4, "address-4-1", "2010-05-21");
INSERT INTO ADDRESS VALUES(4, "address-4-2", "2012-02-11");
INSERT INTO ADDRESS VALUES(4, "address-4-3", "2015-04-27");
INSERT INTO ADDRESS VALUES(4, "address-4-4", "2014-01-01");

drop table people;
drop table address;

-- 10.1 Join table PEOPLE and ADDRESS, but keep only one address information for each person (we don't mind which record we take for each person). 
    -- i.e., the joined table should have the same number of rows as table PEOPLE
    select people.id, people.name,temp.address from people
    left join 
    (
    select id,max(address)as address
    from address
    group by id) as temp
    on people.id = temp.id ;
    
-- 10.2 Join table PEOPLE and ADDRESS, but ONLY keep the LATEST address information for each person. 
    -- i.e., the joined table should have the same number of rows as table PEOPLE
SELECT
PEOPLE.id, PEOPLE.name, TEMP.address
FROM
PEOPLE
LEFT JOIN
(
SELECT id, address, MAX(updatedate)
FROM ADDRESS
GROUP BY id
)
AS TEMP
ON PEOPLE.id =Temp.id;
