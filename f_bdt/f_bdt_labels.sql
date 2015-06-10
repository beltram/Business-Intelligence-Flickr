CREATE OR REPLACE TYPE f_bdt_labels_type AS OBJECT (
fk_photo number(25),
label_value varchar2(50),
MEMBER FUNCTION getFkPhoto RETURN number,
MEMBER FUNCTION getLabelValue RETURN varchar
);
/
CREATE TABLE f_bdt_labels OF f_bdt_labels_type;

CREATE UNIQUE INDEX f_bdt_labels_idx ON f_bdt_labels(fk_photo);

ALTER TABLE f_bdt_labels
ADD CONSTRAINT f_bdt_labels_pk PRIMARY KEY (fk_photo,label_value);

ALTER TABLE f_bdt_labels 
ADD CONSTRAINT f_bdt_labels_fkphoto
FOREIGN KEY (fk_photo) REFERENCES f_bdt_photos(pk_id);