select vgd.generated_date as missing_date
from v_generated_dates vgd left join person_visits pv 
on pv.visit_date = vgd.generated_date 
where pv.visit_date is null
order by missing_date;