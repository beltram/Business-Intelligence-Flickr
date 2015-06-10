
ALTER TABLE f_dw_galleries DISABLE CONSTRAINT f_dw_galleries_pk;
ALTER TABLE f_dw_galleries DISABLE CONSTRAINT f_dw_galleries_fkphoto;
ALTER TABLE f_dw_tags DISABLE CONSTRAINT f_dw_tags_pk;
ALTER TABLE f_dw_tags DISABLE CONSTRAINT f_dw_tags_fkphoto;
ALTER TABLE f_dw_labels DISABLE CONSTRAINT f_dw_labels_pk;
ALTER TABLE f_dw_labels DISABLE CONSTRAINT f_dw_labels_fkphoto;
ALTER TABLE f_dw_pool DISABLE CONSTRAINT f_dw_pool_pk;
ALTER TABLE f_dw_pool DISABLE CONSTRAINT f_dw_pool_fkphoto;
ALTER TABLE f_dw_set DISABLE CONSTRAINT f_dw_set_pk;
ALTER TABLE f_dw_set DISABLE CONSTRAINT f_dw_set_fkphoto;


ALTER TABLE f_dw_photos DISABLE CONSTRAINT f_dw_photos_pk;
ALTER TABLE f_dw_photos DISABLE CONSTRAINT f_dw_photos_fkuser;
ALTER TABLE f_dw_photos DISABLE CONSTRAINT f_dw_photos_fklocation;
ALTER TABLE f_dw_photos DISABLE CONSTRAINT f_dw_photos_fkserver;
ALTER TABLE f_dw_photos DISABLE CONSTRAINT f_dw_photos_datetaken;
ALTER TABLE f_dw_photos DISABLE CONSTRAINT f_dw_photos_dateuploaded;
ALTER TABLE f_dw_photos DISABLE CONSTRAINT f_dw_photos_datelastupdate;
ALTER TABLE f_dw_photos DISABLE CONSTRAINT f_dw_photos_datedateposted;

ALTER TABLE f_dw_date DISABLE CONSTRAINT f_dw_date_pk;
ALTER TABLE f_dw_user DISABLE CONSTRAINT f_dw_user_pk;
ALTER TABLE f_dw_server DISABLE CONSTRAINT f_dw_server_pk;
ALTER TABLE f_dw_location DISABLE CONSTRAINT f_dw_location_pk;

DROP INDEX f_dw_date_idx;

DROP INDEX f_dw_user_idx;
DROP INDEX f_dw_server_idx;
DROP INDEX f_dw_location_idx;

DROP INDEX f_dw_photos_idx;

DROP INDEX f_dw_galleries_idx;
DROP INDEX f_dw_tags_idx;
DROP INDEX f_dw_labels_idx;
DROP INDEX f_dw_pool_idx;
DROP INDEX f_dw_set_idx;


PROMPT '************************************************************'
PROMPT 'Insertion dans f_dw_date'
PROMPT '************************************************************'
INSERT INTO f_dw_date (id,dat,dow,doy,woy,moy,annee)
SELECT date_id.NEXTVAL,t.getDat(),t.getDow(),t.getDoy(),t.getWoy(),t.getMoy(),t.getYear()
FROM f_bdt_date t;

DELETE FROM f_dw_date
WHERE ROWID NOT IN (SELECT MAX(ROWID) FROM f_dw_date d GROUP BY d.dat);

@f_dw/AGGREG/f_aggregation.sql

DELETE FROM f_dw_date d WHERE d.id IN (select fd.id from f_invalid_dates fd);

@f_dw/f_dw_user_moytag.sql
@f_dw/f_dw_user_tag_rank.sql
@f_dw/f_dw_user_tag_percent_rank.sql

PROMPT '************************************************************'
PROMPT 'Insertion dans f_dw_user'
PROMPT '************************************************************'
INSERT INTO f_dw_user (id,pk_id,user_location,real_name,user_name,moy_tag,tag_rank,tag_percent_rank)
SELECT user_id.NEXTVAL,u.getId(),u.getUserLocation(),u.getRealName(),u.getUserName(),f_dw_user_moytag.moy,f_dw_user_tag_rank.rank,f_dw_user_tag_percent_rank.per
FROM f_bdt_user u
LEFT JOIN f_dw_user_moytag ON u.pk_id = f_dw_user_moytag.pk_id
LEFT JOIN f_dw_user_tag_rank ON u.pk_id = f_dw_user_tag_rank.pk_id
LEFT JOIN f_dw_user_tag_percent_rank ON u.pk_id = f_dw_user_tag_percent_rank.pk;

PROMPT '************************************************************'
PROMPT 'Insertion dans f_dw_server'
PROMPT '************************************************************'
INSERT INTO f_dw_server (id,pk_id,farm)
SELECT server_id.NEXTVAL,s.getId(),s.getFarm()
FROM f_bdt_server s;

