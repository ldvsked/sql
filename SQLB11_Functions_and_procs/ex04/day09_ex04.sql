create or replace function fnc_persons_male() 
returns setof person 
as $$
	select * from person p
	where p.gender = 'male'
$$ language sql;

create or replace function fnc_persons_female()
returns setof person 
as $$
	select * from person p
	where p.gender = 'female'
$$ language sql;

select * from fnc_persons_male();
select * from fnc_persons_female();
	