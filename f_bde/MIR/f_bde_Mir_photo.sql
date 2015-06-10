CREATE TABLE f_bde_Mir_photo AS
(SELECT *
 FROM
    XMLTable('/photos/photo'
      passing xmltype(
      BFILENAME('REPO_DATA','photosMIR.xml'),
      nls_charset_id('AL32UTF8')
    )
    COLUMNS 
        dateuploaded varchar2(255) path '@dateuploaded',
        farm varchar2(255) path '@farm',
        photo_id varchar2(255) path '@id',
        isfavorite varchar2(255) path '@isfavorite',
        license varchar2(255) path '@license',
        media varchar2(255) path '@media',
        rotation varchar2(255) path '@rotation',
        safety_level varchar2(255) path '@safety_level',
        secret varchar2(255) path '@secret',
        server varchar2(255) path '@server',
        photo_views varchar2(255) path '@views',
        
        owner_iconfarm varchar2(255) path 'owner/@iconfarm',
        owner_iconserver varchar2(255) path 'owner/@iconserver',
        owner_location varchar2(255) path 'owner/@location' DEFAULT (null),
        owner_nsid varchar2(255) path 'owner/@nsid',
        owner_realname varchar2(255) path 'owner/@realname',
        owner_username varchar2(255) path 'owner/@username',
    
        title varchar2(255) path 'title',
        
        visibility_isfamily varchar2(255) path 'visibility/@isfamily',
        visibility_isfriend varchar2(255) path 'visibility/@isfriend',
        visibility_ispublic varchar2(255) path 'visibility/@ispublic',
        
        dates_lastupdate varchar2(255) path 'dates/@lastupdate',
        dates_posted varchar2(255) path 'dates/@posted',
        dates_taken varchar2(255) path 'dates/@taken',
        dates_takengranularity varchar2(255) path 'dates/@takengranularity',
        
        editability_canaddmeta varchar2(255) path 'editability/@canaddmeta',
        editability_cancomment varchar2(255) path 'editability/@cancomment',
        
        publiceditability_canaddmeta varchar2(255) path 'publiceditability/@canaddmeta',
        publiceditability_cancomment varchar2(255) path 'publiceditability/@cancomment',
        
        usage_canblog varchar2(255) path 'usage/@canblog',
        usage_candownload varchar2(255) path 'usage/@candownload',
        usage_canprint varchar2(255) path 'usage/@canprint',
        usage_canshare varchar2(255) path 'usage/@canshare',
        
            
        tagsList XMLType path 'tags',
        
        groupsList XMLType path 'groups',
        
        labelsList XMLType path 'labels',
        
        photo_location XMLType path 'location',
        
        galleries XMLType path 'galleries'
        
      )        
);

Select * from f_bde_Mir_photo where rownum=1;
Select count(*) from f_bde_Mir_photo;


