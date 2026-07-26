with recursive salesman as (

	select array[g.point1, g.point2] as way, g.point2 as last_point, g.cost as cost, 2 as count 
	from graph g 
	where g.point1 = 'a'
	
	union all 
	
	select s.way || g.point2, g.point2, s.cost + g.cost, count + 1
	from salesman s 
	join graph g on s.last_point = g.point1 and (g.point2 <> all(s.way) or count = 4 and g.point2 = 'a' )
	where count < 5
)

select mid.total_cost, mid.tour
from 
(select s.cost as total_cost, concat('{', array_to_string(s.way, ','), '}') as tour, max(s.cost) over () as mx, min(s.cost) over () as mn
from salesman s
where s.last_point = 'a' and count = 5 
order by s.cost, s.way) as mid
where total_cost = mn OR total_cost = mx;
