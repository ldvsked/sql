--SESSION #1

begin;
set transaction isolation level read committed;
select rating from pizzeria where name = 'Pizza Hut';
--вывелось 4, потом делаем апдейтб, коммит и селект в 2 сессии
select rating from pizzeria where name = 'Pizza Hut';
--вывелось 3.6, так как во второй сессии сделали коммит и он применился к 1 сессии
commit;
select rating from pizzeria where name = 'Pizza Hut';
--снова 3.6

--SESSION #2 
begin;
set transaction isolation level read committed;
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
commit;
select rating from pizzeria where name = 'Pizza Hut';
--вывелось 3.6, возращаемся в 1 сессию
