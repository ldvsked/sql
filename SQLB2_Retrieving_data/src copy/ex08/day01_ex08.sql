select op.order_date, concat(person.name, ' (age:', person.age, ')') as person_information
from
(select  order_date, person_id as id 
from person_order) as op
natural join person
order by order_date asc, person_information asc;
