CREATE OR REPLACE TYPE f_bdt_location_type AS OBJECT (
pk_id varchar2(255),
latitude varchar2(255),
longitude varchar2(255),
location_place_id varchar2(20),
location_woeid number(20),

neighbourhood_place_id varchar2(255),
neighbourhood_woeid number(20),
neighbourhood_value varchar2(255),

locality_place_id varchar2(255),
locality_woeid number(20),
locality_value varchar2(255),

county_place_id varchar2(255),
county_woeid number(20),
county_value varchar2(255),

region_place_id varchar2(255),
region_woeid number(20),
region_value varchar2(255),

country_place_id varchar2(255),
country_woeid number(20),
country_value varchar2(255),

MEMBER FUNCTION getId RETURN varchar,
MEMBER FUNCTION getLatitude RETURN varchar,
MEMBER FUNCTION getLongitude RETURN varchar,
MEMBER FUNCTION getLocationPlaceId RETURN varchar,
MEMBER FUNCTION getLocationWoeid RETURN number,
MEMBER FUNCTION getNeighbourhoodPlaceId RETURN varchar,
MEMBER FUNCTION getNeighbourhoodWoeid RETURN number,
MEMBER FUNCTION getNeighbourhoodValue RETURN varchar,
MEMBER FUNCTION getLocalityPlaceId RETURN varchar,
MEMBER FUNCTION getLocalityWoeid RETURN number,
MEMBER FUNCTION getLocalityValue RETURN varchar,
MEMBER FUNCTION getCountyPlaceId RETURN varchar,
MEMBER FUNCTION getCountyWoeid RETURN number,
MEMBER FUNCTION getCountyValue RETURN varchar,
MEMBER FUNCTION getRegionPlaceId RETURN varchar,
MEMBER FUNCTION getRegionWoeid RETURN number,
MEMBER FUNCTION getRegionValue RETURN varchar,
MEMBER FUNCTION getCountryPlaceId RETURN varchar,
MEMBER FUNCTION getCountryWoeid RETURN number,
MEMBER FUNCTION getCountryValue RETURN varchar
);
/
CREATE TABLE f_bdt_location OF f_bdt_location_type;

CREATE UNIQUE INDEX f_bdt_location_idx ON f_bdt_location(pk_id);

ALTER TABLE f_bdt_location
ADD CONSTRAINT f_bdt_location_pk PRIMARY KEY (pk_id);

