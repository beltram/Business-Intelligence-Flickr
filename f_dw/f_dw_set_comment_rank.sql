create or replace view f_dw_set_comment_rank
as
select * from (
select g.pk_id,g.count_comments, RANK() over (order by g.count_comments desc) rank
from (select distinct pk_id,count_comments from f_bdt_set) g
);