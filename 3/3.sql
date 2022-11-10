DROP DATABASE smth;
CREATE DATABASE smth;
\connect smth

CREATE TABLE IF NOT EXISTS groups (
    id serial PRIMARY KEY,
    num_of_students int,
    surname_of_the_elder varchar
);

CREATE TABLE IF NOT EXISTS students (
    id serial PRIMARY KEY,
    group_code int,
    surname varchar,
    gender varchar(1),
    FOREIGN KEY (group_code) REFERENCES groups (id)
);

CREATE TABLE IF NOT EXISTS discipline (
    id serial PRIMARY KEY,
    discipline_name varchar
);

CREATE TABLE IF NOT EXISTS exams (
    discipline_code int,
    group_code int,
    student_id int,
    grade int,
    FOREIGN KEY (discipline_code) REFERENCES discipline (id),
    FOREIGN KEY (group_code) REFERENCES groups (id),
    FOREIGN KEY (student_id) REFERENCES students (id)
);


INSERT INTO groups (num_of_students, surname_of_the_elder) VALUES (200, 'Aristotle');
INSERT INTO groups (num_of_students, surname_of_the_elder) VALUES (200, 'Pythagoras');
SELECT * FROM groups;


INSERT INTO students (group_code, surname, gender) VALUES (1, 'Einstein', 'm');
INSERT INTO students (group_code, surname, gender) VALUES (1, 'Newton', 'm');
INSERT INTO students (group_code, surname, gender) VALUES (1, 'Curie', 'f');

INSERT INTO students (group_code, surname, gender) VALUES (2, 'Chivchyan', 'm');

INSERT INTO students (group_code, surname, gender) VALUES (3, 'Error...', 'f');
SELECT * FROM students;


INSERT INTO discipline (discipline_name) VALUES ('Physics');
INSERT INTO discipline (discipline_name) VALUES ('Chemistry');
SELECT * FROM discipline;


INSERT INTO exams (discipline_code, group_code, student_id, grade) VALUES (1, 1, 1, 5);
INSERT INTO exams (discipline_code, group_code, student_id, grade) VALUES (2, 1, 1, 5);

INSERT INTO exams (discipline_code, group_code, student_id, grade) VALUES (1, 1, 2, 5);
INSERT INTO exams (discipline_code, group_code, student_id, grade) VALUES (2, 1, 2, 5);

INSERT INTO exams (discipline_code, group_code, student_id, grade) VALUES (1, 1, 3, 5);
INSERT INTO exams (discipline_code, group_code, student_id, grade) VALUES (2, 1, 3, 5);

INSERT INTO exams (discipline_code, group_code, student_id, grade) VALUES (1, 2, 1, 5);
INSERT INTO exams (discipline_code, group_code, student_id, grade) VALUES (2, 2, 1, 2);
SELECT * FROM exams;

-- SELECT exams.group_code, discipline_name, surname, grade FROM exams 
-- JOIN discipline ON exams.discipline_code = discipline.id 
-- JOIN students ON exams.student_id =  students.id;

INSERT INTO exams (discipline_code, group_code, student_id, grade)
SELECT 1, 1, 1, s.id
FROM generate_series(1,100000) AS s(id)
ORDER BY random();

EXPLAIN ANALYZE SELECT * FROM exams where grade <= 100;

CREATE INDEX on exams(grade);

EXPLAIN ANALYZE SELECT * FROM exams where grade <= 100;