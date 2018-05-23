-- Sequence: prd_seq

-- DROP SEQUENCE prd_seq;

CREATE SEQUENCE prd_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 1000000
  START 1
  CACHE 1
  CYCLE;
ALTER TABLE prd_seq
  OWNER TO postgres;
