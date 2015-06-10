CREATE TABLE f_dw_date (
id number(20),
dat date,
dow varchar(15),
doy number(3),
woy number(2),
moy number(2),
annee number(4)
);

CREATE SEQUENCE date_id
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE UNIQUE INDEX f_dw_date_idx ON f_dw_date(id);

ALTER TABLE f_dw_date
ADD CONSTRAINT f_dw_date_pk PRIMARY KEY (id);
