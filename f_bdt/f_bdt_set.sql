CREATE OR REPLACE TYPE f_bdt_set_type AS OBJECT (
pk_id varchar2(255),
fk_photo number(25),
count_comments number(10),
count_photos number(10),
count_videos number(10),
count_views number(10),
title varchar2(255),
MEMBER FUNCTION getId RETURN varchar,
MEMBER FUNCTION getFkPhoto RETURN number,
MEMBER FUNCTION getCountComments RETURN number,
MEMBER FUNCTION getCountPhotos RETURN number,
MEMBER FUNCTION getCountVideos RETURN number,
MEMBER FUNCTION getCountViews RETURN number,
MEMBER FUNCTION getTitle RETURN varchar
);
/
CREATE TABLE f_bdt_set OF f_bdt_set_type;

CREATE UNIQUE INDEX f_bdt_set_idx ON f_bdt_set(pk_id);

ALTER TABLE f_bdt_set
ADD CONSTRAINT f_bdt_set_pk PRIMARY KEY (pk_id);

ALTER TABLE f_bdt_set 
ADD CONSTRAINT f_bdt_set_fkphoto
FOREIGN KEY (fk_photo) REFERENCES f_bdt_photos(pk_id);