CREATE TABLE IF NOT EXISTS person_audit (
    created TIMESTAMPTZ(0) NOT NULL DEFAULT NOW(),
    type_event VARCHAR(1) NOT NULL,
        CONSTRAINT ch_type_event CHECK ( type_event IN ('I', 'U', 'D') ),
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $person_inserts$
    BEGIN
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'I', NEW.id,
               NEW.name, NEW.age, NEW.gender, NEW.address;

        RETURN NEW;
    END;
$person_inserts$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_insert_audit AFTER INSERT ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
