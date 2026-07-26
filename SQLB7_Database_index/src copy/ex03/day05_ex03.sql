set enable_seqscan = off;

create index idx_person_order_multi 
on person_order(person_id, menu_id);

explain analyze 
select po.person_id, po.menu_id
from person_order po 
where po.person_id = 1 and po.menu_id = 2;