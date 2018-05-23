/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     13.10.2013 13:46:50                          */
/*==============================================================*/


drop index ARTIST_PK;

drop table "ARTIST";

drop index BOTANICALFAMILY_PK;

drop table "BOTANICALFAMILY";

drop index CONTINENT_PK;

drop table "CONTINENT";

drop index AUDIT_PK;

drop table "AUDIT";

drop index MEMBER_PK;

drop table "MEMBER";

drop index METADATEN_FK;

drop index METADATA_PK;

drop table "METADATA";

drop index MANUFAKTION_FK;

drop index KONSISTENZ_FK;

drop index PRODUCT_PK;

drop table "PRODUCT";

drop index VORKOMMEN_FK;

drop index VORKOMMEN2_FK;

drop index VORKOMMEN_PK;

drop table "VORKOMMEN";

drop index METADATEN2_FK;

drop index BOTANISCHE_KLASSIFIKATION_FK;

drop index WOOD_PK;

drop table "WOOD";

drop domain "CONTINENT";

drop domain GENDER;

drop sequence AUD_SEQ;

drop sequence ART_SEQ;

drop sequence BOF_SEQ;

drop sequence CON_SEQ;

drop sequence MBR_SEQ;

drop sequence MET_SEQ;

drop sequence PRD_SEQ;

drop sequence WOD_SEQ;

create sequence AUD_SEQ
increment 1
minvalue 1
maxvalue 1000000
start 1
cycle;

create sequence ART_SEQ
increment 1
minvalue 1
maxvalue 1000000
start 1
cycle;

create sequence BOF_SEQ
increment 1
minvalue 1
maxvalue 1000000
start 1
cycle;

create sequence CON_SEQ
increment 1
minvalue 1
maxvalue 1000000
start 1
cycle;

create sequence MBR_SEQ
increment 1
minvalue 1
maxvalue 1000000
start 1
cycle;

create sequence MET_SEQ
increment 1
minvalue 1
maxvalue 1000000
start 1
cycle;

create sequence PRD_SEQ
increment 1
minvalue 1
maxvalue 1000000
start 1
cycle;

create sequence WOD_SEQ
increment 1
minvalue 1
maxvalue 1000000
start 1
cycle;

/*==============================================================*/
/* Domain: CONTINENT                                            */
/*==============================================================*/
create domain "CONTINENT" as CHAR(2);

comment on domain "CONTINENT" is
'Kontinent Domaene';

/*==============================================================*/
/* Domain: GENDER                                               */
/*==============================================================*/
create domain "GENDER" as CHAR(1);

comment on domain "GENDER" is
'Geschlechter Domaene';

/*==============================================================*/
/* Table: AUDIT                                                 */
/*==============================================================*/
create table "AUDIT" (
   AUD_TIME             TIMESTAMP            not null,
   AUD_OP               CHAR(1)              not null,
   AUD_TABLE            VARCHAR(32)          not null,
   AUD_USER             VARCHAR(32)          not null,
   AUD_S01              VARCHAR(128)             null,
   AUD_S02              VARCHAR(128)             null,
   AUD_S03              VARCHAR(128)             null,
   AUD_S04              VARCHAR(128)             null,
   AUD_S05              VARCHAR(128)             null,
   AUD_S06              VARCHAR(128)             null,
   AUD_S07              VARCHAR(128)             null,
   AUD_S08              VARCHAR(128)             null,
   AUD_S09              VARCHAR(128)             null,
   AUD_S10              VARCHAR(128)             null,
   AUD_S11              VARCHAR(128)             null
);

comment on table "AUDIT" is
'Repraesentiert Audit-Statements fuer alle CRUD-Operation auf allen Tabellen';

comment on column "AUDIT".AUD_TIME is
'Zeitpunkt des Logeintrags (yyyy-mm-dd hh:mm:ssss)';

comment on column "AUDIT".AUD_OP is
'Kuerzel der CRUD-Operation';

