-- Example
CREATE OR REPLACE FUNCTION func_count_offerings
RETURNS NUMBER IS

    vn_course_ct NUMBER(4);

BEGIN
    SELECT COUNT(*)
    INTO vn_course_ct
    FROM offerings;
    WHERE course_id = 515;

    RETURN vn_course_ct;

END func_countg_offerings;
/


-- Calling Functions
--Example - Calling functions
CREATE OR REPLACE PROCEDURE
  proc_using_func IS
  vn_no_of_runs number(20);
BEGIN

vn_no_of_runs := func_count_offerings;
DBMS_OUTPUT.PUT_LINE('The value returned from the function is ' || vn_no_of_runs);

END proc_using_func;
/