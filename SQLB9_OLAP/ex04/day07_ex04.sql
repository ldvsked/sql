select * from 
(select p.name, count(pv.id) as count_of_visits
from person_visits pv join person p on p.id = pv.person_id 
group by p.name) as mid
where mid.count_of_visits > 3;