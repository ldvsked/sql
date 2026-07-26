create view v_price_with_discount as 
select p.name, m.pizza_name, m.price, (m.price * 0.9) :: integer as discount_price
from person_order po join person p on p.id = po.person_id 
join menu m on m.id = po.menu_id
order by name, pizza_name, discount_price;

SELECT *
FROM v_price_with_discount;