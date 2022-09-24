select * from employees;

select FIRST_NAME, LAST_NAME, SALARY from employees;

--Comment -- ile yapilir.

select * from COUNTRIES;
select COUNTRY_ID, REGION_ID from COUNTRIES;

--regions
select * from REGIONS;

select * from DEPARTMENTS;

--
select FIRST_NAME, LAST_NAME, SALARY from employees;

-- DiSTINCT
select FIRST_NAME from employees; --107
select distinct FIRST_NAME from employees; --91

select FIRST_NAME, SALARY from employees; --107
select distinct FIRST_NAME, SALARY from employees; --107

--where Query
select FIRST_NAME, EMAIL, SALARY
from employees
where FIRST_NAME='James';

select FIRST_NAME, EMAIL, SALARY
from employees
where SALARY>5000;

select FIRST_NAME, EMAIL, SALARY
from employees
where SALARY>5000 and SALARY<10000; --between 5000 and 10000
-- Degerler dahil degil.  (39 kisi)


select FIRST_NAME, EMAIL, SALARY
from employees
where SALARY between 5000 and 10000; --degerler dahildir (43 kisi)

--or
select FIRST_NAME, EMAIL, SALARY
from employees
where SALARY>=5000 and SALARY<=10000;

-- in
-- JOB_ID -> it_prog and st_man

select FIRST_NAME, LAST_NAME
from employees
where JOB_ID in ('IT_PROG', 'ST_MAN');

 -- bir tane icin
select FIRST_NAME, LAST_NAME
from employees
where JOB_ID='IT_PROG'; --5

select FIRST_NAME, LAST_NAME
from employees
where JOB_ID='ST_MAN'; --5

--or
select FIRST_NAME, LAST_NAME
from employees
where JOB_ID in ('ST_MAN'); --5


-- all information  for specific person
select *
from employees
where FIRST_NAME='Adam' and LAST_NAME='Fripp';

--NoT iN

select FIRST_NAME, LAST_NAME, JOB_ID
from employees
where JOB_ID not in ('IT_PROG', 'ST_MAN'); --exclude
