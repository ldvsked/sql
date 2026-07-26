--SESSION #1 
begin;
set transaction isolation level read committed;
select sum(rating) from pizzeria;
--вывело 21.6, потом во второй сесси вставили новые данные и сделали коммит
select sum(rating) from pizzeria;
--вывело 26.6, так как данные обновились в этой транзакции из-за другой сессии
commit;
select sum(rating) from pizzeria;

--SESSION #2 

begin;
set transaction isolation level read committed;
insert into pizzeria values (10, 'Kazan Pizza', 5);
commit;
select sum(rating) from pizzeria;


