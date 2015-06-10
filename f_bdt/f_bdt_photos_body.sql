CREATE OR REPLACE TYPE BODY f_bdt_photos_type 
IS
MEMBER FUNCTION getId RETURN number
IS
BEGIN
  RETURN TO_NUMBER(pk_id);
END;
MEMBER FUNCTION getNbViews RETURN number
IS
BEGIN
  RETURN TO_NUMBER(nb_views);
END;

MEMBER FUNCTION getDatTaken RETURN date
IS
BEGIN
  case 
    when regexp_like(date_taken,'^([0-9]{4}-0[1-9]|1[012]-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2})') then RETURN TO_DATE(date_taken, 'yyyy-mm-dd hh24:mi:ss');
    when regexp_like(date_taken,'^([0-9]{10})') then RETURN TO_DATE('19700101','yyyymmdd') + (date_taken/86400);
    else RETURN NULL;
  end case;
END;
MEMBER FUNCTION getDatUploaded RETURN date
IS
BEGIN
  case 
    when regexp_like(date_uploaded,'^([0-9]{4}-0[1-9]|1[012]-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2})') then RETURN TO_DATE(date_uploaded, 'yyyy-mm-dd hh24:mi:ss');
    when regexp_like(date_uploaded,'^([0-9]{10})') then RETURN TO_DATE('19700101','yyyymmdd') + (date_uploaded/86400);
    else RETURN NULL;
  end case;
END;
MEMBER FUNCTION getDatLastUpdate RETURN date
IS
BEGIN
  case 
    when regexp_like(date_last_update,'^([0-9]{4}-0[1-9]|1[012]-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2})') then RETURN TO_DATE(date_last_update, 'yyyy-mm-dd hh24:mi:ss');
    when regexp_like(date_last_update,'^([0-9]{10})') then RETURN TO_DATE('19700101','yyyymmdd') + (date_last_update/86400);
    else RETURN NULL;
  end case;
END;
MEMBER FUNCTION getDatePosted RETURN date
IS
BEGIN
  case 
    when regexp_like(date_posted,'^([0-9]{4}-0[1-9]|1[012]-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2})') then RETURN TO_DATE(date_posted, 'yyyy-mm-dd hh24:mi:ss');
    when regexp_like(date_posted,'^([0-9]{10})') then RETURN TO_DATE('19700101','yyyymmdd') + (date_posted/86400);
    else RETURN NULL;
  end case;
END;
MEMBER FUNCTION getUser RETURN varchar
IS
BEGIN
  RETURN SUBSTR(fk_user,0,25);
END;
MEMBER FUNCTION getLocation RETURN varchar
IS
BEGIN
  RETURN SUBSTR(fk_location,0,25);
END;
MEMBER FUNCTION getServer RETURN number
IS
BEGIN
  RETURN TO_NUMBER(fk_server);
END;

END;