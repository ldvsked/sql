create or replace function fnc_trg_person_audit()
returns trigger as $$
	begin 
		if TG_OP = 'INSERT' then 
			insert into person_audit(type_event, row_id, name, age, gender, address)
			values('I', new.id, new.name, new.age, new.gender, new.address);
			return new;
		elsif TG_OP = 'UPDATE' then 
			insert into person_audit(type_event, row_id, name, age, gender, address)
			values('U', new.id, new.name, new.age, new.gender, new.address);
			return new; 
		else 
			insert into person_audit(type_event, row_id, name, age, gender, address)
			values('D', old.id, old.name, old.age, old.gender, old.address);
			return old;	
		end if;
		return null;
	end;
$$ language plpgsql;

create trigger trg_person_audit 
after insert or update or delete on person 
for each row 
execute function fnc_trg_person_audit();

drop trigger trg_person_insert_audit on person;
drop trigger trg_person_update_audit on person;
drop trigger trg_person_delete_audit on person;

drop function fnc_trg_person_insert_audit();
drop function fnc_trg_person_update_audit();
drop function fnc_trg_person_delete_audit();

truncate table person_audit;

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk'); 
UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10; 
DELETE FROM person WHERE id = 10;

SELECT * FROM person_audit ORDER BY created;