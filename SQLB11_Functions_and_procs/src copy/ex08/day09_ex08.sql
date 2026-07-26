create or replace function fnc_fibonacci(pstop integer default 10)
returns table(fib_number integer) as $$ 
declare 
	fib integer[] := array[0, 1];
	n integer := 2;
begin 
	if pstop <= 0 then 
		return;
	elsif pstop = 1 then 
		return query select unnest(ARRAY[0]);
	else 
		while fib[n] + fib[n-1] < pstop loop 
			fib := array_append(fib, fib[n] + fib[n-1]);
			n := n + 1;
		end loop;
	end if;
	return query select unnest(fib);
end;
$$language plpgsql; 

-- select * from fnc_fibonacci(100);

select * from fnc_fibonacci(20);
