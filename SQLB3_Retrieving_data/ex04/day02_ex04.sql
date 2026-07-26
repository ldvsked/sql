select m.pizza_name, p.name as pizzeria_name, m.price 
from menu m left join pizzeria p on m.pizzeria_id = p.id 
where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'
order by pizza_name, pizzeria_name;