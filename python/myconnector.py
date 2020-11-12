import mysql.connector

from mysql.connector import Error
from secrets import my_hostname, my_username, my_passwd



def create_connection(host_name, user_name, user_password):

    connection = None

    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password
        )

        print("Connection to MySQL DB successful")

    except Error as e:

        print(f"Error '{e}' occurred")

    return connection

connection = create_connection(my_hostname, my_username, my_passwd)