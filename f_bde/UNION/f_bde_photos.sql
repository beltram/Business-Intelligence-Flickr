DROP TABLE f_bde_photos;
CREATE TABLE f_bde_photos AS
(SELECT *
 FROM F_BDE_PASCAL_PHOTO
 UNION ALL
 SELECT *
 FROM F_BDE_MIR_PHOTO
 UNION ALL
  SELECT *
 FROM F_BDE_CLEF_PHOTO
);

DELETE FROM f_bde_photos
WHERE rowid not in
(SELECT MIN(rowid)
FROM f_bde_photos
GROUP BY photo_id);

Select * from f_bde_photos where rownum=1;
Select count(*) from f_bde_photos;

