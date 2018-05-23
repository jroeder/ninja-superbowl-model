-- Function: botanicalfamily_audit_function()

-- DROP FUNCTION botanicalfamily_audit_function();

CREATE OR REPLACE FUNCTION botanicalfamily_audit_function()
  RETURNS trigger AS
$BODY$
    BEGIN
        --
        -- Create a row in emp_audit to reflect the operation performed on emp,
        -- make use of the special variable TG_OP to work out the operation.
        --
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO "AUDIT" SELECT now(), 'D', 'BOTANICALFAMILY', user, OLD.BOF_ID, OLD.BOF_VERSION, OLD.BOF_NAME, '', '', '', '', '', '', '', '';
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO "AUDIT" SELECT now(), 'U', 'BOTANICALFAMILY', user, NEW.BOF_ID, NEW.BOF_VERSION, NEW.BOF_NAME, '', '', '', '', '', '', '', '';
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO "AUDIT" SELECT now(), 'I', 'BOTANICALFAMILY', user, NEW.BOF_ID, NEW.BOF_VERSION, NEW.BOF_NAME, '', '', '', '', '', '', '', '';
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 15;
ALTER FUNCTION botanicalfamily_audit_function()
  OWNER TO techusergroup;
