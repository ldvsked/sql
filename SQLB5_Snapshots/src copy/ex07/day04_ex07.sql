insert into person_visits values 
((select max(id) from person_visits) + 1, (select id from person where name = 'Dmitriy'), 
(select min(pz.id) from pizzeria pz 
join menu m on m.pizzeria_id = pz.id
where pz.name not in (select name from mv_dmitriy_visits_and_eats) and m.price < 800), 
'2022-01-08');

refresh materialized view mv_dmitriy_visits_and_eats;

SELECT *
FROM mv_dmitriy_visits_and_eats