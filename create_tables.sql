DROP table if EXISTS GROUPS;
CREATE TABLE groups (
	id INTEGER PRIMARY KEY,
	name text NOT NULL
	);

DROP TABLE if EXISTS teachers;
CREATE TABLE teachers (
	id INTEGER PRIMARY KEY,
	name text NOT NULL
);

DROP TABLE if EXISTS students;
CREATE TABLE students (
	id INTEGER PRIMARY KEY,
	name text NOT NULL,
	group_id INTEGER,
	FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE
);

DROP TABLE if EXISTS subjects;
CREATE TABLE subjects (
	id INTEGER PRIMARY KEY,
	name text NOT NULL,
	teacher_id INTEGER,
	FOREIGN KEY (teacher_id) REFERENCES teachers(id) ON DELETE CASCADE
);

DROP TABLE if EXISTS grades;
CREATE TABLE grades (
	id INTEGER PRIMARY KEY,
	student_id INTEGER,
	subject_id INTEGER,
	grade INT,
	grade_date DATE NOT NULL,
	FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
	FOREIGN KEY	(subject_id) REFERENCES subjects(id) ON DELETE CASCADE
);
