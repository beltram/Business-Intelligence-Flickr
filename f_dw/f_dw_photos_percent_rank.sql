create or replace view f_dw_photos_percent_rank
as
select pk, floor((rownum/(cou+1))*20) per from (
select p.pk_id pk, cou, p.nb_views
from f_bdt_photos p,
(select count(*) cou from f_bdt_photos)
order by p.nb_views asc);