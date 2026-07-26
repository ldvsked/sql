select pizzeria.name from pizzeria 
where pizzeria.id not in (select person_visits.pizzeria_id from person_visits);

select p.name from pizzeria p
where not exists (select pv.pizzeria_id from person_visits pv where pv.pizzeria_id = p.id);