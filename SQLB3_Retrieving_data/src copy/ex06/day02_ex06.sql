select m.pizza_name, pz.name as pizzeria_name
from person_order po join person p on po.person_id = p.id 
join menu m on po.menu_id = m.id 
join pizzeria pz on pz.id = m.pizzeria_id
where p.name = 'Denis' or p.name = 'Anna'
order by pizza_name, pizzeria_name;
