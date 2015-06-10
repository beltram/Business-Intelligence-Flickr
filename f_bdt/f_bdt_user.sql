CREATE OR REPLACE TYPE f_bdt_user_type AS OBJECT (
pk_id varchar2(255),
user_location varchar2(255),
real_name varchar2(255),
user_name varchar2(255),
MEMBER FUNCTION getId RETURN varchar,
MEMBER FUNCTION getUserLocation RETURN varchar,
MEMBER FUNCTION getRealName RETURN varchar,
MEMBER FUNCTION getUserName RETURN varchar
);
/
CREATE TABLE f_bdt_user OF f_bdt_user_type;

CREATE UNIQUE INDEX f_bdt_user_idx ON f_bdt_user(pk_id);

ALTER TABLE f_bdt_user
ADD CONSTRAINT f_bdt_user_pk PRIMARY KEY (pk_id);