## To create a table, you need to call it first:
```sql 
CREATE TABLE employees; 
(
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

# To create a SQL file, follow these commands in order:

1. `CREATE DATABASE` base_name
* `CREATE DATABASE IF NOT EXIST` my_business

2. `USE` my_business;
* Since there can be several databases, we need to use this USE command, so our seleced database can receive and work properly according to what we need.
  
3. `CREATE TABLE` table_name 
   (colunm1 data_type restrictions,
    column2 data_type restrictions,
     ... ); 
* Here we are to set all the columns our database will have. Next to each column, we are going to set the type as well as the restriccions. 

# 3.1. `Common type used`: 
* `INT` stands for an integer (numero entero).
* `VARCAHR` stands for "n" characters in text input. 
* `YEAR` stands for the 4 digits year format (1987).
...;

# 3.2. `Basic Restrictions`: 
* `PRIMARY KEY` stands for unique key, set to every row. ID
* `NOT NULL` means that it's not allowed an empty space/part.
* `AUTO_INCREMENT` means a value generates automatically. 
 ...;

4. `INSERT INTO` table_name (column1, column2, column3 ...)
                 VALUES (value1, value2, value3...);

5. `SELECT` this command allows us to see and consult the information we have saved within the table.
# SELECT FROM table_name ...

* `;` This, when placed at the end of a statement, tells SQL that whatever line it is reading it is a command. No matter if the statement is long and ends at the second line, once the program reach a semi colon, it knows the statement or command has ended.
* `...`  


