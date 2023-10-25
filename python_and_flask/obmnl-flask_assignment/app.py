# Import libraries
from flask import Flask, request, url_for, redirect, render_template

# Instantiate Flask functionality
app = Flask(__name__)

# Sample data
# Sample data
transactions = [
    {'id': 1, 'date': '2023-06-01', 'amount': 100},
    {'id': 2, 'date': '2023-06-02', 'amount': -200},
    {'id': 3, 'date': '2023-06-03', 'amount': 300}
    ]

#Create a function named get_transactions that uses render_template to return an HTML template named transactions.html.
#This function should pass the transactions to the template for display.
#Use the Flask @app.route decorator to map this function to the root (/) URL.
#This means that when a user visits the base URL of your application, Flask will execute the get_transactions function and return its result.
# Read operation
@app.route('/')
def get_transactions():
    return render_template("transactions.html", transactions=transactions)

#Create a function named add_transaction.
#Use add as the decorator for this function. Make sure to pass both GET and POST as possible methods.
#If the request method is GET, use the render_template function to display an HTML form using a template named form.html. This form will allow users to input data for a new transaction.
#If the request method is POST, use request.form to extract the form data, create a new transaction, append it to the transactions list, and then use redirect and url_for to send the user back to the list of transactions.
#The new transaction is passed on to the reading function in the following format.
# Create operation
@app.route('/add', methods=['GET', 'POST'])
def add_transaction():
    if request.method == 'GET':
        return render_template("form.html")
    elif request.method == 'POST':
        # Access form data
        name = request.form['name']
        
        # Redirect user to the new record
        transaction = {
            'id': len(transactions)+1
            'date': request.form['date']
            'amount': float(request.form['amount'])
        }
        transactions.append(transaction)
        return redirect(url_for("get_transactions"))
    else:
        return {"message": "Error! Unsupported request"}, 404

#Create a function named edit_transaction that handles both GET and POST requests. This function should accept a parameter, transaction_id.
#Decorate the function with @app.route and use the route string /edit/<int:transaction_id>.
#The <int:transaction_id> part in the URL is a placeholder for any integer. Flask will pass this integer to your function as the transaction_id argument.
#If the request method is GET, find the transaction with the ID that matches transaction_id
#and use render_template to display a form pre-populated with the current data of the transaction using a template named edit.html.
#If the request method is POST, use request.form to get the updated data, find the transaction with the ID that matches
#transaction_id and modify its data, then redirect the user back to the list of transactions.
# Update operation
@app.route('/edit/<int:transaction_id>', methods=['GET', 'POST'])
def edit_transaction(transaction_id):
    if request.method == 'POST':
        # Extract the updated values from the form fields
        date = request.form['date']
        amount = float(request.form['amount'])

        # Find the transaction with the matching ID and update its values
        for transaction in transactions:
            if transaction['id'] == transaction_id:
                transaction['date'] = date
                transaction['amount'] = amount
                break

        # Redirect to the transactions list page
        return redirect(url_for("get_transactions"))
    
    # Find the transaction with the matching ID and render the edit form
    for transaction in transactions:
        if transaction['id'] == transaction_id:
            return render_template("edit.html", transaction=transaction)

#Complete the following steps to implement the Delete operation.
#Create a function named delete_transaction that takes a parameter, transaction_id.
#Decorate the function with @app.route and use the route string /delete/<int:transaction_id>.
#The <int:transaction_id> part in the URL is a placeholder for any integer. Flask will pass this integer to your function as the transaction_id argument.
#In the function body, find the transaction with the ID that matches transaction_id and remove it from the transactions list,
#then redirect the user back to the list of transactions.
# Delete operation
@app.route('/delete/<int:transaction_id>', methods=['DELETE'])
def delete_transaction(transaction_id):
    if request.method == 'DELETE':
        for transaction in transactions:
            if transaction['id'] == transaction_id:
                transactions.remove(transaction)
                break
    return redirect(url_for("get_transactions"))

# Run the Flask app
if __name__ == "__main__":
    app.run(debug=True)
    
