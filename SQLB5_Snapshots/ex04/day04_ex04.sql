create view v_symmetric_union as 
(select pv.id as person_id 
from person_visits pv 
where pv.visit_date = '2022-01-02'

except 

select pv.id as person_id 
from person_visits pv 
where pv.visit_date = '2022-01-06')

union 

(select pv.id as person_id 
from person_visits pv 
where pv.visit_date = '2022-01-06'

except 

select pv.id as person_id 
from person_visits pv 
where pv.visit_date = '2022-01-02')

order by person_id;

SELECT *
FROM v_symmetric_union