comment on column "AUDIT".AUD_TABLE is
'Tabellenname';

comment on column "AUDIT".AUD_USER is
'Benutzer';

comment on column "AUDIT".AUD_S01 is
'Datenspalte 1';

comment on column "AUDIT".AUD_S02 is
'Datenspalte 2';

comment on column "AUDIT".AUD_S03 is
'Datenspalte 3';

comment on column "AUDIT".AUD_S04 is
'Datenspalte 4';

comment on column "AUDIT".AUD_S05 is
'Datenspalte 5';

comment on column "AUDIT".AUD_S06 is
'Datenspalte 6';

comment on column "AUDIT".AUD_S07 is
'Datenspalte 7';

comment on column "AUDIT".AUD_S08 is
'Datenspalte 8';

comment on column "AUDIT".AUD_S09 is
'Datenspalte 9';

comment on column "AUDIT".AUD_S10 is
'Datenspalte 10';

comment on column "AUDIT".AUD_S11 is
'Datenspalte 11';

/*==============================================================*/
/* Table: ARTIST                                                */
/*==============================================================*/
create table "ARTIST" (
   ART_ID               INT8                 not null,
   ART_VERSION          INT8                 not null,
   ART_GNAME            VARCHAR(25)          not null,
   ART_FNAME            VARCHAR(25)          not null,
   ART_GENDER           GENDER               not null,
   constraint PK_ARTIST primary key (ART_ID)
);

comment on table "ARTIST" is
'Repraesentiert den Produzenten eines Produktes';

comment on column "ARTIST".ART_ID is
'Eindeutiger Technischer Primaerschluessel';

comment on column "ARTIST".ART_VERSION is
'Versionsnummer fuer pessimistisches Sperren';

/*==============================================================*/
/* Index: ARTIST_PK                                             */
/*==============================================================*/
create unique index ARTIST_PK on "ARTIST" (
ART_ID
);

/*==============================================================*/
/* Table: BOTANICALFAMILY                                       */
/*==============================================================*/
create table "BOTANICALFAMILY" (
   BOF_ID               INT8                 not null,
   BOF_VERSION          INT8                 not null,
   BOF_NAME             CHAR(35)             not null,
   constraint PK_BOTANICALFAMILY primary key (BOF_ID)
);

comment on table "BOTANICALFAMILY" is
'Botanische Familienbezeichnung';

comment on column "BOTANICALFAMILY".BOF_ID is
'Eindeutiger Technischer Primaerschluessel';

comment on column "BOTANICALFAMILY".BOF_VERSION is
'Versionsnummer fuer pessimistisches Sperren';

/*==============================================================*/
/* Index: BOTANICALFAMILY_PK                                    */
/*==============================================================*/
create unique index BOTANICALFAMILY_PK on "BOTANICALFAMILY" (
BOF_ID
);

/*==============================================================*/
/* Table: CONTINENT                                             */
/*==============================================================*/
create table "CONTINENT" (
   CON_ID               INT8                 not null,
   CON_VERSION          INT8                 not null,
   CON_NAME             VARCHAR(25)          not null,
   CON_ABBREV           CHAR(2)              not null,
   constraint PK_CONTINENT primary key (CON_ID)
);

comment on table "CONTINENT" is
'Repr�aesentiert eine geographische Zone des Planeten Erde';

comment on column "CONTINENT".CON_ID is
'Eindeutiger Technischer Primaerschl�uessel';

comment on column "CONTINENT".CON_VERSION is
'Versionsnummer fuer pessimistisches Sperren';

comment on column "CONTINENT".CON_NAME is
'Der Name des Kontinents';

comment on column "CONTINENT".CON_ABBREV is
'2-stelliges Kuerzel des Kontinents';

/*==============================================================*/
/* Index: CONTINENT_PK                                          */
/*==============================================================*/
create unique index CONTINENT_PK on "CONTINENT" (
CON_ID
);

