select m.pizza_name, m.price, pz.name  as pizzeria_name, pv.visit_date 
from person_visits pv join pizzeria pz on pv.pizzeria_id = pz.id 
left join menu m on m.pizzeria_id = pz.id 
join person p on p.id = pv.person_id 
where p.name = 'Kate' and m.price between 800 and 1000
order by m.pizza_name, m.price, pizzeria_name, pv.visit_date;