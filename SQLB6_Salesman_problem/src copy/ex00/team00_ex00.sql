create table graph (
	point1 text,
	point2 text,
	cost integer
);


insert into graph values ('a', 'b', 10),
('a', 'c', 15), ('a', 'd', 20), ('b', 'a', 10), ('b', 'c', 35), ('b', 'd', 25), 
('c', 'a', 15), ('c', 'b', 35), ('c', 'd', 30), ('d', 'a', 20), ('d', 'b', 25), ('d', 'c', 30);

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
(select s.cost as total_cost, concat('{', array_to_string(s.way, ','), '}') as tour, min(s.cost) over () as mn
from salesman s
where s.last_point = 'a' and count = 5 
order by s.cost, s.way) as mid
where total_cost = mn;