/*==============================================================*/
/* Table: MEMBER                                                */
/*==============================================================*/
create table "MEMBER" (
   MBR_ID               INT8                 not null,
   MBR_VERSION          INT8                 not null,
   MBR_NAME             VARCHAR(15)          not null,
   MBR_EMAIL            VARCHAR(50)          not null,
   MBR_PASSWORD         VBIN100              not null,
   constraint PK_MEMBER primary key (MBR_ID)
);

comment on table "MEMBER" is
'Repraesentiert den Benutzer der Applikation ''Timberbowl''.';

comment on column "MEMBER".MBR_VERSION is
'Versionsnummer fuer optimistisches Sperren';

comment on column "MEMBER".MBR_NAME is
'Benutzerkennung';

comment on column "MEMBER".MBR_EMAIL is
'Elektronische Mailadresse des Benutzers';

comment on column "MEMBER".MBR_PASSWORD is
'VerschluePrimaerschluesselsseltes Zugangspasswort des Benutzers';

/*==============================================================*/
/* Index: MEMBER_PK                                             */
/*==============================================================*/
create unique index MEMBER_PK on "MEMBER" (
MBR_ID
);

/*==============================================================*/
/* Table: METADATA                                              */
/*==============================================================*/
create table "METADATA" (
   MET_ID               INT8                 not null,
   WOD_ID               INT8                 not null,
   MET_VERSION          INT8                 not null,
   MET_ORIGIN_LOCATION  VARCHAR(128)         not null,
   constraint PK_METADATA primary key (MET_ID)
);

comment on table "METADATA" is
'Repraesentiert Daten im Zusammenhang von Material, Produkt, Produzent und Herstellungsprozess';

comment on column "METADATA".MET_ID is
'Eindeutiger Technischer Primaerschluessel';

comment on column "METADATA".WOD_ID is
'Eindeutiger Technischer Primaerschluessel';

comment on column "METADATA".MET_ORIGIN_LOCATION is
'Gibt Auskunft ueber den lokalen Wachstumsstandort des verarbeiteten Materials';

/*==============================================================*/
/* Index: METADATA_PK                                           */
/*==============================================================*/
create unique index METADATA_PK on "METADATA" (
MET_ID
);

/*==============================================================*/
/* Index: METADATEN_FK                                          */
/*==============================================================*/
create  index METADATEN_FK on "METADATA" (
WOD_ID
);

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
create table "PRODUCT" (
   PRD_ID               INT8                 not null,
   WOD_ID               INT8                 not null,
   ART_ID               INT8                 not null,
   PRD_VERSION          INT8                 not null,
   PRD_NUMBER           INT4                 not null,
   PRD_NAME             VARCHAR(25)          not null,
   PRD_YEAR             CHAR(4)              not null,
   PRD_DIAMETER         DECIMAL              not null,
   PRD_HEIGHT           DECIMAL              not null,
   PRD_PRICE            DECIMAL              not null,
   PRD_IMAGENAME        VARCHAR(35)          not null,
   constraint PK_PRODUCT primary key (PRD_ID)
);

comment on table "PRODUCT" is
'Repraesentiert das finale Produkt; hier eine Schale aus Naturholz aus manueller Produktion.';

comment on column "PRODUCT".PRD_ID is
'Eindeutiger Technischer Prim�rschl�ssel';

comment on column "PRODUCT".WOD_ID is
'Eindeutiger Technischer Prim�rschl�ssel';

comment on column "PRODUCT".ART_ID is
'Eindeutiger Technischer Primaerschluessel';

comment on column "PRODUCT".PRD_VERSION is
'Versionsnummer fuer pessimistisches Sperren';

comment on column "PRODUCT".PRD_NUMBER is
'Logische Produktionsnummer des Produkts';

comment on column "PRODUCT".PRD_NAME is
'Name der Schale';

comment on column "PRODUCT".PRD_YEAR is
'Herstellungsjahr des Produkts';

