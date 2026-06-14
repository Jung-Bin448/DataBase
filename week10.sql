CREATE or REPLACE TRIGGER trig_start_date
AFTER INSERT OR UPDATE OF start_date ON saff
FOR EACH ROW 
DECLARE
    vd_today DATE;
BEGIN
    SELECT SYSDATE
    INTO vd_today
    FROM DUAL;
    IF :NEW.start_date > vd_today THEN