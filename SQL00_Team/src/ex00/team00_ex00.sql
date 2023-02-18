CREATE TABLE public.route (
    id bigint NOT NULL,
    point1 character varying(255),
    point2 character varying(255),
    cost integer
);

INSERT INTO public.route (id, point1, point2, cost)
VALUES (1, 'a', 'b', 10),
    (2, 'b', 'a', 10),
    (3,	'a', 'd', 20),
    (4,	'd', 'a', 20),
    (5,	'a', 'c', 15),
    (6,	'c', 'a', 15),
    (7,	'b', 'd', 25),
    (8,	'd', 'b', 25),
    (9,	'b', 'c', 35),
    (10, 'c', 'd', 30),
    (11, 'd', 'c', 30),
    (12, 'c', 'b', 35);

CREATE VIEW v_jorney AS (
    WITH RECURSIVE jorney (from_town, to_town, distance, way) AS (
        SELECT point1, point2, 0 + cost AS distance, point1::text AS way
        FROM route
        WHERE point1 = 'a'
            UNION ALL
        SELECT arrival.point1, arrival.point2,
               departure.distance + arrival.cost AS distance,
               departure.way || ',' || departure.to_town AS way
        FROM route AS arrival
        INNER JOIN jorney AS departure
            ON arrival.point1 = departure.to_town
        WHERE way NOT LIKE '%' || departure.to_town || '%'
    )

    SELECT distance AS total_cost, ('{' || way || ',' || to_town || '}')::text[] AS tour
    FROM jorney
    WHERE to_town = 'a'
    ORDER BY 1, 2
);

SELECT total_cost, tour
FROM v_jorney
WHERE total_cost = (SELECT MIN(total_cost)
                    FROM v_jorney
                    WHERE array_length(tour, 1) = 5)
ORDER BY 1, 2;
