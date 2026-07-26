select
	case when p.name is null then '-' else p.name end as person_name,
	pv.visit_date,
	case when pz.name is null then '-' else pz.name end as pizzeria_name
from person p left join person_visits pv on p.id = pv.person_id and 
(pv.visit_date = '2022-01-01' or pv.visit_date = '2022-01-02' or pv.visit_date = '2022-01-03')
full join pizzeria pz on pz.id = pv.pizzeria_id 
order by person_name, visit_date, pizzeria_name;

