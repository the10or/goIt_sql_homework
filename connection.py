import sqlite3
from contextlib import contextmanager
from sqlite3 import Error
import logging

db = "database.db"


@contextmanager
def connect(db):
    try:
        con = sqlite3.connect(db)
        logging.info("Connection established!")
        yield con
        con.close()

    except Error as e:
        logging.error(f"Something went wrong. {e}")
