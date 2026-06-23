# server.py
from flask import Flask, request, render_template_string
import mysql.connector # This is the library that lets Python talk to MySQL

app = Flask(__name__)

# 1. Connect Python to your Mac's MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",         # Your MySQL username
    password="your_password", # Your MySQL password
    database="auth_db"   # The database from your auth1.sql file
)
cursor = db.cursor()

@app.route('/login', methods=['POST'])
def login():
    # 2. Grab the data the user typed into gate.html
    username = request.form['username']
    password = request.form['password']
    
    # 3. Query the database (Just like your SQL logic!)
    query = "SELECT password_hash FROM users WHERE username = %s"
    cursor.execute(query, (username,))
    result = cursor.fetchone()
    
    if result:
        db_password_hash = result[0]
        # 4. In a real app, you would check the bcrypt hash here
        if password == "test_password": # (Simplified placeholder check)
            return "✅ Access Granted! Python checked MySQL and you are good to go."
        else:
            return "❌ Wrong password."
    else:
        return "❌ User not found."

if __name__ == '__main__':
    app.run(port=5000) # Starts the server on http://localhost:5000