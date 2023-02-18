DROP VIEW IF EXISTS public.v_generated_dates,
    public.v_persons_female,
    public.v_persons_male,
    public.v_price_with_discount,
    public.v_symmetric_union;

DROP MATERIALIZED VIEW IF EXISTS public.mv_dmitriy_visits_and_eats;
