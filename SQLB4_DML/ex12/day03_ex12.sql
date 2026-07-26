insert into person_order(id, person_id, menu_id, order_date)

select 
generate_series(
(select max(id) from person_order) + 1, 
(select max(id) from person_order) + (select count(id) from person)),
generate_series(
(select min(id) from person),(select max(id) from person)), 
(select id from menu where pizza_name = 'greek pizza'), 
'2022-02-25';

SELECT count(*) = 9 AS CHECK
 FROM person_order
 WHERE order_date = '2022-02-25'
   AND menu_id =
     (SELECT id
     FROM menu
     WHERE pizza_name = 'greek pizza')