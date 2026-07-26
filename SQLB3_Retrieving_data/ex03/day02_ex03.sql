with gs as (
	select generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')::date as date
	)

select gs.date as missing_date
from gs
left join person_visits pv on gs.date = pv.visit_date and (pv.person_id = 1 or pv.person_id = 2)
where pv.id is null
order by missing_date;
