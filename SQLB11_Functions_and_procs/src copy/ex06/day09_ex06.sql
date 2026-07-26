drop function fnc_person_visits_and_eats_on_date();

create or replace 
function fnc_person_visits_and_eats_on_date(pperson text default 'Dmitriy', pprice integer default 500, pdate date default '2022-01-08')
returns table(name varchar) as $$
	begin 
		return query
		select pz.name 
		from person_visits pv join person p on p.id = pv.person_id and p.name = pperson
		join pizzeria pz on pz.id = pv.pizzeria_id and pv.visit_date = pdate
		join menu m on m.pizzeria_id = pz.id and m.price < pprice;
	end;
$$ language plpgsql;

-- select * from fnc_person_visits_and_eats_on_date(pprice:=800);
-- select *  
-- from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

SELECT * 
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');