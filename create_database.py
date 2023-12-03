from connection import connect, db

with connect(db) as con:
    cur = con.cursor()
    try:
        with open("create_tables.sql") as f:
            script = f.read()

    except FileNotFoundError:
        print("Error: script file not found")

    except PermissionError:
        print("Error: permission to open script file denied")

        cur.executescript(script)
        cur.close()
    con.commit()


