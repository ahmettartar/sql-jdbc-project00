select * from employees;

-- java +
-- sql ||
select FIRST_NAME ||' Ahmet ' || LAST_NAME  "TEXAS" from EMPLOYEES;

--as (Tablodaki sutun adini degistirmek icin kullanilir
--   as HAMZA   veya HAMZA

--
select FIRST_NAME ||'@gmail.com ' as "EMAIL LISTEM" from EMPLOYEES;

-- birden fazla kelime olunca " a b " string kullanmak lazim.

--lower

select lower(FIRST_NAME) from EMPLOYEES;
--upper
select upper(FIRST_NAME) from EMPLOYEES;

--initcap  -> Ahmet
select initcap(EMAIL) from EMPLOYEES;
--init cap asc order olarak sonuc verir.

--length
select FIRST_NAME, length(FIRST_NAME) from EMPLOYEES; --sayi verir

--substr      (substring in java)
-- 0 ve 1 aynidir
--her iki degerde dahildir.
select FIRST_NAME, substr(FIRST_NAME, 0, 2) from EMPLOYEES; -- Ellen -> El [1,2]
select FIRST_NAME, substr(FIRST_NAME, 1, 3) from EMPLOYEES; -- Ellen -> El [1,3]

--view
create view Tablo as
 select FIRST_NAME, substr(FIRST_NAME, 0, 2) from EMPLOYEES;


create view bbEmployeesInfo as
select substr(FIRST_NAME,1,1)||'.'||substr(LAST_NAME,1,1)||'.' as initials ,
       FIRST_NAME||' makes ' || salary as Employees_salary from EMPLOYEES;

--tablolari kaldirmak icin
drop view BBEMPLOYEESINFO;
--drop view EMPLOYEESINFO;

--
-- DDL Data Definition Language
create table Amerika(
    stateid INTEGER PRIMARY KEY,
    stateName varchar(20) not null, --bos birakilamaz
    population integer-- there is no constraints Bos birakilinca hata vermiyor

);

--Icine degerlerimizi yerlestiriyoruz.
insert into Amerika(stateid, stateName, population)
VALUES (10, 'Texas', 2000);
insert into Amerika(stateid, stateName, population)
VALUES (11, 'NewYork', 5000);
insert into Amerika(stateid, stateName, population)
VALUES (12, 'New Jersey', 3000);

select * from Amerika;

--update set where
update Amerika
set stateName='Istanbul'
where stateName='NewYork';

update Amerika
set population=100
where stateName='New Jersey';

--delete from
delete from Amerika
where stateName='Texas';

-- commit work or commit--> Save Changes --> BOTH works
commit ;

--
-- ALTER (CHANGE)
alter table Amerika
drop column population;

alter table Amerika
rename to Turkiye;

select * from TURKIYE;

truncate table TURKIYE;
--sadece degerleri keser, tablo bilgisi hala mevcuttur

drop table TURKIYE;


