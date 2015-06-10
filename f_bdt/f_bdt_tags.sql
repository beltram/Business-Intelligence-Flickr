CREATE OR REPLACE TYPE f_bdt_tags_type AS OBJECT (
tag_id varchar2(50),
fk_photo number(25),
author varchar2(15),
tag_value varchar2(255),
MEMBER FUNCTION getId RETURN varchar,
MEMBER FUNCTION getFkPhoto RETURN number,
MEMBER FUNCTION getAuthor RETURN varchar,
MEMBER FUNCTION getTagValue RETURN varchar
);
/
CREATE TABLE f_bdt_tags OF f_bdt_tags_type;

CREATE UNIQUE INDEX f_bdt_tags_idx ON f_bdt_tags(tag_id);

ALTER TABLE f_bdt_tags
ADD CONSTRAINT f_bdt_tags_pk PRIMARY KEY (tag_id);

ALTER TABLE f_bdt_tags 
ADD CONSTRAINT f_bdt_tags_fkphoto
FOREIGN KEY (fk_photo) REFERENCES f_bdt_photos(pk_id);
