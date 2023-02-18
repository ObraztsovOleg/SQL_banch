CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS numeric AS
$minimum$
    SELECT MIN(num) AS min FROM unnest(arr) as data(num);
$minimum$ LANGUAGE SQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);