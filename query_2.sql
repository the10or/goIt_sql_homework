-- Знайти студента із найвищим середнім балом з певного предмета.
SELECT students.name AS student, subjects.name as subject, round(avg(grades.grade), 1) AS average_grade
FROM students
         JOIN grades ON students.id = grades.student_id
         JOIN subjects ON subjects.id = grades.subject_id
WHERE subjects.name = ?

GROUP BY students.name, subjects.name
ORDER BY average_grade DESC
LIMIT 5;