with v as (select pz.name, count(pv.id) as count
from pizzeria pz left join person_visits pv on pz.id = pv.pizzeria_id 
group by pz.name),
o as (select pz.name, count(po.id) as count
from person_order po join menu m on m.id = po.menu_id 
join pizzeria pz on pz.id = m.pizzeria_id 
group by pz.name)


select v.name, v.count + coalesce(o.count, 0) as total_count
from v left join o on o.name = v.name
order by total_count desc, name;

