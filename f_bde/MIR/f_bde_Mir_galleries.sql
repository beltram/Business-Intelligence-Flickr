CREATE TABLE f_bde_Mir_galleries AS
(SELECT p.photo_id,
g.title,g.count_comments,g.count_photos,g.count_videos,g.count_views,g.date_create,g.date_update,g.iconfarm,
g.iconserver,g.gallery_id,g.owner,g.primary_photo_farm,g.primary_photo_id,g.primary_photo_secret,g.primary_photo_server,g.url,g.username
 FROM f_bde_Mir_photo p,
    XMLTable('//gallery' passing p.galleries
    COLUMNS 
        title varchar2(255) path 'title',
        count_comments varchar2(255) path '@count_comments',
        count_photos varchar2(255) path '@count_photos',
        count_videos varchar2(255) path '@count_videos',
        count_views varchar2(255) path '@count_views',
        date_create varchar2(255) path '@date_create',
        date_update varchar2(255) path '@date_update',
        iconfarm varchar2(255) path '@iconfarm',
        iconserver varchar2(255) path '@iconserver',
        gallery_id varchar2(255) path '@id',
        owner varchar2(255) path '@owner',
        primary_photo_farm varchar2(255) path '@primary_photo_farm',
        primary_photo_id varchar2(255) path '@primary_photo_id',
        primary_photo_secret varchar2(255) path '@primary_photo_secret',
        primary_photo_server varchar2(255) path '@primary_photo_server',
        url varchar2(255) path '@url',
        username varchar2(255) path '@username'
      ) g
);

Select * from f_bde_Mir_galleries where rownum=1;
Select count(*) from f_bde_Mir_galleries;