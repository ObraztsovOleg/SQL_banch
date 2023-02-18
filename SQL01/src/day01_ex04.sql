(SELECT person_id
FROM person_order
WHERE CAST(order_date AS DATE) = '2022-01-07')
EXCEPT ALL
(SELECT person_id
FROM person_visits
WHERE CAST(visit_date AS DATE) = '2022-01-07');