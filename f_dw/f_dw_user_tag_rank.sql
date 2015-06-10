create or replace view f_dw_user_tag_rank
as
select pk_id,moy, RANK() over (order by f.moy desc) rank
from f_dw_user_moytag f;