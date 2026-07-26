(select pz.name as pizzeria_name
from person_order po join person p on p.id = po.person_id  
join menu m on m.id = po.menu_id 
join pizzeria pz on pz.id = m.pizzeria_id 
group by pz.name 
having count(case when p.gender = 'male' then 1 end ) = 0 
and count(case when p.gender = 'female' then 1 end) > 0)


union 

(select pz.name as pizzeria_name
from person_order po join person p on p.id = po.person_id  
join menu m on m.id = po.menu_id 
join pizzeria pz on pz.id = m.pizzeria_id 
group by pz.name 
having count(case when p.gender = 'female' then 1 end ) = 0 
and count(case when p.gender = 'male' then 1 end) > 0)

order by pizzeria_name;