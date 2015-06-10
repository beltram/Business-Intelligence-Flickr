CREATE OR REPLACE TYPE f_bdt_date_type AS OBJECT (
dat varchar2(255),
MEMBER FUNCTION getDat RETURN date,
MEMBER FUNCTION getHod RETURN number,
MEMBER FUNCTION getMod RETURN number,
MEMBER FUNCTION getDow RETURN varchar,
MEMBER FUNCTION getDoy RETURN number,
MEMBER FUNCTION getWoy RETURN number,
MEMBER FUNCTION getMoy RETURN number,
MEMBER FUNCTION getYear RETURN number
);
/
CREATE TABLE f_bdt_date OF f_bdt_date_type;

CREATE UNIQUE INDEX f_bdt_date_idx ON f_bdt_date(dat);

ALTER TABLE f_bdt_date
ADD CONSTRAINT f_bdt_date_pk PRIMARY KEY (dat);
