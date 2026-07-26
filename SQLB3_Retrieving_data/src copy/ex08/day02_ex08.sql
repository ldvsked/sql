select p.name
from person_order po join person p on po.person_id = p.id 
join menu m on m.id = po.menu_id
where m.pizza_name in ('pepperoni pizza', 'mushroom pizza') and 
p.address in ('Moscow', 'Samara') and gender = 'male'
group by p.name
order by p.name desc;