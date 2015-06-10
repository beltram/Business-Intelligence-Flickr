CREATE TABLE f_dw_photos (
pk_id number(10),
nb_views number(6),
date_taken number(10),
date_uploaded number(10),
date_last_update number(10),
date_posted number(10),
fk_user number(10),
fk_location number(10),
fk_server number(10),
rank number(10),
percent_rank number(10)
);

CREATE UNIQUE INDEX f_dw_photos_idx ON f_dw_photos(pk_id);

ALTER TABLE f_dw_photos
ADD CONSTRAINT f_dw_photos_pk PRIMARY KEY (pk_id);

ALTER TABLE f_dw_photos 
ADD CONSTRAINT f_dw_photos_fkuser
FOREIGN KEY (fk_user) REFERENCES f_dw_user(id);

ALTER TABLE f_dw_photos 
ADD CONSTRAINT f_dw_photos_fklocation
FOREIGN KEY (fk_location) REFERENCES f_dw_location(id);

ALTER TABLE f_dw_photos 
ADD CONSTRAINT f_dw_photos_fkserver
FOREIGN KEY (fk_server) REFERENCES f_dw_server(id);

ALTER TABLE f_dw_photos 
ADD CONSTRAINT f_dw_photos_datetaken
FOREIGN KEY (date_taken) REFERENCES f_dw_date(id);

ALTER TABLE f_dw_photos 
ADD CONSTRAINT f_dw_photos_dateuploaded
FOREIGN KEY (date_uploaded) REFERENCES f_dw_date(id);

ALTER TABLE f_dw_photos 
ADD CONSTRAINT f_dw_photos_datelastupdate
FOREIGN KEY (date_last_update) REFERENCES f_dw_date(id);

ALTER TABLE f_dw_photos 
ADD CONSTRAINT f_dw_photos_datedateposted
FOREIGN KEY (date_posted) REFERENCES f_dw_date(id);
