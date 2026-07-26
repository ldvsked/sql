select p.name, m.pizza_name, m.price, m.price * (1 - pd.discount/100) as discount_price, pz.name as pizzeria_name
from person_order po 
join person p on po.person_id = p.id 
join menu m on m.id = po.menu_id 
join pizzeria pz on pz.id = m.pizzeria_id 
join person_discounts pd on pd.person_id = po.person_id and pd.pizzeria_id = m.pizzeria_id
order by p.name, m.pizza_name;

