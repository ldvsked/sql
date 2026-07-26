select gs.date::date as missing_date
from generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') as gs(date) 
left join person_visits pv on pv.visit_date = gs.date and (pv.person_id = 1 or pv.person_id = 2)
where pv.person_id is null
order by gs.date asc, pv.person_id asc;