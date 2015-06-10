CREATE TABLE f_bde_Clef_tags AS
(SELECT p.photo_id, t.author, t.tag_id, t.machine_tag, t.tag_raw, t.tag_value
 FROM f_bde_Clef_photo p,
    XMLTable('//tag' passing p.tagslist
    COLUMNS 
        author varchar2(255) path '@author',
        tag_id varchar2(255) path '@id',
        machine_tag varchar2(255) path '@machine_tag',
        tag_raw varchar2(255) path '@raw',
        tag_value varchar2(255) path '/'
      ) t
);

Select * from f_bde_Clef_tags where rownum=1;
Select count(*) from f_bde_Clef_tags;