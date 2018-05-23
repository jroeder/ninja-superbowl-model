-- Table: "BOTANICALFAMILY"

-- DROP TABLE "BOTANICALFAMILY";

CREATE TABLE "BOTANICALFAMILY"
(
  bof_id integer NOT NULL, -- Eindeutiger Technischer Primaerschluessel
  bof_version integer NOT NULL, -- Versionsnummer für pessimistisches Sperren
  bof_name character(35) NOT NULL,
  CONSTRAINT pk_botanicalfamily PRIMARY KEY (bof_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "BOTANICALFAMILY"
  OWNER TO postgres;
COMMENT ON TABLE "BOTANICALFAMILY"
  IS 'Botanische Familienbezeichnung';
COMMENT ON COLUMN "BOTANICALFAMILY".bof_id IS 'Eindeutiger Technischer Primaerschluessel';
COMMENT ON COLUMN "BOTANICALFAMILY".bof_version IS 'Versionsnummer für pessimistisches Sperren';


-- Index: "BOTANICALFAMILY_PK"

-- DROP INDEX "BOTANICALFAMILY_PK";

CREATE UNIQUE INDEX "BOTANICALFAMILY_PK"
  ON "BOTANICALFAMILY"
  USING btree
  (bof_id);


-- Trigger: botanicalfamily_audit on "BOTANICALFAMILY"

-- DROP TRIGGER botanicalfamily_audit ON "BOTANICALFAMILY";

CREATE TRIGGER botanicalfamily_audit
  BEFORE INSERT OR UPDATE OR DELETE
  ON "BOTANICALFAMILY"
  FOR EACH ROW
  EXECUTE PROCEDURE botanicalfamily_audit_function();
