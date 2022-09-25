
select * from EMPLOYEES;

select * from LOCATIONS;
select * from COUNTRIES;

select * from REGIONS;

--is null

select * from EMPLOYEES
where COMMISSION_PCT is null; --72

select * from EMPLOYEES
where COMMISSION_PCT is not null; --35


-- order by
select * from COUNTRIES
order by COUNTRY_NAME desc;--ascending order (1-9 a-z

--or
select COUNTRY_ID from COUNTRIES
order by COUNTRY_ID desc;


select *
from EMPLOYEES
order by SALARY desc ;--asc (sorting out)

--
select * from EMPLOYEES
order by 7 desc ;

--interview sorusu
--get me all information from employees based firstname asc and lastname desc
select * from EMPLOYEES
order by FIRST_NAME asc, LAST_NAME desc , EMAIL desc ;
-- Ahmet Ankara     ->ahmet Zeytin
-- Ahmet Beyaz      ->Ahmet Beyaz
-- Ahmet Zeytin     -Ahmet Ankara


-- LIKE
-- % (any all characters)
-- underscore _ (only one character)
select * from EMPLOYEES
where FIRST_NAME like 'D%';

select * from EMPLOYEES
where FIRST_NAME not like 'D%';

select * from EMPLOYEES
where FIRST_NAME like 'D_v__'; -- first letter D, total number of letter 5

select * from EMPLOYEES
where LAST_NAME like '%d';

-- count
select count(FIRST_NAME) from EMPLOYEES;

-- JOB_id degeri it_prog kac kisi calisiyor.

select count(*) from EMPLOYEES
where COMMISSION_PCT is not null;

-- max min avg round
select max(SALARY) from EMPLOYEES;
select min(SALARY) from EMPLOYEES;
select avg(SALARY) from EMPLOYEES; --6461.831775700934579439252336448598130841
select round(avg(SALARY), 2) from EMPLOYEES; --6461.83

--distinct
select avg( distinct SALARY) from EMPLOYEES; --7067.379310344827586206896551724137931034

-- kac kisi farkli maas aliyor
select count(  distinct SALARY) from EMPLOYEES; --58
-- 58 tane farkli maas degeri var.

--sum
-- ayda sirket toplam ne kadar maas oduyor
select sum(SALARY) from EMPLOYEES; --691416

--group by

select JOB_ID, count(*), avg(SALARY)
from EMPLOYEES
group by JOB_ID;

--group by + having
select JOB_ID, count(*), avg(SALARY)
from EMPLOYEES
group by JOB_ID
having avg(SALARY)>7000; --extra specific condition

--
-- get me department_id where employees count bigger than 5
select DEPARTMENT_ID,count(*) from EMPLOYEES
group by DEPARTMENT_ID
-- count(*) employee sayisini gosterir
having count(*)>=5;

-- --IQ --> display duplicate  first_names from employees table
-- Birden fazla ayni isme sship olanlari goster.
select FIRST_NAME, count(*) from EMPLOYEES
group by FIRST_NAME
having count(*)>1 and count(*)<3 ;-- (1,3) --between a and b =>[a,b]

select FIRST_NAME, count(*) from EMPLOYEES
group by FIRST_NAME
having count(*)>1 ;

-- Listeden ayni David lari alalim.
select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES
where FIRST_NAME='David';

-- SUBQUERY

--max salary
select max(SALARY) from EMPLOYEES
order by SALARY; --redundant
-- max maas alan
select * from EMPLOYEES
where SALARY = (select max(SALARY) from EMPLOYEES);


--2.max maas alan
-- ilk 5 kisi
select * from EMPLOYEES
order by SALARY desc
--limit 5; Diger genel SQL dillerinde kullaniliyor
--where rownum<3; order by dan sonra where clause kullanamiyoruz.



select * from EMPLOYEES
where SALARY = (
    select max(SALARY) from EMPLOYEES
    where salary < (select max(SALARY) from EMPLOYEES));


-- Display all infromation who is making 5th salary
select * from EMPLOYEES
where SALARY = ( --5.kisinin maasini sayisal olarak bulalim.
    select min(SALARY) from ( --table ad yerine kendimiz sort ederek tablo olusturduk
                            select distinct SALARY from EMPLOYEES
                            order by SALARY desc)
                            where rownum<6
                                )
  ;


-- Display all infromation who is making 15th salary
select * from EMPLOYEES
where SALARY = ( --15.kisinin maasini sayisal olarak bulalim.
    select min(SALARY) from ( --table ad yerine kendimiz sort ederek tablo olusturduk
                                select distinct SALARY from EMPLOYEES
                                order by SALARY desc)
    where rownum<16
)
;
