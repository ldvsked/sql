select p.name
from person_order po join person p on p.id = po.person_id
join menu m on m.id = po.menu_id
where p.gender = 'female' and m.pizza_name in ('cheese pizza', 'pepperoni pizza')
group by p.name
having count(distinct m.pizza_name) = 2
order by p.name;
