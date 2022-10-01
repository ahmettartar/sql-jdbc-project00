select * from employees;
select * from CUSTOMER;
select * from ADDRESS;

--inner join
select ADDRESS, c.FIRST_NAME
from ADDRESS A inner join CUSTOMER C
on A.ADDRESS_ID = C.ADDRESS_ID;

--left join veya left outer join
select ADDRESS, c.FIRST_NAME
from ADDRESS A left join CUSTOMER C
on A.ADDRESS_ID = C.ADDRESS_ID;

--Not:
-- logic olarak:
-- A left join B <==> B right join A

select ADDRESS, c.FIRST_NAME
from CUSTOMER C right join ADDRESS A
on A.ADDRESS_ID = C.ADDRESS_ID;

--right join veya right outer join
select ADDRESS, c.FIRST_NAME
from ADDRESS A right join CUSTOMER C
on A.ADDRESS_ID = C.ADDRESS_ID;

--full outer join veya full join
select ADDRESS, c.FIRST_NAME
from ADDRESS A full join CUSTOMER C
on A.ADDRESS_ID = C.ADDRESS_ID;

-- where condition on join
--left join veya left outer join
select ADDRESS, c.FIRST_NAME
from ADDRESS A left join CUSTOMER C
on A.ADDRESS_ID = C.ADDRESS_ID
where c.FIRST_NAME is null;

-- where with right join
--right join veya right outer join
select ADDRESS, c.FIRST_NAME
from ADDRESS A right join CUSTOMER C
on A.ADDRESS_ID = C.ADDRESS_ID
where a.ADDRESS is null;

--full join with where
select ADDRESS, c.FIRST_NAME
from ADDRESS A full join CUSTOMER C
on A.ADDRESS_ID = C.ADDRESS_ID
where a.ADDRESS is null or
      c.FIRST_NAME is null;


--self join
select * from EMPLOYEES;

-- 7. Display manager id, name of 'Neena'
-- neena 'nin manager ->Steven King
select MANAGER_ID
from EMPLOYEES where FIRST_NAME='Neena' ; --100

--bu manager id kime ait

select * from EMPLOYEES
where EMPLOYEE_ID=(select MANAGER_ID
                   from EMPLOYEES where FIRST_NAME='Neena' );

--
--self joinde mutlaka aliases (as) kullanilmalidir

select w.FIRST_NAME,w.LAST_NAME,m.FIRST_NAME,m.LAST_NAME
from EMPLOYEES w inner join EMPLOYEES m
                                  on w.MANAGER_ID=m.EMPLOYEE_ID;
-- isci adi soyadi - (bu isciye ait manager adi -soyadi)
--Eleni,Zlotkey,Steven,King

--Show me Steven as well
select workers.FIRST_NAME,workers.LAST_NAME,managers.FIRST_NAME,managers.LAST_NAME
from EMPLOYEES workers left join EMPLOYEES managers
                                 on workers.MANAGER_ID=managers.EMPLOYEE_ID;
