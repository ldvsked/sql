create materialized view mv_dmitriy_visits_and_eats as
select pz.name
from person_visits pv join menu m on pv.pizzeria_id = m.pizzeria_id 
join pizzeria pz on pz.id = pv.pizzeria_id 
join person p on p.id = pv.person_id
where p.name = 'Dmitriy' and pv.visit_date = '2022-01-08' and m.price < 800;

SELECT *
FROM mv_dmitriy_visits_and_eats