SELECT data.name
FROM ((SELECT name
    FROM v_persons_female)
    UNION
    (SELECT name
    FROM v_persons_male)) data
ORDER BY 1;