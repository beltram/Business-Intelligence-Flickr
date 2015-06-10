create or replace view f_dw_set_photo_rank
as
select * from (
select g.pk_id,g.count_photos, RANK() over (order by g.count_photos desc) rank
from (select distinct pk_id,count_photos from f_bdt_set) g
);