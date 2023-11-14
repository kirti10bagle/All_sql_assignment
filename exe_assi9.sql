-- ASSIGNMENT 9
create database exercise9db;
use exercise9db;

create table cran_logs_tbl(
date_value date,
time_value time,
size int,
r_version varchar(12),
r_each varchar(12),
r_os varchar(12),
package varchar(30),
version varchar(20),
country char(2),
ip_id int
);

select * from cran_logs_tbl;

-- 9.1 give the total number of recordings in this table
select count(*) from  cran_logs_tbl;

-- 9.2 the number of packages listed in this table?
select count(distinct package) from cran_logs_tbl ;

-- 9.3 How many times the package "Rcpp" was downloaded?
select count(*) from cran_logs_tbl where package = "Rcpp";

-- 9.4 How many recordings are from China ("CN")?
select count(*) from cran_logs_tbl where country = 'CN';

-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
select count(*),package from cran_logs_tbl group by package
order by 2 desc ;

-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
select package ,count(*) from
(select * from cran_logs_tbl
where substr(time, 1,5)<"11:00"
and
substr(time, 1,5)>"09:00") 
group by package
order by 2 desc ;

-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
select count(*) from cran_logs_tbl where country="CN" or country="JP" or country="SG";

-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
select max(country) from cran_logs_tbl where country="CN";

-- 9.9 Print the average length of the package name of all the UNIQUE packages
SELECT temp.a package, temp.b count
FROM
(
SELECT package a, count(*) b
	FROM cran_logs_tbl
	GROUP BY package
	ORDER BY b DESC
	LIMIT 2
) temp
ORDER BY temp.b ASC
LIMIT 1;

-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
SELECT temp.a package, temp.b count
FROM
(
SELECT package a, count(*) b
	FROM cran_logs_tbl
	GROUP BY package
	ORDER BY b DESC
	LIMIT 2
) temp
ORDER BY temp.b ASC
LIMIT 1;

-- 9.11 Print the name of the package whose download count is bigger than 1000.
   select package from cran_logs_tbl group by package having count(*) > 1000;

--  *9.12 The field "r_os" is the operating system of the users.
-- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).
SELECT SUBSTR(r_os, 1, 5) AS OS, 
	COUNT(*) AS Download , 
	SUBSTR(COUNT(*)/((SELECT COUNT(*) FROM cran)*1.0)*100, 1, 4) || "%" AS PROPORTION
FROM cran_logs_tbl
GROUP BY SUBSTR(r_os, 1, 5);