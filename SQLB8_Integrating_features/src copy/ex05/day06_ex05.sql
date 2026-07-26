comment on column person_discounts.id is 'Уникальный индентификатор записи о скидке';
comment on column person_discounts.person_id is 'Индентификатор человека, ссылается на таблицу person';
comment on column person_discounts.pizzeria_id is 'Индентификатор пиццерии, в которой человек имеет персональную скидку, ссылается на таблицу pizzeria';
comment on column person_discounts.discount is 'Персональная скидка человека в пиццерии, рассчитанная в зависимости от количества его заказов в данной пиццерии';

SELECT count(*) = 4 AS check
FROM pg_description
WHERE objoid = 'person_discounts'::regclass