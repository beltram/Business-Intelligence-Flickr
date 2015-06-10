create or replace view f_invalid_dates
as
select d.id from f_dw_date d
where d.annee > 2011 or d.annee < 2004;

select count(*) from f_invalid_dates;