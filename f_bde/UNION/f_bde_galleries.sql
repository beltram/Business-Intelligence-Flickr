DROP TABLE f_bde_galleries;
CREATE TABLE f_bde_galleries AS
(SELECT *
 FROM F_BDE_PASCAL_GALLERIES
 UNION ALL
 SELECT *
 FROM F_BDE_MIR_GALLERIES
 UNION ALL
  SELECT *
 FROM F_BDE_CLEF_GALLERIES
);

Select * from f_bde_galleries where rownum=1;
Select count(*) from f_bde_galleries;

