/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     09.02.2017 19:59:24                          */
/*==============================================================*/


drop index MANUFAKTION_FK;

drop index KONSISTENZ_FK;

drop index ARTIFACT_PK;

drop table ARTIFACT;

drop index AUDIT_PK;

drop table AUDIT;

drop index BOTANICSYSTEM_PK;

drop table BOTANICSYSTEM;

drop index ANMELDUNG_FK;

drop index LOGIN_PK;

drop table LOGIN;

drop index ORIGIN_PK;

drop table ORIGIN;

drop index PARTICIPANT_PK;

drop table PARTICIPANT;

drop index ROLE_PK;

drop table ROLE;

drop index STATUS_PK;

drop table STATUS;

drop index RESOURCE_FK;

drop index BOTANISCHE_KLASSIFIKATION_FK;

drop index TIMBER_PK;

drop table TIMBER;

drop domain CONTINENT;

drop domain GENDER;

drop sequence ART_SEQ;

drop sequence BOF_SEQ;

drop sequence CON_SEQ;

drop sequence LOG_SEQ;

drop sequence MBR_SEQ;

drop sequence MET_SEQ;

drop sequence PRD_SEQ;

drop sequence WOD_SEQ;

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

create sequence LOG_SEQ
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
create domain CONTINENT as CHAR(2);

comment on domain CONTINENT is
'Kontinent Domäne';

/*==============================================================*/
/* Domain: GENDER                                               */
/*==============================================================*/
create domain GENDER as CHAR(1);

comment on domain GENDER is
'Geschlechter Domäne';

/*==============================================================*/
/* Table: ARTIFACT                                              */
/*==============================================================*/
create table ARTIFACT (
   ARTIFACT_ID          INT8                 not null,
   TIMBER_ID            INT8                 not null,
   PARTICIPANT_ID       INT8                 not null,
   ARTIFACT_VERSION     INT8                 not null,
   ARTIFACT_ORDINAL     INT8                 not null,
   ARTIFACT_HERSTELLUNGSJAHR CHAR(4)              not null,
   ARTIFACT_PREIS       DECIMAL(7,2)         not null,
   ARTIFACT_DURCHMESSER DECIMAL(5,0)         not null,
   ARTIFACT_HOEHE       DECIMAL(5,0)         not null,
   ARTIFACT_WANDSTAERKE DECIMAL(5,0)         not null,
   ARTIFACT_VERKAUFT    BOOL                 not null,
   ARTIFACT_BESCHREIBUNG VARCHAR(128)         not null,
   constraint PK_ARTIFACT primary key (ARTIFACT_ID)
);

comment on table ARTIFACT is
'Repräsentiert eine Holzschale aus Naturholz als finales Produkt aus dem manuellen Herstellungsprozess.';

comment on column ARTIFACT.ARTIFACT_ID is
'Eindeutiger Technischer Primärschlüssel';

comment on column ARTIFACT.TIMBER_ID is
'Eindeutiger Technischer Primärschlüssel';

comment on column ARTIFACT.PARTICIPANT_ID is
'Eindeutiger Technischer Primärschlüssel';

comment on column ARTIFACT.ARTIFACT_VERSION is
'Versionsnummer für pessimistisches Sperren';

comment on column ARTIFACT.ARTIFACT_ORDINAL is
'Die Ordinalzahl der Schale (laufende Nummer)';

comment on column ARTIFACT.ARTIFACT_HERSTELLUNGSJAHR is
'Das Herstellungsjahr der Schale als vierstellige Jahreszahl';

comment on column ARTIFACT.ARTIFACT_PREIS is
'Verkaufspreis des Produkts';

comment on column ARTIFACT.ARTIFACT_DURCHMESSER is
'Durchmessser der Schale in Zentimeter';

comment on column ARTIFACT.ARTIFACT_HOEHE is
'Höhe der Schale in Zentimeter';

/*==============================================================*/
/* Index: ARTIFACT_PK                                           */
/*==============================================================*/
create unique index ARTIFACT_PK on ARTIFACT (
ARTIFACT_ID
);

