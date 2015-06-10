create or replace view f_dw_set_views_rank
as
select * from (
select g.pk_id,g.count_views, RANK() over (order by g.count_views desc) rank
from (select distinct pk_id,count_views from f_bdt_set) g
);