/*第1步：创建临时表空间  */
create temporary tablespace odi_temp 
tempfile 'C:\app\ORACLE\oradata\orcl\odi_temp.dbf'
size 50m 
autoextend on 
next 50m maxsize 20480m 
extent management local; 
  
/*第2步：创建数据表空间  */
create tablespace odi_data 
logging 
datafile 'C:\app\ORACLE\oradata\orcl\odi_data.dbf'
size 50m 
autoextend on 
next 50m maxsize 20480m 
extent management local; 
  

/*第3步：创建用户并指定表空间  */
create user sakila_dwh identified by sakila_dwh
default tablespace odi_data 
temporary tablespace odi_temp
quota unlimited on odi_data
profile default ;

/*第4步：给用户授予权限  */
grant connect,resource to sakila_dwh;
grant create view to sakila_dwh;




/*
Oracle Client Version : 12.1.0.1.0

Source Server         : sakila_dwh
Source Server Version : 120100
Source Host           : localhost:1521
Source Schema         : SAKILA_DWH

Date: 2015-04-18 18:37:10
*/


-- ----------------------------
-- Table structure for DIM_ACTOR
-- ----------------------------
DROP TABLE "SAKILA_DWH"."DIM_ACTOR";
CREATE TABLE "SAKILA_DWH"."DIM_ACTOR" (
"ACTOR_KEY" NUMBER(11)  GENERATED ALWAYS AS IDENTITY NOT NULL ,
"ACTOR_LAST_UPDATE" DATE NOT NULL ,
"ACTOR_LAST_NAME" VARCHAR2(45) NOT NULL ,
"ACTOR_FIRST_NAME" VARCHAR2(45) NOT NULL ,
"ACTOR_ID" NUMERIC  NOT NULL ,
PRIMARY KEY ("ACTOR_KEY")
);

-- ----------------------------
-- Table structure for DIM_CUSTOMER
-- ----------------------------
DROP TABLE "SAKILA_DWH"."DIM_CUSTOMER";
CREATE TABLE "SAKILA_DWH"."DIM_CUSTOMER" (
"CUSTOMER_KEY" NUMBER(11)  GENERATED ALWAYS AS IDENTITY NOT NULL ,
"CUSTOMER_LAST_UPDATE" DATE DEFAULT TO_DATE ('1970-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS')  NOT NULL ,
"CUSTOMER_ID" NUMBER(11)  ,
"CUSTOMER_FIRST_NAME" VARCHAR2(45)  ,
"CUSTOMER_LAST_NAME" VARCHAR2(45)  ,
"CUSTOMER_EMAIL" VARCHAR2(50)  ,
"CUSTOMER_ACTIVE" CHAR(3)  ,
"CUSTOMER_CREATED" DATE  ,
"CUSTOMER_ADDRESS" VARCHAR2(64)  ,
"CUSTOMER_DISTRICT" VARCHAR2(20)  ,
"CUSTOMER_POSTAL_CODE" VARCHAR2(10)  ,
"CUSTOMER_PHONE_NUMBER" VARCHAR2(20)  ,
"CUSTOMER_CITY" VARCHAR2(50)  ,
"CUSTOMER_COUNTRY" VARCHAR2(50)  ,
"CUSTOMER_VERSION_NUMBER" NUMBER(6)  ,
"CUSTOMER_VALID_FROM" DATE  ,
"CUSTOMER_VALID_THROUGH" DATE  ,
PRIMARY KEY ("CUSTOMER_KEY")
);
-- ----------------------------
-- Indexes structure for table DIM_CUSTOMER
-- ----------------------------
CREATE  INDEX "SAKILA_DWH"."IDX_CUSTOMER_ID"  ON "SAKILA_DWH"."DIM_CUSTOMER" ("CUSTOMER_ID");


