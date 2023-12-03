from connection import connect, db


def make_query(query, data_base=db, params=()):
    try:
        with open(query) as f:
            sql = f.read()

    except FileNotFoundError:
        print("Error: file not found")

    except PermissionError:
        print("Error: permission denied")

    with connect(data_base) as con:
        cur = con.cursor()
        cur.execute(sql, params)
        result = cur.fetchall()
        cur.close()

    return result
