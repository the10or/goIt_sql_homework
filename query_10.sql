-- Список курсів, які певному студенту читає певний викладач.
SELECT DISTINCT students.name as student, teachers.name as teacher, subjects.name as subject_name
FROM students
         JOIN grades ON students.id = grades.student_id
         JOIN subjects ON grades.subject_id = subjects.id
         JOIN teachers ON subjects.teacher_id = teachers.id
WHERE students.name = ?
  AND teachers.name = ?;
