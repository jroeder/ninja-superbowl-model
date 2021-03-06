-- ==================================================
-- DDL Master Script of Derby Database SUPERBOWL
-- Created by: Jürgen Röder
-- Last Updated: 2017-03-06
-- ==================================================

-- ==================================================
-- Table: ACTOR
-- ==================================================
CREATE TABLE ACTOR (
	 ACTOR_ID							BIGINT			NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
	,ACTOR_VERSION						INTEGER			NOT NULL DEFAULT 0
	,ACTOR_USERNAME					VARCHAR(010)	NOT NULL DEFAULT ''
	,ACTOR_PWD							VARCHAR(010)	NOT NULL DEFAULT ''
	,ACTOR_EMAIL						VARCHAR(035)	NOT NULL DEFAULT ''
	,ACTOR_GIVENNAME					VARCHAR(025)	NOT NULL DEFAULT ''
	,ACTOR_MIDDLENAME					VARCHAR(025)	NOT NULL DEFAULT ''
	,ACTOR_FAMILYNAME					VARCHAR(035)	NOT NULL DEFAULT ''
	,ACTOR_LOGINCOUNT					INTEGER			NOT NULL DEFAULT 0
	,ACTOR_LOGINFAILED				INTEGER			NOT NULL DEFAULT 0
	,ACTOR_LOCKED						BOOLEAN			NOT NULL DEFAULT FALSE
	,CONSTRAINT ACTOR_PK PRIMARY KEY (ACTOR_ID)
);

-- ==================================================
-- Table: ARTEFACT
-- ==================================================
CREATE TABLE ARTEFACT (
	 ARTEFACT_ID						BIGINT					NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
	,ARTEFACT_VERSION					INTEGER					NOT NULL DEFAULT 0
	,ARTEFACT_ACTOR_ID				BIGINT					NOT NULL
	,ARTEFACT_ORDINAL					INTEGER					NOT NULL
	,ARTEFACT_PRICE					DOUBLE PRECISION		NOT NULL DEFAULT 0
	,ARTEFACT_IMAGENAME				VARCHAR(064)			NOT NULL DEFAULT ''
	,ARTEFACT_ORIGIN					VARCHAR(256)			NOT NULL DEFAULT ''
	,ARTEFACT_COMMENT					VARCHAR(256)			NOT NULL DEFAULT ''
	,CONSTRAINT ARTEFACT_PK PRIMARY KEY (ARTEFACT_ID)
	,CONSTRAINT ARTEFACT_ACTOR_FK FOREIGN KEY (ARTEFACT_ACTOR_ID) REFERENCES ACTOR(ACTOR_ID)
);
CREATE UNIQUE INDEX ARTEFACT_PK ON ARTEFACT (ARTEFACT_ORDINAL);
CREATE INDEX ARTEFACT_ACTOR_IDX ON ARTEFACT (ARTEFACT_ACTOR_ID);
