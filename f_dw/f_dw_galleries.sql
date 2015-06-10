CREATE TABLE f_dw_galleries (
pk_id varchar2(25),
fk_photo number(10),
count_comments number(10),
count_photos number(10),
count_videos number(10),
count_views number(10),
owner varchar2(50),
title varchar2(150),
comment_rank number(10),
comment_percent_rank number(10),
photos_rank number(10),
photos_percent_rank number(10),
videos_rank number(10),
videos_percent_rank number(10),
views_rank number(10),
views_percent_rank number(10),
popularity number(10)
);

CREATE UNIQUE INDEX f_dw_galleries_idx ON f_dw_galleries(pk_id);

ALTER TABLE f_dw_galleries
ADD CONSTRAINT f_dw_galleries_pk PRIMARY KEY (pk_id,fk_photo);

ALTER TABLE f_dw_galleries 
ADD CONSTRAINT f_dw_galleries_fkphoto
FOREIGN KEY (fk_photo) REFERENCES f_dw_photos(pk_id);