create or replace view f_dw_user_moytag
as
select pk_id, ROUND(cou/nb_photo,1) moy from 
(select u.pk_id,count(*) cou from f_bdt_user u 
INNER JOIN f_bdt_photos p ON u.pk_id = p.fk_user
INNER JOIN f_bdt_tags t ON p.pk_id = t.fk_photo
group by u.pk_id) f1
INNER JOIN (select u.pk_id, count(*) nb_photo from f_bdt_user u 
INNER JOIN f_bdt_photos p ON u.pk_id = p.fk_user
group by u.pk_id) f2
USING(pk_id);