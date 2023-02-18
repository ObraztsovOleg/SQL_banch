SELECT d.date
FROM (SELECT generate_series(timestamp '2022-01-01',
    timestamp '2022-01-10',
    interval  '1 day')::date) AS d(date)
LEFT JOIN (SELECT *
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2) pv
ON d.date = pv.visit_date
WHERE pv.visit_date IS NULL
ORDER BY d.date ASC;
