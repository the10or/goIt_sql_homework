-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT name as student, avg(grades.grade) AS average_grade
FROM students
         JOIN grades ON students.id = grades.student_id
GROUP BY name
ORDER BY average_grade DESC
LIMIT 5;
