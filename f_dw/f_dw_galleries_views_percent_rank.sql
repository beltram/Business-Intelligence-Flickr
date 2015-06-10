create or replace view f_dw_gall_views_percent_rank
as
select pk, floor((rownum/(cou+1))*20) per from (
select g.pk_id pk, cou, g.count_views
from (select distinct pk_id,count_views from f_bdt_galleries) g,
(select count(*) cou from f_bdt_galleries)
order by g.count_views asc);