## To create a table, you need to call it first:
```sql 
CREATE TABLE employees (
employee_id INT, 
first_name VARCHAR(50),
last_name VARCHAR(50), 
hourly_pay DECIMAL(5, 2),
hire_date DATE 
);
```
1. The list below the call are known as: `COLUMN NAMES.`

2. The capital words next to the column names are known as: `DATA TYPES.`

# Once you have finish typing a line, end it with a `;`

            DATA TYPES AND THEIR FUNCTION.

* `INT`, stand for integrers. It stores whole numbers. It won't allow decimals, words, or dates to be saved in the column where is typed to.

* `VARCHAR(50)`, stores text strings (variable characters) up to a set limit (eg, 50 characters).

* `DECIMAL(5, 2)`, stores precise numbers with decimals (perfec for money, like 15.80).

* `DATE`, stores calendar dates formatted as' YYY-MM-DD.

* `DATETIME`, stores both the date and time consecutively.




