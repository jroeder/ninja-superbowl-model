-- Function: wood_audit_function()

-- DROP FUNCTION wood_audit_function();

CREATE OR REPLACE FUNCTION wood_audit_function()
  RETURNS trigger AS
$BODY$
    BEGIN
        --
        -- Create a row in emp_audit to reflect the operation performed on emp,
        -- make use of the special variable TG_OP to work out the operation.
        --
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO "AUDIT" SELECT now(), 'D', 'WOOD', user, OLD.WOD_ID, OLD.BOF_ID, OLD.WOD_VERSION, OLD.WOD_NAME, OLD.WOD_ALIASES, OLD.WOD_BOTNAME, OLD.WOD_BOTFAMILY, OLD.WOD_SYSTEM, OLD.WOD_IMAGENAME, '', '';
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO "AUDIT" SELECT now(), 'U', 'WOOD', user, NEW.WOD_ID, NEW.BOF_ID, NEW.WOD_VERSION, NEW.WOD_NAME, NEW.WOD_ALIASES, NEW.WOD_BOTNAME, NEW.WOD_BOTFAMILY, NEW.WOD_SYSTEM, NEW.WOD_IMAGENAME, '', '';
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO "AUDIT" SELECT now(), 'I', 'WOOD', user, NEW.WOD_ID, NEW.BOF_ID, NEW.WOD_VERSION, NEW.WOD_NAME, NEW.WOD_ALIASES, NEW.WOD_BOTNAME, NEW.WOD_BOTFAMILY, NEW.WOD_SYSTEM, NEW.WOD_IMAGENAME, '', '';
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 25;
ALTER FUNCTION wood_audit_function()
  OWNER TO techusergroup;
