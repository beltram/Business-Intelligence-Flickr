CREATE TABLE f_dw_pool (
pk_id varchar2(15),
fk_photo number(10),
title varchar2(50),
url varchar2(150)
);

CREATE UNIQUE INDEX f_dw_pool_idx ON f_dw_pool(pk_id);

ALTER TABLE f_dw_pool
ADD CONSTRAINT f_dw_pool_pk PRIMARY KEY (pk_id);

ALTER TABLE f_dw_pool 
ADD CONSTRAINT f_dw_pool_fkphoto
FOREIGN KEY (fk_photo) REFERENCES f_dw_photos(pk_id);