-- begin_generated_IBM_copyright_prolog

-- Licensed Materials - Property of IBM
-- 
-- 5724-N72 5655-WBS
-- 
-- Copyright IBM Corp. 2009 All Rights Reserved.
-- 
-- US Government Users Restricted Rights - Use, duplication or
-- disclosure restricted by GSA ADP Schedule Contract with
-- IBM Corp.

-- end_generated_IBM_copyright_prolog

ALTER SESSION SET CURRENT_SCHEMA = __DBSCHEMA__;

CREATE TABLE SR_ACTIVITY_APICALL (
	ID NUMBER(*,0),
	CONTAINER_ID NUMBER(*,0) NOT NULL ENABLE ,
      OWNING_APICALL_ID NUMBER(*,0),
	API_TYPE VARCHAR2(8) ,
	METHOD VARCHAR2(32) ,
	ROOT_OBJECT VARCHAR2(72),
	USERID VARCHAR2(64) ,
	TIME_CREATED TIMESTAMP (6));

ALTER TABLE SR_ACTIVITY_APICALL ADD PRIMARY KEY (ID) ENABLE;


CREATE TABLE SR_ACTIVITY_RECORD (
      ID NUMBER(*,0),
	API_CALL_ID NUMBER(*,0),
	RESOURCE_ACTION VARCHAR2(16) ,
	RESOURCE_TYPE VARCHAR2(16) ,
	SUBJECT VARCHAR2(72) ,
	PREDICATE VARCHAR2(1020),
	FROM_VALUE VARCHAR2(1020) ,
	TO_VALUE VARCHAR2(1020) ,
	TIME_CREATED TIMESTAMP (6));

ALTER TABLE SR_ACTIVITY_RECORD ADD PRIMARY KEY (ID) ENABLE;

CREATE INDEX IDX_ACT_REC_SUB ON SR_ACTIVITY_RECORD(SUBJECT, API_CALL_ID);

CREATE INDEX "IDX_ACT_APICALL_2" ON "SR_ACTIVITY_APICALL" ("USERID" ASC, "METHOD" ASC, "ID" ASC);
CREATE INDEX "IDX_ACT_APICALL_3" ON "SR_ACTIVITY_APICALL" ("METHOD" ASC, "USERID" ASC, "ID" ASC);
CREATE INDEX "IDX_ACT_REC_2"     ON "SR_ACTIVITY_RECORD"  ("RESOURCE_TYPE" ASC, "RESOURCE_ACTION" ASC, "TIME_CREATED" ASC, "TO_VALUE" ASC, "FROM_VALUE" ASC, "PREDICATE" ASC, "SUBJECT" ASC, "ID" ASC, "API_CALL_ID" ASC);
CREATE INDEX "IDX_ACT_REC_3"     ON "SR_ACTIVITY_RECORD"  ("PREDICATE" ASC, "RESOURCE_ACTION" ASC, "RESOURCE_TYPE" ASC, "TIME_CREATED" DESC, "TO_VALUE" ASC, "FROM_VALUE" ASC, "SUBJECT" ASC, "ID" ASC, "API_CALL_ID" ASC);
CREATE INDEX "IDX_ACT_REC_4"     ON "SR_ACTIVITY_RECORD"  ("PREDICATE" ASC, "TIME_CREATED" ASC, "TO_VALUE" ASC, "FROM_VALUE" ASC, "SUBJECT" ASC, "RESOURCE_TYPE" ASC, "RESOURCE_ACTION" ASC, "ID" ASC, "API_CALL_ID" ASC);
CREATE INDEX "IDX_ACT_REC_5"     ON "SR_ACTIVITY_RECORD"  ("TIME_CREATED" ASC, "TO_VALUE" ASC, "FROM_VALUE" ASC, "PREDICATE" ASC, "SUBJECT" ASC, "RESOURCE_TYPE" ASC, "RESOURCE_ACTION" ASC, "ID" ASC, "API_CALL_ID" ASC);

CREATE SEQUENCE  SEQ_SR_ACTIVITY_APICALL_ID  MINVALUE 1 NOMAXVALUE INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
CREATE SEQUENCE  SEQ_SR_ACTIVITY_RECORD_ID  MINVALUE 1 NOMAXVALUE INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

GRANT SELECT,INSERT,UPDATE,DELETE,ALTER ON SR_ACTIVITY_APICALL TO __DBUSER__;
GRANT SELECT,INSERT,UPDATE,DELETE,ALTER ON SR_ACTIVITY_RECORD TO __DBUSER__;

GRANT SELECT,ALTER ON SEQ_SR_ACTIVITY_APICALL_ID TO __DBUSER__;
GRANT SELECT,ALTER ON SEQ_SR_ACTIVITY_RECORD_ID TO __DBUSER__;
