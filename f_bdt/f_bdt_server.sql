CREATE OR REPLACE TYPE f_bdt_server_type AS OBJECT (
pk_id number(10),
farm number(3),
MEMBER FUNCTION getId RETURN number,
MEMBER FUNCTION getFarm RETURN number
);
/

CREATE TABLE f_bdt_server OF f_bdt_server_type;

CREATE UNIQUE INDEX f_bdt_server_idx ON f_bdt_server(pk_id);

ALTER TABLE f_bdt_server
ADD CONSTRAINT f_bdt_server_pk PRIMARY KEY (pk_id);