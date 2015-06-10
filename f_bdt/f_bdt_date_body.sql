CREATE OR REPLACE TYPE BODY f_bdt_date_type 
IS
MEMBER FUNCTION getDat RETURN date
IS
BEGIN
  case 
    when regexp_like(dat,'^([0-9]{4}-0[1-9]|1[012]-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2})') then RETURN TO_DATE(dat, 'yyyy-mm-dd hh24:mi:ss');
    when regexp_like(dat,'^([0-9]{10})') then RETURN TO_DATE('19700101','yyyymmdd') + (dat/86400);
    else RETURN NULL;
  end case;
END;
MEMBER FUNCTION getHod RETURN number
IS
BEGIN
  RETURN TO_CHAR(self.getDat(),'HH24');
END;
MEMBER FUNCTION getMod RETURN number
IS
BEGIN
  RETURN TO_NUMBER(CEIL(self.getHod()/6));
END;
MEMBER FUNCTION getDoy RETURN number
IS
BEGIN
  RETURN TO_CHAR(self.getDat(),'DDD');
END;
MEMBER FUNCTION getDow RETURN varchar
IS
BEGIN
  RETURN TO_CHAR(self.getDat(),'fmday');
END;

MEMBER FUNCTION getWoy RETURN number
IS
BEGIN
  RETURN TO_CHAR(self.getDat(),'ww');
END;

MEMBER FUNCTION getMoy RETURN number
IS
BEGIN
  RETURN TO_CHAR(self.getDat(),'mm');
END;

MEMBER FUNCTION getYear RETURN number
IS
BEGIN
  RETURN TO_CHAR(self.getDat(),'yyyy');
END;

END;