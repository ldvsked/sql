insert into person_visits values ((select max(id) from person_visits) + 1, 
(select id from person p where p.name = 'Denis'), 
(select id from pizzeria pz where pz.name = 'Dominos'), 
'2022-02-24');
insert into person_visits values
((select max(id) from person_visits) + 1, 
(select id from person p where p.name = 'Irina'), 
(select id from pizzeria pz where pz.name = 'Dominos'), 
'2022-02-24'); 

SELECT count(*)=2 AS CHECK
 FROM person_visits
 WHERE visit_date = '2022-02-24'
   AND person_id IN (6, 4)
   AND pizzeria_id = 2;