ALTER TABLE f_bdt_labels DISABLE CONSTRAINT f_bdt_labels_fkphoto;
ALTER TABLE f_bdt_tags DISABLE CONSTRAINT f_bdt_tags_fkphoto;
ALTER TABLE f_bdt_pool DISABLE CONSTRAINT f_bdt_pool_fkphoto;
ALTER TABLE f_bdt_set DISABLE CONSTRAINT f_bdt_set_fkphoto;
ALTER TABLE f_bdt_galleries DISABLE CONSTRAINT f_bdt_galleries_fkphoto;

ALTER TABLE f_bdt_photos DISABLE CONSTRAINT f_bdt_photos_pk;
ALTER TABLE f_bdt_photos DISABLE CONSTRAINT f_bdt_photos_fkuser;
ALTER TABLE f_bdt_photos DISABLE CONSTRAINT f_bdt_photos_fklocation;
ALTER TABLE f_bdt_photos DISABLE CONSTRAINT f_bdt_photos_fkserver;
ALTER TABLE f_bdt_photos DISABLE CONSTRAINT f_bdt_photos_datetaken;
ALTER TABLE f_bdt_photos DISABLE CONSTRAINT f_bdt_photos_dateuploaded;
ALTER TABLE f_bdt_photos DISABLE CONSTRAINT f_bdt_photos_datelastupdate;
ALTER TABLE f_bdt_photos DISABLE CONSTRAINT f_bdt_photos_datedateposted;

ALTER TABLE f_bdt_date DISABLE CONSTRAINT f_bdt_date_pk;
ALTER TABLE f_bdt_galleries DISABLE CONSTRAINT f_bdt_galleries_pk;
ALTER TABLE f_bdt_labels DISABLE CONSTRAINT f_bdt_labels_pk;
ALTER TABLE f_bdt_location DISABLE CONSTRAINT f_bdt_location_pk;
ALTER TABLE f_bdt_pool DISABLE CONSTRAINT f_bdt_pool_pk;
ALTER TABLE f_bdt_server DISABLE CONSTRAINT f_bdt_server_pk;
ALTER TABLE f_bdt_set DISABLE CONSTRAINT f_bdt_set_pk;
ALTER TABLE f_bdt_tags DISABLE CONSTRAINT f_bdt_tags_pk;
ALTER TABLE f_bdt_user DISABLE CONSTRAINT f_bdt_user_pk;

DROP INDEX f_bdt_photos_idx;
DROP INDEX f_bdt_date_idx;
DROP INDEX f_bdt_galleries_idx;
DROP INDEX f_bdt_labels_idx;
DROP INDEX f_bdt_location_idx;
DROP INDEX f_bdt_pool_idx;
DROP INDEX f_bdt_server_idx;
DROP INDEX f_bdt_set_idx;
DROP INDEX f_bdt_tags_idx;
DROP INDEX f_bdt_user_idx;


PROMPT '************************************************************'
PROMPT 'Insertion dans f_bdt_date'
PROMPT '************************************************************'

INSERT INTO f_bdt_date (dat)
SELECT p.dates_lastupdate
FROM f_bde_photos p
UNION ALL
SELECT p.dates_posted
FROM f_bde_photos p
UNION ALL
SELECT p.dates_taken
FROM f_bde_photos p
UNION ALL
SELECT p.dateuploaded
FROM f_bde_photos p;

DELETE FROM f_bdt_date
WHERE ROWID NOT IN (SELECT MAX(ROWID) FROM f_bdt_date GROUP BY f_bdt_date.dat);

PROMPT '************************************************************'
PROMPT 'Insertion dans f_bdt_location'
PROMPT '************************************************************'

INSERT INTO f_bdt_location (pk_id,latitude,longitude,location_place_id,location_woeid,neighbourhood_place_id,neighbourhood_woeid,neighbourhood_value,locality_place_id,
locality_woeid,locality_value,county_place_id,county_woeid,county_value,region_place_id,region_woeid,region_value,country_place_id,country_woeid,country_value)
SELECT l.latitude || l.longitude,l.latitude,l.longitude,l.location_place_id,l.location_woeid,l.neighbourhood_place_id,l.neighbourhood_woeid,
l.neighbourhood_value,l.locality_place_id,l.locality_woeid,l.locality_value,l.county_place_id,l.county_woeid,l.county_value,l.region_place_id,
l.region_woeid,l.region_value,l.country_place_id,l.country_woeid,l.country_value
FROM f_bde_location l;

DELETE FROM f_bdt_location
WHERE ROWID NOT IN (SELECT MAX(ROWID) FROM f_bdt_location GROUP BY f_bdt_location.pk_id);


PROMPT '************************************************************'
PROMPT 'Insertion dans f_bdt_server'
PROMPT '************************************************************'

INSERT INTO f_bdt_server (pk_id,farm)
SELECT DISTINCT p.server,p.farm
FROM f_bde_photos p;


PROMPT '************************************************************'
PROMPT 'Insertion dans f_bdt_user'
PROMPT '************************************************************'

INSERT INTO f_bdt_user (pk_id,user_location,real_name,user_name)
SELECT DISTINCT p.owner_nsid,p.owner_location,p.owner_realname,p.owner_username
FROM f_bde_photos p;

DELETE FROM f_bdt_user
WHERE ROWID NOT IN (SELECT MAX(ROWID) FROM f_bdt_user GROUP BY f_bdt_user.pk_id);

PROMPT '************************************************************'
PROMPT 'Insertion dans f_bdt_photos'
PROMPT '************************************************************'

