SELECT Lecturer_id
FROM course_lecturers
GROUP BY Lecturer_id
HAVING COUNT(Course_id) = 1;


SELECT Lecturer_id
FROM lecturers
WHERE Lecturer_id NOT IN (
    SELECT Lecturer_id
    FROM course_lecturers
);