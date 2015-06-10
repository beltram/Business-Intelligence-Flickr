CREATE TABLE f_bde_Clef_location AS
(SELECT p.photo_id, loc.accuracy, loc.location_context, loc.latitude, loc.longitude, loc.location_place_id, loc.location_woeid,
loc.neighbourhood_place_id, loc.neighbourhood_woeid, loc.neighbourhood_value,
loc.locality_place_id, loc.locality_woeid, loc.locality_value,
loc.county_place_id, loc.county_woeid, loc.county_value,
loc.region_place_id, loc.region_woeid, loc.region_value,
loc.country_place_id, loc.country_woeid, loc.country_value
 FROM f_bde_Clef_photo p,
    XMLTable('//location' passing p.photo_location
    COLUMNS 
        accuracy varchar2(255) path '@accuracy',
        location_context varchar2(255) path '@context',
        latitude varchar2(255) path '@latitude',
        longitude varchar2(255) path '@longitude',
        location_place_id varchar2(255) path '@place_id',
        location_woeid varchar2(255) path '@woeid',
        
        neighbourhood_place_id varchar2(255) path 'neighbourhood/@place_id',
        neighbourhood_woeid varchar2(255) path 'neighbourhood/@woeid',
        neighbourhood_value varchar2(255) path 'neighbourhood',
        
        locality_place_id varchar2(255) path 'locality/@place_id',
        locality_woeid varchar2(255) path 'locality/@woeid',
        locality_value varchar2(255) path 'locality',
        
        county_place_id varchar2(255) path 'county/@place_id',
        county_woeid varchar2(255) path 'county/@woeid',
        county_value varchar2(255) path 'county',
        
        region_place_id varchar2(255) path 'region/@place_id',
        region_woeid varchar2(255) path 'region/@woeid',
        region_value varchar2(255) path 'region',
        
        country_place_id varchar2(255) path 'country/@place_id',
        country_woeid varchar2(255) path 'country/@woeid',
        country_value varchar2(255) path 'country'
      ) loc
);

Select * from f_bde_Clef_location where rownum=1;
Select count(*) from f_bde_Clef_location;