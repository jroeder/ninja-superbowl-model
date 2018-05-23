-- Table: "CONTINENT"

-- DROP TABLE "CONTINENT";

CREATE TABLE "CONTINENT"
(
  con_id integer NOT NULL, -- Eindeutiger Technischer Primaerschluessel
  con_version integer NOT NULL, -- Versionsnummer fuer pessimistisches Sperren
  con_name character varying(25) NOT NULL, -- Der Name des Kontinents
  con_abbrev character(2) NOT NULL, -- 2-stelliges Kuerzel des Kontinents
  CONSTRAINT pk_continent PRIMARY KEY (con_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "CONTINENT"
  OWNER TO postgres;
COMMENT ON TABLE "CONTINENT"
  IS 'Repraesentiert eine geographische Zone des Planeten Erde';
COMMENT ON COLUMN "CONTINENT".con_id IS 'Eindeutiger Technischer Primaerschluessel';
COMMENT ON COLUMN "CONTINENT".con_version IS 'Versionsnummer fuer pessimistisches Sperren';
COMMENT ON COLUMN "CONTINENT".con_name IS 'Der Name des Kontinents';
COMMENT ON COLUMN "CONTINENT".con_abbrev IS '2-stelliges Kuerzel des Kontinents';


-- Index: continent_pk

-- DROP INDEX continent_pk;

CREATE UNIQUE INDEX continent_pk
  ON "CONTINENT"
  USING btree
  (con_id);


-- Trigger: continent_audit on "CONTINENT"

-- DROP TRIGGER continent_audit ON "CONTINENT";

CREATE TRIGGER continent_audit
  AFTER INSERT OR UPDATE OR DELETE
  ON "CONTINENT"
  FOR EACH ROW
  EXECUTE PROCEDURE continent_audit_function();
