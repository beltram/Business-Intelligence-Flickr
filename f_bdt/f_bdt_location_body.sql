CREATE OR REPLACE TYPE BODY f_bdt_location_type 
IS
MEMBER FUNCTION getId RETURN varchar
IS
BEGIN
  RETURN SUBSTR(pk_id,0,20);
END;
MEMBER FUNCTION getLatitude RETURN varchar
IS
BEGIN
  RETURN SUBSTR(latitude,0,10);
END;
MEMBER FUNCTION getLongitude RETURN varchar
IS
BEGIN
  RETURN SUBSTR(longitude,0,10);
END;
MEMBER FUNCTION getLocationPlaceId RETURN varchar
IS
BEGIN
  RETURN SUBSTR(location_place_id,0,20);
END;
MEMBER FUNCTION getLocationWoeid RETURN number
IS
BEGIN
  RETURN TO_NUMBER(location_woeid);
END;
MEMBER FUNCTION getNeighbourhoodPlaceId RETURN varchar
IS
BEGIN
  RETURN SUBSTR(neighbourhood_place_id,0,20);
END;
MEMBER FUNCTION getNeighbourhoodWoeid RETURN number
IS
BEGIN
  RETURN TO_NUMBER(neighbourhood_woeid);
END;
MEMBER FUNCTION getNeighbourhoodValue RETURN varchar
IS
BEGIN
  RETURN SUBSTR(neighbourhood_value,0,100);
END;
MEMBER FUNCTION getLocalityPlaceId RETURN varchar
IS
BEGIN
  RETURN SUBSTR(locality_place_id,0,20);
END;
MEMBER FUNCTION getLocalityWoeid RETURN number
IS
BEGIN
  RETURN TO_NUMBER(locality_woeid);
END;
MEMBER FUNCTION getLocalityValue RETURN varchar
IS
BEGIN
  RETURN SUBSTR(locality_value,0,100);
END;
MEMBER FUNCTION getCountyPlaceId RETURN varchar
IS
BEGIN
  RETURN SUBSTR(county_place_id,0,20);
END;
MEMBER FUNCTION getCountyWoeid RETURN number
IS
BEGIN
  RETURN TO_NUMBER(county_woeid);
END;
MEMBER FUNCTION getCountyValue RETURN varchar
IS
BEGIN
  RETURN SUBSTR(county_value,0,100);
END;
MEMBER FUNCTION getRegionPlaceId RETURN varchar
IS
BEGIN
  RETURN SUBSTR(region_place_id,0,20);
END;
MEMBER FUNCTION getRegionWoeid RETURN number
IS
BEGIN
  RETURN TO_NUMBER(region_woeid);
END;
MEMBER FUNCTION getRegionValue RETURN varchar
IS
BEGIN
  RETURN SUBSTR(region_value,0,100);
END;
MEMBER FUNCTION getCountryPlaceId RETURN varchar
IS
BEGIN
  RETURN SUBSTR(country_place_id,0,20);
END;
MEMBER FUNCTION getCountryWoeid RETURN number
IS
BEGIN
  RETURN TO_NUMBER(country_woeid);
END;
MEMBER FUNCTION getCountryValue RETURN varchar
IS
BEGIN
  RETURN SUBSTR(country_value,0,100);
END;

END;










