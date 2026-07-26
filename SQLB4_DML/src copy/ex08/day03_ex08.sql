insert into menu values ((select max(id) from menu) + 1,
(select id from pizzeria p where p.name = 'Dominos'), 'sicilian pizza', 900);

SELECT count(*) = 1 AS CHECK
 FROM menu
 WHERE id = 20
   AND pizzeria_id = 2
   AND pizza_name = 'sicilian pizza'
   AND price = 900