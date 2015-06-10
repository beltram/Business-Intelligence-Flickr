SET ECHO OFF

@f_bdt/f_exceptions.sql

@f_bdt/f_bdt_location.sql
@f_bdt/f_bdt_date.sql
@f_bdt/f_bdt_user.sql
@f_bdt/f_bdt_server.sql

@f_bdt/f_bdt_photos.sql

@f_bdt/f_bdt_galleries.sql
@f_bdt/f_bdt_tags.sql
@f_bdt/f_bdt_pool.sql
@f_bdt/f_bdt_set.sql
@f_bdt/f_bdt_labels.sql

PROMPT '************************************************************'
PROMPT 'Passage de la zone E a la zone T'
PROMPT '************************************************************'
@f_bdt/f_bdeTObdt.sql
/*
@invalid_views.sql
*/
commit;

