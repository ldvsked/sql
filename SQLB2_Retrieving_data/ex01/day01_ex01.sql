select combined.object_name
from (select 1 as table_o, name as object_name from person
union all 
select 2 as table_o, pizza_name as object_name from menu) as combined
order by combined.table_o, combined.object_name;
