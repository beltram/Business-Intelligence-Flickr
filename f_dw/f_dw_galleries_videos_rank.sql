create or replace view f_dw_galleries_videos_rank
as
select * from (
select g.pk_id,g.count_videos, RANK() over (order by g.count_videos desc) rank
from (select distinct pk_id,count_videos from f_bdt_galleries) g
);