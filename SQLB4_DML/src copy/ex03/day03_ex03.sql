(SELECT pz.name AS pizzeria_name
FROM pizzeria pz 
JOIN person_visits pv ON pz.id = pv.pizzeria_id 
JOIN person p ON p.id = pv.person_id 
WHERE gender = 'male' 

EXCEPT ALL 

SELECT pz.name AS pizzeria_name
FROM pizzeria pz 
JOIN person_visits pv ON pz.id = pv.pizzeria_id 
JOIN person p ON p.id = pv.person_id 
WHERE gender = 'female')

UNION ALL 

(SELECT pz.name AS pizzeria_name
FROM pizzeria pz 
JOIN person_visits pv ON pz.id = pv.pizzeria_id 
JOIN person p ON p.id = pv.person_id 
WHERE gender = 'female' 

EXCEPT ALL 

SELECT pz.name AS pizzeria_name
FROM pizzeria pz 
JOIN person_visits pv ON pz.id = pv.pizzeria_id 
JOIN person p ON p.id = pv.person_id 
WHERE gender = 'male')

ORDER BY pizzeria_name;
