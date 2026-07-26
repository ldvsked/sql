create or replace function func_minimum(arr numeric[])
returns numeric as $$
	select min(val) from unnest(arr) as val;
$$ language sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
