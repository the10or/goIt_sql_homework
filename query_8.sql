-- Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT teachers.name as teacher_name, round(AVG(grades.grade),1) as average_grade
FROM grades
JOIN subjects ON grades.subject_id = subjects.id
JOIN teachers ON subjects.teacher_id = teachers.id
WHERE teachers.name = ?;