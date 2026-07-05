-- 1. Create and select the database
CREATE DATABASE IF NOT EXISTS category_tags_db;

USE category_tags_db;

-- 2. Create the User Accounts table
CREATE TABLE IF NOT EXISTS user_accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create the Articles table (One-to-Many with Users)
CREATE TABLE IF NOT EXISTS user_articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    article_title VARCHAR(255) NOT NULL,
    article_content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_accounts (id)
);

-- 4. Create the Category Tags table
CREATE TABLE IF NOT EXISTS category_tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. THE MISSING PIECE: The Junction Table (Many-to-Many Bridge)
-- This table links user_articles and category_tags together.
CREATE TABLE IF NOT EXISTS article_tags (
    article_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (article_id, tag_id), -- Prevents duplicating the exact same tag on the same article
    FOREIGN KEY (article_id) REFERENCES user_articles (id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES category_tags (id) ON DELETE CASCADE
);

-- ==========================================
-- INSERTING SAMPLE DATA TO TEST IT ALL
-- ==========================================

-- Insert Sample Users
INSERT INTO
    user_accounts (
        username,
        email,
        password_hash
    )
VALUES (
        'david_dev',
        'david@example.com',
        'hash123'
    ),
    (
        'maria_cooks',
        'maria@example.com',
        'hash456'
    );

-- Insert Sample Articles (Linked to user_id)
INSERT INTO
    user_articles (
        user_id,
        article_title,
        article_content
    )
VALUES (
        1,
        'Mastering MySQL Relationships',
        'Today we are learning about junction tables...'
    ),
    (
        1,
        'Coding in Dark Mode',
        'Why dark green aesthetics are the best for coding workspaces...'
    ),
    (
        2,
        'The Perfect Summer BBQ',
        'Here is how to grill the ultimate steak...'
    );

-- Insert the Category Tags (Using your original list)
INSERT INTO
    category_tags (tag_name)
VALUES ('Cooking'),
    ('Technology'),
    ('Outdoor Sports'),
    ('Lifestyle'),
    ('Reading'),
    ('VideoGames'),
    ('Coding');

-- Link Articles to Tags via the Junction Table
-- Article 1 (MySQL) is tagged as Technology (2) and Coding (7)
-- Article 2 (Dark Mode) is tagged as Technology (2) and Coding (7)
-- Article 3 (BBQ) is tagged as Cooking (1) and Outdoor Sports (3)
INSERT INTO
    article_tags (article_id, tag_id)
VALUES (1, 2),
    (1, 7),
    (2, 2),
    (2, 7),
    (3, 1),
    (3, 3);

-- ==========================================
-- THE ULTIMATE TEST: Querying the Data
-- ==========================================
-- This is where the INNER JOINs actually belong!
-- We start at articles, hop to users, hop to the bridge, and end at the tags.

SELECT ua.username AS 'Author', art.article_title AS 'Article Title', t.tag_name AS 'Tag'
FROM
    user_articles art
    INNER JOIN user_accounts ua ON art.user_id = ua.id
    INNER JOIN article_tags at ON art.id = at.article_id
    INNER JOIN category_tags t ON at.tag_id = t.id;