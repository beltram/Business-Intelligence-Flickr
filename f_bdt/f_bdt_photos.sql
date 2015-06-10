CREATE OR REPLACE TYPE f_bdt_photos_type AS OBJECT (
pk_id number(25),
nb_views number(10),
date_taken varchar2(255),
date_uploaded varchar2(255),
date_last_update varchar2(255),
date_posted varchar2(255),
fk_user varchar2(255),
fk_location varchar2(255),
fk_server number(10),
MEMBER FUNCTION getId RETURN number,
MEMBER FUNCTION getNbViews RETURN number,
MEMBER FUNCTION getDatTaken RETURN date,
MEMBER FUNCTION getDatUploaded RETURN date,
MEMBER FUNCTION getDatLastUpdate RETURN date,
MEMBER FUNCTION getDatePosted RETURN date,
MEMBER FUNCTION getUser RETURN varchar,
MEMBER FUNCTION getLocation RETURN varchar,
MEMBER FUNCTION getServer RETURN number
);
/
CREATE TABLE f_bdt_photos OF f_bdt_photos_type;

CREATE UNIQUE INDEX f_bdt_photos_idx ON f_bdt_photos(pk_id);

ALTER TABLE f_bdt_photos
ADD CONSTRAINT f_bdt_photos_pk PRIMARY KEY (pk_id);

ALTER TABLE f_bdt_photos 
ADD CONSTRAINT f_bdt_photos_fkuser
FOREIGN KEY (fk_user) REFERENCES f_bdt_user(pk_id);

ALTER TABLE f_bdt_photos 
ADD CONSTRAINT f_bdt_photos_fklocation
FOREIGN KEY (fk_location) REFERENCES f_bdt_location(pk_id);

ALTER TABLE f_bdt_photos 
ADD CONSTRAINT f_bdt_photos_fkserver
FOREIGN KEY (fk_server) REFERENCES f_bdt_server(pk_id);

ALTER TABLE f_bdt_photos 
ADD CONSTRAINT f_bdt_photos_datetaken
FOREIGN KEY (date_taken) REFERENCES f_bdt_date(dat);

ALTER TABLE f_bdt_photos 
ADD CONSTRAINT f_bdt_photos_dateuploaded
FOREIGN KEY (date_uploaded) REFERENCES f_bdt_date(dat);

ALTER TABLE f_bdt_photos 
ADD CONSTRAINT f_bdt_photos_datelastupdate
FOREIGN KEY (date_last_update) REFERENCES f_bdt_date(dat);

ALTER TABLE f_bdt_photos 
ADD CONSTRAINT f_bdt_photos_datedateposted
FOREIGN KEY (date_posted) REFERENCES f_bdt_date(dat);







