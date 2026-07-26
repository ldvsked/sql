set enable_seqscan = off;

create index idx_person_name 
on person(upper(name));

explain analyze 
select p.address
from person p
where  upper(p.name) = 'ANDREY'; 