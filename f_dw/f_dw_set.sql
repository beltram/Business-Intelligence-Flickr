CREATE TABLE f_dw_set (
pk_id varchar2(15),
fk_photo number(10),
count_comments number(10),
count_photos number(10),
count_videos number(10),
count_views number(10),
title varchar2(100),
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

CREATE UNIQUE INDEX f_dw_set_idx ON f_dw_set(pk_id);

ALTER TABLE f_dw_set
ADD CONSTRAINT f_dw_set_pk PRIMARY KEY (pk_id,fk_photo);

ALTER TABLE f_dw_set 
ADD CONSTRAINT f_dw_set_fkphoto
FOREIGN KEY (fk_photo) REFERENCES f_dw_photos(pk_id);