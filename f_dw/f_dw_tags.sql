CREATE TABLE f_dw_tags (
pk_id varchar2(30),
fk_photo number(10),
author varchar2(25),
tag_value varchar2(100)
);

CREATE UNIQUE INDEX f_dw_tags_idx ON f_dw_tags(pk_id);

ALTER TABLE f_dw_tags
ADD CONSTRAINT f_dw_tags_pk PRIMARY KEY (pk_id);

ALTER TABLE f_dw_tags 
ADD CONSTRAINT f_dw_tags_fkphoto
FOREIGN KEY (fk_photo) REFERENCES f_dw_photos(pk_id);