/*==============================================================*/
/* Index: KONSISTENZ_FK                                         */
/*==============================================================*/
create  index KONSISTENZ_FK on ARTIFACT (
TIMBER_ID
);

/*==============================================================*/
/* Index: MANUFAKTION_FK                                        */
/*==============================================================*/
create  index MANUFAKTION_FK on ARTIFACT (
PARTICIPANT_ID
);

/*==============================================================*/
/* Table: AUDIT                                                 */
/*==============================================================*/
create table AUDIT (
   AUDIT_ID             INT8                 not null,
   AUDIT_TIMESTAMP      DATE                 not null,
   AUDIT_USER           VARCHAR(256)         not null,
   AUDIT_TABLE          VARCHAR(256)         not null,
   AUDIT_ACTION         VARCHAR(256)         not null
      constraint CKC_AUDIT_ACTION_AUDIT check (AUDIT_ACTION in ('D','I','U')),
   AUDIT_IDENTIFIER     INT8                 not null,
   constraint PK_AUDIT primary key (AUDIT_ID)
);

comment on table AUDIT is
'Repraesentiert Audit-Statements fuer alle CRUD-Operation gegen die Datenbank';

comment on column AUDIT.AUDIT_TIMESTAMP is
'Zeitpunkt des Logeintrags (yyyy-mm-dd hh:mm:ssss)';

comment on column AUDIT.AUDIT_TABLE is
'Daten nach der CRUD-Operation';

comment on column AUDIT.AUDIT_ACTION is
'Repraesentiert das Kuerzel fuer die CRUD-Operation (I-Insert;U-Update;D-Delete) ';

/*==============================================================*/
/* Index: AUDIT_PK                                              */
/*==============================================================*/
create unique index AUDIT_PK on AUDIT (
AUDIT_ID
);

/*==============================================================*/
/* Table: BOTANICSYSTEM                                         */
/*==============================================================*/
create table BOTANICSYSTEM (
   BOTANICSYSTEM_ID     INT8                 not null,
   BOTANICSYSTEM_VERSION INT8                 not null,
   BOTANICSYSTEM_ORDINAL INT8                 not null,
   BOTANICSYSTEM_ORDNUNG VARCHAR(25)          not null,
   BOTANICSYSTEM_FAMILIE VARCHAR(25)          not null,
   BOTANICSYSTEM_UNTERFAMILIE VARCHAR(25)          not null,
   constraint PK_BOTANICSYSTEM primary key (BOTANICSYSTEM_ID)
);

comment on table BOTANICSYSTEM is
'System zur wissenschaftlichen botanischen Einordnung der Holzarten';

comment on column BOTANICSYSTEM.BOTANICSYSTEM_ID is
'Eindeutiger Technischer Primärschlüssel';

comment on column BOTANICSYSTEM.BOTANICSYSTEM_VERSION is
'Versionsnummer für pessimistisches Sperren';

/*==============================================================*/
/* Index: BOTANICSYSTEM_PK                                      */
/*==============================================================*/
create unique index BOTANICSYSTEM_PK on BOTANICSYSTEM (
BOTANICSYSTEM_ID
);

/*==============================================================*/
/* Table: LOGIN                                                 */
/*==============================================================*/
create table LOGIN (
   LOGIN_ID             INT8                 not null,
   PARTICIPANT_ID       INT8                 null,
   LOGIN_VERSION        INT8                 not null,
   LOGIN_ENTRY          DATE                 not null,
   LOGIN_EXIT           DATE                 not null,
   constraint PK_LOGIN primary key (LOGIN_ID)
);

comment on column LOGIN.PARTICIPANT_ID is
'Eindeutiger Technischer Primärschlüssel';

/*==============================================================*/
/* Index: LOGIN_PK                                              */
/*==============================================================*/
create unique index LOGIN_PK on LOGIN (
LOGIN_ID
);

/*==============================================================*/
/* Index: ANMELDUNG_FK                                          */
/*==============================================================*/
create  index ANMELDUNG_FK on LOGIN (
PARTICIPANT_ID
);

