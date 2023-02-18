SELECT total_cost, tour
FROM ((SELECT total_cost, tour
    FROM v_jorney
    WHERE total_cost = (SELECT MIN(total_cost)
                        FROM v_jorney
                        WHERE array_length(tour, 1) = 5))
        UNION ALL
    (SELECT total_cost, tour
    FROM v_jorney
    WHERE total_cost = (SELECT MAX(total_cost)
                        FROM v_jorney
                        WHERE array_length(tour, 1) = 5))) data
ORDER BY 1, 2;
