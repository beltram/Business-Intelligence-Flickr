create or replace view f_dw_photos_rank
as
select * from (
select p.pk_id,p.nb_views, RANK() over (order by p.nb_views desc) rank
from f_bdt_photos p
);
/*
select * from f_dw_photos_rank where rownum < 10;

select count(*) from(select count(*) cou from f_dw_photos_rank group by nb_views order by cou desc);
*/