/*==============================================================*/
/* DDL Master Script of MySQL Database superbowlDB              */
/* DBMS name   :     MySQL 5.7           		                   */
/* Created at  :     03.03.2017			                         */
/* Last Updated:     03.03.2017 			                         */
/*==============================================================*/

-- =============================================================
-- DROP DATABASE (SCHEMA)
-- Syntax: DROP {DATABASE | SCHEMA} [IF EXISTS] db_name;DROP DATABSE
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- DROP DATABASE drops all tables in the database and deletes the database.
-- When a database is dropped, user privileges on the database are not automatically dropped.
-- IF EXISTS is used to prevent an error from occurring if the database does not exist.
-- =============================================================
DROP DATABASE IF EXISTS superbowlDB;

-- =============================================================
-- CREATE DATABASE (SCHEMA)
-- Syntax: CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name
--    [create_specification] ...
--
-- create_specification:
--    [DEFAULT] CHARACTER SET [=] charset_name
--  | [DEFAULT] COLLATE [=] collation_name
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- CREATE DATABASE creates a database with the given name.
-- To use this statement, you need the CREATE privilege for the database.
-- CREATE SCHEMA is a synonym for CREATE DATABASE.
-- =============================================================
CREATE DATABASE IF NOT EXISTS superbowlDB;

USE superbowlDB;

-- =============================================================
-- DROP TABLE
-- Syntax: DROP [TEMPORARY] TABLE [IF EXISTS]
--    tbl_name [, tbl_name] ...
--    [RESTRICT | CASCADE]
-- =============================================================
DROP TABLE IF EXISTS AUDIT;
DROP TABLE IF EXISTS MODPROCESS;
DROP TABLE IF EXISTS MODIFICATION;
DROP TABLE IF EXISTS MODSTEP;
DROP TABLE IF EXISTS ARTEFACT;
DROP TABLE IF EXISTS ACTORIDENTITY;
DROP TABLE IF EXISTS ACTORROLE;
DROP TABLE IF EXISTS ACTORSESSION;
DROP TABLE IF EXISTS ACTOR;
DROP TABLE IF EXISTS STATUS;
DROP TABLE IF EXISTS TIMBER;
DROP TABLE IF EXISTS BOTANICSYSTEM;
DROP TABLE IF EXISTS GEOREGION;

-- ==================================================
-- CREATE TABLE
-- ==================================================
CREATE TABLE IF NOT EXISTS AUDIT (
	 AUDIT_ID								BIGINT			NOT NULL AUTO_INCREMENT
	,AUDIT_TIMESTAMP						TIMESTAMP(8)	NOT NULL
	,AUDIT_USER								VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_TABLE							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_ACTION							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD01							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD02							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD03							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD04							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD05							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD06							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD07							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD08							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD09							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD10							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD11							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD12							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD13							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD14							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD15							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD16							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD17							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD18							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD19							VARCHAR(256)	NOT NULL DEFAULT ''
	,AUDIT_FIELD20							VARCHAR(256)	NOT NULL DEFAULT ''
	,PRIMARY KEY (AUDIT_ID)
) ENGINE=InnoDB;

-- ==================================================
-- Table: STATUS
-- ==================================================
CREATE TABLE STATUS (
	 STATUS_ID								BIGINT			NOT NULL AUTO_INCREMENT
	,STATUS_VERSION						INTEGER			NOT NULL DEFAULT 0
	,STATUS_TEXT							VARCHAR(035)	NOT NULL DEFAULT ''
	,STATUS_COMMENT						VARCHAR(128)	NOT NULL DEFAULT ''
	,PRIMARY KEY (STATUS_ID)
) ENGINE=InnoDB;

-- ==================================================
-- Table: GEOREGION
-- ==================================================
CREATE TABLE GEOREGION (
	 GEOREGION_ID							BIGINT			NOT NULL AUTO_INCREMENT
	,GEOREGION_VERSION					INTEGER			NOT NULL DEFAULT 0
	,GEOREGION_ORDINAL					INTEGER			NOT NULL
	,GEOREGION_CODE						VARCHAR(010)	NOT NULL DEFAULT 'k.A.'
	,GEOREGION_NAME						VARCHAR(012)	NOT NULL DEFAULT 'k.A.'
	,GEOREGION_REGION						VARCHAR(035)	NOT NULL DEFAULT 'k.A.'
	,PRIMARY KEY (GEOREGION_ID)
) ENGINE=InnoDB;
-- ==================================================
-- Index: CREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name
--        USING [BTREE | HASH | RTREE]
--        ON table_name (column_name [(length)] [ASC | DESC],...)
-- ==================================================
CREATE UNIQUE INDEX GEOREGION_ORDINAL_IDX ON GEOREGION (GEOREGION_ORDINAL) ASC;

