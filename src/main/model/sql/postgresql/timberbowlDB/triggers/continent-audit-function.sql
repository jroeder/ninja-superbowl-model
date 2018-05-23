-- Function: continent_audit_function()

-- DROP FUNCTION continent_audit_function();

CREATE OR REPLACE FUNCTION continent_audit_function()
  RETURNS trigger AS
$BODY$BEGIN
        --
        -- Create a row in emp_audit to reflect the operation performed on emp,
        -- make use of the special variable TG_OP to work out the operation.
        --
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO "AUDIT" SELECT now(), 'D', 'CONTINENT', user, OLD.CON_ID, OLD.CON_VERSION, OLD.CON_NAME, OLD.CON_ABBREV, '', '', '', '', '', '', '';
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO "AUDIT" SELECT now(), 'U', 'CONTINENT', user, NEW.CON_ID, NEW.CON_VERSION, NEW.CON_NAME, NEW.CON_ABBREV, '', '', '', '', '', '', '';
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO "AUDIT" SELECT now(), 'I', 'CONTINENT', user, NEW.CON_ID, NEW.CON_VERSION, NEW.CON_NAME, NEW.CON_ABBREV, '', '', '', '', '', '', '';
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 20;
ALTER FUNCTION continent_audit_function()
  OWNER TO techusergroup;
