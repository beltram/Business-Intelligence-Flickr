CREATE TABLE f_dw_labels (
fk_photo number(10),
label_value varchar2(50)
);

CREATE UNIQUE INDEX f_dw_labels_idx ON f_dw_labels(fk_photo);

ALTER TABLE f_dw_labels
ADD CONSTRAINT f_dw_labels_pk PRIMARY KEY (fk_photo,label_value);

ALTER TABLE f_dw_labels 
ADD CONSTRAINT f_dw_labels_fkphoto
FOREIGN KEY (fk_photo) REFERENCES f_dw_photos(pk_id);