-- ==================================================
-- Table: BOTANICSYSTEM
-- ==================================================
CREATE TABLE BOTANICSYSTEM (
	 BOTANICSYSTEM_ID						BIGINT			NOT NULL AUTO_INCREMENT
	,BOTANICSYSTEM_VERSION				INTEGER			NOT NULL DEFAULT 0
	,BOTANICSYSTEM_ORDINAL				INTEGER			NOT NULL
	,BOTANICSYSTEM_ORDNUNG				VARCHAR(025)	NOT NULL DEFAULT ''
	,BOTANICSYSTEM_FAMILIE				VARCHAR(025)	NOT NULL DEFAULT ''
	,BOTANICSYSTEM_UNTERFAMILIE 		VARCHAR(025)	NOT NULL DEFAULT ''
	,PRIMARY KEY (BOTANICSYSTEM_ID)
) ENGINE=InnoDB;
-- ==================================================
-- Index: CREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name
--        USING [BTREE | HASH | RTREE]
--        ON table_name (column_name [(length)] [ASC | DESC],...)
-- ==================================================
CREATE UNIQUE INDEX BOTANICSYSTEM_ORDINAL_IDX ON BOTANICSYSTEM (BOTANICSYSTEM_ORDINAL) ASC;

-- ==================================================
-- Table: TIMBER
-- ==================================================
-- Foreign Key Syntax:
--    CONSTRAINT constraint_name
--    FOREIGN KEY foreign_key_name (columns)
--    REFERENCES parent_table(columns)
--    ON DELETE action
--    ON UPDATE action
-- ==================================================
CREATE TABLE TIMBER (
	 TIMBER_ID								BIGINT			NOT NULL AUTO_INCREMENT
	,TIMBER_VERSION						INTEGER			NOT NULL DEFAULT 0
	,TIMBER_GEOREGION_ID					BIGINT			NOT NULL
	,TIMBER_BOTANICSYSTEM_ID			BIGINT			NOT NULL
	,TIMBER_TYPE							CHAR(001)		NOT NULL DEFAULT ''
	,TIMBER_CODE							CHAR(004)		NOT NULL DEFAULT ''
	,TIMBER_NAME							VARCHAR(035)	NOT NULL DEFAULT ''
	,TIMBER_IMAGENAME						VARCHAR(035)	NOT NULL DEFAULT ''
	,TIMBER_AKADEMISCHERNAME			VARCHAR(050)	NOT NULL DEFAULT ''
	,TIMBER_ROHDICHTE						VARCHAR(015)	NOT NULL DEFAULT 'k.A.'
	,TIMBER_ZUGFESTIGKEIT				VARCHAR(015)	NOT NULL DEFAULT 'k.A.'
	,TIMBER_DRUCKFESTIGKEIT				VARCHAR(015)	NOT NULL DEFAULT 'k.A.'
	,TIMBER_BIEGEFESTIGKEIT				VARCHAR(015)	NOT NULL DEFAULT 'k.A.'
	,TIMBER_SCHERFESTIGKEIT				VARCHAR(015)	NOT NULL DEFAULT 'k.A.'
	,TIMBER_BRINELL_HAERTE1				VARCHAR(015)	NOT NULL DEFAULT 'k.A.'
	,TIMBER_BRINELL_HAERTE2				VARCHAR(015)	NOT NULL DEFAULT 'k.A.'
	,TIMBER_TANGENTIALSCHWUND			VARCHAR(015)	NOT NULL DEFAULT 'k.A.'
	,TIMBER_RADIALSCHWUND				VARCHAR(015)	NOT NULL DEFAULT 'k.A.'
	,RIMARY KEY (TIMBER_ID)
	,CONSTRAINT TIMBER_BOTANICSYSTEM_FK FOREIGN KEY (TIMBER_BOTANICSYSTEM_ID) REFERENCES BOTANICSYSTEM(BOTANICSYSTEM_ID)
	 ON DELETE NO ACTION
	 ON UPDATE NO ACTION
	,CONSTRAINT TIMBER_GEOREGION_FK FOREIGN KEY (TIMBER_GEOREGION_ID) REFERENCES GEOREGION(GEOREGION_ID)
	 ON DELETE NO ACTION
	 ON UPDATE NO ACTION
) ENGINE=InnoDB;
-- ==================================================
-- Index: CREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name
--        USING [BTREE | HASH | RTREE]
--        ON table_name (column_name [(length)] [ASC | DESC],...)
-- ==================================================
CREATE INDEX TIMBER_GEOREGION_IDX ON TIMBER (TIMBER_GEOREGION_ID) ASC;

