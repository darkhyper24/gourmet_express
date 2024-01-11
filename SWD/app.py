from flask import Flask, render_template, request, redirect, url_for
import pyodbc

app = Flask(__name__)

connection_string = 'DRIVER={SQL Server};SERVER=LAPTOP-BTLK3Q2I;DATABASE=dish drop;Trusted_Connection=yes;'

def insert_customer(name, password, email, phone):
    try:
        conn = pyodbc.connect(connection_string)
        cursor = conn.cursor()

        cursor.execute("INSERT INTO Customers (Name, Password, Email, PhoneNumber) VALUES (?, ?, ?, ?)",
                       name, password, email, phone)
        conn.commit()
        conn.close()
    except Exception as e:
        print(f"Error inserting data: {str(e)}")

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
     
        name = request.form['name']
        password = request.form['password']
        email = request.form['email']
        phone = request.form['phone']

        insert_customer(name, password, email, phone)

        return redirect(url_for('resturant_start'))

    return render_template('signup.html')

@app.route('/resturant/start')
def restaurant_start():
    
    return render_template('resturant/start.html')

if __name__ == '__main__':
    app.run(debug=True)
