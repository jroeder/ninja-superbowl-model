-- Table: "AUDIT"

-- DROP TABLE "AUDIT";

CREATE TABLE "AUDIT"
(
  aud_time timestamp without time zone NOT NULL, -- Zeitpunkt des Logeintrags (yyyy-mm-dd hh:mm:ssss)
  aud_op character(1) NOT NULL, -- Kuerzel der CRUD-Operation
  aud_table character varying(32) NOT NULL, -- Tabellenname
  aud_user character varying(32) NOT NULL, -- Benutzer
  aud_s01 character varying(128), -- Datenspalte 1
  aud_s02 character varying(128), -- Datenspalte 2
  aud_s03 character varying(128), -- Datenspalte 3
  aud_s04 character varying(128), -- Datenspalte 4
  aud_s05 character varying(128), -- Datenspalte 5
  aud_s06 character varying(128), -- Datenspalte 6
  aud_s07 character varying(128), -- Datenspalte 7
  aud_s08 character varying(128), -- Datenspalte 8
  aud_s09 character varying(128), -- Datenspalte 9
  aud_s10 character varying(128), -- Datenspalte 10
  aud_s11 character varying(128) -- Datenspalte 11
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "AUDIT"
  OWNER TO postgres;
COMMENT ON TABLE "AUDIT"
  IS 'Repraesentiert Audit-Statements fuer alle CRUD-Operation auf allen Tabellen';
COMMENT ON COLUMN "AUDIT".aud_time IS 'Zeitpunkt des Logeintrags (yyyy-mm-dd hh:mm:ssss)';
COMMENT ON COLUMN "AUDIT".aud_op IS 'Kuerzel der CRUD-Operation';
COMMENT ON COLUMN "AUDIT".aud_table IS 'Tabellenname';
COMMENT ON COLUMN "AUDIT".aud_user IS 'Benutzer';
COMMENT ON COLUMN "AUDIT".aud_s01 IS 'Datenspalte 1';
COMMENT ON COLUMN "AUDIT".aud_s02 IS 'Datenspalte 2';
COMMENT ON COLUMN "AUDIT".aud_s03 IS 'Datenspalte 3';
COMMENT ON COLUMN "AUDIT".aud_s04 IS 'Datenspalte 4';
COMMENT ON COLUMN "AUDIT".aud_s05 IS 'Datenspalte 5';
COMMENT ON COLUMN "AUDIT".aud_s06 IS 'Datenspalte 6';
COMMENT ON COLUMN "AUDIT".aud_s07 IS 'Datenspalte 7';
COMMENT ON COLUMN "AUDIT".aud_s08 IS 'Datenspalte 8';
COMMENT ON COLUMN "AUDIT".aud_s09 IS 'Datenspalte 9';
COMMENT ON COLUMN "AUDIT".aud_s10 IS 'Datenspalte 10';
COMMENT ON COLUMN "AUDIT".aud_s11 IS 'Datenspalte 11';
