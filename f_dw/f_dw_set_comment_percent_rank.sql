create or replace view f_dw_set_comment_percent_rank
as
select pk, floor((rownum/(cou+1))*20) per from (
select g.pk_id pk, cou, g.count_comments
from (select distinct pk_id,count_comments from f_bdt_set) g,
(select count(*) cou from f_bdt_set)
order by g.count_comments asc);