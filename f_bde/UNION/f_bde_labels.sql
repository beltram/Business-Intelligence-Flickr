DROP TABLE f_bde_labels;
CREATE TABLE f_bde_labels AS
(SELECT *
 FROM F_BDE_PASCAL_LABELS
 UNION ALL
 SELECT *
 FROM F_BDE_MIR_LABELS
 UNION ALL
  SELECT *
 FROM F_BDE_CLEF_LABELS
);

Select * from f_bde_labels where rownum=1;
Select count(*) from f_bde_labels;

