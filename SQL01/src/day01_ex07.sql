SELECT pr.order_date,
       COALESCE(p.name || ' (age:' || p.age || ')', '') AS person_information
FROM person_order pr
INNER JOIN person p
ON pr.person_id = p.id
ORDER BY pr.order_date ASC, person_information ASC;