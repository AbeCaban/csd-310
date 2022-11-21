
import mysql.connector

db = mysql.connector.connect(
        user="abe",
        password="nerds",
        host="127.0.0.1",
        database="movies",
        )


cursor = db.cursor()
query = "SELECT studio_id, studio_name FROM studio;"
cursor.execute(query)
studios = cursor.fetchall()
print("\n")
print("-- DISPLAYING Studio RECORDS --")
for studio in studios:
    print("Studio ID:{} \nStudio Name:{} \n".format(studio[0], studio[1]))


query = "SELECT genre_id, genre_name FROM genre;"
cursor.execute(query)
genres = cursor.fetchall()
print("\n")
print("-- DISPLAYING Genre RECORDS --")
for genre in genres:
    print("Genre Id:{} \nGenre Name:{} \n".format(genre[0], genre[1]))

query = "SELECT film_name, film_runtime FROM film WHERE film_runtime <= 120;"
cursor.execute(query)
films = cursor.fetchall()
print("\n")
print("-- DISPLAYING Short Film RECORDS --")
for film in films:
    print("Film Name:{} \nRuntime:{} \n".format(film[0], film[1]))

query = "SELECT film_name, film_director FROM film ORDER BY film_director;"
cursor.execute(query)
films = cursor.fetchall()
print("\n")
print("-- DISPLAYING Director RECORDS in Order --")
for film in films:
    print("Film Name:{} \nDirector:{} \n".format(film[0], film[1]))

db.close()
