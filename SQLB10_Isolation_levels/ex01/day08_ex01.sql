--SESSION #1
show transaction isolation level;
begin;
update pizzeria set rating = 4 where name = 'Pizza Hut';
--сначала не делаем update и открываем 2 сессию
--так как 2 сессия зависла надо закоммитить 1
commit;


--SESSION #2
show transaction isolation level;
begin;
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
--процесс зависает так как в 1 транзакции не сделали коммит
--после коммита в 1 все отвисло
commit;
select rating from pizzeria where name = 'Pizza Hut';
--rating = 3.6 так как 2 коммит был позже первого 