INSERT INTO f_bdt_photos (pk_id,nb_views,date_taken,date_uploaded,date_last_update,date_posted,fk_user,fk_location,fk_server)
SELECT DISTINCT p.photo_id,p.photo_views,p.dates_taken,p.dateuploaded,p.dates_lastupdate,p.dates_posted,p.owner_nsid,
l.latitude || l.longitude,p.server
FROM f_bde_photos p LEFT OUTER JOIN f_bde_location l on p.photo_id = l.photo_id;

PROMPT '************************************************************'
PROMPT 'Insertion dans f_bdt_galleries'
PROMPT '************************************************************'

INSERT INTO f_bdt_galleries (pk_id,fk_photo,count_comments,count_photos,count_videos,count_views,owner,title)
SELECT DISTINCT g.gallery_id,g.photo_id,g.count_comments,g.count_photos,g.count_videos,g.count_views,g.owner,g.title
FROM f_bde_galleries g;


PROMPT '************************************************************'
PROMPT 'Insertion dans f_bdt_labels'
PROMPT '************************************************************'

INSERT INTO f_bdt_labels (fk_photo,label_value)
SELECT DISTINCT l.photo_id,l.label_value
FROM f_bde_labels l;

PROMPT '************************************************************'
PROMPT 'Insertion dans f_bdt_tags'
PROMPT '************************************************************'

INSERT INTO f_bdt_tags (tag_id,fk_photo,author,tag_value)
SELECT t.tag_id,t.photo_id,t.author,t.tag_value
FROM f_bde_tags t;


PROMPT '************************************************************'
PROMPT 'Insertion dans f_bdt_pool'
PROMPT '************************************************************'

INSERT INTO f_bdt_pool (pk_id,fk_photo,title,url)
SELECT p.group_id,p.photo_id,p.group_title,p.group_url
FROM f_bde_pool p;

PROMPT '************************************************************'
PROMPT 'Insertion dans f_bdt_set'
PROMPT '************************************************************'

INSERT INTO f_bdt_set (pk_id,fk_photo,count_comments,count_photos,count_videos,count_views,title)
SELECT s.set_id,s.photo_id,s.set_comment_count,s.set_count_photo,s.set_count_video,s.set_view_count,s.set_title
FROM f_bde_set s;

DELETE FROM f_bdt_set
WHERE ROWID NOT IN (SELECT MAX(ROWID) FROM f_bdt_set s GROUP BY s.pk_id,s.fk_photo);

CREATE INDEX f_bdt_photos_idx ON f_bdt_photos(pk_id);
CREATE INDEX f_bdt_date_idx ON f_bdt_date(dat);
CREATE INDEX f_bdt_galleries_idx ON f_bdt_galleries(pk_id);
CREATE INDEX f_bdt_labels_idx ON f_bdt_labels(fk_photo);
CREATE INDEX f_bdt_location_idx ON f_bdt_location(pk_id);
CREATE INDEX f_bdt_pool_idx ON f_bdt_pool(pk_id);
CREATE INDEX f_bdt_server_idx ON f_bdt_server(pk_id);
CREATE INDEX f_bdt_set_idx ON f_bdt_set(pk_id);
CREATE INDEX f_bdt_tags_idx ON f_bdt_tags(tag_id);
CREATE INDEX f_bdt_user_idx ON f_bdt_user(pk_id);


ALTER TABLE f_bdt_date ENABLE CONSTRAINT f_bdt_date_pk EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_galleries ENABLE CONSTRAINT f_bdt_galleries_pk EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_labels ENABLE CONSTRAINT f_bdt_labels_pk EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_location ENABLE CONSTRAINT f_bdt_location_pk EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_pool ENABLE CONSTRAINT f_bdt_pool_pk EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_server ENABLE CONSTRAINT f_bdt_server_pk EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_set ENABLE CONSTRAINT f_bdt_set_pk EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_tags ENABLE CONSTRAINT f_bdt_tags_pk EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_user ENABLE CONSTRAINT f_bdt_user_pk EXCEPTIONS INTO EXCEPTIONS;


ALTER TABLE f_bdt_photos ENABLE CONSTRAINT f_bdt_photos_pk EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_photos ENABLE CONSTRAINT f_bdt_photos_fkuser EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_photos ENABLE CONSTRAINT f_bdt_photos_fklocation EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_photos ENABLE CONSTRAINT f_bdt_photos_fkserver EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_photos ENABLE CONSTRAINT f_bdt_photos_datetaken EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_photos ENABLE CONSTRAINT f_bdt_photos_dateuploaded EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_photos ENABLE CONSTRAINT f_bdt_photos_datelastupdate EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_photos ENABLE CONSTRAINT f_bdt_photos_datedateposted EXCEPTIONS INTO EXCEPTIONS;


ALTER TABLE f_bdt_galleries ENABLE CONSTRAINT f_bdt_galleries_fkphoto EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_labels ENABLE CONSTRAINT f_bdt_labels_fkphoto EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_tags ENABLE CONSTRAINT f_bdt_tags_fkphoto EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_pool ENABLE CONSTRAINT f_bdt_pool_fkphoto EXCEPTIONS INTO EXCEPTIONS;
ALTER TABLE f_bdt_set ENABLE CONSTRAINT f_bdt_set_fkphoto EXCEPTIONS INTO EXCEPTIONS;



PROMPT '************************************************************'
PROMPT 'Nombre de ligne deans la table d"exeptions'
PROMPT '************************************************************'
SELECT count(*) as nbExceptions FROM exceptions;

