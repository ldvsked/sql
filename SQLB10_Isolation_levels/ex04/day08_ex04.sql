--SESSION #1 
begin;
set transaction isolation level serializable;SET
select rating from pizzeria where name = 'Pizza Hut';
--вывелось 3.6, потом во второй сессии сделали апдейт и коммит 
-- и вернулись в 1
select rating from pizzeria where name = 'Pizza Hut';
--показало все еще 3.6 так как в режиме serializable 
--игнорируются любые изменения которые произошли с начала транзакции
commit;
--теперь уже подтянулись изменения и стало 3.0
select rating from pizzeria where name = 'Pizza Hut';

--SESSION #2
begin;
set transaction isolation level serializable;
update pizzeria set rating = 3.0 where name = 'Pizza Hut';
commit;
select rating from pizzeria where name = 'Pizza Hut';


