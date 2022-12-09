import mysql.connector
from mysql.connector import errorcode
from pymysql import err

config = {
    "user": "root",
    "password": "**********",
    "host": "127.0.0.1",
    "database": "outland_adventures",
    "raise_on_warnings": True
}

try:
    db = mysql.connector.connect(**config)

    print("\n Database user {} connected to MySQL on host {} with database {}".format(config["user"], config["host"],
                                                                                      config["database"]))

    cursor = db.cursor()
    query = "select customer_id, count(purchase_id), sum(purchase_amt) as Amount, purchase_date " \
            "from purchases " \
            "group by customer_id, purchase_date order by customer_id"
    cursor.execute(query)
    results = cursor.fetchall()
    print(" -- DISPLAYING Purchases --")

    for purchases in results:
        print("\nCustomer ID:", purchases[0])
        print("Purchase ID:", purchases[1])
        print("Purchase Amount:", purchases[2])
        print("Purchase Date:", purchases[3])

except mysql.connector as Error:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print(" The supplied username or password is invalid")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print(" The supplied database does not exist")

    else:
        print(err)

finally:
    db.close()