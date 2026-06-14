--Trigger Example
CREATE OR REPLACE TRIGGER trig_create
BEFORE CREATE ON CSY2038.SCHEMA
BEGIN
   INSERT INTO audit_create_table
   (user_account, date_timestamp)
   VALUES(USER,SYSDATE);
END;

--Trigger Example - Using IF

CREATE OR REPLACE TRIGGER trig_date_constraint
BEFORE INSERT OR UPDATE OF billing_date ON invoices
FOR EACH ROW

DECLARE
    vd_today DATE;
BEGIN
    SELECT SYSDATE 
    INTO vd_today 
    FROM DUAL;

IF :NEW.billing_date < vd_today THEN
    RAISE_APPLICATION_ERROR(-20000, 'BILLING_DATE MUST BE BEFORE CURRENT DATE');

END NULL;
END IF;
END trig_date_constraint;
/

--TRIGGER Example - Using WHEN

CREATE OR REPLACE TRIGGER trig_date_constraint
BEFORE INSERT OR UPDATE OF billing_date ON invoices
FOR EACH ROW
WHEN (NEW.billing_date > SYSDATE)

BEGIN

RAISE_APPLICATION_ERROR(-20000, 'BILLING_DATE MUST BE BEFORE CURRENT DATE');

END trig_date_constraint;
/

//CREATE TABLE user_table (
    user_id      VARCHAR2(10),
    username     VARCHAR2(20) NOT NULL,
    password     VARCHAR2(20) NOT NULL,
    full_name    VARCHAR2(30),
    email        VARCHAR2(50),
    role         VARCHAR2(15),
    created_date DATE,
    
    CONSTRAINT pk_user PRIMARY KEY (user_id)
);