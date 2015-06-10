create or replace view f_dw_user_tag_percent_rank
as
select pk, floor((rownum/(co+1))*20) per from (
select u.pk_id pk, co, u.moy
from f_dw_user_moytag u,
(select count(*) co from f_bdt_user)
);