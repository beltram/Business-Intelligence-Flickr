CREATE TABLE f_dw_user (
id number(10),
pk_id varchar2(25),
user_location varchar2(50),
real_name varchar2(25),
user_name varchar2(25),
moy_tag number(10),
tag_rank number(10),
tag_percent_rank number(10)
);

CREATE SEQUENCE user_id
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE UNIQUE INDEX f_dw_user_idx ON f_dw_user(id);

ALTER TABLE f_dw_user
ADD CONSTRAINT f_dw_user_pk PRIMARY KEY (id);
