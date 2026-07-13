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

## INNER JOIN, 
<p>An INNER JOIN only returns rows where there is a perfect match in both tables. If a row in Table A doesn’t find a matching value in Table B, it gets completely left out of the final results.<p>

<h1>Mental Image:</h1> <strong>The shaded intersection right in the middle of a Venn diagram.</strong>

<p>Example Use Case: Showing a list of orders alongside the details of the customers who placed them. (If a customer hasn't ordered anything yet, they won't appear).</p>

## LEFT JOIN

<p> A LEFT JOIN returns every single row from the left table (Table A), regardless of whether a match exists in Table B. If there is a match, it pulls in the data from Table B. If there is no match, it still displays Table A's data but fills Table B's columns with NULL (empty) values.</p>

<h1>Mental Image:</h1> <strong>The entire left circle is filled in, along with the overlapping middle.</strong>

<p>Example Use Case: Listing all registered clients, plus any order data they might have. Clients who haven't bought anything will still show up on your list, just with NULL in the order column.</p>

## RIGHT JOIN

<p>A RIGHT JOIN is the exact mirror image of a Left Join. It returns every single row from the right table (Table B), whether a match exists in Table A or not. If a row in Table B doesn’t have a match in Table A, Table A's columns come back as NULL.</p>

<h1>Mental Image:</h1> <strong>The entire right circle is filled in, along with the overlapping middle.</strong>

<p>Example Use Case: Tracking system inventory. You want to see every product variant in your inventory table, even if no client has ever added it to their shopping cart (Table A).</p>

`Note for your notes:`
<!--Developers rarely use RIGHT JOIN in practice because you can always just switch the order of the tables in your code and use a LEFT JOIN to achieve the exact same result. Keeping everything "Left-to-Right" makes code much easier to read!-->

## FULL JOIN

<p><spans>A FULL JOIN returns absolutely everything from both tables.</spans> It combines the behavior of both a Left Join and a Right Join. If there is a match, it connects them. If a row only exists in Table A, or only exists in Table B, it includes it anyway and uses NULL for the missing partner's data.</p>

<h1>Mental Image:</h1> <strong>Both circles are entirely filled in—nothing is left behind.</strong>

<p>Example Use Case: Merging two separate department databases (like Sales and Marketing) to find all unique email addresses across the entire company, whether they are active in one department, the other, or both.</p>

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

<h1 style="color darkgreen; text-align: center;">The First, Second, and Third Normal Forms (1NF, 2NF, 3NF).</h1>

<p>Database normalization is all about organizing your data to avoid repetition (redundancy) and protect your data's integrity. Think of it like organizing a messy closet: you group similar items together so you don't end up with shoes mixed in with shirts.</p>

<p>Let's use your library/book loan project as an example. Imagine we started with a single, messy unnormalized table like this:</p>

<!-- EXAMPLE of a table. -->

```SQL
-- 1. THE First Normal Form: (1NF): Atomic Values.
```
<p>The golden rule of 1NF is: <spans>Every cell must contain a single, atomic (indivisible) value.</spans> You cannot have lists or multiple pieces of data shoved into one column.</p>

<p>The Problem: In our starting table, David's row has two books (The Hobbit, Dune) in a single cell. A database can't easily search, sort, or update that.</p>

<p>The Fix: We break those values up into their own rows so that every row-and-column intersection has exactly one value.</p>

<strong>Now we have a composite Primary Key (a combination of LoanID and BookTitle) to uniquely identify each row.</strong>

<!-- 2. Second Normal Form (2NF): Full Functional Dependency> -->

<p> To reach 2NF, a table must first be in 1NF, and every non-key column must depend on the entire primary key, not just a part of it.</p>

<p>The Problem: Our primary key is a combination of LoanID + BookTitle.</p>

<p>Does UserName depend on both? No, David is David regardless of what book he takes. UserName only depends on the UserID.</p>

<p>This causes massive data repetition (we are repeating "David" and "2026-07-01" for every single book he borrows).</p>

<p>The Fix: We split the table into separate entities so that attributes only live where they fully belong.
Our Tables in 2NF:</p>

<strong>Table A: Users (Using UserID as Key)</strong>

<!-- 3. Third Normal Form (3NF): No Transitive Dependencies. -->

<p>To reach 3NF, the table must be in 2NF, and non-key columns cannot depend on other non-key columns. In database terms: "Every column must depend on the key, the whole key, and nothing but the key."</p>

<p>Let’s add a wrinkle to see the problem. Imagine our Book Loans table also included the author's name and email: BookTitle, AuthorName, AuthorEmail.</p>

<p>The Problem: AuthorEmail depends on AuthorName, which depends on BookTitle. Neither of them have anything to do with the Loan itself. This is a transitive dependency. If you delete the loan, you accidentally delete the author's email from your entire system!</p>

<strong>The Fix: Separate the independent data into its own dedicated table.</strong>

<!-->... Summary Checklist for your Project ...

1NF: No lists in a single cell.

2NF: Split tables so you don't repeat user profiles or book descriptions every time a loan happens.

3NF: Ensure that changing a book's details or an author's info doesn't require updating the loan records. -->

<p>Tne inner query is made first, then out of it, the outer quiter will be born from.</p>

<p>In SQL, the asterisk * does not mean multiplication when it is inside an aggregate function like COUNT().</p>

<strong>Instead, it means "all rows" or "everything."</strong>

<p>When you write COUNT(*), you are simply telling the database: "Count every single row in this group, regardless of what data is inside the columns." It is the standard, safest way to count rows in SQL.</p>

<!--Why HAVING (C) wins over WHERE (A)
This is the core concept of database filtering, and it all comes down to timing.

WHERE filters individual rows before they are grouped. The database looks at the raw data row-by-row. Because the groups haven't been created yet, the database doesn't know what the final "count" is. If you try to use WHERE COUNT(*)..., SQL will throw an error.

HAVING filters groups after they are aggregated. Once the database gathers the individual rows into groups (like grouping movies by genre or director), it calculates the COUNT(*). Then, the HAVING clause steps in to filter out any groups that don't meet the criteria.

Think of it this way: You use WHERE to filter individual items, but you must use HAVING to filter entire groups.-->









