import logging
import sqlite3
from random import randint

from connection import connect, db
import faker

fake = faker.Faker("uk-UA")

NUMBER_OF_SUBJECTS = 8
NUMBER_OF_TEACHERS = 5
NUMBER_OF_GROUPS = 3
NUMBER_OF_STUDENTS = 50
SUBJECTS = (
    "Python core",
    "Soft skills",
    "Python Web",
    "English",
    "HTML+CSS",
    "JavaScript",
    "Python date science",
    "Career skills",
)


def seed_students(db):
    with connect(db) as con:
        cur = con.cursor()
        for _ in range(NUMBER_OF_STUDENTS):
            name = fake.name()
            group_id = randint(1, NUMBER_OF_GROUPS)
            sql = "INSERT INTO students (name, group_id) VALUES (?, ?)"
            cur.execute(sql, (name, group_id))
        con.commit()
        logging.info("students seed done!")


def seed_groups(db):
    with connect(db) as con:
        cur = con.cursor()
        for group in ("DRY_KISS.py", "Coders of the Galaxy", "Gruppe Sechs"):
            sql = "INSERT INTO groups (name) VALUES (?)"
            cur.execute(sql, (group,))
        con.commit()
        logging.info("groups seed done!")


def seed_teachers(db):
    with connect(db) as con:
        cur = con.cursor()
        for _ in range(NUMBER_OF_TEACHERS):
            name = fake.name()
            sql = "INSERT INTO teachers (name) VALUES (?)"
            cur.execute(sql, (name,))
        con.commit()
        logging.info("teachers seed done!")


def seed_subjects(db, subjects=SUBJECTS):
    with connect(db) as con:
        cur = con.cursor()

        for subject in subjects:
            sql = "INSERT INTO subjects (name, teacher_id) VALUES (?, ?)"
            cur.execute(sql, (subject, randint(1, NUMBER_OF_TEACHERS)))
        con.commit()
        logging.info("subjects seed done!")


def seed_grades(db):
    with connect(db) as con:
        cur = con.cursor()
        sql = "INSERT INTO grades (student_id, subject_id, grade, grade_date) VALUES (?, ?, ?, ?)"
        try:
            for student_id in range(1, NUMBER_OF_STUDENTS + 1):
                for subject in range(20):
                    grade = randint(1, 12)
                    subject_id = randint(1, NUMBER_OF_SUBJECTS)
                    grade_date = str(
                        fake.date_between(start_date="-155d", end_date="+155d")
                    )
                    cur.execute(sql, (student_id, subject_id, grade, grade_date))

            con.commit()
            cur.close()
            logging.info("grades seed done!")
        except sqlite3.Error as e:
            logging.error(f"An error occurred: {str(e)}")
            con.rollback()


if __name__ == '__main__':
    seed_students(db)
    seed_groups(db)
    seed_teachers(db)
    seed_subjects(db)
    seed_grades(db)
