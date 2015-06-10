DROP TABLE f_bde_tags;
CREATE TABLE f_bde_tags AS
(SELECT *
 FROM F_BDE_PASCAL_TAGS
 UNION ALL
 SELECT *
 FROM F_BDE_MIR_TAGS
 UNION ALL
  SELECT *
 FROM F_BDE_CLEF_TAGS
);

DELETE FROM f_bde_tags
WHERE rowid not in
(SELECT MIN(rowid)
FROM f_bde_tags
GROUP BY tag_id);

Select * from f_bde_tags where rownum=1;
Select count(*) from f_bde_tags;

