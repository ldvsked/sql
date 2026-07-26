select mid.address, round(mid.formula,2) as formula, round(mid.average, 2) as average,
case 
	when formula > average then true 
	else false
end as comparison
from 
(select p.address, max(p.age) - (min(p.age)::numeric)/max(p.age) as formula, avg(p.age) as average 
from person p
group by p.address) as mid
order by mid.address;