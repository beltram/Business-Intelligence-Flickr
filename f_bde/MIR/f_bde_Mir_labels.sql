CREATE TABLE f_bde_Mir_labels AS
(SELECT p.photo_id, l.label_source, l.label_value
 FROM f_bde_Mir_photo p,
    XMLTable('//label' passing p.labelsList
    COLUMNS 
        label_source varchar2(255) path '@source',
        label_value varchar2(255) path '/'
      ) l
);

Select * from f_bde_Mir_labels where rownum=1;
Select count(*) from f_bde_Mir_labels;