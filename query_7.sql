-- Знайти оцінки студентів у окремій групі з певного предмета.
SELECT students.name as student, subjects.name as subject , grades.grade as grade
FROM students
         JOIN grades ON students.id = grades.student_id
         JOIN subjects ON grades.subject_id = subjects.id
         JOIN groups ON students.group_id = groups.id
WHERE groups.name = ?
  AND subjects.name = ?;
