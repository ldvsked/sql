drop function fnc_persons_male();
drop function fnc_persons_female();

create or replace function fnc_persons(pgender text default 'female')
returns setof person as $$
	select * from person p 
	where p.gender = pgender;
$$ language sql;

--select * from fnc_persons(pgender := 'male');
select * from fnc_persons();