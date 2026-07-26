--SESSION #1
begin;
set transaction isolation level repeatable read;
update pizzeria set rating = 4 where name = 'Pizza Hut';
--потом апдейт в 2 сессии
commit;
--2 сессия отвисла, но вылезла ошибка что изменения не применились из-за уровня изоляции
select rating from pizzeria where name = 'Pizza Hut';
--измененмя 1 сессии применились

--SESSION #2
begin;
set transaction isolation level repeatable read;
update pizzeria set rating = 3.6  where name = 'Pizza Hut';
--после этого апдейта зависло, так как в 1 сессии не было коммита
select rating from pizzeria where name = 'Pizza Hut';
commit;
select rating from pizzeria where name = 'Pizza Hut';
--изменения применились только от 1 сессии

