PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'

PROMPT '************************************************************'
PROMPT 'nombre de photos prises par année'
PROMPT '************************************************************'
select d.annee,count(*) cou from f_dw_photos p
INNER JOIN f_dw_date d ON p.date_taken = d.id
group by annee
order by annee desc;

PROMPT '************************************************************'
PROMPT 'nombre de photos uploadées par année'
PROMPT '************************************************************'
select d.annee,count(*) cou from f_dw_photos p
INNER JOIN f_dw_date d ON p.date_uploaded = d.id
group by annee
order by annee desc;

PROMPT '************************************************************'
PROMPT 'nombre de photos uploadées par mois'
PROMPT '************************************************************'
select d.moy,count(*) cou from f_dw_photos p
INNER JOIN f_dw_date d ON p.date_uploaded = d.id
group by moy
order by cou desc;

PROMPT '************************************************************'
PROMPT 'nombre de photos uploadées par jour de la semaine'
PROMPT '************************************************************'
select d.dow,count(*) cou from f_dw_photos p
INNER JOIN f_dw_date d ON p.date_uploaded = d.id
group by dow
order by cou desc;

PROMPT '************************************************************'
PROMPT 'nombre de photos postées par année'
PROMPT '************************************************************'
select d.annee,count(*) cou from f_dw_photos p
INNER JOIN f_dw_date d ON p.date_posted = d.id
group by annee
order by annee desc;

PROMPT '************************************************************'
PROMPT 'nombre de photos dernièrement mises à jour par année'
PROMPT '************************************************************'
select d.annee,count(*) cou from f_dw_photos p
INNER JOIN f_dw_date d ON p.date_last_update = d.id
group by annee
order by annee desc;

PROMPT '************************************************************'
PROMPT 'Top 20 des tags les plus populaires'
PROMPT '************************************************************'
select * from (
select t.tag_value,count(*) cou from f_dw_tags t
group by t.tag_value
order by cou desc)
where rownum < 20;


PROMPT '************************************************************'
PROMPT 'nombre de photos par pays'
PROMPT '************************************************************'
select l.country_value,count(*) cou from f_dw_photos p
INNER JOIN f_dw_location l ON p.fk_location = l.id
where l.country_value is not null
group by l.country_value
order by cou desc;

PROMPT '************************************************************'
PROMPT 'nombre de photos par state (USA)'
PROMPT '************************************************************'
select l.region_value,count(*) cou from f_dw_photos p
INNER JOIN f_dw_location l ON p.fk_location = l.id
where l.country_value = 'United States'
and l.region_value is not null
group by l.region_value
order by cou desc;

PROMPT '************************************************************'
PROMPT 'nombre de photos par state (Canada)'
PROMPT '************************************************************'
select l.region_value,count(*) cou from f_dw_photos p
INNER JOIN f_dw_location l ON p.fk_location = l.id
where l.country_value = 'Canada'
and l.region_value is not null
group by l.region_value
order by cou desc;

PROMPT '************************************************************'
PROMPT 'nombre de photos par county du Québec'
PROMPT '************************************************************'
select l.locality_value,count(*) cou from f_dw_photos p
INNER JOIN f_dw_location l ON p.fk_location = l.id
where l.region_value = 'Quebec'
and l.locality_value is not null
group by l.locality_value
order by cou desc;

PROMPT '************************************************************'
PROMPT 'nombre de photos par quartier de Montréal'
PROMPT '************************************************************'
select l.neighbourhood_value,count(*) cou from f_dw_photos p
INNER JOIN f_dw_location l ON p.fk_location = l.id
where l.county_value = 'Montréal'
and l.neighbourhood_value is not null
group by l.neighbourhood_value
order by cou desc;

PROMPT '************************************************************'
PROMPT 'Top 20 des villes ayant le plus de photos (les plus touristiques ou habitées)'
PROMPT '************************************************************'
select * from (
select l.locality_value,count(*) cou from f_dw_photos p
INNER JOIN f_dw_location l ON p.fk_location = l.id
where l.locality_value is not null
group by l.locality_value
order by cou desc)
where rownum < 20;

PROMPT '************************************************************'
PROMPT 'Répartition de charge parmi les serveurs'
PROMPT '************************************************************'
select s.pk_id,count(*) cou from f_dw_photos p
INNER JOIN f_dw_server s ON p.fk_server = s.id
group by s.pk_id
order by cou desc;

PROMPT '************************************************************'
PROMPT 'Répartition de charge par ferme de serveur'
PROMPT '************************************************************'
select s.farm,count(*) cou from f_dw_photos p
INNER JOIN f_dw_server s ON p.fk_server = s.id
group by s.farm
order by cou desc;

PROMPT '************************************************************'
PROMPT 'Relation entre le nobre de vues d''une photo et la popularité du groupe auquel elle appartient'
PROMPT 'NB : plus popularity est élevé, plus la tranche de photos par nombre de vues appartient à des groupes populaires'
PROMPT 'Conclusion : Les utilisateurs ont tendance à découvrir les photos à partir des galleries de photos'
PROMPT '************************************************************'
select f1.percent_rank, ROUND((SUM(f1.cou)*SUM(f1.popularity+1))/count(*)) popularity from (
select p.percent_rank,g.popularity,count(*) cou from f_dw_photos p
INNER JOIN f_dw_galleries g ON p.pk_id = g.fk_photo
group by p.percent_rank, g.popularity
order by p.percent_rank desc) f1
group by f1.percent_rank
order by f1.percent_rank desc;






















PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_ END _**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'
PROMPT '*_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_**_*'