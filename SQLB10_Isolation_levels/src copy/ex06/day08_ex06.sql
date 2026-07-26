--SESSION #1
begin;
set transaction isolation level repeatable read;
select sum(rating) from pizzeria;
--вывелосб 26.9, потом пошли во вторую сессию и сделали вставку данных и коммит и вернулись
select sum(rating) from pizzeria;
--вывелось все еще 26.9, так как при данном уровне изоляции при первом делается
--снимок бд и внутри одной транзакции данные не меняются
commit;
select sum(rating) from pizzeria;
--здесь уже 30.9, так как после транзакции будут обращения к актуальным данным

--SESSION #2
begin;
set transaction isolation level repeatable read;
insert into pizzeria values (11, 'Kazan Pizza 2', 4);
commit;
select sum(rating) from pizzeria;
