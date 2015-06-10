CREATE TABLE f_dw_server (
id number(10),
pk_id number(10),
farm number(3)
);

CREATE SEQUENCE server_id
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE UNIQUE INDEX f_dw_server_idx ON f_dw_server(id);

ALTER TABLE f_dw_server
ADD CONSTRAINT f_dw_server_pk PRIMARY KEY (id);
