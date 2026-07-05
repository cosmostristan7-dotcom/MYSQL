--1. Create a DATABASE specifically for my website category tags.
CREATE DATABASE if NOT EXISTS category_tags_db;

USE category_tags_db;

SELECT DATABASE();
--2. Create a table to hold user account details for my website. The table will include columns for id, username, email, password_hash, and created_at.
CREATE TABLE if NOT EXISTS user_accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--3. Create a table to hold one article per user account. The table will include columns for id, user_id, article_title, article_content, and created_at.
CREATE TABLE if NOT EXISTS user_articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    article_title VARCHAR(255) NOT NULL,
    article_content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_accounts (id)
);

FROM
    user_articles
    INNER JOIN user_accounts ON user_articles.user_id = user_accounts.id;

--4. Create a table to securely hold category tags for my website. My category tags will be Cooking, Technology, Outdoor Sports, Lifestyle, Reading, VideoGames and Coding.
CREATE TABLE if NOT EXISTS category_tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INNER JOIN user_articles ON category_tags.id = user_articles.id;
--5. Insert the initial category tags into the table.
INSERT INTO
    category_tags (tag_name)
VALUES ('Cooking'),
    ('Technology'),
    ('Outdoor Sports'),
    ('Lifestyle'),
    ('Reading'),
    ('VideoGames'),
    ('Coding');

--6. Verify the table structure works by selecting all the category tags from the table.
SELECT id, tag_name, created_at FROM category_tags;