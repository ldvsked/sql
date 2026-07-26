select p.name as person_name, m.pizza_name, pz.name as pizzeria_name
from person_order po 
join person p on p.id = po.person_id 
join menu m on m.id = po.menu_id
join pizzeria pz on pz.id = m.pizzeria_id
order by p.name asc, m.pizza_name asc, pz.name asc;