CREATE TABLE f_bde_Clef_groups_pool AS
(SELECT p.photo_id, g.group_id, g.group_title, g.group_url
 FROM f_bde_Clef_photo p,
    XMLTable('//pool' passing p.groupsList
    COLUMNS 
        group_id varchar2(255) path '@id',
        group_title varchar2(255) path '@title',
        group_url varchar2(255) path '@url'
      ) g
);

Select * from f_bde_Clef_groups_pool where rownum=1;
Select count(*) from f_bde_Clef_groups_pool;

CREATE TABLE f_bde_Clef_groups_set PARALLEL COMPRESS AS
(SELECT p.photo_id,
s.set_comment_count,s.set_count_photo,s.set_count_video,s.set_farm,s.set_id,s.set_primary,s.set_secret,s.set_server,s.set_title,s.set_view_count
 FROM f_bde_Clef_photo p,
      XMLTable('//set' passing p.groupsList
    COLUMNS 
        set_comment_count varchar2(255) path '@comment_count',
        set_count_photo varchar2(255) path '@count_photo',
        set_count_video varchar2(255) path '@count_video',
        set_farm varchar2(255) path '@farm',
        set_id varchar2(255) path '@id',
        set_primary varchar2(255) path '@primary',
        set_secret varchar2(255) path '@secret',
        set_server varchar2(255) path '@server',
        set_title varchar2(255) path '@title',
        set_view_count varchar2(255) path '@view_count'
      ) s
);

Select * from f_bde_Clef_groups_set where rownum=1;
Select count(*) from f_bde_Clef_groups_set;