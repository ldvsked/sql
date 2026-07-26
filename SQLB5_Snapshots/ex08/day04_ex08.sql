drop view v_persons_female;
drop view v_persons_male;
drop view v_generated_dates;
drop view v_symmetric_union;
drop view v_price_with_discount;
drop materialized view mv_dmitriy_visits_and_eats;

SELECT count(*) = 0 AS CHECK
FROM pg_class
WHERE relname IN ('v_generated_dates',
                  'v_persons_female',
                  'v_persons_male',
                  'v_price_with_discount',
                  'v_symmetric_union',
                  'mv_dmitriy_visits_and_eats')