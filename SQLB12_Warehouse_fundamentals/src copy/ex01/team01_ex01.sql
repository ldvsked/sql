insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

create or replace function func_find_nearest_rate_to_usd(p_date timestamp, p_id bigint) 
returns numeric as $$
declare
	res numeric := 0;
	r RECORD;
begin 
	for r in (
		select rate_to_usd as rtu, updated as ud 
		from currency c
		where c.id = p_id
		order by ud asc
	) loop
		if r.ud <= p_date then 
			res := r.rtu;
		else 
			if res = 0 then 
				res := r.rtu;
			end if;
			exit;
		end if;
	end loop;

	return res;
end;
$$ language plpgsql;

with id_name_currency as (
	select distinct
		c.id, 
		c.name
	from currency c 
)

select coalesce(u.name, 'not defined') as name, 
coalesce(u.lastname, 'not defined') as lastname, 
inc.name as currency_name, 
b.money * func_find_nearest_rate_to_usd(b.updated, b.currency_id) as currency_in_usd
from balance b 
left join "user" u on u.id = b.user_id 
join id_name_currency inc on inc.id = b.currency_id
order by name desc, lastname asc, currency_name asc;


