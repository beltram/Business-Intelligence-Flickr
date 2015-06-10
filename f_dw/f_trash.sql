create table f_datetaken as (
select pk,r from (select p.pk_id pk,d.id r from f_bdt_date dt
INNER JOIN f_dw_date d ON d.dat = dt.getDat()
INNER JOIN f_bdt_photos p ON p.date_taken = dt.dat where d.id is not null) dtaken,
f_bdt_photos p
where p.pk_id = dtaken.pk
);

create table f_dateuploaded as (
select pk,r from (select p.pk_id pk,d.id r from f_bdt_date dt
INNER JOIN f_dw_date d ON d.dat = dt.getDat()
INNER JOIN f_bdt_photos p ON p.date_uploaded = dt.dat where d.id is not null) duploaded,
f_bdt_photos p
where p.pk_id = duploaded.pk
);

create table f_datelastupdate as (
select pk,r from (select p.pk_id pk,d.id r from f_bdt_date dt
INNER JOIN f_dw_date d ON d.dat = dt.getDat()
INNER JOIN f_bdt_photos p ON p.date_last_update = dt.dat where d.id is not null) dlastupdate,
f_bdt_photos p
where p.pk_id = dlastupdate.pk
);

create table f_dateposted as (
select pk,r from (select p.pk_id pk,d.id r from f_bdt_date dt
INNER JOIN f_dw_date d ON d.dat = dt.getDat()
INNER JOIN f_bdt_photos p ON p.date_posted = dt.dat where d.id is not null) dposted,
f_bdt_photos p
where p.pk_id = dposted.pk
);

create table f_user as (
select pk,r from (select p.pk_id pk,u.id r from f_bdt_user ut
INNER JOIN f_dw_user u ON u.pk_id = ut.getId()
INNER JOIN f_bdt_photos p ON p.fk_user = ut.pk_id where u.id is not null) fuser,
f_bdt_photos p
where p.pk_id = fuser.pk
);

create table f_location as (
select pk,r from (select p.pk_id pk,l.id r from f_bdt_location lt
INNER JOIN f_dw_location l ON l.pk_id = lt.getId()
INNER JOIN f_bdt_photos p ON p.fk_location = lt.pk_id where l.id is not null) flocation,
f_bdt_photos p
where p.pk_id = flocation.pk
);

create table f_server as (
select pk,r from (select p.pk_id pk,s.id r from f_bdt_server st
INNER JOIN f_dw_server s ON s.pk_id = st.getId()
INNER JOIN f_bdt_photos p ON p.fk_server = st.pk_id where s.id is not null) fserver,
f_bdt_photos p
where p.pk_id = fserver.pk
);

