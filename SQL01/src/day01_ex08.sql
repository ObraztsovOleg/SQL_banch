SELECT pr.order_date,
       COALESCE(p.name || ' (age:' || p.age || ')', '') AS person_information
FROM person_order pr
NATURAL JOIN (SELECT id AS person_id, age, name
              FROM person) p
ORDER BY pr.order_date ASC, person_information ASC;