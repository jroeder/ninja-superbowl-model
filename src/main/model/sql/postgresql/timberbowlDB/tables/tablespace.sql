-- Role: techusergroup

-- DROP ROLE techusergroup;

CREATE ROLE techusergroup
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE REPLICATION;
COMMENT ON ROLE techusergroup IS 'Technische Benutzergruppe';