-- ==================================================
-- Table: ACTORROLE
-- ==================================================
CREATE TABLE ACTORROLE (
	 ACTORROLE_ID							BIGINT			NOT NULL AUTO_INCREMENT
	,ACTORROLE_VERSION					INTEGER			NOT NULL DEFAULT 0
	,ACTORROLE_NAME						VARCHAR(015)	NOT NULL DEFAULT ''
	,ACTORROLE_COMMENT					VARCHAR(256)	NOT NULL DEFAULT ''
	,PRIMARY KEY (ACTORROLE_ID)
) ENGINE=InnoDB;

-- ==================================================
-- Table: ACTOR
-- ==================================================
CREATE TABLE ACTOR (
	 ACTOR_ID								BIGINT			NOT NULL AUTO_INCREMENT
	,ACTOR_VERSION							INTEGER			NOT NULL DEFAULT 0
	,ACTOR_USERNAME						VARCHAR(010)	NOT NULL DEFAULT ''
	,ACTOR_PWD								VARCHAR(010)	NOT NULL DEFAULT ''
	,ACTOR_EMAIL							VARCHAR(035)	NOT NULL DEFAULT ''
	,ACTOR_GIVENNAME						VARCHAR(025)	NOT NULL DEFAULT ''
	,ACTOR_MIDDLENAME						VARCHAR(025)	NOT NULL DEFAULT ''
	,ACTOR_FAMILYNAME						VARCHAR(035)	NOT NULL DEFAULT ''
	,ACTOR_LOGINCOUNT						INTEGER			NOT NULL DEFAULT 0
	,ACTOR_LOGINFAILED					INTEGER			NOT NULL DEFAULT 0
	,ACTOR_LOCKED							BOOLEAN			NOT NULL DEFAULT FALSE
	,PRIMARY KEY (ACTOR_ID)
) ENGINE=InnoDB;

-- ==================================================
-- Table: ACTORIDENTITY
-- ==================================================
-- Foreign Key Syntax:
--    CONSTRAINT constraint_name
--    FOREIGN KEY foreign_key_name (columns)
--    REFERENCES parent_table(columns)
--    ON DELETE action
--    ON UPDATE action
-- ==================================================
CREATE TABLE ACTORIDENTITY (
	 ROLE_ID									BIGINT			NOT NULL
	,ACTOR_ID								BIGINT			NOT NULL
	,CONSTRAINT ACTORIDENTITY_ACTORROLE_FK FOREIGN KEY (ROLE_ID) REFERENCES ACTORROLE(ACTORROLE_ID)
	 ON DELETE NO ACTION
	 ON UPDATE CASCADE
	,CONSTRAINT ACTORIDENTITY_ACTOR_FK FOREIGN KEY (ACTOR_ID) REFERENCES ACTOR(ACTOR_ID)
) ENGINE=InnoDB;
-- ==================================================
-- Index: CREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name
--        USING [BTREE | HASH | RTREE]
--        ON table_name (column_name [(length)] [ASC | DESC],...)
-- ==================================================
CREATE INDEX ACTORIDENTITY_ROLE_IDX ON ACTORIDENTITY (ROLE_ID) ASC;
CREATE INDEX ACTORIDENTITY_ACTOR_IDX ON ACTORIDENTITY (ACTOR_ID) ASC;

