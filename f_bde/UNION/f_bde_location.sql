DROP TABLE f_bde_location;
CREATE TABLE f_bde_location AS
(SELECT *
 FROM F_BDE_PASCAL_LOCATION
 UNION ALL
 SELECT *
 FROM F_BDE_MIR_LOCATION
 UNION ALL
  SELECT *
 FROM F_BDE_CLEF_LOCATION
);

Select * from f_bde_location where rownum=1;
Select count(*) from f_bde_location;

