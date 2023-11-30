create database worker;
use worker;
create table workers(
worker_id int primary key,
first_name varchar(100),
last_name varchar(100),
salary int,
joining_date datetime,
department varchar(100)
);
insert into workers (worker_id,first_name,last_name,salary,joining_date,department)values
(1,"Monika","Arora",100000,"2019-2-20 9:00","Hr"),
(2,"Neharika","Verma",80000,"2014-6-11 9:00","Admin"),
(3,"Vishal","Singhal",300000,"2014-2-20 9:00","Hr"),
(4,"Amitabh","Singh",500000,"2014-2-20 9:00","Admin"),
(5,"Vivek","Bhati",500000,"2014-6-11 9:00","Admin"),
(6,"Vipul","Diwan",200000,"2014-6-11 9:00","Accountant"),
(7,"Satish","Kumar",75000,"2014-1-20 9:00","Accontant"),
(8,"Gitika","Chauhan",90000,"2014-4-11 9:00","Admin");
select * from workers;
-- 1 Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 
select * from workers order by first_name asc ,department desc;

-- 2 Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table. 
select first_name from workers where first_name = "Vipul" or first_name="Satish";

-- 3 Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
select  * from workers where first_name like "%h" limit 1;

-- 4 Write an SQL query to print details of the Workers whose SALARY lies between 1. 
select * from workers where salary between 100000 ;

-- 5 Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
SELECT Worker_id, COUNT(Worker_id)
FROM workers
GROUP BY worker_id
HAVING COUNT(worker_id) > 1;

-- 6 Write an SQL query to show the top 6 records of a table. 
select * from workers limit 6;

-- 7. Write an SQL query to fetch the departments that have less than five people in them. 

-- 8. Write an SQL query to show all departments along with the number of people in there. 


-- 9. Write an SQL query to print the name of employees having the highest salary in each department.
select first_name,salary,department from workers  order by  salary desc limit 1;
