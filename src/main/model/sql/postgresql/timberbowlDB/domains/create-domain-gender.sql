-- Domain: gender

-- DROP DOMAIN gender;

CREATE DOMAIN gender
  AS character(1)
  COLLATE pg_catalog."default";
ALTER DOMAIN gender
  OWNER TO postgres;
COMMENT ON DOMAIN gender
  IS 'Geschlechter Domaene';