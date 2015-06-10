@f_dw/f_exceptions.sql

@f_dw/f_bdt2body.sql

@f_dw/f_dw_date.sql
@f_dw/f_dw_user.sql
@f_dw/f_dw_server.sql
@f_dw/f_dw_location.sql

@f_dw/f_dw_photos.sql


@f_dw/f_dw_galleries.sql
@f_dw/f_dw_tags.sql
@f_dw/f_dw_labels.sql
@f_dw/f_dw_pool.sql
@f_dw/f_dw_set.sql

PROMPT '************************************************************'
PROMPT 'Passage de la zone T a la zone W'
PROMPT '************************************************************'

@f_dw/f_bdtTOdw.sql

commit;

