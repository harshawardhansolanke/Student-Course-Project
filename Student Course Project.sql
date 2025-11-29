CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    age NUMBER
);
CREATE TABLE courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(50),
    duration_months NUMBER
);
CREATE TABLE enrollments (
    enroll_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    course_id NUMBER,
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students VALUES (1, 'Rahul', 20);
INSERT INTO students VALUES (2, 'Sneha', 22);
INSERT INTO students VALUES (3, 'Amit', 21);

INSERT INTO courses VALUES (101, 'Python', 2);
INSERT INTO courses VALUES (102, 'SQL Basics', 1);
INSERT INTO courses VALUES (103, 'Data Analytics', 3);

INSERT INTO enrollments VALUES (1001, 1, 101);
INSERT INTO enrollments VALUES (1002, 1, 102);
INSERT INTO enrollments VALUES (1003, 2, 103);
INSERT INTO enrollments VALUES (1004, 3, 101);

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

SELECT s.name, c.course_name
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

SELECT * FROM students
WHERE age = (SELECT MIN(age) FROM students);

COMMIT;

