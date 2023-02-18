CREATE VIEW v_generated_dates AS
SELECT generate_series(timestamp '2022-01-01',
    timestamp '2022-01-31',
    interval '1 day')::DATE AS generated_date
ORDER BY 1;