/*==============================================================*/
/* Table: ORIGIN                                                */
/*==============================================================*/
create table ORIGIN (
   ORIGIN_ID            INT8                 not null,
   ORIGIN_VERSION       INT8                 not null,
   ORIGIN_ORDINAL       INT8                 not null,
   ORIGIN_CODE          VARCHAR(10)          not null,
   ORIGIN_NAME          VARCHAR(12)          not null,
   ORIGIN_REGION        VARCHAR(35)          not null,
   constraint PK_ORIGIN primary key (ORIGIN_ID)
);

comment on table ORIGIN is
'Repräsentiert eine geographische Zone des Planeten Erde';

comment on column ORIGIN.ORIGIN_ID is
'Eindeutiger Technischer Primärschlüssel';

comment on column ORIGIN.ORIGIN_VERSION is
'Versionsnummer für pessimistisches Sperren';

comment on column ORIGIN.ORIGIN_NAME is
'Der Name des Kontinents';

comment on column ORIGIN.ORIGIN_REGION is
'2-stelliges Kürzel des Kontinents';

/*==============================================================*/
/* Index: ORIGIN_PK                                             */
/*==============================================================*/
create unique index ORIGIN_PK on ORIGIN (
ORIGIN_ID
);

/*==============================================================*/
/* Table: PARTICIPANT                                           */
/*==============================================================*/
create table PARTICIPANT (
   PARTICIPANT_ID       INT8                 not null,
   PARTICIPANT_VERSION  INT8                 not null,
   PARTICIPANT_USERNAME VARCHAR(10)          not null,
   PARTICIPANT_PWD      VARCHAR(10)          not null,
   PARTICIPANT_EMAIL    VARCHAR(35)          not null,
   PARTICIPANT_GIVENNAME VARCHAR(25)          not null,
   PARTICIPANT_MIDDLENAME VARCHAR(25)          not null,
   PARTICIPANT_FAMILYNAME VARCHAR(35)          not null,
   PARTICIPANT_LOGINCOUNT INT8                 not null,
   PARTICIPANT_LOGINFAILED INT8                 not null,
   PARTICIPANT_LOCKED   BOOL                 not null,
   constraint PK_PARTICIPANT primary key (PARTICIPANT_ID)
);

comment on table PARTICIPANT is
'Repräsentiert den Teilnehmer an der Superbowl-Applikation';

comment on column PARTICIPANT.PARTICIPANT_ID is
'Eindeutiger Technischer Primärschlüssel';

comment on column PARTICIPANT.PARTICIPANT_VERSION is
'Versionsnummer für pessimistisches Sperren';

