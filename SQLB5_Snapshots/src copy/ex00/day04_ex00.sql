create view v_persons_female as 
select *
from person p 
where p.gender = 'female';

create view v_persons_male as 
select * 
from person p 
where p.gender = 'male';

SELECT *
FROM v_persons_female
ORDER BY 1;

SELECT *
FROM v_persons_male
ORDER BY 1;