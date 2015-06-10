CREATE OR REPLACE TYPE BODY f_bdt_labels_type 
IS
MEMBER FUNCTION getFkPhoto RETURN number
IS
BEGIN
  RETURN TO_NUMBER(fk_photo);
END;
MEMBER FUNCTION getLabelValue RETURN varchar
IS
BEGIN
  RETURN SUBSTR(label_value,0,50);
END;

END;