-- Знайти список курсів, які відвідує студент.
SELECT  distinct students.name, subjects.name
FROM students
JOIN grades ON students.id = grades.student_id
JOIN subjects ON grades.subject_id = subjects.id
WHERE students.name = ?;
