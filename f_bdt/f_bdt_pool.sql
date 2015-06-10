CREATE OR REPLACE TYPE f_bdt_pool_type AS OBJECT (
pk_id varchar2(255),
fk_photo number(25),
title varchar2(255),
url varchar2(255),
MEMBER FUNCTION getId RETURN varchar,
MEMBER FUNCTION getFkPhoto RETURN number,
MEMBER FUNCTION getTitle RETURN varchar,
MEMBER FUNCTION getUrl RETURN varchar
);
/
CREATE TABLE f_bdt_pool OF f_bdt_pool_type;

CREATE UNIQUE INDEX f_bdt_pool_idx ON f_bdt_pool(pk_id);

ALTER TABLE f_bdt_pool
ADD CONSTRAINT f_bdt_pool_pk PRIMARY KEY (pk_id);

ALTER TABLE f_bdt_pool 
ADD CONSTRAINT f_bdt_pool_fkphoto
FOREIGN KEY (fk_photo) REFERENCES f_bdt_photos(pk_id);