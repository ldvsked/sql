(select pz.name, count(pv.id) as count, 'visit' as action_type
from person_visits pv join pizzeria pz on pz.id = pv.pizzeria_id 
group by pz.name 
limit 3)

union all 

(select pz.name, count(po.id) as count, 'order' as action_type
from person_order po join menu m on m.id = po.menu_id 
join pizzeria pz on pz.id = m.pizzeria_id 
group by pz.name
limit 3)

order by action_type, count desc;
