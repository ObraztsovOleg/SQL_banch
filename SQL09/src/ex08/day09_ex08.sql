CREATE OR REPLACE FUNCTION fnc_fibonacci(in pstop INTEGER DEFAULT 10)
    RETURNS TABLE (numbers integer) AS
$fibonacci$
    BEGIN
        RETURN QUERY (
            WITH RECURSIVE fn (prev, curr) AS (
                    SELECT 0, 1
                        UNION ALL
                    SELECT curr, prev + curr
                    FROM fn
                    WHERE curr < pstop)
            SELECT prev
            FROM fn
        );
    END;
$fibonacci$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();