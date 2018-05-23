-- Sequence: aud_seq

-- DROP SEQUENCE aud_seq;

CREATE SEQUENCE aud_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 1000000
  START 1
  CACHE 1
  CYCLE;
ALTER TABLE aud_seq
  OWNER TO postgres;
