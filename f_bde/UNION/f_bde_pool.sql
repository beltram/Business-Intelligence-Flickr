DROP TABLE f_bde_pool;
CREATE TABLE f_bde_pool AS
(SELECT *
 FROM F_BDE_PASCAL_GROUPS_POOL
 UNION ALL
 SELECT *
 FROM F_BDE_MIR_GROUPS_POOL
 UNION ALL
  SELECT *
 FROM F_BDE_CLEF_GROUPS_POOL
);

DELETE FROM f_bde_pool
WHERE rowid not in
(SELECT MIN(rowid)
FROM f_bde_pool
GROUP BY group_id);

Select * from f_bde_pool where rownum=1;
Select count(*) from f_bde_pool;

