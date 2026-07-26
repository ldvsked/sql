insert into person_order values ((select max(id) from person_order) + 1, 
(select id from person where name = 'Andrey'), 
(select id from menu where pizza_name = 'sicilian pizza'), 
'2022-02-24'),
((select max(id) from person_order) + 2, 
(select id from person where name = 'Irina'), 
(select id from menu where pizza_name = 'sicilian pizza'), 
'2022-02-24'); 

SELECT count(*) = 2 AS CHECK
 FROM person_order
 WHERE order_date = '2022-02-24'
   AND person_id IN (6,4)
   AND menu_id =
     (SELECT id
     FROM menu
     WHERE pizza_name = 'sicilian pizza')