-- 1. Create a new DATABASE name library_borrow;
CREATE DATABASE library_borrow;

--2. Create a new TABLE name books with the following columns:
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    published_year INT,
    genre VARCHAR(100),
    shelf_location VARCHAR(50),
    out_of_stock BOOLEAN DEFAULT FALSE
);

--3. Create a new TABLE name users with the following columns:
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    membership_date DATE DEFAULT CURRENT_DATE
);

--4. Create a new TABLE name borrow_records with the following columns:
CREATE TABLE borrow_records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    book_id INT,
    borrow_date DATE DEFAULT CURRENT_DATE,
    return_date DATE,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (book_id) REFERENCES books (book_id)
);

-- --- -- --- -- --- -- --- -- ---- -- --- --- ---- ----- -- ---
-- --- -- --- -- --- -- --- -- ---- -- --- --- ---- ----- -- ---
--5. Show all the books that are currently borrowed (i.e., have a borrow record with a return date).
SELECT b.title, b.author, br.borrow_date, u.first_name, u.last_name
FROM
    books b
    JOIN borrow_records br ON b.book_id = br.book_id
    JOIN users u ON br.user_id = u.user_id
WHERE
    b.book_id IN (
        SELECT book_id
        FROM borrow_records
        WHERE
            return_date IS NULL
    );

-- --- -- --- -- --- -- --- -- ---- -- --- --- ---- ----- -- ---
-- --- -- --- -- --- -- --- -- ---- -- --- --- ---- ----- -- ---
--6. Show all the users and all books they have check out (i.e., have a borrow record with a return date).
SELECT u.first_name, u.last_name, b.title, b.author, br.borrow_date
FROM (
        SELECT user_id, book_id, borrow_date
        FROM borrow_records
        WHERE
            return_date IS NULL
    ) br
    JOIN users u ON br.user_id = u.user_id
    JOIN books b ON br.book_id = b.book_id;