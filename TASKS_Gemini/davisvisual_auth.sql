-- 1. Create a database specifically for your Davisvisusl project
CREATE DATABASE 
IF NOT EXISTS davisvisual_db;
USE davisvisual_db;

-- 2. Create a table to securely hold user account details
CREATE TABLE
IF NOT EXISTS users
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR (50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Insert a dummy test user for your project
INSERT INTO users
    (username, email, password_hash)
VALUES
    ('movie_lover99', 
    'david@example.com', 
    'scramble_secret_passcode_123'
    );

-- 4. Verify the table structure works
SELECT id, username, email, created_at
FROM users;