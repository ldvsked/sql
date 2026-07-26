select pv.person_id, count(pv.id) as count_of_visits
from person_visits pv join person p on p.id = pv.person_id 
group by pv.person_id 
order by count_of_visits desc, person_id asc;