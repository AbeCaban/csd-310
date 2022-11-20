
import mysql.connector
from mysql.connector import errorcode
# config
db = mysql.connector.connect(
        user="abe",
        password="nerds",
        host="127.0.0.1",
        database="movies",
        # "raise_on_warnings": True
        )

# try:
# db = (**config)

#     print("\n Database user {} connected to MySQL on host {} with database {}"
#           .format(config["user"], config["host"], config["database"]))
#
#     input("\n\n Press any key to continue...")
#
#     if db.is_connected():
#         print("\n Connection established...")
#
# except mysql.connector.Error as err:
#     if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
#         print("   The supplied username or password are invalid")
#
#     elif err.errno == errorcode.ER_BAD_DB_ERROR:
#         print("  The specified database does not exist")
#
#     else:
#         print(err)
#
# finally:

cursor = db.cursor()
query = "SELECT studio_id, studio_name FROM studio;"
cursor.execute(query)  # selecting three fields
studios = cursor.fetchall()
print("\n")
print("-- DISPLAYING Studio RECORDS --")
for studio in studios:
    print("Studio ID:{} \nStudio Name:{} \n".format(studio[0], studio[1]))  # three fields
    # print(x)
# print("Studio ID: {} \n Studio Name:{} \n Email:{} \n", format(studio[0], studio[1], studio[2]))

query = "SELECT genre_id, genre_name FROM genre;"
cursor.execute(query)  # selecting three fields
genres = cursor.fetchall()
print("\n")
print("-- DISPLAYING Genre RECORDS --")
for genre in genres:
    print("Genre Id:{} \nGenre Name:{} \n".format(genre[0], genre[1]))

query = "SELECT studio_id, studio_name FROM studio;"
cursor.execute(query)  # selecting three fields
studios = cursor.fetchall()
print("\n")
print("-- DISPLAYING Studio RECORDS --")
for studio in studios:
    print("Studio ID:{} \nStudio Name:{} \n".format(studio[0], studio[1]))

query = "SELECT studio_id, studio_name FROM studio;"
cursor.execute(query)  # selecting three fields
studios = cursor.fetchall()
print("\n")
print("-- DISPLAYING Studio RECORDS --")
for studio in studios:
    print("Studio ID:{} \nStudio Name:{} \n".format(studio[0], studio[1]))

db.close()
