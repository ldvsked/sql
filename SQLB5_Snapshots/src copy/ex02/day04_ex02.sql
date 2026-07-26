create view v_generated_dates as 
select generate_series('2022-01-01'::date, '2022-01-31'::date, '1 day') ::date as generated_date
order by generated_date;

SELECT count(*) = 31 AS CHECK,
      min(generated_date) AS check1,
      max(generated_date) AS check2
FROM v_generated_dates;