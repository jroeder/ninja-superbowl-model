-- Domain: continent

-- DROP DOMAIN continent;

CREATE DOMAIN continent
  AS character(2)
  COLLATE pg_catalog."default";
ALTER DOMAIN continent
  OWNER TO postgres;
COMMENT ON DOMAIN continent
  IS 'Kontinent Domaene';