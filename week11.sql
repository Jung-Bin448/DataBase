-- Declaring an Explicit Cursor 

DECLARE
    CURSOR cur_students
    SELECT student_id, student_firstname,
    student_lastname, phone_no, date_of_birth,
        voucher
    FROM students;