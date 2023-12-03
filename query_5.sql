-- Знайти які курси читає певний викладач.
SELECT teachers.name AS teacher, subjects.name AS subject
FROM teachers
         JOIN subjects ON subjects.teacher_id = teachers.id
WHERE teachers.name = ?;