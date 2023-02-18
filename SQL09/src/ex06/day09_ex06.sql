CREATE OR REPLACE FUNCTION  fnc_person_visits_and_eats_on_date(
    IN pperson VARCHAR DEFAULT 'Dmitriy',
    IN pprice NUMERIC DEFAULT 500,
    IN pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE (name VARCHAR) AS $person_visit_and_eats_on_date$
    BEGIN
        RETURN QUERY((SELECT piz.name
                    FROM person_visits pv
                    INNER JOIN person p
                        ON pv.person_id = p.id
                    INNER JOIN pizzeria piz
                        ON pv.pizzeria_id = piz.id
                    WHERE p.name = pperson AND pv.visit_date = pdate)
                INTERSECT
                    (SELECT piz.name
                    FROM person_order po
                    INNER JOIN person p on p.id = po.person_id
                    INNER JOIN menu m on m.id = po.menu_id
                    INNER JOIN pizzeria piz on piz.id = m.pizzeria_id
                    WHERE po.order_date = pdate AND
                        p.name = pperson AND m.price < pprice)
        );
    END;
$person_visit_and_eats_on_date$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
