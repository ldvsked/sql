--SESSION #1
begin;
update pizzeria set rating = 1.2 where id = 1;
update pizzeria set rating = 2 where id = 2;
--эта строка заблокирована 2 сессией, поэтому окно замирает и ждет 
--пока вторая 2 сессия отпустит 
commit;

--SESSION #2

begin;
update pizzeria set rating = 2.7 where id = 2;
update pizzeria set rating = 1 where id = 1;
--эта строка заблокировна 1 сессией, эта сессия замирает и ждет 
--в итоге замерли оба и ждут, поэтому postgres выбирает жертву 
--в нашем случае 2 и обрывает ее с ошибкой с откатом
--первая спасена 
commit;




