insert into person_discounts 
select ROW_NUMBER() OVER() as id, mid.person_id, mid.pizzeria_id, 
	case  
	when mid.count_orders = 1 then 10.5
	when mid.count_orders = 2 then 22
	else 30
	end as discount
from (select po.person_id, m.pizzeria_id, count(po.id) as count_orders 
	from person_order po 
	join menu m on po.menu_id = m.id 
	group by po.person_id, m.pizzeria_id) as mid
;

SELECT count(*) > 0 AS check
FROM person_discounts