comment on column "PRODUCT".PRD_DIAMETER is
'Durchmessser des Produkts in Millimeter';

comment on column "PRODUCT".PRD_HEIGHT is
'Hoehe des Produkts in Millimeter';

comment on column "PRODUCT".PRD_PRICE is
'Verkaufspreis des Produkts';

comment on column "PRODUCT".PRD_IMAGENAME is
'Name der Bilddatei zu dem Produkt';

/*==============================================================*/
/* Index: PRODUCT_PK                                            */
/*==============================================================*/
create unique index PRODUCT_PK on "PRODUCT" (
PRD_ID
);

/*==============================================================*/
/* Index: KONSISTENZ_FK                                         */
/*==============================================================*/
create  index KONSISTENZ_FK on "PRODUCT" (
WOD_ID
);

/*==============================================================*/
/* Index: MANUFAKTION_FK                                        */
/*==============================================================*/
create  index MANUFAKTION_FK on "PRODUCT" (
ART_ID
);

/*==============================================================*/
/* Table: VORKOMMEN                                             */
/*==============================================================*/
create table "VORKOMMEN" (
   CON_ID               INT8                 not null,
   WOD_ID               INT8                 not null,
   constraint PK_VORKOMMEN primary key (CON_ID, WOD_ID)
);

comment on table "VORKOMMEN" is
'Repr�sentiert die geographischen Wachstumsregionen einer Holzart';

comment on column "VORKOMMEN".CON_ID is
'Eindeutiger Technischer Primaerschluessel';

comment on column "VORKOMMEN".WOD_ID is
'Eindeutiger Technischer Primaerschluessel';

/*==============================================================*/
/* Index: VORKOMMEN_PK                                          */
/*==============================================================*/
create unique index VORKOMMEN_PK on "VORKOMMEN" (
CON_ID,
WOD_ID
);

/*==============================================================*/
/* Index: VORKOMMEN2_FK                                         */
/*==============================================================*/
create  index VORKOMMEN2_FK on "VORKOMMEN" (
WOD_ID
);

/*==============================================================*/
/* Index: VORKOMMEN_FK                                          */
/*==============================================================*/
create  index VORKOMMEN_FK on "VORKOMMEN" (
CON_ID
);

/*==============================================================*/
/* Table: WOOD                                                  */
/*==============================================================*/
create table "WOOD" (
   WOD_ID               INT8                 not null,
   BOF_ID               INT8                 not null,
   MET_ID               INT8                 null,
   WOD_VERSION          INT8                 not null,
   WOD_NAME             VARCHAR(25)          not null,
   WOD_ALIASES          VARCHAR(256)         not null,
   WOD_BOTNAME          VARCHAR(35)          not null,
   WOD_BOTFAMILY        VARCHAR(25)          not null,
   WOD_SYSTEM           VARCHAR(25)          not null,
   WOD_IMAGENAME        VARCHAR(35)          not null,
   constraint PK_WOOD primary key (WOD_ID)
);

comment on table "WOOD" is
'Repraesentiert die Holzart aus dem ein Produkt (hier: Schale) besteht und hergestellt wird.';

comment on column "WOOD".WOD_ID is
'Eindeutiger Technischer Primaerschluessel';

comment on column "WOOD".BOF_ID is
'Eindeutiger Technischer Prim�aerschluessel';

comment on column "WOOD".MET_ID is
'Eindeutiger Technischer Primaerschluessel';

comment on column "WOOD".WOD_VERSION is
'Versionsnummer fuer pessimistisches Sperren';

comment on column "WOOD".WOD_ALIASES is
'Liste von anderen Namen fuer eine Holzart';

comment on column "WOOD".WOD_IMAGENAME is
'Name des Bilddatei zur Holzart';

/*==============================================================*/
/* Index: WOOD_PK                                               */
/*==============================================================*/
create unique index WOOD_PK on "WOOD" (
WOD_ID
);

