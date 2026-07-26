-- insert into menu values (19, 2, 'greek pizza', 800);

SELECT count(*) = 1 AS CHECK
 FROM menu
 WHERE id = 19
   AND pizzeria_id = 2
   AND pizza_name = 'greek pizza'
   AND price = 800