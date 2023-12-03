-- Знайти середній бал у групах з певного предмета.
SELECT groups.name AS group_name, subjects.name AS subject_name, round(AVG(grades.grade), 1) AS average_grade
FROM students
         JOIN grades ON students.id = grades.student_id
         JOIN subjects ON grades.subject_id = subjects.id
         JOIN groups ON students.group_id = groups.id
WHERE subjects.name = ?
GROUP BY group_name, subject_name;