PROMPT '************************************************************'
PROMPT 'Insertion dans f_dw_location'
PROMPT '************************************************************'
INSERT INTO f_dw_location (id,pk_id,latitude,longitude,location_place_id,location_woeid,neighbourhood_place_id,neighbourhood_woeid,neighbourhood_value,locality_place_id,
locality_woeid,locality_value,county_place_id,county_woeid,county_value,region_place_id,region_woeid,region_value,country_place_id,country_woeid,country_value)
SELECT location_id.NEXTVAL,l.getId(),l.getLatitude(),l.getLongitude(),l.getLocationPlaceId(),l.getLocationWoeid(),l.getNeighbourhoodPlaceId(),l.getNeighbourhoodWoeid(),
l.getNeighbourhoodValue(),l.getLocalityPlaceId(),l.getLocalityWoeid(),l.getLocalityValue(),l.getCountyPlaceId(),l.getCountyWoeid(),l.getCountyValue(),
l.getRegionPlaceId(),l.getRegionWoeid(),l.getRegionValue(),l.getCountryPlaceId(),l.getCountryWoeid(),l.getCountryValue()
FROM f_bdt_location l;


@f_dw/f_trash.sql

@f_dw/f_dw_photos_rank.sql
@f_dw/f_dw_photos_percent_rank.sql

PROMPT '************************************************************'
PROMPT 'Insertion dans f_dw_photos'
PROMPT '************************************************************'
INSERT INTO f_dw_photos (pk_id,nb_views,date_taken,date_uploaded,date_last_update,date_posted,fk_user,fk_location,fk_server,rank,percent_rank)
SELECT p.getId(),p.getNbViews(),f_datetaken.r,f_dateuploaded.r,f_datelastupdate.r,f_dateposted.r,f_user.r,f_location.r,
f_server.r,f_dw_photos_rank.rank,f_dw_photos_percent_rank.per
FROM f_bdt_photos p 
LEFT JOIN f_datetaken ON p.pk_id = f_datetaken.pk
LEFT JOIN f_dateuploaded ON p.pk_id = f_dateuploaded.pk
LEFT JOIN f_datelastupdate ON p.pk_id = f_datelastupdate.pk
LEFT JOIN f_dateposted ON p.pk_id = f_dateposted.pk
LEFT JOIN f_user ON p.pk_id = f_user.pk
LEFT JOIN f_location ON p.pk_id = f_location.pk
LEFT JOIN f_server ON p.pk_id = f_server.pk
LEFT JOIN f_dw_photos_rank ON p.pk_id = f_dw_photos_rank.pk_id
LEFT JOIN f_dw_photos_percent_rank ON p.pk_id = f_dw_photos_percent_rank.pk;



drop table f_datetaken;drop table f_dateuploaded;drop table f_datelastupdate;drop table f_dateposted;drop table f_user;drop table f_location;drop table f_server;


@f_dw/f_dw_galleries_comment_rank.sql
@f_dw/f_dw_galleries_comment_percent_rank.sql
@f_dw/f_dw_galleries_photos_rank.sql
@f_dw/f_dw_galleries_photos_percent_rank.sql
@f_dw/f_dw_galleries_videos_rank.sql
@f_dw/f_dw_galleries_videos_percent_rank.sql
@f_dw/f_dw_galleries_views_rank.sql
@f_dw/f_dw_galleries_views_percent_rank.sql

PROMPT '************************************************************'
PROMPT 'Insertion dans f_dw_galleries'
PROMPT '************************************************************'
INSERT INTO f_dw_galleries (pk_id,fk_photo,count_comments,count_photos,count_videos,count_views,owner,title,
comment_rank,comment_percent_rank,photos_rank,photos_percent_rank,videos_rank,videos_percent_rank,views_rank,views_percent_rank)
SELECT g.getId(),g.getFkPhoto(),g.getCountComments(),g.getCountPhotos(),g.getCountVideos(),g.getCountViews(),g.getOwner(),g.getTitle(),
f_dw_galleries_comment_rank.rank,f_dw_gall_comment_percent_rank.per,f_dw_galleries_photo_rank.rank,f_dw_gall_photos_percent_rank.per,
f_dw_galleries_videos_rank.rank,f_dw_gall_videos_percent_rank.per,f_dw_galleries_views_rank.rank,f_dw_gall_views_percent_rank.per
FROM f_bdt_galleries g
INNER JOIN f_dw_galleries_comment_rank ON g.pk_id = f_dw_galleries_comment_rank.pk_id
INNER JOIN f_dw_gall_comment_percent_rank ON g.pk_id = f_dw_gall_comment_percent_rank.pk

