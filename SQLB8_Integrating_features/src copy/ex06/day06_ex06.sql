create sequence seq_person_discounts start with 1;

--select просто функцию вызывает, false выдает новое значение только при новом вызове
select setval('seq_person_discounts', coalesce((select max(id) from person_discounts), 0) + 1, false);

alter table person_discounts 
alter column id set default nextval('seq_person_discounts');

SELECT count(*)=1 AS check1,
      max("start_value") = 1 AS check2,
      max("last_value") > 5 AS check3
FROM pg_sequences
WHERE sequencename = 'seq_person_discounts'