/*==============================================================*/
/* Index: BOTANISCHE_KLASSIFIKATION_FK                          */
/*==============================================================*/
create  index BOTANISCHE_KLASSIFIKATION_FK on "WOOD" (
BOF_ID
);

/*==============================================================*/
/* Index: METADATEN2_FK                                         */
/*==============================================================*/
create  index METADATEN2_FK on "WOOD" (
MET_ID
);

alter table "METADATA"
   add constraint FK_METADATA_METADATEN_WOOD foreign key (WOD_ID)
      references "WOOD" (WOD_ID)
      on delete restrict on update restrict;

alter table "PRODUCT"
   add constraint FK_PRODUCT_KONSISTEN_WOOD foreign key (WOD_ID)
      references "WOOD" (WOD_ID)
      on delete restrict on update restrict;

alter table "PRODUCT"
   add constraint FK_PRODUCT_MANUFAKTI_ARTIST foreign key (ART_ID)
      references "ARTIST" (ART_ID)
      on delete restrict on update restrict;

alter table "VORKOMMEN"
   add constraint FK_VORKOMME_VORKOMMEN_CONTINEN foreign key (CON_ID)
      references "CONTINENT" (CON_ID)
      on delete restrict on update restrict;

alter table "VORKOMMEN"
   add constraint FK_VORKOMME_VORKOMMEN_WOOD foreign key (WOD_ID)
      references "WOOD" (WOD_ID)
      on delete restrict on update restrict;

alter table "WOOD"
   add constraint FK_WOOD_BOTANISCH_BOTANICA foreign key (BOF_ID)
      references "BOTANICALFAMILY" (BOF_ID)
      on delete restrict on update restrict;

alter table "WOOD"
   add constraint FK_WOOD_METADATEN_METADATA foreign key (MET_ID)
      references "METADATA" (MET_ID)
      on delete restrict on update restrict;

/*==============================================================
  TRIGGER
  ==============================================================*/
DROP TRIGGER IF EXISTS INSERT_ARTIST_AUDIT_TRIGGER ON "ARTIST";
COMMIT;

CREATE TRIGGER "INSERT_ARTIST_AUDIT_TRIGGER"
  AFTER INSERT
  ON "ARTIST"
  FOR EACH ROW
  EXECUTE PROCEDURE artist_audit();

COMMIT;
  
DROP TRIGGER IF EXISTS INSERT_ARTIST_LOG_TRIGGER ON "ARTIST";

CREATE TRIGGER "INSERT_ARTIST_LOG_TRIGGER"
  AFTER INSERT
  ON "ARTIST"
  FOR EACH ROW
  EXECUTE PROCEDURE timberbowl_audit();
  
DROP TRIGGER IF EXISTS INSERT_PRODUCT_LOG_TRIGGER ON "PRODUCT";

CREATE TRIGGER "INSERT_PRODUCT_LOG_TRIGGER"
  AFTER INSERT
  ON "PRODUCT"
  FOR EACH ROW
  EXECUTE PROCEDURE product_log_audit0();
  
DROP TRIGGER IF EXISTS DELETE_PRODUCT_LOG_TRIGGER ON "PRODUCT";

CREATE TRIGGER "DELETE_PRODUCT_LOG_TRIGGER"
  AFTER DELETE
  ON "PRODUCT"
  FOR EACH ROW

comment on column "AUDIT".AUD_S01 is
'Datenspalte 1';

comment on column "AUDIT".AUD_S02 is
'Datenspalte 2';
  EXECUTE PROCEDURE product_log_audit0();

DROP TRIGGER IF EXISTS UPDATE_PRODUCT_LOG_TRIGGER ON "PRODUCT";

CREATE TRIGGER "UPDATE_PRODUCT_LOG_TRIGGER"
  AFTER UPDATE
  ON "PRODUCT"
  FOR EACH ROW
  EXECUTE PROCEDURE product_log_audit0();

COMMIT; 