INNER JOIN f_dw_galleries_photo_rank ON g.pk_id = f_dw_galleries_photo_rank.pk_id
INNER JOIN f_dw_gall_photos_percent_rank ON g.pk_id = f_dw_gall_photos_percent_rank.pk

LEFT JOIN f_dw_galleries_videos_rank ON g.pk_id = f_dw_galleries_videos_rank.pk_id
LEFT JOIN f_dw_gall_videos_percent_rank ON g.pk_id = f_dw_gall_videos_percent_rank.pk

LEFT JOIN f_dw_galleries_views_rank ON g.pk_id = f_dw_galleries_views_rank.pk_id
LEFT JOIN f_dw_gall_views_percent_rank ON g.pk_id = f_dw_gall_views_percent_rank.pk
;

UPDATE f_dw_galleries f1
  SET popularity = (select ROUND((comment_percent_rank+photos_percent_rank+videos_percent_rank+views_percent_rank)/4)
  from f_dw_galleries f2 WHERE f1.pk_id = f2.pk_id AND f1.fk_photo = f2.fk_photo);

PROMPT '************************************************************'
PROMPT 'Insertion dans f_dw_tags'
PROMPT '************************************************************'
INSERT INTO f_dw_tags (pk_id,fk_photo,author,tag_value)
SELECT t.getId(),t.getFkPhoto(),t.getAuthor(),t.getTagValue()
FROM f_bdt_tags t;

PROMPT '************************************************************'
PROMPT 'Insertion dans f_dw_labels'
PROMPT '************************************************************'
INSERT INTO f_dw_labels (fk_photo,label_value)
SELECT l.getFkPhoto(),l.getLabelValue()
FROM f_bdt_labels l;

PROMPT '************************************************************'
PROMPT 'Insertion dans f_dw_pool'
PROMPT '************************************************************'
INSERT INTO f_dw_pool (pk_id,fk_photo,title,url)
SELECT p.getId(),p.getFkPhoto(),p.getTitle(),p.getUrl()
FROM f_bdt_pool p;

@f_dw/f_dw_set_comment_rank.sql
@f_dw/f_dw_set_comment_percent_rank.sql
@f_dw/f_dw_set_photos_rank.sql
@f_dw/f_dw_set_photos_percent_rank.sql
@f_dw/f_dw_set_videos_rank.sql
@f_dw/f_dw_set_videos_percent_rank.sql
@f_dw/f_dw_set_views_rank.sql
@f_dw/f_dw_set_views_percent_rank.sql



PROMPT '************************************************************'
PROMPT 'Insertion dans f_dw_set'
PROMPT '************************************************************'
INSERT INTO f_dw_set (pk_id,fk_photo,count_comments,count_photos,count_videos,count_views,title,
comment_rank,comment_percent_rank,photos_rank,photos_percent_rank,videos_rank,videos_percent_rank,views_rank,views_percent_rank)
SELECT s.getId(),s.getFkPhoto(),s.getCountComments(),s.getCountPhotos(),s.getCountVideos(),s.getCountViews(),s.getTitle(),
f_dw_set_comment_rank.rank,f_dw_set_comment_percent_rank.per,f_dw_set_photo_rank.rank,f_dw_set_photos_percent_rank.per,
f_dw_set_videos_rank.rank,f_dw_set_videos_percent_rank.per,f_dw_set_views_rank.rank,f_dw_set_views_percent_rank.per
FROM f_bdt_set s
INNER JOIN f_dw_set_comment_rank ON s.pk_id = f_dw_set_comment_rank.pk_id
INNER JOIN f_dw_set_comment_percent_rank ON s.pk_id = f_dw_set_comment_percent_rank.pk

INNER JOIN f_dw_set_photo_rank ON s.pk_id = f_dw_set_photo_rank.pk_id
INNER JOIN f_dw_set_photos_percent_rank ON s.pk_id = f_dw_set_photos_percent_rank.pk

LEFT JOIN f_dw_set_videos_rank ON s.pk_id = f_dw_set_videos_rank.pk_id
LEFT JOIN f_dw_set_videos_percent_rank ON s.pk_id = f_dw_set_videos_percent_rank.pk

LEFT JOIN f_dw_set_views_rank ON s.pk_id = f_dw_set_views_rank.pk_id
LEFT JOIN f_dw_set_views_percent_rank ON s.pk_id = f_dw_set_views_percent_rank.pk;

DELETE FROM f_dw_set
WHERE ROWID NOT IN (SELECT MAX(ROWID) FROM f_dw_set s GROUP BY s.pk_id,s.fk_photo);

UPDATE f_dw_set s1
  SET popularity = (select ROUND((comment_percent_rank+photos_percent_rank+videos_percent_rank+views_percent_rank)/4)
  from f_dw_set s2 WHERE s1.pk_id = s2.pk_id AND s1.fk_photo = s2.fk_photo);

