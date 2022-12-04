#11/27/2022
import mysql.connector
from mysql.connector import errorcode
from datetime import datetime

config = {
    "user": "root",
    "password": "AlmostDone24!",
    "host": "127.0.0.1",
    "database": "outland_adventures",
    "raise_on_warnings": True
}

db = mysql.connector.connect(**config)

try:
    
    print("\n  Database user {} connected to MySQL on host {} with database {}".format(config["user"], config["host"], config["database"]))

    cursor = db.cursor()
    query = "SELECT * from department"
    cursor.execute(query)
    results = cursor.fetchall()
    print(" -- DISPLAYING Departments --")

    for department in results:
        print("Department ID:", department[0])
        print("Department Name: ", department[1])
        print(" ")

    query = "SELECT * from customer"
    cursor.execute(query)
    results = cursor.fetchall()
    print(" -- DISPLAYING Customers --")

    for customer in results:
        print("Customer ID:", customer[0])
        print("Customer Name: ", customer[1])
        print(" ")

    query = "SELECT * from equipment"
    cursor.execute(query)
    results = cursor.fetchall()
    print(" -- DISPLAYING Equipment --")

    for equipment in results:
        print("Equipment ID:", equipment[0])
        print("Equipment Name: ", equipment[1])
        print("Acquired Date: ", equipment[2])
        print(" ")

    query = "SELECT * from visa"
    cursor.execute(query)
    results = cursor.fetchall()
    print(" -- DISPLAYING Visa --")

    for visa in results:
        print("Visa ID:", visa[0])
        print("Visa Number: ", visa[1])
        print("Visa Type: ", visa[2])
        print(" ")

    query = "SELECT * from airfare"
    cursor.execute(query)
    results = cursor.fetchall()
    print(" -- DISPLAYING Airfare --")

    for airfare in results:
        print("Airfare ID:", airfare[0])
        print("Ticket Number: ", airfare[1])
        print("Ticket type: ", airfare[2])
        print("Airline: ", airfare[3])
        print(" ")
        
    query = "SELECT * from jobs"
    cursor.execute(query)
    results = cursor.fetchall()
    print(" -- DISPLAYING Jobs --")

    for jobs in results:
        print("Job ID:", jobs[0])
        print("Job Name: ", jobs[1])
        print("Department ID: ", jobs[2])
        print(" ")

    query = "SELECT * from employee"
    cursor.execute(query)
    results = cursor.fetchall()
    print(" -- DISPLAYING Employees --")

    for employee in results:
        print("Employee ID:", employee[0])
        print("Employee Name: ", employee[1])
        print("Department ID: ", employee[2])
        print(" ")

    query = "SELECT * from purchases"
    cursor.execute(query)
    results = cursor.fetchall()
    print(" -- DISPLAYING Purchases --")

    for purchases in results:
        print("Purchase ID:", purchases[0])
        print("Equipment ID:", purchases[1])
        print("Customer ID:", purchases[2])
        print("Purchase Amount: ${:.2f}".format(purchases[3]))
        print("Purchase Date:", purchases[4])
        print(" ")

    query = "SELECT * from rental"
    cursor.execute(query)
    results = cursor.fetchall()
    print(" -- DISPLAYING Rentals --")

    for rentals in results:
        print("Rental ID:", rentals[0])
        print("Equipment ID: ", rentals[1])
        print("Customer ID: ", rentals[2])
        print("Rental Amount: ${:.2f}".format(rentals[3]))
        print("Rental Date: ", rentals[4])
        print(" ")

    query = "SELECT * from trips"
    cursor.execute(query)
    results = cursor.fetchall()
    print(" -- DISPLAYING Trips --")

    for trips in results:
        print("Trip ID: ", trips[0])
        print("Continent ID: ", trips[1])
        print("Country: ", trips[2])
        print("Region: ", trips[3])
        print("Innoculation: ", trips[4])
        print("Customer ID: ", trips[5])
        print("Visa ID: ", trips[6])
        print("Ticket ID: ", trips[7])
        print(" ")

    query = "SELECT * from orders"
    cursor.execute(query)
    results = cursor.fetchall()
    print(" -- DISPLAYING Orders --")

    for orders in results:
        print("Order ID: ", orders[0])
        print("Order Date: ", orders[1])
        print("Customer ID: ", orders[2])
        print("Trip ID: ", orders[3])
        print("Purchase ID: ", orders[4])
        print("Rental ID: ", orders[5])
        print("Employee ID: ", orders[6])
        print(" ")



except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("  The supplied username or password are invalid")

    elif err.errno == errorcode.ER_BAD_FIELD_ERROR:
        print("  The specified database does not exist")

    else:
        print(err)
    
finally:
    db.close()