-- Sequence: mbr_seq

-- DROP SEQUENCE mbr_seq;

CREATE SEQUENCE mbr_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 1000000
  START 1
  CACHE 1
  CYCLE;
ALTER TABLE mbr_seq
  OWNER TO postgres;