-- ----------------------------
-- Table structure for DIM_DATE
-- ----------------------------
DROP TABLE "SAKILA_DWH"."DIM_DATE";
CREATE TABLE "SAKILA_DWH"."DIM_DATE" (
"DATE_KEY" NUMBER(11) NOT NULL ,
"DATE_VALUE" DATE NOT NULL ,
"DATE_SHORT" CHAR(12) NOT NULL ,
"DATE_MEDIUM" CHAR(16) NOT NULL ,
"DATE_LONG" CHAR(24) NOT NULL ,
"DATE_FULL" CHAR(32) NOT NULL ,
"DAY_IN_YEAR" NUMBER(6) NOT NULL ,
"DAY_IN_MONTH" NUMBER(4) NOT NULL ,
"IS_FIRST_DAY_IN_MONTH" CHAR(10) NOT NULL ,
"IS_LAST_DAY_IN_MONTH" CHAR(10) NOT NULL ,
"DAY_ABBREVIATION" CHAR(3) NOT NULL ,
"DAY_NAME" CHAR(12) NOT NULL ,
"WEEK_IN_YEAR" NUMBER(4) NOT NULL ,
"WEEK_IN_MONTH" NUMBER(4) NOT NULL ,
"IS_FIRST_DAY_IN_WEEK" CHAR(10) NOT NULL ,
"IS_LAST_DAY_IN_WEEK" CHAR(10) NOT NULL ,
"MONTH_NUMBER" NUMBER(4) NOT NULL ,
"MONTH_ABBREVIATION" CHAR(3) NOT NULL ,
"MONTH_NAME" CHAR(12) NOT NULL ,
"YEAR2" CHAR(2) NOT NULL ,
"YEAR4" NUMBER(6) NOT NULL ,
"QUARTER_NAME" CHAR(2) NOT NULL ,
"QUARTER_NUMBER" NUMBER(4) NOT NULL ,
"YEAR_QUARTER" CHAR(7) NOT NULL ,
"YEAR_MONTH_NUMBER" CHAR(7) NOT NULL ,
"YEAR_MONTH_ABBREVIATION" CHAR(8) NOT NULL ,
PRIMARY KEY ("DATE_KEY")
);

-- ----------------------------
-- Indexes structure for table DIM_DATE
-- ----------------------------
CREATE  INDEX "SAKILA_DWH"."IDX_DATE_VALUE"  ON "SAKILA_DWH"."DIM_DATE" ("DATE_VALUE" );



-- ----------------------------
-- Table structure for DIM_FILM
-- ----------------------------
DROP TABLE "SAKILA_DWH"."DIM_FILM";
CREATE TABLE "SAKILA_DWH"."DIM_FILM" (
"FILM_KEY" NUMBER(11)  GENERATED ALWAYS AS IDENTITY NOT NULL ,
"FILM_LAST_UPDATE" DATE NOT NULL ,
"FILM_TITLE" VARCHAR2(64) NOT NULL ,
"FILM_DESCRIPTION" NCLOB NOT NULL ,
"FILM_RELEASE_YEAR" NUMBER(6) NOT NULL ,
"FILM_LANGUAGE" VARCHAR2(20) NOT NULL ,
"FILM_ORIGINAL_LANGUAGE" VARCHAR2(20) NOT NULL ,
"FILM_RENTAL_DURATION" NUMBER(4)  ,
"FILM_RENTAL_RATE" NUMBER  ,
"FILM_DURATION" NUMBER(11)  ,
"FILM_REPLACEMENT_COST" NUMBER  ,
"FILM_RATING_CODE" CHAR(5)  ,
"FILM_RATING_TEXT" VARCHAR2(30)  ,
"FILM_HAS_TRAILERS" CHAR(4)  ,
"FILM_HAS_COMMENTARIES" CHAR(4)  ,
"FILM_HAS_DELETED_SCENES" CHAR(4)  ,
"FILM_HAS_BEHIND_THE_SCENES" CHAR(4)  ,
"FILM_IN_CATEGORY_ACTION" CHAR(4)  ,
"FILM_IN_CATEGORY_ANIMATION" CHAR(4)  ,
"FILM_IN_CATEGORY_CHILDREN" CHAR(4)  ,
"FILM_IN_CATEGORY_CLASSICS" CHAR(4)  ,
"FILM_IN_CATEGORY_COMEDY" CHAR(4)  ,
"FILM_IN_CATEGORY_DOCUMENTARY" CHAR(4)  ,
"FILM_IN_CATEGORY_DRAMA" CHAR(4)  ,
"FILM_IN_CATEGORY_FAMILY" CHAR(4)  ,
"FILM_IN_CATEGORY_FOREIGN" CHAR(4)  ,
"FILM_IN_CATEGORY_GAMES" CHAR(4)  ,
"FILM_IN_CATEGORY_HORROR" CHAR(4)  ,
"FILM_IN_CATEGORY_MUSIC" CHAR(4)  ,
"FILM_IN_CATEGORY_NEW" CHAR(4)  ,
"FILM_IN_CATEGORY_SCIFI" CHAR(4)  ,
"FILM_IN_CATEGORY_SPORTS" CHAR(4)  ,
"FILM_IN_CATEGORY_TRAVEL" CHAR(4)  ,
"FILM_ID" NUMBER(11) NOT NULL ,
PRIMARY KEY ("FILM_KEY")
);