/*==============================================================*/
/* Index: PARTICIPANT_PK                                        */
/*==============================================================*/
create unique index PARTICIPANT_PK on PARTICIPANT (
PARTICIPANT_ID
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE (
   ROLE_ID              INT8                 not null,
   ROLE_VERSION         INT8                 not null,
   ROLE_NAME            VARCHAR(15)          not null,
   constraint PK_ROLE primary key (ROLE_ID)
);

/*==============================================================*/
/* Index: ROLE_PK                                               */
/*==============================================================*/
create unique index ROLE_PK on ROLE (
ROLE_ID
);

/*==============================================================*/
/* Table: STATUS                                                */
/*==============================================================*/
create table STATUS (
   STATUS_ID            INT8                 not null,
   STATUS_VERSION       INT8                 not null,
   STATUS_BEZEICHNUNG   VARCHAR(35)          not null,
   constraint PK_STATUS primary key (STATUS_ID)
);

comment on table STATUS is
'Repraesentiert den Status eines Artefaktes';

comment on column STATUS.STATUS_VERSION is
'Versionsnummer fuer optimistisches Sperren';

comment on column STATUS.STATUS_BEZEICHNUNG is
'Benutzerkennung';

/*==============================================================*/
/* Index: STATUS_PK                                             */
/*==============================================================*/
create unique index STATUS_PK on STATUS (
STATUS_ID
);

/*==============================================================*/
/* Table: TIMBER                                                */
/*==============================================================*/
create table TIMBER (
   TIMBER_ID            INT8                 not null,
   BOTANICSYSTEM_ID     INT8                 not null,
   ORIGIN_ID            INT8                 not null,
   TIMBER_VERSION       INT8                 not null,
   TIMBER_TYPE          CHAR(1)              not null,
   TIMBER_CODE          CHAR(4)              not null,
   TIMBER_NAME          VARCHAR(25)          not null,
   TIMBER_IMAGENAME     VARCHAR(35)          not null,
   TIMBER_AKADEMISCHERNAME VARCHAR(50)          not null,
   TIMBER_ROHDICHTE     VARCHAR(15)          not null,
   TIMBER_ZUGFESTIGKEIT VARCHAR(15)          not null,
   TIMBER_DRUCKFESTIGKEIT VARCHAR(15)          not null,
   TIMBER_BIEGEFESTIGKEIT VARCHAR(15)          not null,
   TIMBER_SCHERFESTIGKEIT VARCHAR(15)          not null,
   TIMBER_BRINELL_HAERTE1 VARCHAR(15)          not null,
   TIMBER_BRINELL_HAERTE2 VARCHAR(15)          not null,
   TIMBER_TANGENTIALSCHWUND VARCHAR(15)          not null,
   TIMBER_RADIALSCHWUND VARCHAR(15)          not null,
   constraint PK_TIMBER primary key (TIMBER_ID)
);

comment on table TIMBER is
'Repräsentiert die Holzart aus dem die Schale hergestellt ist.';

comment on column TIMBER.TIMBER_ID is
'Eindeutiger Technischer Primärschlüssel';

comment on column TIMBER.BOTANICSYSTEM_ID is
'Eindeutiger Technischer Primärschlüssel';

comment on column TIMBER.ORIGIN_ID is
'Eindeutiger Technischer Primärschlüssel';

comment on column TIMBER.TIMBER_VERSION is
'Versionsnummer für pessimistisches Sperren';

comment on column TIMBER.TIMBER_TYPE is
'Liste von anderen Namen für eine Holzart';

comment on column TIMBER.TIMBER_IMAGENAME is
'Name des Bilddatei zur Holzart';

/*==============================================================*/
/* Index: TIMBER_PK                                             */
/*==============================================================*/
create unique index TIMBER_PK on TIMBER (
TIMBER_ID
);

/*==============================================================*/
/* Index: BOTANISCHE_KLASSIFIKATION_FK                          */
/*==============================================================*/
create  index BOTANISCHE_KLASSIFIKATION_FK on TIMBER (
BOTANICSYSTEM_ID
);

/*==============================================================*/
/* Index: RESOURCE_FK                                           */
/*==============================================================*/
create  index RESOURCE_FK on TIMBER (
ORIGIN_ID
);

alter table ARTIFACT
   add constraint FK_ARTIFACT_KONSISTEN_TIMBER foreign key (TIMBER_ID)
      references TIMBER (TIMBER_ID)
      on delete restrict on update restrict;

alter table ARTIFACT
   add constraint FK_ARTIFACT_MANUFAKTI_PARTICIP foreign key (PARTICIPANT_ID)
      references PARTICIPANT (PARTICIPANT_ID)
      on delete restrict on update restrict;

alter table LOGIN
   add constraint FK_LOGIN_ANMELDUNG_PARTICIP foreign key (PARTICIPANT_ID)
      references PARTICIPANT (PARTICIPANT_ID)
      on delete restrict on update restrict;

alter table TIMBER
   add constraint FK_TIMBER_BOTANISCH_BOTANICS foreign key (BOTANICSYSTEM_ID)
      references BOTANICSYSTEM (BOTANICSYSTEM_ID)
      on delete restrict on update restrict;

alter table TIMBER
   add constraint FK_TIMBER_RESOURCE_ORIGIN foreign key (ORIGIN_ID)
      references ORIGIN (ORIGIN_ID)
      on delete restrict on update restrict;

