-- Table: "MEMBER"

-- DROP TABLE "MEMBER";

CREATE TABLE "MEMBER"
(
  mbr_id oid NOT NULL,
  mbr_version integer NOT NULL,
  mbr_name character varying(15) NOT NULL,
  mbr_email character varying(50) NOT NULL,
  mbr_password character varying(1024) NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "MEMBER"
  OWNER TO postgres;
COMMENT ON TABLE "MEMBER"
  IS 'Mitglieder und/oder Benutzer der Timberbowl-Applikation';

-- Index: emailidx

-- DROP INDEX emailidx;

CREATE UNIQUE INDEX emailidx
  ON "MEMBER"
  USING btree
  (mbr_email COLLATE pg_catalog."default");

-- Index: nameidx

-- DROP INDEX nameidx;

CREATE UNIQUE INDEX nameidx
  ON "MEMBER"
  USING btree
  (mbr_name COLLATE pg_catalog."default");