-- ----------------------------
-- Table structure for DIM_FILM_ACTOR_BRIDGE
-- ----------------------------
DROP TABLE "SAKILA_DWH"."DIM_FILM_ACTOR_BRIDGE";
CREATE TABLE "SAKILA_DWH"."DIM_FILM_ACTOR_BRIDGE" (
"FILM_KEY" NUMBER(11) NOT NULL ,
"ACTOR_KEY" NUMBER(11) NOT NULL ,
"ACTOR_WEIGHTING_FACTOR" NUMBER NOT NULL ,
PRIMARY KEY ("FILM_KEY", "ACTOR_KEY")
);

-- ----------------------------
-- Indexes structure for table DIM_FILM_ACTOR_BRIDGE
-- ----------------------------
CREATE INDEX "SAKILA_DWH"."IDX_ACTOR_KEY" ON "SAKILA_DWH"."DIM_FILM_ACTOR_BRIDGE" ("ACTOR_KEY" );



-- ----------------------------
-- Table structure for DIM_STAFF
-- ----------------------------
DROP TABLE "SAKILA_DWH"."DIM_STAFF";
CREATE TABLE "SAKILA_DWH"."DIM_STAFF" (
"STAFF_KEY" NUMBER(11)  GENERATED ALWAYS AS IDENTITY NOT NULL ,
"STAFF_LAST_UPDATE" DATE DEFAULT TO_DATE ('1970-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS')  NOT NULL ,
"STAFF_FIRST_NAME" VARCHAR2(45)  ,
"STAFF_LAST_NAME" VARCHAR2(45)  ,
"STAFF_ID" NUMBER(11)  ,
"STAFF_STORE_ID" NUMBER(11)  ,
"STAFF_VERSION_NUMBER" NUMBER(6)  ,
"STAFF_VALID_FROM" DATE  ,
"STAFF_VALID_THROUGH" DATE  ,
"STAFF_ACTIVE" CHAR(3)  ,
PRIMARY KEY ("STAFF_KEY")
);

-- ----------------------------
-- Indexes structure for table DIM_STAFF
-- ----------------------------
CREATE INDEX "SAKILA_DWH"."IDX_STAFF_ID" ON "SAKILA_DWH"."DIM_STAFF" ("STAFF_ID");



-- ----------------------------
-- Table structure for DIM_STORE
-- ----------------------------
DROP TABLE "SAKILA_DWH"."DIM_STORE";
CREATE TABLE "SAKILA_DWH"."DIM_STORE" (
"STORE_KEY" NUMBER(11)  GENERATED ALWAYS AS IDENTITY NOT NULL ,
"STORE_LAST_UPDATE" DATE DEFAULT TO_DATE ('1970-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS')  NOT NULL ,
"STORE_ID" NUMBER(11)  ,
"STORE_ADDRESS" VARCHAR2(64)  ,
"STORE_DISTRICT" VARCHAR2(20)  ,
"STORE_POSTAL_CODE" VARCHAR2(10)  ,
"STORE_PHONE_NUMBER" VARCHAR2(20)  ,
"STORE_CITY" VARCHAR2(50)  ,
"STORE_COUNTRY" VARCHAR2(50)  ,
"STORE_MANAGER_STAFF_ID" NUMBER(11)  ,
"STORE_MANAGER_FIRST_NAME" VARCHAR2(45)  ,
"STORE_MANAGER_LAST_NAME" VARCHAR2(45)  ,
"STORE_VERSION_NUMBER" NUMBER(6)  ,
"STORE_VALID_FROM" DATE  ,
"STORE_VALID_THROUGH" DATE  ,
PRIMARY KEY ("STORE_KEY")
);

