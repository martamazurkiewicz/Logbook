CREATE TABLE  "COUNTRIES"
(
	"COUNTRY_ID" NUMBER(3) GENERATED BY DEFAULT ON NULL AS IDENTITY,
	"COUNTRY_NAME" VARCHAR2(50) NOT NULL UNIQUE
);
ALTER TABLE  "COUNTRIES" 
 ADD CONSTRAINT "PK_COUNTRIES"
	PRIMARY KEY ("COUNTRY_ID");

CREATE TABLE  "CITIES"
(
	"CITY_ID" NUMBER(4) GENERATED BY DEFAULT ON NULL AS IDENTITY,
	"CITY_NAME" VARCHAR2(50) NOT NULL UNIQUE
);
ALTER TABLE  "CITIES" 
 ADD CONSTRAINT "PK_CITIES"
	PRIMARY KEY ("CITY_ID");
    
CREATE TABLE  "TOKENS"
(
	"TOKEN_ID" NUMBER(4) GENERATED BY DEFAULT ON NULL AS IDENTITY,
	"TOKEN" VARCHAR2(32) NOT NULL,
	"CREATION_DATE" DATE NOT NULL,
	"EXPIRATION_DATE" DATE NOT NULL
);
ALTER TABLE  "TOKENS" 
 ADD CONSTRAINT "PK_TOKENS"
	PRIMARY KEY ("TOKEN_ID");

CREATE TABLE  "USERS"
(
	"USER_ID" NUMBER(4) GENERATED BY DEFAULT ON NULL AS IDENTITY,
	"USERNAME" VARCHAR2(40) NOT NULL UNIQUE,
	"EMAIL" VARCHAR2(50) NOT NULL UNIQUE,
	"NAME" VARCHAR2(25) NOT NULL,
	"SURNAME" VARCHAR2(40) NOT NULL,
	"SALT" VARCHAR2(32) NOT NULL,
	"HASH" VARCHAR2(32) NOT NULL,
	"COUNTRY_ID" NUMBER(3),
	"CITY_ID" NUMBER(4),
	"TOKEN_ID" NUMBER(4) NOT NULL
);
ALTER TABLE  "USERS" 
 ADD 
 (
    CONSTRAINT "PK_USERS" PRIMARY KEY ("USER_ID"), 
    CONSTRAINT "CITIES_FK" FOREIGN KEY ("CITY_ID") REFERENCES  "CITIES" ("CITY_ID"),
    CONSTRAINT "COUNTRIES_FK" FOREIGN KEY ("COUNTRY_ID") REFERENCES  "COUNTRIES" ("COUNTRY_ID"),
    CONSTRAINT "TOKENS_FK" FOREIGN KEY ("TOKEN_ID") REFERENCES  "TOKENS" ("TOKEN_ID")
);