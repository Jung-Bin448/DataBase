SELECT TRIM(' ' FROM '   Hello   ') "Trimmed"
    FROM DUAL;

Trimmed
----------
Hello


SELECT TRIM(' ' FROM '   Oracle SQL   ') "Trimmed"
    FROM DUAL;

Trimmed
----------
Oracle SQL


SELECT TRIM(' ' FROM '   Programming   ') "Trimmed"
    FROM DUAL;

Trimmed
----------
Programming


SELECT TRIM(' ' FROM '   Database   ') "Trimmed"
    FROM DUAL;

Trimmed
----------
Database


SELECT TRIM(' ' FROM '   John Smith   ') "Trimmed"
FROM DUAL;

Trimmed
----------
John Smith


SELECT TRIM(' ' FROM '   New York   ') "Trimmed"
    FROM DUAL;

Trimmed
----------
New York

    SELECT TRIM(" "FROM firstname),
    TRIM('' FROM surname)
    FROM staff;

    SELECT LENGTH(firstname) FROM staff;

    SELECT INSTR('CORPORATE FLOOR','OR'3,2)FROM
    DUAL;

    SELECT first_name, SUBSTR(first_name, 3) "Starting from 3rd Letter" FROM employees;

    -- every functions 3 use case loop


--  1. SQL Character Functions
    -- Use Case 1 — Clean up product names & find string positions
    -- Products(product_name, category)
SELECT 
  TRIM('  ' FROM product_name) AS clean_name,
  LENGTH(TRIM('  ' FROM product_name)) AS name_length,
  INSTR(product_name, 'Pro') AS pro_position,
  SUBSTR(product_name, 1, 5) AS short_code
FROM products;

    -- Use Case 2 — Format customer email addresses
    -- Customers(email, fullname)
SELECT 
  TRIM(email) AS clean_email,
  INSTR(TRIM(email), '@') AS at_position,
  SUBSTR(TRIM(email), 1, INSTR(TRIM(email), '@') - 1) AS username,
  LENGTH(fullname) AS name_length
FROM customers;

    -- Use Case 3 — Search within employee job titles
    -- Employees(job_title, department)
SELECT 
  TRIM(job_title) AS title,
  INSTR(job_title, 'Manager') AS mgr_pos,
  SUBSTR(job_title, 1, 3) AS title_code,
  LENGTH(TRIM(job_title)) AS title_length
FROM employees
WHERE INSTR(job_title, 'Manager') > 0;


    -- 2. PL/SQL Block Structure
    -- Use Case 1 — Calculate and print a student's grade
DECLARE
  vn_score    NUMBER := 72;
  v_grade     VARCHAR2(2);
BEGIN
  IF vn_score >= 75 THEN
    v_grade := 'A';
  ELSIF vn_score >= 60 THEN
    v_grade := 'B';
  ELSE
    v_grade := 'C';
  END IF;
  DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

    -- Use Case 2 — Fetch and display an employee's salary
    DECLARE
  v_salary    employees.salary%TYPE;
  v_name      employees.first_name%TYPE;
BEGIN
  SELECT first_name, salary
  INTO v_name, v_salary
  FROM employees
  WHERE employee_id = 101;

  DBMS_OUTPUT.PUT_LINE(v_name || ' earns: ' || v_salary);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee not found.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/

    -- Use Case 3 — Apply a discount and update price
    DECLARE
  vn_price      NUMBER := 500;
  vn_discount   NUMBER := 0.15;
  vn_final      NUMBER;
BEGIN
  vn_final := vn_price - (vn_price * vn_discount);
  DBMS_OUTPUT.PUT_LINE('Original : ' || vn_price);
  DBMS_OUTPUT.PUT_LINE('Discounted: ' || vn_final);
EXCEPTION
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('Value calculation error.');
END;
/

    -- 3. PL/SQL Loops with EXIT WHEN
    -- Use Case 1 — Print multiplication table of 4
    DECLARE
  vn_counter NUMBER(2) := 1;
BEGIN
  LOOP
    EXIT WHEN vn_counter > 10;
    DBMS_OUTPUT.PUT_LINE('4 x ' || vn_counter || ' = ' || (4 * vn_counter));
    vn_counter := vn_counter + 1;
  END LOOP;
END;
/

    -- Use Case 2 — Accumulate a running total until limit
    DECLARE
  vn_counter NUMBER(3) := 1;
  vn_total   NUMBER    := 0;
BEGIN
  LOOP
    EXIT WHEN vn_counter > 50;
    vn_total   := vn_total + vn_counter;
    vn_counter := vn_counter + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Sum 1 to 50 = ' || vn_total);
END;
/

    -- Use Case 3 — Simulate stock deduction until out of stock
    DECLARE
  vn_stock   NUMBER(4) := 20;
  vn_sold    NUMBER    := 0;
BEGIN
  LOOP
    EXIT WHEN vn_stock <= 0;
    vn_stock := vn_stock - 3;
    vn_sold  := vn_sold  + 3;
    DBMS_OUTPUT.PUT_LINE('Sold 3 units. Remaining: ' || vn_stock);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Total sold: ' || vn_sold);
END;
/


-- WHILE LOOP 
DECLARE vn_counter NUMBER(3):=0;
BEGIN
 WHILE 3>=vn_counter LOOP
   DBMS_OUTPUT.PUT_LINE('counter has not exceeded 3');
   vn_counter := vn_counter + 1;
 END LOOP;
END;