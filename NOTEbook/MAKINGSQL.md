s## To create a table, you need to call it first:
```sql 
--  Correct
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

* `RELATIONAL TABLES`, 

# The Junction Table (The Structure)
A junction table is a physical table that you build inside your database using a CREATE TABLE statement.
* It actually exists in your database storage.
* It permanently holds data (pairs of IDs) to link two other tables together.
* Analogy: It’s a physical filing cabinet that maps which articles have which tags. 

# SELECT and INNER JOIN (The Query)
SELECT, FROM, and INNER JOIN are SQL commands used to read data from your tables.
* They do not create or store anything permanently.
* You use them to temporarily pull data from the tables, combine the rows visually on your screen, and see the results.
* Analogy: It’s you opening the filing cabinets, looking at the maps, and writing a combined report on a temporary piece of paper.

`How they work together?`
Because your articles and tags are separated, you use INNER JOIN to travel through the Junction Table.

```SQL 
FROM user_articles art
INNER JOIN article_tags at ON art.id = at.article_id
INNER JOIN category_tags t ON at.tag_id = t.id;
```

# IMPORTANT DAVIS: (INFO. given by Copilot), lines (89- 97).

* `CORE IDEA`,

* Every table has its own primary key.
* Foreign keys create the bridges between them.
* Joins use those bridges.

You do not join tables by “typing at the end which primary key you need.”

You join tables by `using the foreign key column` that already points to the other table’s primary key.

```html
<p><strong>LOGICAL OPERATORS</strong></p>

<h1 style="color: green; text-align: left;">IN</h1>
<p>evaluates actual values. It runs the subquery first, gathers a literal list of values (like a list of IDs), and then checks if the outer query's value matches anything inside that list.</p>

```SQL
CREATES

```

<h1 style="color: green; text-align: left;">EXISTS</h1>>
<p>evaluates a boolean condition (True/False). It looks at the rows one by one. The moment it finds a single match in the subquery that satisfies the condition, it stops looking (True) and moves to the next row. It doesn't actually pull or return any data from the subquery.</p>

<h2 style="color: red; text-align: center;">The Scenario</h2>
<p>Imagine you have two tables: customers and orders. You want to find <spans style="color: green;">only the customers who have placed at least one order.</spans></p>

<h2 text-align: left;>The SQL Query</h2>

```SQL
SELECT customer_id, first_name, last_name
FROM customers c
WHERE EXISTS (
    SELECT 1 
    FROM orders o 
    WHERE o.customer_id = c.customer_id
);
```

<p><strong>DATABASE OBJECT (or SCHEMA OBJECT).</strong></p>

<h1 style="color: white; text-align: center;">CREATE INDEX</h1>

```SQL
-- 1. Creates hash index (only to specific elements). --
CREATE INDEX index_user_email ON users USING HASH(email); 

-- 2. Response through this. --
SELECT * FROM users WHERE email= 'ana@example.com';
```
<p>The <spans>CREATE INDEX</spans> sintanx is used to specify from a list of database 1 specific element (an email, a name, a number, an average, etc). On the other hand,<p>


<p><strong>FULL TEXT-INDEX or (Full-Text Search).</strong></p>

<h1 style="color: white; text-align: center;">CREATE FULLTEXT INDEX</h1>

```SQL
-- 1. Creates FULLTEXT INDEX. --
CREATE FULLTEXT INDEX idx_posts_content ON posts(content);

-- 2. Advanced search. --
SELECT * FROM posts
WHERE MATCH(content) AGAINST('receip + pasta' IN  BOOLEAN MODE);
```

<p>While a standard index looks for exact matches or prefixes, a Full-Text Index is designed to search for individual words or phrases inside large blocks of text (like articles or product descriptions).</p>




