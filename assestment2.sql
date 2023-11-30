create database school;
use school;
create table student(
stdid int primary key,
stdname varchar(100),
sex varchar(100),
percentage int,
class int,
sec varchar(50),
stream varchar(100),
dob date
);
insert into student(stdid,stdname,sex,percentage,class,sec,stream,dob)values
(1001,"Surekha Joshi","female",82,12,"A","science","3-8-1998");
(1002,"Mahi Agarval","female",56,11,"C","commerce",23-11-2008),
(1003,"Sanam Verma","Male",59,11,"C","commerce",29-6-2006),
(1004,"Ronit Kumar","Male",63,11,"C","commerce",5-11-1997),
(1005,"Dipesh Pulkit","Male",78,11,"B","science",9-14-2003),
(1006,"Jahanvi Puri","female",60,11,"B","commerce",7-11-2008),
(1007,"Sanam Kumar","Male",23,12,"F","commerce",8-3-1998),
(1008,"Sahil Saras","Male",56,11,"C","commerce",7-11-2008),
(1009,"Akshra Agarwal","female",72,12,"B","commerce",1-10-1996),
(1010,"Stuti Mishra","female",39,11,"F","science",23-11-2008),
(1011,"Harsh Agarwal","Male",42,"11","C","science",3-8-1998),
(1012,"Nikunj Agarwal","Male",49,12,"C","coomerce",6-23-1998),
(1013,"Akriti Saxena","female",89,12,"A","science",23-11-2008),
(1014,"Tani Rastogi","female",82,12,"A","science",23-11-2008);

-- 1 To display all the records form STUDENT table.
 SELECT * FROM student ; 
 
-- 2. To display any name and date of birth from the table STUDENT. 
SELECT StdName, DOB FROM student ; 

-- 3. To display all students record where percentage is greater of equal to 80 FROM student table. 
SELECT * FROM student WHERE percentage >= 80; 

-- 4. To display student name, stream and percentage where percentage of student is more than 80 
SELECT StdName, Stream, Percentage WHERE percentage > 80; 

-- 5. To display all records of science students whose percentage is more than 75 form student table. 
SELECT * FORM student WHERE stream = ‘Science’ AND percentage > 75;