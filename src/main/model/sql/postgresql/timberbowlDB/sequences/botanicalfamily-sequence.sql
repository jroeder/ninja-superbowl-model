-- Sequence: bof_seq

-- DROP SEQUENCE bof_seq;

CREATE SEQUENCE bof_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 1000000
  START 1
  CACHE 1
  CYCLE;
ALTER TABLE bof_seq
  OWNER TO postgres;
