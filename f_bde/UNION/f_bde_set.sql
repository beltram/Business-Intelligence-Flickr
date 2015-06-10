DROP TABLE f_bde_set;
CREATE TABLE f_bde_set AS
(SELECT *
 FROM F_BDE_PASCAL_GROUPS_SET
 UNION ALL
 SELECT *
 FROM F_BDE_MIR_GROUPS_SET
 UNION ALL
  SELECT *
 FROM F_BDE_CLEF_GROUPS_SET
);

DELETE FROM f_bde_set
WHERE rowid not in
(SELECT MIN(rowid)
FROM f_bde_set
GROUP BY set_id);

Select * from f_bde_set where rownum=1;
Select count(*) from f_bde_set;