CREATE INDEX f_dw_date_idx ON f_dw_date(dat);
CREATE INDEX f_dw_user_idx ON f_dw_user(pk_id);
CREATE INDEX f_dw_server_idx ON f_dw_server(pk_id);
CREATE INDEX f_dw_location_idx ON f_dw_location(pk_id);
CREATE INDEX f_dw_photos_idx ON f_dw_photos(pk_id);


CREATE INDEX f_dw_galleries_idx ON f_dw_galleries(pk_id);
CREATE INDEX f_dw_tags_idx ON f_dw_tags(pk_id);
CREATE INDEX f_dw_labels_idx ON f_dw_labels(fk_photo);
CREATE INDEX f_dw_pool_idx ON f_dw_pool(pk_id);
CREATE INDEX f_dw_set_idx ON f_dw_set(pk_id);


ALTER TABLE f_dw_date ENABLE CONSTRAINT f_dw_date_pk EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_user ENABLE CONSTRAINT f_dw_user_pk EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_server ENABLE CONSTRAINT f_dw_server_pk EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_location ENABLE CONSTRAINT f_dw_location_pk EXCEPTIONS INTO exceptions;


ALTER TABLE f_dw_photos ENABLE CONSTRAINT f_dw_photos_pk EXCEPTIONS INTO exceptions;

ALTER TABLE f_dw_photos ENABLE CONSTRAINT f_dw_photos_fkuser EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_photos ENABLE CONSTRAINT f_dw_photos_fklocation EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_photos ENABLE CONSTRAINT f_dw_photos_fkserver EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_photos ENABLE CONSTRAINT f_dw_photos_datetaken EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_photos ENABLE CONSTRAINT f_dw_photos_dateuploaded EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_photos ENABLE CONSTRAINT f_dw_photos_datelastupdate EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_photos ENABLE CONSTRAINT f_dw_photos_datedateposted EXCEPTIONS INTO exceptions;


ALTER TABLE f_dw_galleries ENABLE CONSTRAINT f_dw_galleries_pk EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_galleries ENABLE CONSTRAINT f_dw_galleries_fkphoto EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_tags ENABLE CONSTRAINT f_dw_tags_pk EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_tags ENABLE CONSTRAINT f_dw_tags_fkphoto EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_labels ENABLE CONSTRAINT f_dw_labels_pk EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_labels ENABLE CONSTRAINT f_dw_labels_fkphoto EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_pool ENABLE CONSTRAINT f_dw_pool_pk EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_pool ENABLE CONSTRAINT f_dw_pool_fkphoto EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_set ENABLE CONSTRAINT f_dw_set_pk EXCEPTIONS INTO exceptions;
ALTER TABLE f_dw_set ENABLE CONSTRAINT f_dw_set_fkphoto EXCEPTIONS INTO exceptions;


PROMPT '************************************************************'
PROMPT 'Nombre de ligne dans la table d"exeptions expected : 0'
PROMPT '************************************************************'
SELECT count(*) FROM exceptions;

PROMPT '************************************************************'
PROMPT 'Nombre de ligne dans la table photos expected : 24647'
PROMPT '************************************************************'
SELECT count(*) FROM f_dw_photos;

PROMPT '************************************************************'
PROMPT 'Nombre de ligne dans la table date expected : 67805'
PROMPT '************************************************************'
SELECT count(*) FROM f_dw_date;

PROMPT '************************************************************'
PROMPT 'Nombre de ligne dans la table galleries expected : 4045'
PROMPT '************************************************************'
SELECT count(*) FROM f_dw_galleries;

PROMPT '************************************************************'
PROMPT 'Nombre de ligne dans la table labels expected : 86992'
PROMPT '************************************************************'
SELECT count(*) FROM f_dw_labels;

PROMPT '************************************************************'
PROMPT 'Nombre de ligne dans la table location expected : 4964'
PROMPT '************************************************************'
SELECT count(*) FROM f_dw_location;

PROMPT '************************************************************'
PROMPT 'Nombre de ligne dans la table pool expected : 25481'
PROMPT '************************************************************'
SELECT count(*) FROM f_dw_pool;

PROMPT '************************************************************'
PROMPT 'Nombre de ligne dans la table server expected : 1411'
PROMPT '************************************************************'
SELECT count(*) FROM f_dw_server;

PROMPT '************************************************************'
PROMPT 'Nombre de ligne dans la table set expected : 23846'
PROMPT '************************************************************'
SELECT count(*) FROM f_dw_set;

PROMPT '************************************************************'
PROMPT 'Nombre de ligne dans la table tags expected : 221054'
PROMPT '************************************************************'
SELECT count(*) FROM f_dw_tags;

PROMPT '************************************************************'
PROMPT 'Nombre de ligne dans la table user expected : 14075'
PROMPT '************************************************************'
SELECT count(*) FROM f_dw_user;



