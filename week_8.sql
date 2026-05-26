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