-- ==================================================
-- Table: ACTORSESSION
-- ==================================================
-- Foreign Key Syntax:
--    CONSTRAINT constraint_name
--    FOREIGN KEY foreign_key_name (columns)
--    REFERENCES parent_table(columns)
--    ON DELETE action
--    ON UPDATE action
-- ==================================================
CREATE TABLE ACTORSESSION (
	 ACTORSESSION_ID						BIGINT			NOT NULL AUTO_INCREMENT
	,ACTORSESSION_VERSION				INTEGER			NOT NULL DEFAULT 0
	,ACTORSESSION_ACTOR_ID				BIGINT			NOT NULL
	,ACTORSESSION_LOGIN					TIMESTAMP(8)
	,ACTORSESSION_LOGOUT					TIMESTAMP(8)
	,PRIMARY KEY (ACTORSESSION_ID)
	,CONSTRAINT ACTORSESSION_ACTOR_FK FOREIGN KEY (ACTORSESSION_ACTOR_ID) REFERENCES ACTOR(ACTOR_ID)
	 ON DELETE NO ACTION
	 ON UPDATE NO ACTION
) ENGINE=InnoDB;
-- ==================================================
-- Index: CREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name
--        USING [BTREE | HASH | RTREE]
--        ON table_name (column_name [(length)] [ASC | DESC],...)
-- ==================================================
CREATE INDEX ACTORSESSION_ACTOR_IDX ON ACTORSESSION (ACTORSESSION_ACTOR_ID) ASC;

-- ==================================================
-- Table: ARTEFACT
-- ==================================================
-- Foreign Key Syntax:
--    CONSTRAINT constraint_name
--    FOREIGN KEY foreign_key_name (columns)
--    REFERENCES parent_table(columns)
--    ON DELETE action
--    ON UPDATE action
-- ==================================================
CREATE TABLE ARTEFACT (
	 ARTEFACT_ID							BIGINT			NOT NULL AUTO_INCREMENT
	,ARTEFACT_VERSION						INTEGER			NOT NULL DEFAULT 0
	,ARTEFACT_ACTOR_ID					BIGINT			NOT NULL
	,ARTEFACT_STATUS_ID					BIGINT			NOT NULL
	,ARTEFACT_TIMBER_ID					BIGINT			NOT NULL
	,ARTEFACT_ORDINAL						INTEGER			NOT NULL
	,ARTEFACT_PRICE						DECIMAL(7,2)	NOT NULL DEFAULT 0
	,ARTEFACT_IMAGENAME					VARCHAR(064)	NOT NULL DEFAULT ''
	,ARTEFACT_ORIGIN						VARCHAR(256)	NOT NULL DEFAULT ''
	,ARTEFACT_COMMENT						VARCHAR(256)	NOT NULL DEFAULT ''
	,PRIMARY KEY (ARTEFACT_ID)
	,CONSTRAINT ARTEFACT_ACTOR_FK FOREIGN KEY (ARTEFACT_ACTOR_ID) REFERENCES ACTOR(ACTOR_ID)
	 ON DELETE NO ACTION
	 ON UPDATE NO ACTION
	,CONSTRAINT ARTEFACT_STATUS_FK FOREIGN KEY (ARTEFACT_STATUS_ID) REFERENCES STATUS(STATUS_ID)
	 ON DELETE NO ACTION
	 ON UPDATE NO ACTION
	,CONSTRAINT ARTEFACT_TIMBER_FK FOREIGN KEY (ARTEFACT_TIMBER_ID) REFERENCES TIMBER(TIMBER_ID)
	 ON DELETE NO ACTION
	 ON UPDATE NO ACTION
) ENGINE=InnoDB;
-- ==================================================
-- Index: CREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name
--        USING [BTREE | HASH | RTREE]
--        ON table_name (column_name [(length)] [ASC | DESC],...)
-- ==================================================
CREATE UNIQUE INDEX ARTEFACT_PK ON ARTEFACT (ARTEFACT_ORDINAL) ASC;
CREATE INDEX ARTEFACT_ACTOR_IDX ON ARTEFACT (ARTEFACT_ACTOR_ID) ASC;
CREATE INDEX ARTEFACT_STATUS_IDX ON ARTEFACT (ARTEFACT_STATUS_ID) ASC;
CREATE INDEX ARTEFACT_TIMBER_IDX ON ARTEFACT (ARTEFACT_TIMBER_ID) ASC;

-- ==================================================
-- Table: MODSTEP
-- ==================================================
CREATE TABLE MODSTEP (
	 MODSTEP_ID								BIGINT			NOT NULL AUTO_INCREMENT
	,MODSTEP_VERSION						INTEGER			NOT NULL DEFAULT 0
	,MODSTEP_NAME							VARCHAR(064)	NOT NULL DEFAULT ''
	,MODSTEP_COMMENT						VARCHAR(256)	NOT NULL DEFAULT ''
	,PRIMARY KEY (MODSTEP_ID)
) ENGINE=InnoDB;

