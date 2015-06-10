CREATE TABLE f_dw_location (
id number(10),
pk_id varchar2(20),
latitude varchar2(10),
longitude varchar2(10),
location_place_id varchar2(20),
location_woeid number(8),

neighbourhood_place_id varchar2(20),
neighbourhood_woeid number(8),
neighbourhood_value varchar2(100),

locality_place_id varchar2(20),
locality_woeid number(8),
locality_value varchar2(100),

county_place_id varchar2(20),
county_woeid number(8),
county_value varchar2(100),

region_place_id varchar2(20),
region_woeid number(8),
region_value varchar2(100),

country_place_id varchar2(20),
country_woeid number(8),
country_value varchar2(100)
);

CREATE SEQUENCE location_id
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE UNIQUE INDEX f_dw_location_idx ON f_dw_location(id);

ALTER TABLE f_dw_location
ADD CONSTRAINT f_dw_location_pk PRIMARY KEY (id);
