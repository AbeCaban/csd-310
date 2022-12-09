from datetime import date, timedelta
import mysql.connector
from mysql.connector import errorcode

config = {
    "user": "root",
    "password": "root",
    "host": "127.0.0.1",
    "database": "outland_adventures",
    "raise_on_warnings": True
}

db = mysql.connector.connect(**config)

try:
    
    print("\n  Database user {} connected to MySQL on host {} with database {}".format(config["user"], config["host"], config["database"]))
    cursor = db.cursor() 
    query = ("SELECT COUNT(trips.trip_id), continent_name FROM orders INNER JOIN trips ON orders.trip_id = trips.trip_id INNER JOIN destination ON trips.continent_ID = destination.continent_ID WHERE order_date > DATE_SUB(curdate(), INTERVAL 90 DAY) GROUP BY continent_name ORDER BY COUNT(continent_name)")
    cursor.execute(query)
    results = cursor.fetchall()
    print()
    print(" -- DISPLAYING Bookings by Continent (Past 90 Days) --")
    print()

    for booking_group in results:
        print("Number of Bookings:", booking_group[0])
        print("Continent:", booking_group[1])
        print()

    input("Press any key to close")

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("  The supplied username or password are invalid")

    elif err.errno == errorcode.ER_BAD_FIELD_ERROR:
        print("  The specified field does not exist")

    else:
        print(err)
    
finally:
    db.close()