-- ==================================================
-- Table: MODIFICATION
-- ==================================================
-- Foreign Key Syntax:
--    CONSTRAINT constraint_name
--    FOREIGN KEY foreign_key_name (columns)
--    REFERENCES parent_table(columns)
--    ON DELETE action
--    ON UPDATE action
-- ==================================================
CREATE TABLE MODIFICATION (
	 MODIFICATION_ID						BIGINT			NOT NULL AUTO_INCREMENT
	,MODIFICATION_VERSION				INTEGER			NOT NULL DEFAULT 0
	,MODIFICATION_ARTEFACT_ID			BIGINT			NOT NULL
	,MODIFICATION_MODSTEP_ID			BIGINT			NOT NULL
	,MODIFICATION_DATE					DATE				NOT NULL
	,MODIFICATION_DIAMETER				DECIMAL(7,2)	NOT NULL DEFAULT 0
	,MODIFICATION_HEIGHT					DECIMAL(7,2)	NOT NULL DEFAULT 0
	,MODIFICATION_WALLTHICKNESS_MIN 	DECIMAL(7,2)	NOT NULL DEFAULT 0
	,MODIFICATION_WALLTHICKNESS_MAX 	DECIMAL(7,2)	NOT NULL DEFAULT 0
	,MODIFICATION_GRANULATION			INTEGER			NOT NULL DEFAULT 0
	,MODIFICATION_TAP						INTEGER			NOT NULL DEFAULT 0
	,MODIFICATION_RECESS					INTEGER			NOT NULL DEFAULT 0
	,MODIFICATION_SURFACE				VARCHAR(064)	NOT NULL DEFAULT ''
	,MODIFICATION_COMMENT				VARCHAR(256)	NOT NULL DEFAULT ''
	,PRIMARY KEY (MODIFICATION_ID)
	,CONSTRAINT MODIFICATION_ARTEFACT_FK FOREIGN KEY (MODIFICATION_ARTEFACT_ID) REFERENCES ARTEFACT(ARTEFACT_ID)
	 ON DELETE NO ACTION
	 ON UPDATE NO ACTION
	,CONSTRAINT MODIFICATION_MODSTEP_FK FOREIGN KEY (MODIFICATION_MODSTEP_ID) REFERENCES MODSTEP(MODSTEP_ID)
	 ON DELETE NO ACTION
	 ON UPDATE NO ACTION
) ENGINE=InnoDB;
-- ==================================================
-- Index: CREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name
--        USING [BTREE | HASH | RTREE]
--        ON table_name (column_name [(length)] [ASC | DESC],...)
-- ==================================================
CREATE INDEX MODIFICATION_ARTEFACT_IDX ON MODIFICATION (MODIFICATION_ARTEFACT_ID) ASC;
CREATE INDEX MODIFICATION_MODTSEP_IDX ON MODIFICATION (MODIFICATION_MODSTEP_ID) ASC;

-- ==================================================
-- Table: MODPROCESS
-- ==================================================
-- Foreign Key Syntax:
--    CONSTRAINT constraint_name
--    FOREIGN KEY foreign_key_name (columns)
--    REFERENCES parent_table(columns)
--    ON DELETE action
--    ON UPDATE action
-- ==================================================
CREATE TABLE MODPROCESS (
	 MODPROCESS_ID							BIGINT			NOT NULL AUTO_INCREMENT
	,MODPROCESS_VERSION					INTEGER			NOT NULL DEFAULT 0
	,MODPROCESS_MODIFICATION_ID		BIGINT			NOT NULL
	,MODPROCESS_DATE						DATE				NOT NULL DEFAULT ''
	,MODPROCESS_WEIGHT					DECIMAL(7,2)	NOT NULL DEFAULT 0
	,MODPROCESS_MOISTURE					DECIMAL(7,2)	NOT NULL DEFAULT 0
	,PRIMARY KEY (MODPROCESS_ID)
	,CONSTRAINT MODPROCESS_MODIFICATION_FK FOREIGN KEY (MODPROCESS_MODIFICATION_ID) REFERENCES MODIFICATION(MODIFICATION_ID)
	 ON DELETE NO ACTION
	 ON UPDATE NO ACTION
) ENGINE=InnoDB;
-- ==================================================
-- Index: CREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name
--        USING [BTREE | HASH | RTREE]
--        ON table_name (column_name [(length)] [ASC | DESC],...)
-- ==================================================
CREATE INDEX MODPROCESS_MODIFICATION_IDX ON MODPROCESS (MODPROCESS_MODIFICATION_ID) ASC;
