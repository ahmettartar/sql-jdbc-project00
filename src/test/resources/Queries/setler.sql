create table Developer(
                           Id_Number Integer primary key,
                           Names varchar(30),
                           Salary Integer
);
create table Tester(
                        Id_Number Integer primary key,
                        Names varchar(30),
                        Salary Integer
);
insert into developer values (1, 'Mike', 155000);
insert into developer values (2, 'John', 142000);
insert into developer values (3, 'Steven', 850000);
insert into developer values (4, 'Maria', 120000);

insert into tester values (1, 'Steven', 110000);
insert into tester values(2, 'Adam', 105000);
insert into tester values (3, 'Lex', 100000);
commit work; --save the data

/*
UNION
- To merge more than table vertically
- Removes DUPs
- Make an order asc
*/
-- it checks all rows to find same row.if we have it will remove one of them
select * from DEVELOPER;
select * from TESTER;

select * from DEVELOPER
UNION
select * from TESTER;
--id ye gore siralama yapti

select names from DEVELOPER
UNION
select names from TESTER;
-- duplicates leri kaldirdi.
-- siralama ACS olarak oldu.

-- Steven - Steven  => duplicates
-- Steven 10
-- Steven 15 => Bu durumda iki parametre uzerinden degerlendirme yapmak gerekir.
-- Bu duplicates olmaz.


/*
UNION ALL
- DONT Remove DUPs
- DONT sort results
*/
select * from DEVELOPER --birinci tablo
UNION ALL
select * from TESTER; --ikinci tablo
--birinci tablonun bitimine, 2.tablo bilgilerini ekler


select names from DEVELOPER
UNION ALL
select names from TESTER;
--dup kaldirmaz. ve birbirinin devamina tabloyu ekler.



-- MINUS
--ana islem tablosu birinci tabloda yapilir.
select * from DEVELOPER --
MINUS
select * from TESTER;
--birinci tablo sonucu geldi.


select names from DEVELOPER
MINUS
select names from TESTER;
--eslesen steven silindi.

-- INTERSECT
select * from DEVELOPER
INTERSECT
select * from TESTER;
--normalde bos bekleriz. eslesen (tum data) veri yok.


select names from DEVELOPER
INTERSECT
select names from TESTER;
-- Eslesen deger => Steven olarak bulmus olduk.

-- JDBC
-- Java Data Base Connectivity
