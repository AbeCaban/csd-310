import mysql.connector
db = mysql.connector.connect(
        user="abe",
        password="nerds",
        host="127.0.0.1",
        database="movies",
        )

cursor = db.cursor()

def show_films(cursor, title):

        cursor.execute("""SELECT film_name as Name, film_director as Director, genre_name as Genre, studio_name as 'Studio Name' 
                        from film INNER JOIN genre ON film.genre_id=genre.genre_id INNER JOIN studio ON film.studio_id = studio.studio_id""")

        films = cursor.fetchall()
        print("\n -- {} --".format(title))

        for film in films:
            print("Film Name: {}\nDirector: {}\nGenre Name ID: {}\nStudio Name: {}\n".format(film[0], film[1], film[2], film[3]))

show_films(cursor, "Displaying Films")

cursor.execute("INSERT INTO studio (studio_id, studio_name) values(4, 'Pinewood Studios');")
db.commit()
cursor.execute("""INSERT INTO film (film_id, film_name, film_releaseDate, film_runtime, film_director, genre_id, studio_id) values(4, 'The Fifth Element', '1997', '126', 'Luc Besson', 2, 4);
""")
db.commit()

show_films(cursor, "Displaying Film After Insert")

cursor.execute("""UPDATE film SET film_id = 2, film_name = 'Alien', film_releaseDate = '1979', film_runtime = '117', film_director = 'Ridley Scott', studio_id = 1, genre_id = 1 WHERE film_id = 2;""")

db.commit()

show_films(cursor, "Displaying Film After Update- Changed Alien To Horror --")

cursor.execute("DELETE FROM film WHERE film_id = 1;")

db.commit()

show_films(cursor, "Displaying Film After Delete")