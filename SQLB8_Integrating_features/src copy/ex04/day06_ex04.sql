alter table person_discounts 
	add constraint ch_nn_person_id check (person_id is not null),
	add constraint ch_nn_pizzeria_id check(pizzeria_id is not null), 
	add constraint ch_nn_discount check(discount is not null), 
	alter column discount set default 0,
	add constraint ch_range_discount check(discount between 0 and 100);

SELECT count(*) = 4 AS check
FROM pg_constraint
WHERE conname IN ('ch_nn_person_id',
                  'ch_nn_pizzeria_id',
                  'ch_nn_discount',
                  'ch_range_discount');

SELECT column_default::integer = 0 AS check
FROM information_schema.columns
WHERE COLUMN_NAME = 'discount'
  AND TABLE_NAME = 'person_discounts'