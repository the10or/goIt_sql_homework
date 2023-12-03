-- Знайти список студентів у певній групі.
SELECT s.name AS student, g.name AS group_name
FROM students s JOIN groups g
ON s.group_id = g.id
WHERE g.name = ?
ORDER BY student;