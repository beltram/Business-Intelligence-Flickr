create view invalid_card as
SELECT CARDNUMBER FROM (SELECT CARDNUMBER,count(*) as cou FROM F_BDE_CARD GROUP BY CARDNUMBER)
WHERE cou > 1;

create view invalid_cities as
SELECT city FROM (SELECT city,count(*) as cou FROM f_bde_cities GROUP BY city)
WHERE cou > 1;