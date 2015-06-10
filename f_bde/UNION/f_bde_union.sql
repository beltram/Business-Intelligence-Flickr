SET ECHO OFF
/*
@raz.sql
*/
PROMPT '************************************************************'
PROMPT 'Union des tables'
PROMPT '************************************************************'
@f_bde/UNION/f_bde_photos.sql
@f_bde/UNION/f_bde_galleries.sql
@f_bde/UNION/f_bde_labels.sql
@f_bde/UNION/f_bde_location.sql
@f_bde/UNION/f_bde_pool.sql
@f_bde/UNION/f_bde_set.sql
@f_bde/UNION/f_bde_tags.sql