-- ----------------------------
-- Indexes structure for table DIM_STORE
-- ----------------------------
CREATE INDEX "SAKILA_DWH"."IDX_STORE_ID" ON "SAKILA_DWH"."DIM_STORE" ("STORE_ID");

-- ----------------------------
-- Table structure for DIM_TIME
-- ----------------------------
DROP TABLE "SAKILA_DWH"."DIM_TIME";
CREATE TABLE "SAKILA_DWH"."DIM_TIME" (
"TIME_KEY" NUMBER(11) NOT NULL ,
"TIME_VALUE" VARCHAR2(255 BYTE) NOT NULL ,
"HOURS24" NUMBER(4) NOT NULL ,
"HOURS12" NUMBER(4)  ,
"MINUTES" NUMBER(4)  ,
"SECONDS" NUMBER(4)  ,
"AM_PM" CHAR(3)  ,
PRIMARY KEY ("TIME_KEY")
);
-- ----------------------------
-- Indexes structure for table DIM_TIME
-- ----------------------------
CREATE  INDEX "SAKILA_DWH"."IDX_TIME_VALUE"  ON "SAKILA_DWH"."DIM_TIME" ("TIME_VALUE");


-- ----------------------------
-- Table structure for FACT_RENTAL
-- ----------------------------
DROP TABLE "SAKILA_DWH"."FACT_RENTAL";
CREATE TABLE "SAKILA_DWH"."FACT_RENTAL" (
"CUSTOMER_KEY" NUMBER(11) NOT NULL ,
"STAFF_KEY" NUMBER(11) NOT NULL ,
"FILM_KEY" NUMBER(11) NOT NULL ,
"STORE_KEY" NUMBER(11) NOT NULL ,
"RENTAL_DATE_KEY" CHAR(8) NOT NULL ,
"RETURN_DATE_KEY" CHAR(10) NOT NULL ,
"RENTAL_TIME_KEY" CHAR(8) NOT NULL ,
"COUNT_RETURNS" NUMBER(11) NOT NULL ,
"COUNT_RENTALS" NUMBER(11) NOT NULL ,
"RENTAL_DURATION" NUMBER(11)  ,
"RENTAL_LAST_UPDATE" DATE  ,
"RENTAL_ID" NUMBER(11)  
);

-- ----------------------------
-- Indexes structure for table FACT_RENTAL
-- ----------------------------
CREATE  INDEX "SAKILA_DWH"."DIM_CUSTOMER_FACT_RENTAL_FK"
ON "SAKILA_DWH"."FACT_RENTAL" ("CUSTOMER_KEY" )
;
CREATE  INDEX "SAKILA_DWH"."DIM_DATE_FACT_RENTAL_FK"
ON "SAKILA_DWH"."FACT_RENTAL" ("RENTAL_DATE_KEY" )
;
CREATE  INDEX "SAKILA_DWH"."DIM_FILM_FACT_RENTAL_FK"
ON "SAKILA_DWH"."FACT_RENTAL" ("FILM_KEY" )
;
CREATE  INDEX "SAKILA_DWH"."DIM_STAFF_FACT_RENTAL_FK"
ON "SAKILA_DWH"."FACT_RENTAL" ("STAFF_KEY" )
;
CREATE  INDEX "SAKILA_DWH"."DIM_STORE_FACT_RENTAL_FK"
ON "SAKILA_DWH"."FACT_RENTAL" ("STORE_KEY" )
;
CREATE  INDEX "SAKILA_DWH"."DIM_TIME_FACT_RENTAL_FK"
ON "SAKILA_DWH"."FACT_RENTAL" ("RENTAL_TIME_KEY" )
;





